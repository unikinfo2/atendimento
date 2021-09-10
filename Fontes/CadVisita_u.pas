unit CadVisita_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, Menus, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, Db, DBTables,
  RxCalc, RxDBComb, ComCtrls, variants;

type
  TCadVisita_f = class(TDeriva_f)
    medCliente: TMaskEdit;
    Label1: TLabel;
    sbPesq: TSpeedButton;
    Label2: TLabel;
    edtNomeCli: TEdit;
    DBMemo1: TDBMemo;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtCodigo: TEdit;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    dsVisita: TDataSource;
    qryVisita: TQuery;
    medVisita: TMaskEdit;
    Label7: TLabel;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    edtFunc: TEdit;
    qryAux: TQuery;
    BitBtn3: TBitBtn;
    rgStatus: TDBRadioGroup;
    DBEdit2: TDBEdit;
    Label8: TLabel;
    DBEdit3: TDBEdit;
    Label9: TLabel;
    qryVisitaCOD_VISITA: TIntegerField;
    qryVisitaCOD_FUNC: TIntegerField;
    qryVisitaDT_VISITA: TDateTimeField;
    qryVisitaDT_PREV_RET: TDateTimeField;
    qryVisitaMOTIVO_VISITA: TMemoField;
    qryVisitaOBS_VISITA: TStringField;
    qryVisitaCONTATO_VISITA: TStringField;
    qryVisitaSTATUS_VISITA: TStringField;
    qryVisitaCOD_FUNC_CAD_VIS: TIntegerField;
    qryVisitaCOD_CLIENTE: TIntegerField;
    Label10: TLabel;
    qryVisitaTIPO_COMPROMISSO: TStringField;
    rgCompromisso: TRxDBComboBox;
    Label11: TLabel;
    qryVisitaDETALHE_VISTA: TMemoField;
    DBMemo2: TDBMemo;
    procedure medVisitaExit(Sender: TObject);
    procedure sbPesqClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure medClienteExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure DBMemo2KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadVisita_f: TCadVisita_f;

implementation
uses Principal, Atendimento_dm, funcoes;
{$R *.DFM}

procedure TCadVisita_f.medVisitaExit(Sender: TObject);
begin
  inherited;
  if medVisita.Text = '' then
  begin
    exit;
  end;
  with qryVisita do
  begin
    close;
    ParamByName('Cod_Visita').AsString := medVisita.Text;
    open;
    if eof then
    begin
      messagedlg('Codigo de Visita não Cadastrada.',mtInformation,[mbOk],0);
      medVisita.SetFocus;
      exit;
    end
    else
    begin
      edit;
      rgStatus.ReadOnly  := True;
      medCliente.Enabled := True;
      edtCodigo.Enabled  := True;
      medCliente.Text    := fieldbyName('Cod_Cliente').AsString;
      edtCodigo.Text     := fieldbyName('Cod_Func').AsString;
      medClienteExit(sender);
      edtCodigoExit(sender);
      if FieldByName('TIPO_COMPROMISSO').AsString = 'V' then
        rgCompromisso.ItemIndex := 0
      else if FieldByName('TIPO_COMPROMISSO').AsString = 'F' then
        rgCompromisso.ItemIndex := 1
      else if FieldByName('TIPO_COMPROMISSO').AsString = 'H' then
        rgCompromisso.ItemIndex := 2;
    end;
  end;
end;

procedure TCadVisita_f.sbPesqClick(Sender: TObject);
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

procedure TCadVisita_f.edtCodigoExit(Sender: TObject);
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
    qryAux.SQL.Text := 'SELECT * FROM GC_FUNCIONARIO WHERE  ATIVO_FUNC <> ''N'' AND COD_FUNC='+edtCodigo.Text;
    qryAux.Open;
    edtCodigo.Text  := qryAux.FieldByName('Cod_Func').AsString;
    edtFunc.Text    := qryAux.FieldByName('Nome_Func').AsString;
    {qryVisita.FieldByName('Cod_Depto').AsInteger := qryAux.FieldByName('Cod_Depto').AsInteger;}
  end
  else
  begin
    edtCodigo.SetFocus;
  end;
end;

procedure TCadVisita_f.medClienteExit(Sender: TObject);
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
    medCliente.Text  := qryAux.FieldByName('Cod_Cliente').AsString;
    edtNomeCli.Text  := qryAux.FieldByName('Nome_cli').AsString;
    if qryVisita.State = dsInsert then
    begin
      dbEdit1.Field.AsString  := qryAux.FieldByName('Contato_cli').AsString;
    end;
  end
  else
  begin
    medCliente.Clear;
    edtNomeCli.Clear;
  end;
end;

procedure TCadVisita_f.BitBtn3Click(Sender: TObject);
begin
  inherited;
  qryVisita.Close;
  edtNomeCli.Clear;
  medCliente.Clear;
  edtCodigo.Clear;
  edtFunc.Clear;
  medVisita.Clear;
  with qryVisita do
  begin
    close;
    ParamByName('Cod_Visita').AsString := '0';
    open;
    Insert;
    medCliente.Enabled := True;
    edtCodigo.Enabled  := True;
    rgStatus.ReadOnly  := False;
    qryVisita.FieldByName('STATUS_VISITA').AsString    := 'A';
    qryVisita.FieldByName('TIPO_COMPROMISSO').AsString := 'V';
    rgCompromisso.ItemIndex := 0;
    FieldByName('COD_FUNC').AsString                   := edtCodigo.Text;
    FieldByName('COD_FUNC_CAD_VIS').AsInteger          := Cod_Func;
    FieldByName('DT_VISITA').AsDateTime                := now();
    edtCodigo.Text                                     := IntToStr(Cod_Func);

    edtCodigoExit(sender);
    medCliente.SetFocus;
  end;
end;

procedure TCadVisita_f.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if qryVisita.State = dsEdit then
  begin
    qryVisita.FieldByName('COD_FUNC').AsString        := edtCodigo.Text;
    {qryVisita.FieldByName('Dt_Visita').AsDateTime     := now();}
    if medCliente.text <> '' then
      qryVisita.FieldByName('Cod_Cliente').AsString     := medCliente.text
    else
      qryVisita.FieldByName('Cod_Cliente').Value        := null;

    qryVisita.Post;
    medCliente.Enabled := False;
    edtCodigo.Enabled  := False;
  end;
  if qryVisita.State = dsInsert then
  begin
    qryVisita.FieldByName('COD_FUNC').AsString        := edtCodigo.Text;
    {qryVisita.FieldByName('Dt_Visita').AsDateTime     := now();}
    if medCliente.text <> '' then
      qryVisita.FieldByName('Cod_Cliente').AsString     := medCliente.text;
    qryVisita.FieldByName('STATUS_VISITA').AsString   := 'A';
    qryVisita.Post;
    medCliente.Enabled := False;
    edtCodigo.Enabled  := False;
  end;
  qryVisita.Close;
  edtNomeCli.Clear;
  medCliente.Clear;
  edtCodigo.Clear;
  edtFunc.Clear;
  medVisita.Clear;
  medVisita.SetFocus;
end;

procedure TCadVisita_f.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if qryVisita.State in [dsEdit, dsInsert] then
    qryVisita.Cancel;
  qryVisita.Close;
  edtNomeCli.Clear;
  medCliente.Clear;
  edtCodigo.Clear;
  edtFunc.Clear;
  medVisita.Clear;
  medVisita.SetFocus;
  medCliente.Enabled := False;
  edtCodigo.Enabled  := False;
end;

procedure TCadVisita_f.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if messagedlg('Deseja realmente apagar esta Visita ?',mtWarning,[mbYes,mbNo],0) = idYes then
  begin
    if (qryVisita.active) and (not qryVisita.eof) then
    begin
      if qryVisita.FieldByName('Status_Visita').AsString = 'A' then
      begin
        qryVisita.Cancel;
        qryVisita.Delete;
        BitBtn2Click(Sender);
      end
      else
      begin
        messagedlg('É possivel apagar apenas Visitas em aberto.',mtWarning,[mbOk],0);
        exit;
      end;
    end
    else
    begin
      messagedlg('Não foi possível apagar esta visita, tente mais tarde.',mtWarning,[mbOk],0);
      exit;
    end;
  end;
end;

procedure TCadVisita_f.SpeedButton2Click(Sender: TObject);
var sSql : String;
begin
  inherited;
  sSql := 'SELECT VIS.*, CLI.NOME_CLI, FUN.NOME_FUNC, DEP.DESC_DEPTO ' +
          ' FROM GC_VISITA VIS ' +
          ' LEFT JOIN GC_CLIENTE CLI ON (VIS.COD_CLIENTE=CLI.COD_CLIENTE) ' +
          ' LEFT JOIN GC_FUNCIONARIO FUN ON (VIS.COD_FUNC=FUN.COD_FUNC) ' +
          ' LEFT JOIN GC_DEPARTAMENTO DEP ON (FUN.COD_DEPTO=DEP.COD_DEPTO) ' +
          ' ORDER BY VIS.DT_VISITA ';

  dmPesq.PesVis.StringSql.Clear;
  dmPesq.PesVis.StringSql.Add(sSql);
  dmPesq.PesVis.Execute;
  if dmPesq.PesVis.ValoresRetorno[0] <> '' then
  begin
    medVisita.Clear;
    medVisita.Text := dmPesq.PesVis.ValoresRetorno[0];
    medVisitaExit(sender);
  end;
end;

procedure TCadVisita_f.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  dmPesq.PesFunc2.Execute;
  if dmPesq.PesFunc2.ValoresRetorno[0] <> '' then
  begin
    edtCodigo.Text := dmPesq.PesFunc2.ValoresRetorno[0];
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
end;

procedure TCadVisita_f.DBMemo2KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if key = #13 then
  begin
    esc := False;
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
