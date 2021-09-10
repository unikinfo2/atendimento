unit CadLigacao_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, Menus, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, Db, DBTables,
  RxCalc, variants;

type
  TCadLigacao_f = class(TDeriva_f)
    medCliente: TMaskEdit;
    Label1: TLabel;
    sbPesq: TSpeedButton;
    Label2: TLabel;
    edtNomeCli: TEdit;
    DBMemo1: TDBMemo;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit1: TDBEdit;
    Label3: TLabel;
    Label4: TLabel;
    edtCodigo: TEdit;
    SpeedButton1: TSpeedButton;
    Label5: TLabel;
    Label6: TLabel;
    dsLigacao: TDataSource;
    qryLigacao: TQuery;
    medLigacao: TMaskEdit;
    Label7: TLabel;
    SpeedButton2: TSpeedButton;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    qryLigacaoCOD_LIGACAO: TIntegerField;
    qryLigacaoCOD_CLIENTE: TIntegerField;
    qryLigacaoCOD_FUNC: TIntegerField;
    qryLigacaoCOD_DEPTO: TIntegerField;
    qryLigacaoPRIORIDADE_LIG: TStringField;
    qryLigacaoSTATUS_LIG: TStringField;
    qryLigacaoDT_PEDIDO_LIG: TDateTimeField;
    qryLigacaoDT_FECHAMENTO_LIG: TDateTimeField;
    qryLigacaoFONE1: TStringField;
    qryLigacaoFONE2: TStringField;
    qryLigacaoFONE3: TStringField;
    qryLigacaoFONE4: TStringField;
    qryLigacaoCONTATO: TStringField;
    qryLigacaoRAMAL1: TStringField;
    qryLigacaoRAMAL2: TStringField;
    qryLigacaoRAMAL3: TStringField;
    qryLigacaoRAMAL4: TStringField;
    qryLigacaoCOD_FUNC_CAD: TIntegerField;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label10: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    edtFunc: TEdit;
    qryAux: TQuery;
    BitBtn3: TBitBtn;
    rgStatus: TDBRadioGroup;
    quemfala: TDBRadioGroup;
    qryLigacaoQUEMFALA: TStringField;
    qryLigacaoCOD_CONTATO: TIntegerField;
    Label14: TLabel;
    medContato: TMaskEdit;
    sbContato: TSpeedButton;
    edtNomeContato: TEdit;
    Label15: TLabel;
    DBRadioGroup2: TDBRadioGroup;
    qryLigacaoTIPO_LIGACAO: TStringField;
    btnRet: TBitBtn;
    qryLigacaoINFORMADO_LIG: TStringField;
    qryLigacaoDESC_LIG: TMemoField;
    qryLigacaoOBS_LIG: TMemoField;
    qryLigacaoPARTICULAR_LIG: TStringField;
    SpeedButton3: TSpeedButton;
    AssuntosPrDefinidos1: TMenuItem;
    qryLigacaoCOD_ASSUNTO: TIntegerField;
    edtClass: TEdit;
    DBRadioGroup3: TDBRadioGroup;
    medAtendimento: TMaskEdit;
    Label16: TLabel;
    SpeedButton5: TSpeedButton;
    qryAtendimento: TQuery;
    qryAtendimentoCOD_ATENDIMENTO: TIntegerField;
    qryAtendimentoCOD_CLIENTE: TIntegerField;
    qryAtendimentoSTATUS_ATEND: TStringField;
    qryAtendimentoPRIORIDADE_ATEND: TStringField;
    qryAtendimentoDT_ATEND: TDateTimeField;
    qryAtendimentoTIPO_ATEND: TStringField;
    qryAtendimentoDT_COMPET_INI: TDateTimeField;
    qryAtendimentoDT_COMPET_FIN: TDateTimeField;
    qryAtendimentoDT_VENCTO: TDateTimeField;
    qryAtendimentoVALOR_DOCTO: TFloatField;
    qryAtendimentoCOD_DOCTO: TIntegerField;
    qryAtendimentoCOD_DEPTO: TIntegerField;
    qryAtendimentoNOME_CLIFUNC: TStringField;
    qryAtendimentoCOD_FUNC: TIntegerField;
    qryAtendimentoCOBRA_ATEND: TStringField;
    qryAtendimentoEMAIL_ATEND: TStringField;
    qryAtendimentoRELATO_CLIENTE: TBlobField;
    qryAtendimentoDT_PREV_FECHA: TDateTimeField;
    qryAtendimentoINFORMADO_ATEND: TStringField;
    qryAtendimentoDESCRICAO_ATEND: TMemoField;
    qryLigacaoCOD_ATENDIMENTO: TIntegerField;
    procedure medLigacaoExit(Sender: TObject);
    procedure sbPesqClick(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure medClienteExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sbContatoClick(Sender: TObject);
    procedure medContatoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnRetClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure AssuntosPrDefinidos1Click(Sender: TObject);
    procedure edtClassExit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure medAtendimentoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadLigacao_f: TCadLigacao_f;

implementation
uses Principal, Atendimento_dm, Atendimento_u, CadAssunto_u, funcoes;
{$R *.DFM}

procedure TCadLigacao_f.medLigacaoExit(Sender: TObject);
begin
  inherited;
  if (medLigacao.Text = '') and (BitBtn3.Focused) then
  begin
    exit;
  end
  else if (medLigacao.Text = '') and (not BitBtn3.Focused) then
  begin
    medLigacao.SetFocus;
    exit;
  end;

  with qryLigacao do
  begin
    close;
    ParamByName('Cod_Ligacao').AsString := medLigacao.Text;
    open;
    btnRet.Enabled := (not eof) and (fieldbyname('TIPO_LIGACAO').AsString = 'R');

    if eof then
    begin
      messagedlg('Codigo de Ligação não Cadastrada.',mtInformation,[mbOk],0);
      medLigacao.SetFocus;
      exit;
    end
    else
    begin
      edit;
      medCliente.Enabled := True;
      edtCodigo.Enabled  := True;
      rgStatus.ReadOnly  := True;
      medCliente.Text    := fieldbyName('Cod_Cliente').AsString;
      edtCodigo.Text     := fieldbyName('Cod_Func').AsString;
      medContato.Text    := fieldbyName('Cod_Contato').AsString;
      medAtendimento.Text := fieldbyName('Cod_Atendimento').AsString;

      if fieldByName('cod_assunto').AsInteger > 0 then
      begin
        qryAux.Close;
        qryAux.sql.Text := 'SELECT * FROM GC_ASSUNTO WHERE COD_ASSUNTO = ' + fieldByName('cod_assunto').AsString;
        qryAux.Open;
        edtClass.Text   := qryAux.fieldbyname('classific_assunto').AsString;
      end;
      medClienteExit(sender);
      edtCodigoExit(sender);
      medContatoExit(sender);
    end;
  end;
end;

procedure TCadLigacao_f.sbPesqClick(Sender: TObject);
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

procedure TCadLigacao_f.edtCodigoExit(Sender: TObject);
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
    if qryAux.eof then
    begin
      messagedlg('Codigo de Funcionário não cadastrado.',mtWarning,[mbOk],0);
      edtCodigo.SetFocus;
      exit;
    end;
    edtCodigo.Text  := qryAux.FieldByName('Cod_Func').AsString;
    edtFunc.Text    := qryAux.FieldByName('Nome_Func').AsString;
    qryLigacao.FieldByName('Cod_Depto').AsInteger := qryAux.FieldByName('Cod_Depto').AsInteger;
  end
  else
  begin
    edtCodigo.SetFocus;
  end;
end;

procedure TCadLigacao_f.medClienteExit(Sender: TObject);
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
    medContato.Clear;
    edtNomeContato.Clear;
    if qryLigacao.State = dsInsert then
    begin
      dbEdit1.Field.AsString  := qryAux.FieldByName('Contato_cli').AsString;
      dbEdit9.Field.AsString  := qryAux.FieldByName('Fone1_cli').AsString;
      dbEdit10.Field.AsString := qryAux.FieldByName('Fone2_cli').AsString;
      dbEdit11.Field.AsString := qryAux.FieldByName('Fone3_cli').AsString;
    end;
  end
  else
  begin
    medCliente.Clear;
    edtNomeCli.Clear;
  end;
end;

procedure TCadLigacao_f.BitBtn3Click(Sender: TObject);
begin
  inherited;
  qryLigacao.Close;
  edtNomeCli.Clear;
  medCliente.Clear;
  edtNomeContato.Clear;
  medContato.Clear;
  edtCodigo.Clear;
  edtFunc.Clear;
  medLigacao.Clear;
  edtClass.Clear;
  medAtendimento.Clear;
  btnRet.Enabled := False;

  qryAux.close;
  qryAux.sql.clear;
  qryAux.sql.add('SELECT * FROM GC_FUNCIONARIO WHERE NIVEL_FUNC = ''4'' AND COD_FUNC=' +inttostr(cod_func));
  qryAux.open;

  with qryLigacao do
  begin
    close;
    ParamByName('Cod_Ligacao').AsString := '0';
    open;
    Insert;
    rgStatus.ReadOnly       := False;
    medCliente.Enabled      := True;
    edtCodigo.Enabled       := True;
    medContato.Enabled      := True;
    qryLigacao.FieldByName('STATUS_LIG').AsString  := 'A';
    FieldByName('PRIORIDADE_LIG').AsString         := 'B';
    FieldByName('quemfala').AsString               := 'E';
    if (not qryAux.eof) then
      FieldByName('Tipo_Ligacao').AsString         := 'R'
    else
      FieldByName('Tipo_Ligacao').AsString         := 'S';
    FieldByName('Particular_Lig').AsString         := 'C';
    FieldByName('COD_FUNC').AsString               := edtCodigo.Text;
    FieldByName('COD_FUNC_CAD').AsInteger          := Cod_Func;
    edtCodigo.Text                                 := IntToStr(Cod_Func);
    edtCodigoExit(sender);
    medCliente.SetFocus;
  end;
end;

procedure TCadLigacao_f.BitBtn1Click(Sender: TObject);
var Cod, vCod_Depto, vAtend   : Integer;
    vTipo : String;
    NaoGeraAtend : Boolean;
begin
  inherited;
  medLigacao.Clear;
  if qryLigacao.State = dsEdit then
  begin
    qryLigacao.FieldByName('COD_FUNC').AsString        := edtCodigo.Text;
    qryLigacao.FieldByName('Dt_Pedido_lig').AsDateTime := now();
    qryLigacao.FieldByName('Cod_Cliente').AsString     := medCliente.text;
    qryLigacao.FieldByName('Cod_Contato').AsString     := medContato.text;
    qryLigacao.FieldByName('Cod_Atendimento').value    := null;
    if medAtendimento.Text <> '' then
      qryLigacao.FieldByName('Cod_Atendimento').AsString := medAtendimento.text;
    qryLigacao.Post;
    medCliente.Enabled := False;
    medContato.Enabled := False;
    edtCodigo.Enabled  := False;
  end;
  if qryLigacao.State = dsInsert then
  begin
    if ((qryLigacao.FieldByName('Tipo_Ligacao').AsString   = 'R') or (qryLigacao.FieldByName('Tipo_Ligacao').AsString   = 'S')) and
       (qryLigacao.FieldByName('Particular_lig').AsString = 'C') then
    begin
      NaoGeraAtend := messagedlg('Deseja gerar um atendimento a partir desta ligação recebida ?',mtConfirmation,[mbYes, mbNo],0) = idNo;
      if (trim(medCliente.Text) = '') and (not NaoGeraAtend) then
      begin
        messagedlg('É necessário informar o codigo do cliente para ligações Recebidas não particulares.',mtWarning,[mbOk],0);
        medCliente.SetFocus;
        exit;
      end;
    end;
    cod := Proximo('GC_LIGACAO','COD_LIGACAO','', true);
    qryLigacao.FieldByName('COD_LIGACAO').AsInteger    := cod;
    qryLigacao.FieldByName('COD_FUNC').AsString        := edtCodigo.Text;
    qryLigacao.FieldByName('Dt_Pedido_lig').AsDateTime := now();
    qryLigacao.FieldByName('Cod_Cliente').AsString     := medCliente.text;
    qryLigacao.FieldByName('Cod_Contato').AsString     := medContato.text;
    qryLigacao.FieldByName('Cod_Atendimento').value    := null;
    if medAtendimento.Text <> '' then
      qryLigacao.FieldByName('Cod_Atendimento').AsString := medAtendimento.text;
    qryLigacao.Post;
    medLigacao.Text    := IntToStr(cod);
    medCliente.Enabled := False;
    edtCodigo.Enabled  := False;
    medContato.Enabled := False;
    medLigacaoExit(Sender);

    if (qryLigacao.FieldByName('Tipo_Ligacao').AsString   = 'R') and
       (qryLigacao.FieldByName('Particular_lig').AsString = 'C') then
    begin
      if NaoGeraAtend then
      begin
        exit;
      end;
      qryAux.Close;
      qryAux.SQL.Text := 'SELECT * FROM GC_FUNCIONARIO WHERE  ATIVO_FUNC <> ''N'' AND COD_FUNC = ' + edtCodigo.Text;
      qryAux.Open;
      vCod_Depto := qryAux.FieldByName('cod_depto').AsInteger;

      vTipo := 'Recebida';

      if assigned(Atendimento_f) then
        Atendimento_f := nil;

      qryAux.Close;
      qryAux.sql.Text := 'INSERT INTO GC_ATENDIMENTO ( COD_ATENDIMENTO, '+
                         ' COD_CLIENTE       , '+
                         ' DESCRICAO_ATEND   , '+
                         ' STATUS_ATEND      , '+
                         ' PRIORIDADE_ATEND  , '+
                         ' DT_ATEND          , '+
                         ' TIPO_ATEND        , '+
                         ' DT_COMPET_INI     , '+
                         ' DT_COMPET_FIN     , '+
                         ' DT_VENCTO         , '+
                         ' COD_DEPTO         , '+
                         ' NOME_CLIFUNC      , '+
                         ' COD_FUNC          , '+
                         ' EMAIL_ATEND       , '+
                         ' COBRA_ATEND       , '+
                         ' DT_PREV_FECHA     , '+
                         ' INFORMADO_ATEND     '+
                         ' ) VALUES (           '+
                         ' :COD_ATENDIMENTO,    '+
                         ' :COD_CLIENTE       , '+
                         ' :DESCRICAO_ATEND   , '+
                         ' :STATUS_ATEND      , '+
                         ' :PRIORIDADE_ATEND  , '+
                         ' :DT_ATEND          , '+
                         ' :TIPO_ATEND        , '+
                         ' :DT_COMPET_INI     , '+
                         ' :DT_COMPET_FIN     , '+
                         ' :DT_VENCTO         , '+
                         ' :COD_DEPTO         , '+
                         ' :NOME_CLIFUNC      , '+
                         ' :COD_FUNC          , '+
                         ' :EMAIL_ATEND       , '+
                         ' :COBRA_ATEND       , '+
                         ' :DT_PREV_FECHA     , '+
                         ' :INFORMADO_ATEND )';

      vAtend := Proximo('GC_ATENDIMENTO','COD_ATENDIMENTO','', true);
      qryAux.ParamByName('Cod_Atendimento').AsInteger   := vAtend;
      qryAux.ParamByName('cod_cliente').AsInteger       := qryLigacao.FieldByName('Cod_Cliente').AsInteger;
      qryAux.ParamByName('DESCRICAO_ATEND').AsString    := 'Atendimento originado da Ligação '+vTipo+' Nº: ' +
                                                           formatfloat('00000', qryLigacao.FieldByName('Cod_Ligacao').AsInteger) + #13#10 +
                                                           'Data da Ligação: '+ formatdatetime('dd/mm/yyyy hh:nn', qryLigacao.FieldByName('dt_pedido_lig').AsDateTime) + #13#10 +
                                                           qryLigacao.FieldByName('Desc_Lig').AsString;

      qryAux.ParamByName('STATUS_ATEND').AsString       := 'A';
      qryAux.ParamByName('PRIORIDADE_ATEND').AsString   := 'B';
      qryAux.ParamByName('DT_ATEND').AsDateTime         := now();
      qryAux.ParamByName('TIPO_ATEND').AsInteger        := 0;
      qryAux.ParamByName('COD_DEPTO').DataType          := ftInteger;
      qryAux.ParamByName('DT_COMPET_INI').DataType      := ftDateTime;
      qryAux.ParamByName('DT_COMPET_FIN').DataType      := ftDateTime;
      qryAux.ParamByName('DT_PREV_FECHA').DataType      := ftDateTime;
      qryAux.ParamByName('DT_VENCTO').DataType          := ftDateTime;
      qryAux.ParamByName('COD_DEPTO').value             := null;
      if vCod_Depto > 0 then
        qryAux.ParamByName('COD_DEPTO').AsInteger       := vCod_Depto;
      qryAux.ParamByName('NOME_CLIFUNC').AsString       := qryLigacao.FieldByName('Contato').AsString;
      qryAux.ParamByName('COD_FUNC').AsInteger          := StrToInt(edtCodigo.text);
      qryAux.ParamByName('COBRA_ATEND').AsString        := 'S';
      qryAux.ParamByName('INFORMADO_ATEND').AsString    := 'N';
      qryAux.ParamByName('email_atend').AsString        := 'N';
      qryAux.ExecSQL;
      messagedlg('Atendimento Nº ' + formatfloat('00000000',vAtend)+ ' foi gerado com sucesso.',mtInformation,[mbOk],0);
    end;
  end;
  qryLigacao.Close;
  edtNomeCli.Clear;
  medCliente.Clear;
  edtCodigo.Clear;
  edtFunc.Clear;
  edtNomeContato.Clear;
  medContato.Clear;
  edtClass.Clear;
  medAtendimento.Clear;
  medLigacao.SetFocus;
end;

procedure TCadLigacao_f.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if qryLigacao.State in [dsEdit, dsInsert] then
    qryLigacao.Cancel;
  qryLigacao.Close;
  edtNomeCli.Clear;
  medCliente.Clear;
  edtCodigo.Clear;
  edtFunc.Clear;
  medAtendimento.Clear;
  medLigacao.Clear;
  edtClass.Clear;
  medCliente.Enabled := False;
  edtCodigo.Enabled  := False;
  medLigacao.SetFocus;
end;

procedure TCadLigacao_f.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if messagedlg('Deseja realmente apagar este Agendamento de Ligação ?',mtWarning,[mbYes,mbNo],0) = idYes then
  begin
    if (qryLigacao.active) and (not qryLigacao.eof) then
    begin
      if qryLigacao.FieldByName('Status_lig').AsString = 'A' then
      begin
        qryLigacao.Cancel;
        qryLigacao.Delete;
        BitBtn2Click(Sender);
      end
      else
      begin
        messagedlg('É possivel apagar apenas ligações em aberto.',mtWarning,[mbOk],0);
        exit;
      end;
    end
    else
    begin
      messagedlg('Não foi possível apagar esta ligação, tente mais tarde.',mtWarning,[mbOk],0);
      exit;
    end;
  end;
end;

procedure TCadLigacao_f.SpeedButton2Click(Sender: TObject);
var sSql : String;
begin
  inherited;
  sSql := 'SELECT LIG.*, CLI.NOME_CLI, FUN.NOME_FUNC, DEP.DESC_DEPTO ' +
          ' FROM GC_LIGACAO LIG ' +
          ' LEFT JOIN GC_CLIENTE CLI ON (LIG.COD_CLIENTE=CLI.COD_CLIENTE) ' +
          ' LEFT JOIN GC_FUNCIONARIO FUN ON (LIG.COD_FUNC=FUN.COD_FUNC) ' +
          ' LEFT JOIN GC_DEPARTAMENTO DEP ON (LIG.COD_DEPTO=DEP.COD_DEPTO) ' +
          ' ORDER BY LIG.DT_PEDIDO_LIG ';

  dmPesq.PesLig.StringSql.Clear;
  dmPesq.PesLig.StringSql.Add(sSql);
  dmPesq.PesLig.Execute;
  if dmPesq.PesLig.ValoresRetorno[0] <> '' then
  begin
    medLigacao.Clear;
    medLigacao.Text := dmPesq.PesLig.ValoresRetorno[0];
    medLigacaoExit(sender);
  end;
end;

procedure TCadLigacao_f.sbContatoClick(Sender: TObject);
begin
  inherited;
  dmPesq.PesAgenda.Execute;
  if dmPesq.PesAgenda.ValoresRetorno[0] <> '' then
  begin
    medContato.Clear;
    edtNomeContato.Clear;
    medContato.Text     := dmPesq.PesAgenda.ValoresRetorno[0];
    edtNomeContato.Text := dmPesq.PesAgenda.ValoresRetorno[1];
  end;
end;

procedure TCadLigacao_f.medContatoExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
  if medContato.Text <> '' then
  begin
    qryAux.Close;
    qryAux.SQL.Text := 'SELECT * FROM GC_AGENDA WHERE COD_CONTATO='+medContato.Text;
    qryAux.Open;
    if qryAux.eof then
    begin
      messagedlg('Codigo de Contato não cadastrado.',mtWarning,[mbOk],0);
      medContato.SetFocus;
      exit;
    end;
    medContato.Text      := qryAux.FieldByName('Cod_Contato').AsString;
    edtNomeContato.Text  := qryAux.FieldByName('Nome_Contato').AsString;
    medCliente.Clear;
    edtNomeCli.Clear;
    if qryLigacao.State = dsInsert then
    begin
      dbEdit1.Field.AsString  := qryAux.FieldByName('Nome_Contato').AsString;
      dbEdit9.Field.AsString  := qryAux.FieldByName('Fone1_Contato').AsString;
      dbEdit10.Field.AsString := qryAux.FieldByName('Fone2_Contato').AsString;
      dbEdit11.Field.AsString := qryAux.FieldByName('Fone3_Contato').AsString;
    end;
  end
  else
  begin
    medContato.Clear;
    edtNomeContato.Clear;
  end;
end;

procedure TCadLigacao_f.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  dmPesq.PesFunc2.Execute;
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
  qryLigacao.FieldByName('Cod_Depto').AsInteger := qryAux.FieldByName('Cod_Depto').AsInteger;
end;

procedure TCadLigacao_f.btnRetClick(Sender: TObject);
var cod, codAssunto : Integer;
    Status, Priori, Assunto : String;
    Fone1, Fone2, Fone3, Ramal1, Ramal2, Ramal3, contato : String;
begin
  inherited;
  if qryLigacao.Active then
  begin
    Status  := qryLigacao.FieldByName('Status_lig').AsString;
    Priori  := qryLigacao.FieldByName('Prioridade_lig').AsString;
    Assunto := qryLigacao.FieldByName('desc_lig').AsString;
    Fone1   := qryLigacao.FieldByName('fone1').AsString;
    Fone2   := qryLigacao.FieldByName('fone2').AsString;
    Fone3   := qryLigacao.FieldByName('fone3').AsString;
    Ramal1  := qryLigacao.FieldByName('Ramal1').AsString;
    Ramal2  := qryLigacao.FieldByName('Ramal2').AsString;
    Ramal3  := qryLigacao.FieldByName('Ramal3').AsString;
    Contato := qryLigacao.FieldByName('contato').AsString;
    CodAssunto := qryLigacao.FieldByName('cod_assunto').AsInteger;
    qryLigacao.Insert;
    cod := Proximo('GC_LIGACAO','COD_LIGACAO','', true);
    qryLigacao.FieldByName('COD_LIGACAO').AsInteger    := cod;
    if codAssunto > 0 then
      qryLigacao.FieldByName('COD_ASSUNTO').AsInteger    := codAssunto;
    qryLigacao.FieldByName('COD_FUNC').AsString        := edtCodigo.Text;
    qryLigacao.FieldByName('Dt_Pedido_lig').AsDateTime := now();
    qryLigacao.FieldByName('Cod_Cliente').AsString     := medCliente.text;
    qryLigacao.FieldByName('TIPO_LIGACAO').AsString    := 'S';
    qryLigacao.FieldByName('STATUS_LIG').AsString      := Status;
    qryLigacao.FieldByName('Prioridade_LIG').AsString  := Priori;
    qryLigacao.FieldByName('Desc_LIG').AsString        := Assunto;
    qryLigacao.FieldByName('Cod_Contato').AsString     := medContato.text;
    qryLigacao.FieldByName('fone1').AsString           := fone1;
    qryLigacao.FieldByName('fone2').AsString           := fone2;
    qryLigacao.FieldByName('fone3').AsString           := fone3;
    qryLigacao.FieldByName('Ramal1').AsString          := Ramal1;
    qryLigacao.FieldByName('Ramal2').AsString          := Ramal2;
    qryLigacao.FieldByName('Ramal3').AsString          := Ramal3;
    qryLigacao.FieldByName('contato').AsString         := Contato;
    qryLigacao.Post;
    medLigacao.Text := IntToStr(cod);
    medCliente.Enabled := False;
    edtCodigo.Enabled  := False;
    medContato.Enabled := False;

    qryLigacao.Close;
    edtNomeCli.Clear;
    medCliente.Clear;
    edtCodigo.Clear;
    edtFunc.Clear;
    edtNomeContato.Clear;
    medContato.Clear;
    medLigacao.SetFocus;
  end;
end;

procedure TCadLigacao_f.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  dmPesq.PesAssunto.Execute;
  if qryLigacao.State = dsInsert then
  begin
    if dmPesq.PesAssunto.ValoresRetorno[1] <> '' then
    begin
      if qryLigacao.FieldByName('Cod_Depto').AsString <> dmPesq.PesAssunto.ValoresRetorno[2] then
      begin
        if messagedlg('Assunto diferente do Depto. do Funcionário, continua ?',mtConfirmation,[mbYes, mbNo],0) = idNo then
        begin
          exit;
        end;
      end;
      qryLigacao.FieldByName('COD_ASSUNTO').AsString := dmPesq.PesAssunto.ValoresRetorno[1];
      dbMemo1.Lines.Text                             := dmPesq.PesAssunto.ValoresRetorno[0];
      edtClass.Text                                  := dmPesq.PesAssunto.ValoresRetorno[3];
    end;
  end;
end;

procedure TCadLigacao_f.AssuntosPrDefinidos1Click(Sender: TObject);
begin
  inherited;
  if assigned(CadAssunto_f) then
    CadAssunto_f := nil;

  CadAssunto_f := TCadAssunto_f.Create(Self);
  try
    CadAssunto_f.Show;
  except
    CadAssunto_f := TCadAssunto_f.Create(Self);
    CadAssunto_f.Show;
  end;
end;

procedure TCadLigacao_f.edtClassExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
  if qryLigacao.State = dsInsert then
  begin
    if edtClass.Text <> '' then
    begin
      qryAux.Close;
      qryAux.sql.Text := 'SELECT * FROM GC_ASSUNTO WHERE CLASSIFIC_ASSUNTO = ' + StringSql(edtClass.Text);
      qryAux.Open;
      if not qryAux.eof then
      begin
        qryLigacao.FieldByName('COD_ASSUNTO').AsInteger := qryAux.FieldByName('cod_assunto').AsInteger;
        dbMemo1.Text   := qryAux.FieldByName('desc_assunto').AsString;
      end
      else
      begin
        messagedlg('Codigo do Assunto não cadastrado.',mtWarning,[mbOk],0);
        edtClass.Clear;
        edtClass.SetFocus;
        exit;
      end;
    end;
  end;
end;

procedure TCadLigacao_f.SpeedButton5Click(Sender: TObject);
var sSql : String;
begin
  inherited;
  sSql := 'SELECT ATEND.*, CLI.NOME_CLI, ATEND.DESCRICAO_ATEND AS DESCRICAO_ATEND2 ' +
          ' FROM GC_ATENDIMENTO ATEND   ' +
          ' LEFT JOIN GC_CLIENTE CLI ON (ATEND.COD_CLIENTE=CLI.COD_CLIENTE) ';
  if medCliente.Text <> '' then
   sSQl := sSQl + ' WHERE ATEND.COD_CLIENTE = ' + medCliente.text;

  sSQl := sSQl + ' ORDER BY ATEND.DT_ATEND DESC';

  dmPesq.pesAtendimento.StringSql.Text := sSql;
  dmPesq.pesAtendimento.Execute;

  if dmPesq.pesAtendimento.ValoresRetorno[0] <> '' then
  begin
    medAtendimento.Clear;
    medAtendimento.Text := dmPesq.PesAtendimento.ValoresRetorno[0];
    medAtendimentoExit(sender);
  end;
end;

procedure TCadLigacao_f.medAtendimentoExit(Sender: TObject);
var sSql : String;
begin
  inherited;
  if medAtendimento.Text <> '' then
  begin
    with qryAtendimento do
    begin
      close;
      sql.text := 'SELECT * FROM GC_ATENDIMENTO '+
                  ' WHERE COD_ATENDIMENTO = :COD_ATENDIMENTO ';
      if medCliente.Text <> '' then
       sSQl := sSQl + ' AND ATEND.COD_CLIENTE = ' + medCliente.text;

      ParamByName('Cod_Atendimento').AsString := medAtendimento.Text;
      open;
      if eof then
      begin
        messagedlg('Codigo de Atendimento não Cadastrado ou pertence a outro Cliente',mtInformation,[mbOk],0);
        medAtendimento.SetFocus;
        exit;
      end
      else
      begin
        if fieldbyname('STATUS_ATEND').AsString = 'F' then
        begin
          messagedlg('Este atendimento está fechado, verifique.',mtInformation,[mbOk],0);
          medAtendimento.SetFocus;
          exit;
        end;
        medCliente.Text    := fieldbyName('Cod_Cliente').AsString;
        medClienteExit(sender);
      end;
    end;
  end;
end;

end.
