unit DocEmitido_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, Menus, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, Db, DBTables,
  RxCalc, Grids, DBGrids, ToolEdit, RXDBCtrl, shellapi, CurrEdit;

type
  TDocEmitido_f = class(TDeriva_f)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    medCliente: TMaskEdit;
    sbPesq: TSpeedButton;
    edtNomeCli: TEdit;
    Label2: TLabel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    edtProtocolo: TEdit;
    Label8: TLabel;
    SpeedButton2: TSpeedButton;
    qryAux: TQuery;
    qryDocto: TQuery;
    qryProtocolo: TQuery;
    dsProtocolo: TDataSource;
    edtCodDocto: TEdit;
    Label3: TLabel;
    sbPesDocto: TSpeedButton;
    edtDescDocto: TEdit;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    Label7: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    SpeedButton3: TSpeedButton;
    Label10: TLabel;
    DBEdit1: TDBEdit;
    edtCodigo: TEdit;
    edtFunc: TEdit;
    DBGrid1: TDBGrid;
    btnApaga: TBitBtn;
    edtCompl: TEdit;
    qryDocEmi: TQuery;
    dsDoctoEmitido: TDataSource;
    Label11: TLabel;
    qryDoctoEmitido: TQuery;
    qryDoctoEmitidoOBS_DOCTO_EMI: TStringField;
    qryDoctoEmitidoCOD_DOCTO: TIntegerField;
    qryDoctoEmitidoDESC_DOCTO: TStringField;
    Label12: TLabel;
    btnGrava: TBitBtn;
    qryDoctoEmitidoCOD_DOCTO_EMI: TIntegerField;
    qryProtocoloCOD_PROTOCOLO: TIntegerField;
    qryProtocoloCOD_CLIENTE: TIntegerField;
    qryProtocoloDT_EMISSAO_PROTO: TDateTimeField;
    qryProtocoloDT_ENTREGA_PREV: TDateTimeField;
    qryProtocoloDT_ENTREGA_PROTO: TDateTimeField;
    qryProtocoloSTATUS_ENTREGA: TStringField;
    qryProtocoloCOD_FUNC: TIntegerField;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    lblSituacao: TLabel;
    qryProtocoloCOD_FUNC_CAD: TIntegerField;
    BitBtn10: TBitBtn;
    qryImpPro: TQuery;
    DateEdit1: TDateEdit;
    Label13: TLabel;
    qryDoctoEmitidoDT_VENCIMENTO: TDateTimeField;
    BitBtn11: TBitBtn;
    Cadastros1: TMenuItem;
    Documentos1: TMenuItem;
    qryProtocoloRESPONSAVEL_PROTO: TStringField;
    DBEdit2: TDBEdit;
    Label14: TLabel;
    Label15: TLabel;
    edtValDocto: TRxCalcEdit;
    qryDoctoEmitidoVALOR_DOCTO_EMI: TFloatField;
    qryProtocoloOBS_PROTOCOLO: TMemoField;
    procedure medClienteExit(Sender: TObject);
    procedure edtCodDoctoExit(Sender: TObject);
    procedure sbPesDoctoClick(Sender: TObject);
    procedure sbPesqClick(Sender: TObject);
    procedure edtProtocoloExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure rgChange(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure btnGravaClick(Sender: TObject);
    procedure btnApagaClick(Sender: TObject);
    procedure DBDateEdit2Exit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure Documentos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DocEmitido_f: TDocEmitido_f;

implementation
uses principal,
     Atendimento_dm,
     CopiaProtocolo, CadDocumento_u, funcoes;
{$R *.DFM}

procedure TDocEmitido_f.medClienteExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
  if medCliente.Text <> '' then
  begin
    qryAux.Close;
    qryAux.SQL.Text := 'SELECT * FROM GC_CLIENTE WHERE COD_CLIENTE='+medCliente.Text;
    qryAux.Open;
    if qryAux.eof then
    begin
      messagedlg('Codigo de Cliente não cadastrado.',mtWarning,[mbOk],0);
      medCliente.SetFocus;
      exit;
    end;
    medCliente.Text  := qryAux.FieldByName('Cod_Cliente').AsString;
    edtNomeCli.Text  := qryAux.FieldByName('Nome_cli').AsString;
    if qryProtocolo.State = dsInsert then
      qryProtocolo.FieldByName('Responsavel_Proto').AsString := qryAux.FieldByName('CONTATO_CLI').AsString;
  end
  else
  begin
    medCliente.Clear;
    edtNomeCli.Clear;
    sbPesqClick(Sender);
  end;
end;

procedure TDocEmitido_f.edtCodDoctoExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
  if edtCodDocto.Text <> '' then
  begin
    qryDocto.Close;
    qryDocto.ParamByName('Cod_Docto').AsString := edtCodDocto.Text;
    qryDocto.Open;
    if qryDocto.eof then
    begin
      if messagedlg('Documento não cadastrado. Deseja cadastrar ?',mtConfirmation,[mbYes,mbNo],0) = idYes then
      begin
        if assigned(CadDocumento_f) then
          CadDocumento_f := nil;

        CadDocumento_f := TCadDocumento_f.Create(Self);
        try
          CadDocumento_f.Show;
        except
          CadDocumento_f := TCadDocumento_f.Create(Self);
          CadDocumento_f.Show;
        end;
      end;
      edtCodDocto.SetFocus;
    end
    else
    begin
      edtDescDocto.Text := qryDocto.FieldByName('Desc_Docto').AsString;
    end;
  end;
end;

procedure TDocEmitido_f.sbPesDoctoClick(Sender: TObject);
begin
  inherited;
  dmPesq.PesDocto.Execute;
  edtCodDocto.Text  := dmPesq.PesDocto.ValoresRetorno[1];
  edtDescDocto.Text := dmPesq.PesDocto.ValoresRetorno[0];
  if edtCodDocto.Text = '' then
  begin
    edtCodDocto.SetFocus;
    exit;
  end;
  qryDocto.Close;
  qryDocto.ParamByName('Cod_Docto').AsString := edtCodDocto.Text;
  qryDocto.Open;
  qryDocto.Edit;
end;

procedure TDocEmitido_f.sbPesqClick(Sender: TObject);
begin
  inherited;
  dmPesq.PesCliente.StringSql.Clear;
  dmPesq.PesCliente.StringSql.Add('SELECT * FROM GC_CLIENTE ');
  dmPesq.PesCliente.StringSql.Add(' ORDER BY NOME_CLI');
  dmPesq.PesCliente.Execute;
  medCliente.Clear;
  edtNomeCli.Clear;
  medCliente.Text := dmPesq.PesCliente.ValoresRetorno[0];
  edtNomeCli.Text := dmPesq.PesCliente.ValoresRetorno[2];
end;

procedure TDocEmitido_f.edtProtocoloExit(Sender: TObject);
begin
  inherited;
  edtFunc.Clear;
  medCliente.Clear;
  edtNomeCli.Clear;
  dbDateEdit2.Enabled := True;

  if edtProtocolo.text <> '' then
  begin
    qryProtocolo.Close;
    qryProtocolo.ParamByName('Cod_Protocolo').AsString := edtProtocolo.Text;
    qryProtocolo.Open;
    if qryProtocolo.Eof then
    begin
      messagedlg('Protocolo não cadastrado.',mtInformation,[mbOk],0);
      edtProtocolo.SetFocus;
      qryDoctoEmitido.Close;
      exit;
    end
    else
    begin
      if (qryProtocolo.FieldByName('Status_Entrega').AsString = 'X') and (qryProtocolo.FieldByName('Cod_Func').AsString = '') then
      begin
        edtCodigo.Enabled    := True;
        SpeedButton3.Enabled := True;
      end
      else
      begin
        edtCodigo.Enabled    := False;
        SpeedButton3.Enabled := False;
      end;

      edtCodDocto.Enabled := not (qryProtocolo.FieldByName('Status_Entrega').AsString <> 'M');
      sbPesDocto.Enabled  := not (qryProtocolo.FieldByName('Status_Entrega').AsString <> 'M');
      edtCompl.Enabled    := not (qryProtocolo.FieldByName('Status_Entrega').AsString <> 'M');
      btnGrava.Enabled    := not (qryProtocolo.FieldByName('Status_Entrega').AsString <> 'M');
      btnApaga.Enabled    := not (qryProtocolo.FieldByName('Status_Entrega').AsString <> 'M');

      sbPesq.Enabled      := not (qryProtocolo.FieldByName('Status_Entrega').AsString <> 'M');
      MedCliente.Enabled  := not (qryProtocolo.FieldByName('Status_Entrega').AsString <> 'M');
      dbMemo1.Enabled     := not ((qryProtocolo.FieldByName('Status_Entrega').AsString = 'E') or (qryProtocolo.FieldByName('Status_Entrega').AsString = 'P'));



      dbDateEdit1.Enabled := not (qryProtocolo.FieldByName('Status_Entrega').AsString <> 'M');
      dbDateEdit2.Enabled := not ((qryProtocolo.FieldByName('Status_Entrega').AsString = 'E') or
                                  (qryProtocolo.FieldByName('Status_Entrega').AsString = 'P'));

      edtCodigo.Text   := qryProtocolo.FieldByName('Cod_Func').AsString;
      medCliente.Text  := qryProtocolo.FieldByName('Cod_Cliente').AsString;
      if edtCodigo.Text <> '' then
        edtCodigoExit(Sender);
      medClienteExit(Sender);
      qryProtocolo.Edit;
      qryDoctoEmitido.Close;
      qryDoctoEmitido.ParamByName('Cod_Protocolo').AsString := edtProtocolo.Text;
      qryDoctoEmitido.Open;
    end;
  end;

  lblSituacao.Caption := '';
  if      qryProtocolo.fieldbyname('Status_Entrega').AsString = 'M' then lblSituacao.Caption := 'Emitido'
  else if qryProtocolo.fieldbyname('Status_Entrega').AsString = 'X' then lblSituacao.Caption := 'Expedido'
  else if qryProtocolo.fieldbyname('Status_Entrega').AsString = 'R' then lblSituacao.Caption := 'Retirado'
  else if qryProtocolo.fieldbyname('Status_Entrega').AsString = 'E' then lblSituacao.Caption := 'Entregue'
  else if qryProtocolo.fieldbyname('Status_Entrega').AsString = 'D' then lblSituacao.Caption := 'Devolvido'
  else if qryProtocolo.fieldbyname('Status_Entrega').AsString = 'N' then lblSituacao.Caption := 'Endereço Errado'
  else if qryProtocolo.fieldbyname('Status_Entrega').AsString = 'C' then lblSituacao.Caption := 'Entrega Cancelada'
  else if qryProtocolo.fieldbyname('Status_Entrega').AsString = 'P' then lblSituacao.Caption := 'Entregue com Retorno de Protocolo';

  if nivel = 5 then
  begin
    bitbtn2.Enabled := qryProtocolo.fieldbyname('Status_Entrega').AsString = 'M';
    if qryProtocolo.fieldbyname('Status_Entrega').AsString = 'X' then
    begin
      bitbtn4.Enabled := True;
      bitbtn5.Enabled := True;
      bitbtn6.Enabled := True;
      bitbtn7.Enabled := True;
      bitbtn8.Enabled := False;
      bitbtn9.Enabled := False;
    end
    else if (qryProtocolo.fieldbyname('Status_Entrega').AsString = 'E') or
            (qryProtocolo.fieldbyname('Status_Entrega').AsString = 'R') or
            (qryProtocolo.fieldbyname('Status_Entrega').AsString = 'N') or
            (qryProtocolo.fieldbyname('Status_Entrega').AsString = 'C') or
            (qryProtocolo.fieldbyname('Status_Entrega').AsString = 'P') or
            (qryProtocolo.fieldbyname('Status_Entrega').AsString = 'D') then
    begin
      bitbtn4.Enabled := False;
      bitbtn5.Enabled := False;
      bitbtn6.Enabled := False;
      bitbtn7.Enabled := False;
      bitbtn8.Enabled := False;
      bitbtn9.Enabled := False;
    end;
  end
  else
  begin
    bitbtn2.Enabled := False;
    bitbtn4.Enabled := False;
    bitbtn5.Enabled := False;
    bitbtn6.Enabled := False;
    bitbtn7.Enabled := False;
    bitbtn9.Enabled := True;
    bitbtn8.Enabled := True;
    if (qryProtocolo.fieldbyname('Status_Entrega').AsString = 'E') then
      bitbtn8.Enabled := False;
  end;
  if (qryProtocolo.fieldbyname('Status_Entrega').AsString = 'P') or
     (qryProtocolo.fieldbyname('Status_Entrega').AsString = 'C') then
  begin
    bitbtn2.Enabled := False;
    bitbtn4.Enabled := False;
    bitbtn5.Enabled := False;
    bitbtn6.Enabled := False;
    bitbtn7.Enabled := False;
    bitbtn8.Enabled := False;
    bitbtn9.Enabled := False;
    dbDateEdit2.Enabled := False;
    dbMemo1.Enabled     := False;
  end;

end;

procedure TDocEmitido_f.BitBtn3Click(Sender: TObject);
begin
  inherited;
  lblSituacao.Caption := '';
  edtCodDocto.Clear;
  edtDescDocto.Clear;
  edtCompl.Clear;
  medCliente.Clear;
  edtNomeCli.Clear;
  edtProtocolo.Clear;
  edtCodigo.Clear;
  edtFunc.Clear;

  qryDoctoEmitido.Close;
  qryProtocolo.Close;
  qryProtocolo.Open;
  qryProtocolo.Insert;
  qryProtocolo.FieldByName('Status_Entrega').AsString     := 'M';
  qryProtocolo.FieldByName('Dt_Emissao_Proto').AsDateTime := Now();


  edtCodDocto.Enabled := True;
  medCliente.Enabled  := True;
  sbPesq.Enabled      := True;
  edtCodDocto.Enabled := True;
  sbPesDocto.Enabled  := True;
  btnGrava.Enabled    := True;
  btnApaga.Enabled    := True;
  dbMemo1.Enabled     := True;
  edtCompl.Enabled    := True;
  dbDateEdit1.Enabled := True;

  bitbtn2.Enabled := False;
  bitbtn4.Enabled := False;
  bitbtn5.Enabled := False;
  bitbtn6.Enabled := False;
  bitbtn7.Enabled := False;
  bitbtn8.Enabled := False;
  bitbtn9.Enabled := False;

  medCliente.SetFocus;
end;

procedure TDocEmitido_f.BitBtn1Click(Sender: TObject);
begin
  inherited;
  lblSituacao.Caption := '';
  if (qryProtocolo.fieldbyname('Status_Entrega').AsString = 'X') and (edtCodigo.Text = '') then
  begin
    messagedlg('É necessário informar o funcionário que entregará o documento.',mtInformation,[mbOk],0);
    exit;
  end;

  if qryProtocolo.State = dsEdit then
  begin
    qryProtocolo.fieldbyname('Cod_Func').AsString       := edtCodigo.Text;
    qryProtocolo.Post;
  end;

  if qryProtocolo.State = dsInsert then
  begin
    qryProtocolo.fieldbyname('Cod_Protocolo').AsInteger := Proximo('GC_PROTOCOLO','COD_PROTOCOLO','', true);
    qryProtocolo.fieldbyname('Cod_Cliente').AsString    := medCliente.Text;
    qryProtocolo.fieldbyname('Cod_Func').AsString       := edtCodigo.Text;
    qryProtocolo.fieldbyname('Cod_Func_Cad').AsInteger  := Cod_Func;
    edtProtocolo.Text := qryProtocolo.fieldbyname('Cod_Protocolo').AsString;
    qryProtocolo.Post;
    {messagedlg('Numero do Protocolo Emitido :'+formatfloat('000000000',qryProtocolo.fieldbyname('Cod_Docto_Emi').AsInteger),mtInformation,[mbOk],0);}
  end;


  edtCodDocto.Clear;
  edtDescDocto.Clear;
  edtCompl.Clear;
  medCliente.Clear;
  edtNomeCli.Clear;
  edtCodigo.Clear;
  edtFunc.Clear;
  qryProtocolo.Close;
  edtCodDocto.Enabled := False;
  medCliente.Enabled  := False;
  dbDateEdit2.Enabled := True;
  {edtProtocolo.Clear;}
  edtProtocolo.SetFocus;
  qryDoctoEmitido.Close;
end;

procedure TDocEmitido_f.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  dmPesq.PesDoctoEmi.Execute;
  edtProtocolo.Text  := dmPesq.PesDoctoEmi.ValoresRetorno[0];
  if edtProtocolo.Text = '' then
  begin
    edtProtocolo.SetFocus;
    exit;
  end;
  edtProtocoloExit(Sender);
end;

procedure TDocEmitido_f.rgChange(Sender: TObject);
begin
  inherited;
  edtCodigo.Enabled    := qryProtocolo.fieldbyname('Status_Protocolo').AsString = 'X';
  speedbutton3.Enabled := qryProtocolo.fieldbyname('Status_Protocolo').AsString = 'X';
  edtFunc.Enabled      := qryProtocolo.fieldbyname('Status_Protocolo').AsString = 'X';
end;

procedure TDocEmitido_f.edtCodigoExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
  if edtCodigo.Text <> '' then
  begin
    qryAux.Close;
    qryAux.SQL.Text := 'SELECT * FROM GC_FUNCIONARIO WHERE COD_FUNC='+edtCodigo.Text;
    qryAux.Open;
    if qryAux.eof then
    begin
      messagedlg('Codigo de Funcionário não cadastrado.',mtWarning,[mbOk],0);
      edtCodigo.SetFocus;
      exit;
    end;
    edtCodigo.Text  := qryAux.FieldByName('Cod_Func').AsString;
    edtFunc.Text    := qryAux.FieldByName('Nome_Func').AsString;
  end
  else
  begin
    edtCodigo.SetFocus;
  end;
end;

procedure TDocEmitido_f.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  dmPesq.PesFunc.Execute;
  edtCodigo.Text := dmPesq.PesFunc.ValoresRetorno[0];
  if edtCodigo.Text = '' then
  begin
    edtCodigo.SetFocus;
    exit;
  end;
  qryAux.Close;
  qryAux.SQL.Text := 'SELECT * FROM GC_FUNCIONARIO WHERE COD_FUNC='+edtCodigo.Text;
  qryAux.Open;
  edtFunc.Text := qryAux.FieldByName('Nome_Func').AsString;
end;

procedure TDocEmitido_f.btnGravaClick(Sender: TObject);
var cod:Integer;
begin
  inherited;
  if edtCodDocto.Text <> '' then
  begin
    if qryProtocolo.State = dsInsert then
    begin
      qryProtocolo.fieldbyname('Cod_Protocolo').AsInteger := Proximo('GC_PROTOCOLO','COD_PROTOCOLO','', true);
      qryProtocolo.fieldbyname('Cod_Cliente').AsString    := medCliente.Text;
      qryProtocolo.fieldbyname('Cod_Func').AsString       := edtCodigo.Text;
      qryProtocolo.fieldbyname('Cod_Func_Cad').AsInteger  := Cod_Func;
      edtProtocolo.Text := qryProtocolo.fieldbyname('Cod_Protocolo').AsString;
      qryProtocolo.Post;
      {messagedlg('Numero do Protocolo Emitido :'+formatfloat('000000000',qryProtocolo.fieldbyname('Cod_Docto_Emi').AsInteger),mtInformation,[mbOk],0);}
    end;
    qryAux.Close;
    qryAux.Sql.Text := 'SELECT * FROM GC_DOCUMENTO_EMITIDO WHERE COD_PROTOCOLO = ' + edtProtocolo.Text;
    qryAux.Open;
    if qryAux.RecordCount >= 12 then
    begin
      messagedlg('Não é possível informar mais de 12 documentos para cada Protocolo, Crie um novo.',mtInformation,[mbOk],0);
      exit;
    end;
    qryAux.Insert;
    cod := proximo('GC_DOCUMENTO_EMITIDO','COD_DOCTO_EMI','', true);
    qryAux.FieldByName('Cod_Protocolo').AsString  := edtProtocolo.Text;
    qryAux.FieldByName('Cod_Docto_Emi').AsInteger := cod;
    qryAux.FieldByName('Cod_Docto').AsString      := edtCodDocto.Text;
    qryAux.FieldByName('Valor_Docto_Emi').AsFloat := edtValDocto.Value;
    qryAux.FieldByName('Obs_Docto_Emi').AsString  := edtCompl.Text;
    if dateedit1.Text <> '  /  /    ' then
      qryAux.FieldByName('dt_vencimento').AsDateTime    := dateedit1.Date;
    qryAux.Post;
    edtCompl.Clear;
    edtCodDocto.Clear;
    edtDescDocto.Clear;
    DateEdit1.Clear;
    edtValDocto.Clear;
    edtCodDocto.SetFocus;
    qryDoctoEmitido.Close;
    qryDoctoEmitido.ParamByName('Cod_Protocolo').AsString := edtProtocolo.Text;
    qryDoctoEmitido.Open;
    qryDoctoEmitido.Locate('cod_docto_emi',cod,[loCaseInsensitive]);
  end;
end;

procedure TDocEmitido_f.btnApagaClick(Sender: TObject);
begin
  inherited;
  if Nivel <= 1 then
  begin
    if messagedlg('Deseja realmente apagar este Documento ?',mtWarning,[mbYes,mbNo],0) = idYes then
    begin
      qryAux.Close;
      qryAux.RequestLive := False;
      qryAux.sql.Text := 'DELETE FROM GC_DOCUMENTO_EMITIDO WHERE COD_DOCTO_EMI = ' + qryDoctoEmitido.FieldByName('Cod_Docto_Emi').AsString;
      qryAux.ExecSQL;
      qryAux.Close;
      qryAux.RequestLive := True;
      qryDoctoEmitido.Close;
      qryDoctoEmitido.Open;
    end;
  end
  else
  begin
    messagedlg('Não é possível apagar o Documento do Protocolo com este Nível de senha.',mtWarning,[mbOk],0);
    exit;
  end;
end;

procedure TDocEmitido_f.DBDateEdit2Exit(Sender: TObject);
begin
  inherited;
  {if (dbDateEdit2.EditText <> '  /  /    ') and (qryProtocolo.State = dsEdit) then
  begin
    qryProtocolo.fieldbyname('Status_Entrega').AsString := 'E';
    bitBtn1.SetFocus;
  end;}
end;

procedure TDocEmitido_f.BitBtn2Click(Sender: TObject);
begin
  inherited;
  qryProtocolo.Edit;
  qryProtocolo.fieldbyname('Status_Entrega').AsString := 'X';
  qryProtocolo.Post;
  edtProtocoloExit(Sender);
  
end;

procedure TDocEmitido_f.FormShow(Sender: TObject);
begin
  inherited;
  lblSituacao.Caption := '';
end;

procedure TDocEmitido_f.BitBtn8Click(Sender: TObject);
begin
  inherited;
  qryProtocolo.Edit;
  qryProtocolo.fieldbyname('Status_Entrega').AsString := 'C';
  qryProtocolo.Post;
  edtProtocoloExit(Sender);
end;

procedure TDocEmitido_f.BitBtn4Click(Sender: TObject);
begin
  inherited;
  if dbDateEdit2.Field.IsNull then
  begin
    messagedlg('Informe a data de Entrega.',mtWarning,[mbOk],0);
    dbDateEdit2.SetFocus;
    exit;
  end;
  qryProtocolo.Edit;
  qryProtocolo.fieldbyname('Status_Entrega').AsString := 'E';
  qryProtocolo.Post;
  edtProtocoloExit(Sender);
end;

procedure TDocEmitido_f.BitBtn5Click(Sender: TObject);
begin
  inherited;
  qryProtocolo.Edit;
  qryProtocolo.fieldbyname('Status_Entrega').AsString := 'R';
  qryProtocolo.Post;
  edtProtocoloExit(Sender);
end;

procedure TDocEmitido_f.BitBtn7Click(Sender: TObject);
begin
  inherited;
  qryProtocolo.Edit;
  qryProtocolo.fieldbyname('Status_Entrega').AsString := 'N';
  qryProtocolo.Post;
  edtProtocoloExit(Sender);
end;

procedure TDocEmitido_f.BitBtn6Click(Sender: TObject);
begin
  inherited;
  qryProtocolo.Edit;
  qryProtocolo.fieldbyname('Status_Entrega').AsString := 'D';
  qryProtocolo.Post;
  edtProtocoloExit(Sender);
end;

procedure TDocEmitido_f.BitBtn9Click(Sender: TObject);
begin
  inherited;
  qryProtocolo.Edit;
  qryProtocolo.fieldbyname('Status_Entrega').AsString := 'P';
  qryProtocolo.Post;
  edtProtocoloExit(Sender);
end;

procedure TDocEmitido_f.BitBtn10Click(Sender: TObject);
var ArqTmp  : TextFile;
    NomeArq : String;
    qtdePro : Integer;
    x, y, p : Integer;
    copia   : Integer;
    qtdLinha: Integer;
    Protocolo : array[1..3] of array of String;
begin
  inherited;
  if edtProtocolo.Text = '' then
  begin
    messagedlg('Informe o número do Protocolo.',mtWarning,[mbOk],0);
    exit;
  end;

  qryImpPro.Close;
  qryImpPro.SQL.Text := 'SELECT COUNT(*) FROM GC_DOCUMENTO_EMITIDO WHERE COD_PROTOCOLO='+ edtProtocolo.Text;
  qryImpPro.Open;

  if (qryImpPro.Fields[0].AsInteger / 12) = trunc(qryImpPro.Fields[0].AsInteger / 12) then
    qtdePro := trunc(qryImpPro.Fields[0].AsInteger / 12)
  else
    qtdePro := trunc(qryImpPro.Fields[0].AsInteger / 12) + 1;


  qryImpPro.Close;
  qryImpPro.SQL.Text := 'SELECT EMI.*, DOC.DESC_DOCTO FROM GC_DOCUMENTO_EMITIDO EMI '+
                        ' LEFT JOIN GC_DOCUMENTO DOC ON (EMI.COD_DOCTO=DOC.COD_DOCTO) '+
                        ' WHERE COD_PROTOCOLO ='+edtProtocolo.Text+')';
  qryImpPro.Open;

  qtdLinha := qtdePro*12;

  setlength(protocolo[1],qtdLinha+1);
  setlength(protocolo[2],qtdLinha+1);
  setlength(protocolo[3],qtdLinha+1);

  qryImpPro.Close;
  qryImpPro.SQL.Text := 'SELECT EMI.*, DOC.DESC_DOCTO FROM GC_DOCUMENTO_EMITIDO EMI '+
                        ' LEFT JOIN GC_DOCUMENTO DOC ON (EMI.COD_DOCTO=DOC.COD_DOCTO) '+
                        ' WHERE COD_PROTOCOLO='+edtProtocolo.Text;
  qryImpPro.Open;

  x := 1;
  while not qryImpPro.Eof do
  begin
    Protocolo[1,x] := qryImpPro.FieldByName('Desc_Docto').AsString;
    Protocolo[2,x] := qryImpPro.FieldByName('Obs_Docto_Emi').AsString;
    Protocolo[3,x] := qryImpPro.FieldByName('Dt_Vencimento').AsString;
    qryImpPro.Next;
    inc(x);
  end;
  for y := x to qtdLinha do
  begin
    Protocolo[1,y] := '';
    Protocolo[2,y] := '';
    Protocolo[3,y] := '';
  end;

  qryImpPro.Close;
  qryImpPro.SQL.Text := 'SELECT * FROM GC_PROTOCOLO PRO '+
                        ' LEFT JOIN GC_CLIENTE CLI ON (PRO.COD_CLIENTE=CLI.COD_CLIENTE) '+
                        ' LEFT JOIN GC_FUNCIONARIO FUN ON (PRO.COD_FUNC_CAD=FUN.COD_FUNC) '+
                        ' LEFT JOIN GC_DEPARTAMENTO DEP ON (FUN.COD_DEPTO=DEP.COD_DEPTO) '+
                        ' WHERE COD_PROTOCOLO = ' + edtProtocolo.Text;
  qryImpPro.Open;

  NomeArq := ExtractFileDir(application.ExeName) + '\TMP_Protocolo2.html';
  assignfile(ArqTmp,NomeArq);
  ReWrite(ArqTmp);
  try
    for x := 1 to qtdePro do
    begin

      writeln(arqTmp,'<html>');
      writeln(arqTmp,'<head>');
      writeln(arqTmp,'<meta http-equiv="Content-Language" content="pt-br">');
      writeln(arqTmp,'<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">');
      writeln(arqTmp,'<meta name="GENERATOR" content="Microsoft FrontPage 4.0">');
      writeln(arqTmp,'<meta name="ProgId" content="FrontPage.Editor.Document">');
      writeln(arqTmp,'<title>Emissão Protocolo</title>');
      writeln(arqTmp,'</head>');
      writeln(arqTmp,'<body>');
      writeln(arqTmp,'<table border="0" width="740" height="82" cellspacing="2" cellpadding="2">');
      writeln(arqTmp,'<tr>');
      for copia := 1 to 2 do
      begin
        p := (x * 12) - 11;
        writeln(arqTmp,'<td>');
        writeln(arqTmp,'<table border="1" width="365" height="82" cellspacing="0" cellpadding="0">');
        writeln(arqTmp,'  <tr>');
        writeln(arqTmp,'    <td width="340" height="47">');
        writeln(arqTmp,'      <table border="0" width="100%" cellspacing="0" cellpadding="0" height="41">');
        writeln(arqTmp,'        <tr>');
        writeln(arqTmp,'          <td width="168%" height="41">');
        writeln(arqTmp,'            <table border="0" width="100%" cellspacing="0">');
        writeln(arqTmp,'              <tr>');
        writeln(arqTmp,'                <td width="100%">');
        writeln(arqTmp,'                  <p align="center"><b><font size="1">Protocolo de Envio Nº: '+formatfloat('000000000',qryImpPro.FieldByName('cod_protocolo').AsInteger) +'</font></b></p>');
        writeln(arqTmp,'                </td>');
        writeln(arqTmp,'              </tr>');
        writeln(arqTmp,'              <tr>');
        writeln(arqTmp,'                <td width="100%">');
        writeln(arqTmp,'                  <p align="center"><font size="1">'+ lerIni(caminho+'Atendimento.ini','CIDADE','CLIENTE')+ '<BR>' + lerIni(caminho+'Atendimento.ini','CIDADE','ENDERECO') + '<BR>FONE: ' + lerIni(caminho+'Atendimento.ini','CIDADE','TELEFONE') + ' FAX: ' + lerIni(caminho+'Atendimento.ini','CIDADE','FAX') + '</font></p>');
        writeln(arqTmp,'                </td>');
        writeln(arqTmp,'              </tr>');
        writeln(arqTmp,'            </table>');
        writeln(arqTmp,'          </td>');
        writeln(arqTmp,'        </tr>');
        writeln(arqTmp,'      </table>');
        writeln(arqTmp,'    </td>');
        writeln(arqTmp,'  </tr>');
        writeln(arqTmp,'  <tr>');
        writeln(arqTmp,'    <td width="340" height="8">');
        writeln(arqTmp,'      <table border="0" width="100%" cellspacing="0" cellpadding="0">');
        writeln(arqTmp,'        <tr>');
        writeln(arqTmp,'          <td width="100%"><font size="1"><b>Cliente: </b>'+qryImpPro.FieldByName('nome_cli').AsString+'</font></td>');
        writeln(arqTmp,'        </tr>');
        writeln(arqTmp,'        <tr>');
        writeln(arqTmp,'          <td width="100%"><font size="1"><b>Endereço: </b>'+qryImpPro.FieldByName('endereco_cli').AsString+'</font></td>');
        writeln(arqTmp,'        </tr>');
        writeln(arqTmp,'      </table>');
        writeln(arqTmp,'    </td>');
        writeln(arqTmp,'  </tr>');
        writeln(arqTmp,'  <tr>');
        writeln(arqTmp,'    <td width="340" height="32">');
        writeln(arqTmp,'      <table border="0" width="100%" cellspacing="0" height="13" cellpadding="0">');
        writeln(arqTmp,'        <tr>');
        writeln(arqTmp,'          <th width="8%" height="11">');
        writeln(arqTmp,'            <p align="center"><font size="1">Nº</font></th>');
        writeln(arqTmp,'          <th width="54%" height="11"><font size="1" face="Times New Roman">Descrição</font></th>');
        writeln(arqTmp,'          <th width="18%" height="11">');
        writeln(arqTmp,'            <p align="center"><font size="1">Vencto.</font></th>');
        writeln(arqTmp,'        </tr>');

        for y := 1 to 12 do
        begin
          writeln(arqTmp,'      <tr>');
          {&nbsp;}
          if protocolo[1,p] <> '' then
          begin
            writeln(arqTmp,'        <td width="8%" height="23">');
            writeln(arqTmp,'          <p align="center"><font size="1">'+formatfloat('00',y)+'</font></td>');
            writeln(arqTmp,'        <td width="54%" height="23"><font size="1" face="Times New Roman">'+ protocolo[1,p]+ ' ' + protocolo[2,p] + '</font></td>');
            writeln(arqTmp,'        <td width="18%" height="23">');
          end
          else
          begin
            writeln(arqTmp,'        <td width="8%" height="23"><p align="center"><font size="1">&nbsp;</font></td>');
            writeln(arqTmp,'        <td width="54%" height="23"><font size="1" face="Times New Roman">&nbsp;</font></td>');
            writeln(arqTmp,'        <td width="18%" height="23">');
          end;
          if protocolo[3,p] <> '' then
            writeln(arqTmp,'          <p align="center"><font size="1">'+protocolo[3,p]+'</font></td>')
          else
            writeln(arqTmp,'          <p align="center"><font size="1">&nbsp;</font></td>');
          writeln(arqTmp,'      </tr>');
          inc(p);
        end;
        writeln(arqTmp,'      </table>');
        writeln(arqTmp,'    </td>');
        writeln(arqTmp,'  </tr>');
        writeln(arqTmp,'  <tr>');
        writeln(arqTmp,'    <td width="340" height="55">');
        writeln(arqTmp,'      <table border="0" width="100%" cellspacing="0" cellpadding="0">');
        writeln(arqTmp,'        <tr>');
        writeln(arqTmp,'          <td width="41%"><font size="1">Emissão: '+formatdatetime('dd/mm/yyyy',qryImpPro.FieldByName('dt_emissao_proto').AsDateTime)+'</font></td>');
        if formatdatetime('dd/mm/yyyy',qryImpPro.FieldByName('dt_entrega_prev').AsDateTime) <> '30/12/1899' then
          writeln(arqTmp,'          <td width="59%"><font size="1">Entregar até: ' + formatdatetime('dd/mm/yyyy',qryImpPro.FieldByName('dt_entrega_prev').AsDateTime)+ '</font></td>')
        else
          writeln(arqTmp,'          <td width="59%"><font size="1">Entregar até:</font></td>');

        writeln(arqTmp,'        </tr>');
        writeln(arqTmp,'        <tr>');
        writeln(arqTmp,'          <td width="41%">');
        writeln(arqTmp,'            <table border="0" width="100%" cellspacing="0" cellpadding="0" height="30">');
        writeln(arqTmp,'              <tr>');
        writeln(arqTmp,'                <td width="100%" height="15"><font size="1">Entrega:</font></td>');
        writeln(arqTmp,'              </tr>');
        writeln(arqTmp,'              <tr>');
        writeln(arqTmp,'                <td width="100%" height="15"><font size="1">&nbsp;</font></td>');
        writeln(arqTmp,'              </tr>');
        writeln(arqTmp,'            </table>');
        writeln(arqTmp,'          </td>');
        writeln(arqTmp,'          <td width="59%">');
        writeln(arqTmp,'            <table border="0" width="100%" cellspacing="0" cellpadding="0" height="30">');
        writeln(arqTmp,'              <tr>');
        writeln(arqTmp,'                <td width="100%" height="14"></td>');
        writeln(arqTmp,'              </tr>');
        writeln(arqTmp,'              <tr>');
        writeln(arqTmp,'                <td width="100%" height="16">');
        writeln(arqTmp,'                  <p align="center"><font size="1">Carimbo e Assinatura da Empresa</font></td>');
        writeln(arqTmp,'              </tr>');
        writeln(arqTmp,'            </table>');
        writeln(arqTmp,'          </td>');
        writeln(arqTmp,'        </tr>');
        writeln(arqTmp,'        <tr>');
        writeln(arqTmp,'          <td width="41%"><font size="1">Departamento: '+qryImpPro.FieldByName('desc_depto').AsString+'</font></td>');
        writeln(arqTmp,'          <td width="59%"><font size="1">Funcionário: '+qryImpPro.FieldByName('apelido_func').AsString+'</font></td>');
        writeln(arqTmp,'        </tr>');
        writeln(arqTmp,'      </table>');
        writeln(arqTmp,'    </td>');
        writeln(arqTmp,'  </tr>');
        writeln(arqTmp,'</table>');
        writeln(arqTmp,'</td>');
      end;
    end;
    writeln(arqTmp,'</tr>');
  finally
    CloseFile(ArqTmp);
  end;
  shellexecute(Self.Handle,'open', pChar(NomeArq),'','',SW_SHOW);
end;

procedure TDocEmitido_f.BitBtn11Click(Sender: TObject);
begin
  inherited;
  if assigned(CopiaProtocolo_f) then
    CopiaProtocolo_f := nil;

  CopiaProtocolo_f := TCopiaProtocolo_f.Create(Self);
  try
    if edtProtocolo.text = '' then
      CopiaProtocolo_f.cod_protocolo := 0
    else
      CopiaProtocolo_f.cod_protocolo := StrToInt(edtProtocolo.text);
    CopiaProtocolo_f.Show;
  except
    ShowMessage('Não é possivel copiar protocolo. Informe o Código do Protocolo.');
    CopiaProtocolo_f.Free;
  end;
end;

procedure TDocEmitido_f.Documentos1Click(Sender: TObject);
begin
  inherited;
  if assigned(CadDocumento_f) then
    CadDocumento_f := nil;

  CadDocumento_f := TCadDocumento_f.Create(Self);
  try
    CadDocumento_f.Show;
  except
    CadDocumento_f := TCadDocumento_f.Create(Self);
    CadDocumento_f.Show;
  end;
end;

end.
