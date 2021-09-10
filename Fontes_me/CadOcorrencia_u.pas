unit CadOcorrencia_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, Menus, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, Db, DBTables,
  RxCalc, SakEmail, funcoes;

type
  TCadOcorrencia_f = class(TDeriva_f)
    Panel1: TPanel;
    Panel2: TPanel;
    edtCodigo: TEdit;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    edtFunc: TEdit;
    Label5: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox1: TGroupBox;
    edtCodTrans: TEdit;
    Label7: TLabel;
    SpeedButton2: TSpeedButton;
    edtFuncTrans: TEdit;
    Label8: TLabel;
    rgOcorrencia: TDBRadioGroup;
    DBMemo1: TDBMemo;
    Label9: TLabel;
    dsOcorrencia: TDataSource;
    qryOcorrencia: TQuery;
    medOcorrencia: TMaskEdit;
    Label10: TLabel;
    SpeedButton3: TSpeedButton;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    btnCancel: TBitBtn;
    BitBtn5: TBitBtn;
    qryAux: TQuery;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    qryOcorrenciaCOD_OCORRENCIA: TIntegerField;
    qryOcorrenciaCOD_ATENDIMENTO: TIntegerField;
    qryOcorrenciaCOD_CLIENTE: TIntegerField;
    qryOcorrenciaCOD_FUNC: TIntegerField;
    qryOcorrenciaDT_OCORRENCIA: TDateTimeField;
    qryOcorrenciaSTATUS_OCORR: TStringField;
    qryOcorrenciaCOD_FUNC_TRANS: TIntegerField;
    qryOcorrenciaDT_FECHAMENTO_OCORR: TDateTimeField;
    qryFunc: TQuery;
    qryFuncCOD_FUNC: TIntegerField;
    qryFuncCOD_DEPTO: TIntegerField;
    qryFuncNOME_FUNC: TStringField;
    qryFuncFONE1: TStringField;
    qryFuncFONE2: TStringField;
    qryFuncRESPONSAVEL: TStringField;
    qryFuncEMAIL_FUNC: TStringField;
    qryFuncAPELIDO_FUNC: TStringField;
    qryFuncSENHA_FUNC: TStringField;
    qryFuncNIVEL_FUNC: TStringField;
    qryOcorrenciaDESCRICAO_OCORR: TStringField;
    SakMsg1: TSakMsg;
    SakSMTP1: TSakSMTP;
    qryAux2: TQuery;
    edtDep: TEdit;
    procedure edtCodigoExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure edtCodTransExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure medOcorrenciaExit(Sender: TObject);
    procedure Sada1Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    Cod_Atendimento : Integer;
    Cod_Cliente     : Integer;
    procedure DisparaEmail(pMens:String);
    { Public declarations }
  end;

var
  CadOcorrencia_f: TCadOcorrencia_f;

implementation
uses Principal,
     Atendimento_dm,
     Atendimento_u;
{$R *.DFM}

procedure TCadOcorrencia_f.edtCodigoExit(Sender: TObject);
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
    qryAux.SQL.Text := 'SELECT * FROM GC_FUNCIONARIO FUN LEFT JOIN GC_DEPARTAMENTO DEP ON (FUN.COD_DEPTO=DEP.COD_DEPTO)'+
                       ' WHERE COD_FUNC='+edtCodigo.Text;
    qryAux.Open;
    if qryAux.eof then
    begin
      messagedlg('Codigo de Funcionário não cadastrado.',mtWarning,[mbOk],0);
      edtCodigo.SetFocus;
      exit;
    end;
    edtCodigo.Text  := qryAux.FieldByName('Cod_Func').AsString;
    edtFunc.Text    := qryAux.FieldByName('Nome_Func').AsString;
    edtDep.Text     := qryAux.FieldByName('desc_depto').AsString;
  end;
end;

procedure TCadOcorrencia_f.BitBtn3Click(Sender: TObject);
begin
  inherited;
  qryOcorrencia.Close;
  if medOcorrencia.Text = '' then
    qryOcorrencia.ParamByName('Cod_Ocorrencia').AsInteger  := 0
  else
    qryOcorrencia.ParamByName('Cod_Ocorrencia').AsInteger  := StrToInt(medOcorrencia.Text);

  qryOcorrencia.ParamByName('Cod_Atendimento').AsInteger := Cod_Atendimento;
  qryOcorrencia.ParamByName('Cod_Cliente').AsInteger     := Cod_Cliente;
  qryOcorrencia.Open;

  qryOcorrencia.Insert;
  qryOcorrencia.FieldByName('Status_Ocorr').AsString    := 'A';
  qryOcorrencia.FieldByName('Cod_Func').AsString        := edtCodigo.Text;
  qryOcorrencia.FieldByName('Dt_Ocorrencia').AsDateTime := Now();
  dbMemo1.SetFocus;
end;

procedure TCadOcorrencia_f.edtCodTransExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
  if edtCodTrans.Text <> '' then
  begin
    qryAux.Close;
    qryAux.SQL.Text := 'SELECT * FROM GC_FUNCIONARIO WHERE ATIVO_FUNC <> ''N'' AND COD_FUNC='+edtCodTrans.Text;
    qryAux.Open;
    edtCodTrans.Text  := qryAux.FieldByName('Cod_Func').AsString;
    edtFuncTrans.Text := qryAux.FieldByName('Nome_Func').AsString;
  end
  else
  begin
    edtCodTrans.Clear;
    edtFuncTrans.Clear;
  end;
end;

procedure TCadOcorrencia_f.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  dmPesq.PesFunc2.Execute;
  edtCodTrans.Text := dmPesq.PesFunc2.ValoresRetorno[0];
  if edtCodTrans.Text = '' then
  begin
    edtCodTrans.SetFocus;
    exit;
  end;
  qryFunc.Close;
  qryFunc.ParamByName('Cod_Func').AsString := edtCodTrans.Text;
  qryFunc.Open;
  edtFuncTrans.Text := qryFunc.FieldByName('Nome_Func').AsString;
end;

procedure TCadOcorrencia_f.BitBtn1Click(Sender: TObject);
var vCod : Integer;
begin
  inherited;
  if qryOcorrencia.State in [dsInsert,dsEdit] then
  begin
    if qryOcorrencia.State in [dsInsert] then
    begin
      {vCod := Proximo('Cod_ocorrencia', 'gc_ocorrencia');}
      qryOcorrencia.FieldByName('Cod_Func').AsString         := edtCodigo.Text;
      qryOcorrencia.FieldByName('Cod_Atendimento').AsInteger := Cod_Atendimento;
      qryOcorrencia.FieldByName('Cod_Cliente').AsInteger     := Cod_Cliente;
    end;
    if edtCodTrans.Text <> '' then  { Transferencia }
    begin
      qryOcorrencia.FieldByName('Cod_Func_Trans').AsString := edtCodTrans.Text;
      qryOcorrencia.FieldByName('Status_Ocorr').AsString   := 'T';
      if Atendimento_f.qryAtendimento.State <> dsEdit then
        Atendimento_f.qryAtendimento.Edit;

      Atendimento_f.qryAtendimento.FieldByName('Cod_Depto').AsString := qryFunc.FieldByName('Cod_Depto').AsString;
      Atendimento_f.qryAtendimento.FieldByName('Cod_Func').AsString  := edtCodTrans.Text;
      Atendimento_f.qryAtendimento.Post;
      Atendimento_f.medAtendimentoExit(sender);
      close;
    end;
    if (qryOcorrencia.FieldByName('Status_Ocorr').AsString = 'T') and (edtCodTrans.Text = '') then
    begin
      messagedlg('É necessário informar o funcionário para transferencia.',mtWarning,[mbOk],0);
      edtCodTrans.SetFocus;
      exit;
    end;
    if qryOcorrencia.FieldByName('Status_Ocorr').AsString = 'F' then { Fechamento }
    begin

      if UpperCase(LerIni(caminho+'Atendimento.ini','EMAIL','TRANSF')) = 'SIM' then
      begin
        qryAux2.Close;
        qryAux2.sql.Text := 'SELECT * FROM GC_OCORRENCIA OCO '+
                           ' INNER JOIN GC_ATENDIMENTO ATE ON (OCO.COD_ATENDIMENTO=ATE.COD_ATENDIMENTO) '+
                           ' INNER JOIN GC_FUNCIONARIO FUN ON (OCO.COD_FUNC=FUN.COD_FUNC) '+
                           ' LEFT JOIN GC_DEPARTAMENTO DEP ON (FUN.COD_DEPTO=DEP.COD_DEPTO) '+
                           ' WHERE OCO.COD_ATENDIMENTO=' + IntToStr(Cod_Atendimento)+
                           ' AND OCO.COD_OCORRENCIA IN (select MIN(COD_OCORRENCIA) from gc_ocorrencia WHERE status_ocorr = ''T'' and COD_ATENDIMENTO='+IntToStr(Cod_Atendimento)+')';
        qryAux2.Open;
        if (not qryAux2.eof) and (qryAux2.FieldByName('cod_func').AsInteger <> cod_func) then
        begin
          DisparaEmail('Atendimento número: '+formatfloat('000000000',qryAux2.FieldByName('Cod_Atendimento').AsInteger)+
                       ' foi fechado pelo funcionário: '+edtFunc.text+
                       ' Departamento: '+edtDep.Text+' Relato do CLiente: '+qryAux2.FieldByName('descricao_atend').AsString);
        end;
      end;


      qryOcorrencia.FieldByName('dt_fechamento_ocorr').AsDateTime := now();
      if Atendimento_f.qryAtendimento.State <> dsEdit then
        Atendimento_f.qryAtendimento.Edit;

      Atendimento_f.qryAtendimento.FieldByName('Status_Atend').AsString := 'F';
      Atendimento_f.qryAtendimento.Post;
      Atendimento_f.medAtendimentoExit(sender);
      close;
    end;
    if qryOcorrencia.FieldByName('Status_Ocorr').AsString = 'C' then { Cancelamento }
    begin
      qryOcorrencia.FieldByName('dt_fechamento_ocorr').AsDateTime := now();
      if Atendimento_f.qryAtendimento.State <> dsEdit then
        Atendimento_f.qryAtendimento.Edit;

      Atendimento_f.qryAtendimento.FieldByName('Status_Atend').AsString := 'C';
      Atendimento_f.qryAtendimento.Post;
      Atendimento_f.medAtendimentoExit(sender);
      close;
    end;
    if qryOcorrencia.FieldByName('Status_Ocorr').AsString = 'E' then { Coloca em Espera }
    begin
      if Atendimento_f.qryAtendimento.State <> dsEdit then
        Atendimento_f.qryAtendimento.Edit;

      Atendimento_f.qryAtendimento.FieldByName('Status_Atend').AsString := 'E';
      Atendimento_f.qryAtendimento.Post;
      Atendimento_f.medAtendimentoExit(sender);
      close;
    end;
    qryOcorrencia.Post;
  end;
  btnCancel.Click;
end;

procedure TCadOcorrencia_f.DisparaEmail(pMens:String);
begin
  {Dispara email do atendimento}
  {Conectar}
  BitBtn1.Enabled := False;
{  try
    NMSMTP1.Host := LerIni(caminho+'Atendimento.ini','EMAIL','SMTP');
    NMSMTP1.Port := 25;
    NMSMTP1.UserID := email_func;
    NMSMTP1.Connect;
    if not NMSMTP1.Connected then
      raise Exception.Create('Erro de conexão');

    with NMSMTP1.PostMessage do
    begin
      FromAddress := email_func;
      FromName    := email_func;
      ToAddress.Clear;
      if qryAux2.FieldByName('email_func').AsString <> '' then
        ToAddress.Add(qryAux2.FieldByName('email_func').AsString);

      if UpperCase(LerIni(caminho+'Atendimento.ini','EMAIL','CONTROLLER')) = 'SIM' then
        ToAddress.Add(LerIni(caminho+'Atendimento.ini','EMAIL','EMAILCONTR'));

      Subject   := 'Fechamento de Atendimento';
      Body.Text := pMens;
    end;
    if NMSMTP1.PostMessage.ToAddress.Count > 0 then
    begin
      NMSMTP1.SendMail;
      NMSMTP1.Disconnect;
    end
    else
    begin
      NMSMTP1.Cancel;
      NMSMTP1.Disconnect;
    end;
  except}
    sakSMTP1.Host     := LerIni(caminho+'Atendimento.ini','EMAIL','SMTP');
    sakSMTP1.Connect;
    if not sakSMTP1.Connected then
      raise Exception.Create('Erro de conexão');
    showmessage(Email_Func + #13 + pMens);
    sakMsg1.From      := Email_Func;
    sakMsg1.Subject   := 'Fechamento de Atendimento';
    sakMsg1.Text.Clear;
    sakMsg1.Text.Text := pMens;
    sakMsg1.sendTo    := qryAux2.FieldByName('email_func').AsString;
    sakSMTP1.SendMessage(sakMsg1);
    sakMsg1.CC        := '';
    if uppercase(LerIni(caminho+'Atendimento.ini','EMAIL','CONTROLLER')) = 'SIM' then
    begin
      sakMsg1.sendTo    := LerIni(caminho+'Atendimento.ini','EMAIL','EMAILCONTR');
      sakSMTP1.SendMessage(sakMsg1);
      sakMsg1.CC        := '';
    end;
    sakSMTP1.Quit;
{  end;}
  BitBtn1.Enabled := True;
end;


procedure TCadOcorrencia_f.btnCancelClick(Sender: TObject);
begin
  inherited;
  if qryOcorrencia.State in [dsEdit,dsInsert] then
    qryOcorrencia.Cancel;
  edtCodTrans.Clear;
  edtFuncTrans.Clear;
  medOcorrencia.Clear;
  qryOcorrencia.Close;
  medOcorrencia.SetFocus;
end;

procedure TCadOcorrencia_f.medOcorrenciaExit(Sender: TObject);
begin
  inherited;
  if medOcorrencia.Text = '' then
    exit;

  qryOcorrencia.Close;
  qryOcorrencia.ParamByName('Cod_Ocorrencia').AsInteger  := StrToInt(medOcorrencia.Text);
  qryOcorrencia.ParamByName('Cod_Atendimento').AsInteger := Cod_Atendimento;
  qryOcorrencia.ParamByName('Cod_Cliente').AsInteger     := Cod_Cliente;
  qryOcorrencia.Open;

  if qryOcorrencia.Eof then
  begin
    messagedlg('Codigo de Ocorrência não Cadastrada.',mtInformation,[mbOk],0);
    medOcorrencia.SetFocus;
    exit;
  end;
  if qryOcorrencia.FieldByName('Cod_Func_Trans').AsInteger <> 0 then
  begin
    edtCodTrans.Text := qryOcorrencia.FieldByName('Cod_Func_Trans').AsString;
    edtCodTransExit(Sender);
  end;
  qryOcorrencia.Edit;
end;

procedure TCadOcorrencia_f.Sada1Click(Sender: TObject);
begin
  inherited;
  Atendimento_f.medAtendimentoExit(sender);
end;

procedure TCadOcorrencia_f.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if Nivel <= 1 then
  begin
    if messagedlg('Deseja realmente apagar esta Ocorrência ?',mtWarning,[mbYes,mbNo],0) = IdYes then
    begin
      if (qryOcorrencia.active) and (not qryOcorrencia.eof) then
      begin
        if qryOcorrencia.FieldByName('Status_Ocorr').AsString = 'A' then
        begin
          qryOcorrencia.Cancel;
          try
            qryOcorrencia.Delete;
          except
            messagedlg('Não foi possível apagar esta Ocorrência.',mtWarning,[mbOk],0);
          end;
          btnCancelClick(Sender);
        end
        else
        begin
          messagedlg('É possivel apagar apenas Ocorrências em aberto.',mtWarning,[mbOk],0);
          exit;
        end;
      end
      else
      begin
        messagedlg('Não foi possível apagar esta ocorrência, tente mais tarde.',mtWarning,[mbOk],0);
        exit;
      end;
    end;
  end
  else
  begin
    messagedlg('Não é possível apagar ocorrência com este Nível de senha.',mtWarning,[mbOk],0);
    exit;
  end;
end;

procedure TCadOcorrencia_f.SpeedButton3Click(Sender: TObject);
var sSql:String;
begin
  inherited;

  sSql := 'SELECT OCO.*, FUN1.NOME_FUNC, DEP1.DESC_DEPTO, '+
          'FUN2.NOME_FUNC, DEP2.DESC_DEPTO, CAST(DESCRICAO_OCORR AS VARCHAR(100)) DESCRICAO_OCORR2 '+
          'FROM GC_OCORRENCIA OCO '+
          'LEFT JOIN GC_FUNCIONARIO FUN1 ON (OCO.COD_FUNC=FUN1.COD_FUNC) '+
          'LEFT JOIN GC_DEPARTAMENTO DEP1 ON (FUN1.COD_DEPTO=DEP1.COD_DEPTO) '+
          'LEFT JOIN GC_FUNCIONARIO FUN2 ON (OCO.COD_FUNC_TRANS=FUN2.COD_FUNC) '+
          'LEFT JOIN GC_DEPARTAMENTO DEP2 ON (FUN2.COD_DEPTO=DEP2.COD_DEPTO) '+
          'WHERE OCO.COD_CLIENTE     = ' + IntToStr(COD_CLIENTE) +
          ' AND  OCO.COD_ATENDIMENTO = ' + IntToStr(COD_ATENDIMENTO) +
          ' ORDER BY OCO.DT_OCORRENCIA DESC ';

  dmPesq.PesOcorrencia.StringSql.Text := sSql;
  dmPesq.PesOcorrencia.Execute;
  if medOcorrencia.Text <> '' then
    medOcorrencia.Text := dmPesq.PesOcorrencia.ValoresRetorno[0];
  if medOcorrencia.Text = '' then
  begin
    medOcorrencia.SetFocus;
    exit;
  end;

end;

procedure TCadOcorrencia_f.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Atendimento_f.medAtendimento.SetFocus;
end;

end.
