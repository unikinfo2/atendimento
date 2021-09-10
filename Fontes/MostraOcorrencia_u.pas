unit MostraOcorrencia_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, Menus, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, Db, DBTables,
  RxCalc, SakEmail, funcoes;

type
  TMostraOcorrencia_f = class(TDeriva_f)
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
    qryAux2: TQuery;
    edtDep: TEdit;
    DBMemo2: TDBMemo;
    Label1: TLabel;
    qryOcorrenciaDESCRICAO_ATEND: TMemoField;
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodTransExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure medOcorrenciaExit(Sender: TObject);
    procedure Sada1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    Cod_Atendimento : Integer;
    Cod_Cliente     : Integer;
    { Public declarations }
  end;

var
  MostraOcorrencia_f: TMostraOcorrencia_f;

implementation
uses Principal,
     Atendimento_dm,
     Atendimento_u;
{$R *.DFM}

procedure TMostraOcorrencia_f.edtCodigoExit(Sender: TObject);
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

procedure TMostraOcorrencia_f.edtCodTransExit(Sender: TObject);
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

procedure TMostraOcorrencia_f.SpeedButton2Click(Sender: TObject);
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

procedure TMostraOcorrencia_f.medOcorrenciaExit(Sender: TObject);
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
end;

procedure TMostraOcorrencia_f.Sada1Click(Sender: TObject);
begin
  inherited;
  Atendimento_f.medAtendimentoExit(sender);
end;

procedure TMostraOcorrencia_f.SpeedButton3Click(Sender: TObject);
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

procedure TMostraOcorrencia_f.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Atendimento_f.medAtendimento.SetFocus;
end;

end.
