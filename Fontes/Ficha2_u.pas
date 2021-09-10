unit Ficha2_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, RxCalc, Menus, ExtCtrls, StdCtrls, Mask, DBCtrls, ComCtrls,
  Buttons, Grids, DBGrids, ToolEdit, CurrEdit, RXDBCtrl, Db, DBTables,
  shellapi, variants;

type
  TFicha2_f = class(TDeriva_f)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    medFicha: TMaskEdit;
    Label1: TLabel;
    PageControl1: TPageControl;
    DBRadioGroup1: TDBRadioGroup;
    TabSheet4: TTabSheet;
    DBDateEdit1: TDBDateEdit;
    DBDateEdit2: TDBDateEdit;
    DBDateEdit3: TDBDateEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    DBDateEdit4: TDBDateEdit;
    Label20: TLabel;
    Label21: TLabel;
    SpeedButton2: TSpeedButton;
    qryFicha: TQuery;
    dsFicha: TDataSource;
    qrySocios: TQuery;
    dsSocios: TDataSource;
    qrySociosCOD_FICHA: TIntegerField;
    qrySociosCOD_SOCIO: TIntegerField;
    qrySociosNOME_RAZAO: TStringField;
    qrySociosCPF_CNPJ: TStringField;
    qrySociosORGAO_EMISSOR: TStringField;
    qrySociosPROFISSAO: TStringField;
    qrySociosESTADO_CIVIL: TStringField;
    qrySociosORGAO_CLASSE: TStringField;
    qrySociosVALOR_CAP_SOC: TFloatField;
    qrySociosPORC_CAP_SOC: TFloatField;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    cbDepto: TDBLookupComboBox;
    Label23: TLabel;
    qryDepto: TQuery;
    qryDeptoCOD_DEPTO: TIntegerField;
    qryDeptoDESC_DEPTO: TStringField;
    dsDepto: TDataSource;
    obs: TMemo;
    qrySociosENDERECO: TStringField;
    qrySociosRG: TStringField;
    qrySociosTITULO: TStringField;
    qrySociosSEXO: TStringField;
    qrySociosORGAO_NUMERO: TStringField;
    tsAndamento: TTabSheet;
    DBGrid2: TDBGrid;
    qryAndamento: TQuery;
    dsAndamento: TDataSource;
    DBMemo4: TDBMemo;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    BitBtn6: TBitBtn;
    BitBtn7: TBitBtn;
    DBDateEdit5: TDBDateEdit;
    DBDateEdit6: TDBDateEdit;
    DBDateEdit7: TDBDateEdit;
    TabSheet5: TTabSheet;
    Label28: TLabel;
    DBMemo5: TDBMemo;
    DBMemo6: TDBMemo;
    Label29: TLabel;
    DBMemo7: TDBMemo;
    Label30: TLabel;
    DBMemo8: TDBMemo;
    Label31: TLabel;
    tsFinanc: TTabSheet;
    Label13: TLabel;
    calcTaxa: TRxDBCalcEdit;
    Label14: TLabel;
    calcServico: TRxDBCalcEdit;
    Label15: TLabel;
    calcOutro: TRxDBCalcEdit;
    calcTotal: TRxCalcEdit;
    Label35: TLabel;
    qryPag: TQuery;
    dsPag: TDataSource;
    qryPagCOD_FICHA: TIntegerField;
    qryPagCOD_PAG: TIntegerField;
    qryPagDT_PREV_PAG: TDateTimeField;
    qryPagDT_PAG: TDateTimeField;
    qryPagVALOR_PAG: TFloatField;
    DBGrid3: TDBGrid;
    medParc: TMaskEdit;
    Label36: TLabel;
    BitBtn8: TBitBtn;
    medConta: TMaskEdit;
    Label37: TLabel;
    SpeedButton4: TSpeedButton;
    Edit2: TEdit;
    Label38: TLabel;
    medPlano: TMaskEdit;
    Label39: TLabel;
    SpeedButton3: TSpeedButton;
    Edit3: TEdit;
    Label40: TLabel;
    qryAux: TQuery;
    medCliente: TMaskEdit;
    Label41: TLabel;
    sbPesq: TSpeedButton;
    edtNomeCli: TEdit;
    Label42: TLabel;
    Cadastro1: TMenuItem;
    Cliente1: TMenuItem;
    qryAux2: TQuery;
    DBMemo10: TDBMemo;
    Label33: TLabel;
    DBMemo9: TDBMemo;
    Label32: TLabel;
    DBMemo11: TDBMemo;
    Label34: TLabel;
    qryFichaCOD_FICHA: TIntegerField;
    qryFichaRAZAO1: TStringField;
    qryFichaRAZAO2: TStringField;
    qryFichaRAZAO3: TStringField;
    qryFichaRAZAO_VALIDA1: TStringField;
    qryFichaRAZAO_VALIDA2: TStringField;
    qryFichaRAZAO_VALIDA3: TStringField;
    qryFichaOBJETO_SOCIAL: TStringField;
    qryFichaENDERECO: TStringField;
    qryFichaGERENCIA: TStringField;
    qryFichaCONTATO: TStringField;
    qryFichaFONE1: TStringField;
    qryFichaFONE2: TStringField;
    qryFichaCAPITAL_SOCIAL: TFloatField;
    qryFichaINTEGRALIZADO: TFloatField;
    qryFichaA_INTEGRALIZAR: TFloatField;
    qryFichaPRAZO: TStringField;
    qryFichaFORMA_INTEGRALIZAR: TStringField;
    qryFichaBENS: TStringField;
    qryFichaVALOR_TAXA: TFloatField;
    qryFichaVALOR_SERVICO: TFloatField;
    qryFichaVALOR_OUTROS: TFloatField;
    qryFichaORGAO1: TStringField;
    qryFichaORGAO2: TStringField;
    qryFichaORGAO3: TStringField;
    qryFichaORGAO4: TStringField;
    qryFichaORGAO5: TStringField;
    qryFichaORGAO6: TStringField;
    qryFichaORGAO7: TStringField;
    qryFichaORGAO8: TStringField;
    qryFichaSIGLA_CONSELHO: TStringField;
    qryFichaALVARA_REGULAR: TStringField;
    qryFichaPEDIDO_LICENCA: TStringField;
    qryFichaTRIBUTACAO: TStringField;
    qryFichaDT_CONTATO: TDateTimeField;
    qryFichaDT_INICIO: TDateTimeField;
    qryFichaDT_PREV_TERMINO: TDateTimeField;
    qryFichaDT_TERMINO: TDateTimeField;
    qryFichaOBS: TMemoField;
    qryFichaTIPO_PROCESSO: TStringField;
    qryFichaOUTRA_TRIB: TStringField;
    qryFichaCOD_DEPTO: TIntegerField;
    qryFichaCOD_FUNC: TIntegerField;
    qryFichaPREFEITURA: TStringField;
    qryFichaORGAO1_PROC: TMemoField;
    qryFichaORGAO2_PROC: TMemoField;
    qryFichaORGAO3_PROC: TMemoField;
    qryFichaORGAO4_PROC: TMemoField;
    qryFichaORGAO5_PROC: TMemoField;
    qryFichaORGAO6_PROC: TMemoField;
    qryFichaORGAO7_PROC: TMemoField;
    qryFichaORGAO8_PROC: TMemoField;
    qryFichaCOD_PLCONTA: TIntegerField;
    qryFichaCOD_CLIENTE: TIntegerField;
    qryFichaCOD_BANCO: TIntegerField;
    qryAndamentoCOD_FICHA: TIntegerField;
    qryAndamentoCOD_ANDAMENTO: TIntegerField;
    qryAndamentoDT_ANDAMENTO: TDateTimeField;
    qryAndamentoDT_PREV_RET: TDateTimeField;
    qryAndamentoDT_FECHA: TDateTimeField;
    qryAndamentoDESC_ANDAMENTO: TMemoField;
    qryAndamentoCOD_FUNC: TIntegerField;
    qryAndamentoDesc2: TStringField;
    procedure medFichaExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure calcTaxaExit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure medContaExit(Sender: TObject);
    procedure medPlanoExit(Sender: TObject);
    procedure DBGrid3Exit(Sender: TObject);
    procedure sbPesqClick(Sender: TObject);
    procedure medClienteExit(Sender: TObject);
    procedure Cliente1Click(Sender: TObject);
    procedure qryAndamentoCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    PrimeiraVez : Boolean;
  end;

var
  Ficha2_f: TFicha2_f;

implementation
uses principal,
     atendimento_dm, Ficha_Soc_u, Financeiro_dm, CadCliente_u, funcoes;
{$R *.DFM}

procedure TFicha2_f.medFichaExit(Sender: TObject);
begin
  inherited;
  if (medFicha.Text = '') and (BitBtn1.Focused) then
  begin
    exit;
  end
  else if (medFicha.Text = '') and (not BitBtn1.Focused) then
  begin
    medFicha.SetFocus;
    exit;
  end;

  pagecontrol1.ActivePageIndex := 0;
  qryDepto.Close;
  qryDepto.Open;
  with qryFicha do
  begin
    close;
    ParamByName('Cod_Ficha').AsString := medFicha.Text;
    open;
    if eof then
    begin
      qrySocios.Close;
      messagedlg('Codigo de Ficha não Cadastrada.',mtInformation,[mbOk],0);
      medFicha.SetFocus;
      exit;
    end
    else
    begin
      if (cod_func = qryFicha.FieldByName('cod_func').AsInteger) or (nivel = 0) then
      begin
        edit
      end
      else
      begin
      end;
      obs.Lines.Text      := fieldbyname('obs').AsString;
      medConta.Text       := fieldbyname('Cod_Banco').AsString;
      medPlano.Text       := fieldbyname('Cod_PlConta').AsString;
      medCliente.Text     := fieldbyname('Cod_Cliente').AsString;
      medContaExit(Self);
      medPlanoExit(Self);
      medClienteExit(Self);
      cbDepto.Enabled     := False;
      PrimeiraVez         := False;
      tsAndamento.Enabled := True;
      qrySocios.Close;
      qrySocios.ParamByName('Cod_Ficha').AsString := medFicha.Text;
      qrySocios.open;
      qryAndamento.Close;
      qryAndamento.ParamByName('Cod_Ficha').AsString := medFicha.Text;
      qryAndamento.open;
      qryPag.Close;
      dsPag.AutoEdit := (nivel = 0);
      qryPag.ParamByName('Cod_Ficha').AsString := medFicha.Text;
      qryPag.open;
    end;
  end;
end;

procedure TFicha2_f.BitBtn2Click(Sender: TObject);
var cod:integer;
begin
  inherited;
  if qryFicha.State = dsInsert then
  begin
    cod := proximo('gc_ficha','cod_ficha','', true);
    qryFicha.FieldByName('cod_ficha').AsInteger  := cod;
    qryFicha.FieldByName('cod_func').AsInteger   := cod_func;
    qryFicha.FieldByName('obs').AsString         := obs.Lines.Text;
    if medCliente.Text <> '' then
      qryFicha.FieldByName('Cod_Cliente').AsString := medCliente.Text
    else
      qryFicha.FieldByName('Cod_Cliente').Value := null;

    if medConta.Text <> '' then
      qryFicha.FieldByName('Cod_Banco').AsString   := medConta.Text;
    if medPlano.Text <> '' then
      qryFicha.FieldByName('Cod_PlConta').AsString := medPlano.Text;
    medFicha.Text := formatfloat('00000',cod);
    qryFicha.Post;
    qrySocios.Close;
    medCliente.Clear;
    edtNomeCli.Clear;
    medFicha.SetFocus;
  end
  else if qryFicha.State = dsEdit then
  begin
    medFicha.Text := formatfloat('00000',qryFicha.FieldByName('cod_ficha').AsInteger);
    qryFicha.FieldByName('obs').AsString        := obs.Lines.Text;
    if medConta.Text <> '' then
      qryFicha.FieldByName('Cod_Banco').AsString   := medConta.Text;
    if medPlano.Text <> '' then
      qryFicha.FieldByName('Cod_PlConta').AsString := medPlano.Text;
    if medCliente.Text <> '' then
      qryFicha.FieldByName('Cod_Cliente').AsString := medCliente.Text
    else
      qryFicha.FieldByName('Cod_Cliente').Value := null;
    qryFicha.Post;
    qrySocios.Close;
    medCliente.Clear;
    edtNomeCli.Clear;
    medFicha.SetFocus;
  end
  else
  begin
    qryFicha.Edit;
    medFicha.Text := formatfloat('00000',qryFicha.FieldByName('cod_ficha').AsInteger);
    qryFicha.FieldByName('obs').AsString        := obs.Lines.Text;
    if medConta.Text <> '' then
      qryFicha.FieldByName('Cod_Banco').AsString   := medConta.Text;
    if medPlano.Text <> '' then
      qryFicha.FieldByName('Cod_PlConta').AsString := medPlano.Text;
    if medCliente.Text <> '' then
      qryFicha.FieldByName('Cod_Cliente').AsString := medCliente.Text
    else
      qryFicha.FieldByName('Cod_Cliente').Value := null;
    qryFicha.Post;
    qrySocios.Close;
    medCliente.Clear;
    edtNomeCli.Clear;
    medFicha.SetFocus;
  end;

  if PrimeiraVez then
  begin
    messagedlg('Número da Ficha: ' + medFicha.Text ,mtInformation,[mbOk],0);
    PrimeiraVez := False;
  end;
  pagecontrol1.ActivePageIndex := 0;
  obs.Lines.Clear;
  medPlano.Clear;
  medConta.Clear;
  edit2.Clear;
  edit3.Clear;
  qryFicha.Close;
end;

procedure TFicha2_f.BitBtn1Click(Sender: TObject);
begin
  inherited;
  cbDepto.Enabled := True;
  qryDepto.Close;
  qryDepto.Open;
  qryAndamento.Close;
  qryPag.Close;
  qrySocios.Close;
  qryFicha.close;
  qryFicha.ParamByName('Cod_Ficha').AsInteger := 0;
  qryFicha.Open;
  pagecontrol1.ActivePageIndex := 0;
  obs.Lines.Clear;
  qryFicha.Insert;
  tsAndamento.Enabled := False;
  medFicha.Clear;
  medPlano.Clear;
  medConta.Clear;
  medCliente.Clear;
  edtNomeCli.Clear;
  edit2.Clear;
  edit3.Clear;
  qryFicha.FieldByName('alvara_regular').AsString     := 'N';
  qryFicha.FieldByName('PEDIDO_LICENCA').AsString     := 'N';
  qryFicha.FieldByName('tipo_processo').AsString      := 'R';
  qryFicha.FieldByName('tributacao').AsString         := 'Simples ME';
  qryFicha.FieldByName('razao_valida1').AsString      := 'N';
  qryFicha.FieldByName('razao_valida2').AsString      := 'N';
  qryFicha.FieldByName('razao_valida3').AsString      := 'N';
  qryFicha.FieldByName('gerencia').AsString           := 'D';
  qryFicha.FieldByName('forma_integralizar').AsString := '1';
  qryFicha.FieldByName('orgao1').AsString             := 'JUCESP';
  qryFicha.FieldByName('orgao2').AsString             := 'INSS';
  qryFicha.FieldByName('orgao3').AsString             := 'Receita Federal';
  qryFicha.FieldByName('orgao4').AsString             := 'FGTS';
  qryFicha.FieldByName('orgao5').AsString             := 'Estado';
  qryFicha.FieldByName('orgao6').AsString             := 'Conselho de Classe';
  qryFicha.FieldByName('orgao7').AsString             := 'Prefeitura';
  qryFicha.FieldByName('dt_contato').AsDateTime       := now();
  qryFicha.Fieldbyname('Cod_Depto').AsInteger         := Cod_Depto;
  PrimeiraVez := True;
  medCliente.SetFocus;
end;

procedure TFicha2_f.FormCreate(Sender: TObject);
begin
  inherited;
  PrimeiraVez         := False;
  tsFinanc.TabVisible := nivel = 0;
  {if pagecontrol1.FindNextPage ActivePage = tsFinanc then
    AllowChange := nivel = 0;}

end;

procedure TFicha2_f.BitBtn3Click(Sender: TObject);
var cod : Integer;
begin
  inherited;

  if qryFicha.State = dsInsert then
  begin
    cod := proximo('gc_ficha','cod_ficha','', true);
    qryFicha.FieldByName('cod_ficha').AsInteger := cod;
    medFicha.Text := formatfloat('00000',cod);
    qryFicha.Post;
  end;

  if assigned(Ficha_Soc_f) then
    Ficha_Soc_f := nil;

  Ficha_Soc_f := TFicha_Soc_f.Create(Self);
  try
    Ficha_Soc_f.qrySocio.Close;
    Ficha_Soc_f.qrySocio.ParamByName('Cod_Ficha').AsInteger := 0;
    Ficha_Soc_f.qrySocio.ParamByName('Cod_Socio').AsInteger := 0;
    Ficha_Soc_f.qrySocio.Open;
    Ficha_Soc_f.qrySocio.Insert;
    Ficha_Soc_f.qrySocio.FieldByName('Cod_Ficha').AsString    := medFicha.Text;
    Ficha_Soc_f.qrySocio.FieldByName('SITUACAO_SOC').AsString := 'I';
    Ficha_Soc_f.qrySocio.FieldByName('CONTRIB_ATU_INSS').AsString := 'S';
    Ficha_Soc_f.Show;
  except
    Ficha_Soc_f := TFicha_Soc_f.Create(Self);
    Ficha_Soc_f.Show;
  end;
end;

procedure TFicha2_f.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if Nivel <= 1 then
  begin
    if messagedlg('Deseja realmente apagar este Registro de Sócio ?',mtWarning,[mbYes,mbNo],0) = idYes then
    begin
      if qrySocios.Active then
        qrySocios.Delete;
    end;
  end
  else
  begin
    messagedlg('Não é possível apagar Informações com este Nível de senha.',mtWarning,[mbOk],0);
    exit;
  end;

end;

procedure TFicha2_f.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  dmPesq.pesFicha.StringSql.Clear;
  dmPesq.pesFicha.StringSql.ADD('SELECT * FROM GC_FICHA FIC ');
  dmPesq.pesFicha.StringSql.ADD(' LEFT JOIN GC_CLIENTE CLI ON (FIC.COD_CLIENTE=CLI.COD_CLIENTE) ');
  dmPesq.pesFicha.StringSql.ADD(' WHERE (TIPO_PROCESSO=''R'' or TIPO_PROCESSO=''C'' or TIPO_PROCESSO=''O'') ');
  dmPesq.pesFicha.StringSql.ADD(' ORDER BY CLI.NOME_CLI, FIC.COD_FICHA ');
  dmPesq.pesFicha.Execute;
  if dmPesq.pesFicha.ValoresRetorno[0] <> '' then
  begin
    medFicha.Clear;
    medFicha.Text := dmPesq.PesFicha.ValoresRetorno[0];
    medFichaExit(sender);
  end;

end;

procedure TFicha2_f.BitBtn4Click(Sender: TObject);
var ArqTmp  : TextFile;
    NomeArq, vstr, procurador : String;
    x:integer;
begin
  inherited;
  NomeArq := ExtractFileDir(application.ExeName) + '\TMP_FichaCadastral.html';
  assignfile(ArqTmp,NomeArq);
  ReWrite(ArqTmp);
  try
    vStr := '';
    if qryFicha.FieldByName('Tipo_Processo').AsString = 'A' then
      vStr := 'Abertura'
    else if qryFicha.FieldByName('Tipo_Processo').AsString = 'T' then
      vStr := 'Alteração'
    else if qryFicha.FieldByName('Tipo_Processo').AsString = 'R' then
      vStr := 'Regularização'
    else if qryFicha.FieldByName('Tipo_Processo').AsString = 'C' then
      vStr := 'Cancelamento'
    else if qryFicha.FieldByName('Tipo_Processo').AsString = 'O' then
      vStr := 'Centidão/Outros';
    writeln(arqTmp,'<html>');
    writeln(arqTmp,'<head>');
    writeln(arqTmp,'<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">');
    writeln(arqTmp,'<meta name="GENERATOR" content="Microsoft FrontPage 4.0">');
    writeln(arqTmp,'<meta name="ProgId" content="FrontPage.Editor.Document">');
    writeln(arqTmp,'<title>Uni-K - Ficha de Dados Cadastrais</title>');
    writeln(arqTmp,'</head>');
    writeln(arqTmp,'<body">');
    writeln(arqTmp,'<TABLE cellSpacing=0 cellpadding=0 border=0 vspace="0" valign="top" width="672" height="100%">');
    writeln(arqTmp,'  <TR>');
    writeln(arqTmp,'    <TD width="829" colspan="2" height="700">');
    writeln(arqTmp,'      <table border="0" width="100%" cellspacing="0" cellpadding="0">');
    writeln(arqTmp,'        <tr>');
    writeln(arqTmp,'          <td width="32%"><b><font size="4"><img border="0" src="Imagens/LOGO_Pequeno.Gif" width="92" height="70"></font></b></td>');
    writeln(arqTmp,'          <td width="68%"><P align=center><b><font size="4">Ficha de Dados Cadastrais para '+ vstr +'</font></b></P>');
    writeln(arqTmp,'            <p>&nbsp;</td>');
    writeln(arqTmp,'        </tr>');
    writeln(arqTmp,'      </table>');
    writeln(arqTmp,'      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0 height="100">');
    writeln(arqTmp,'        <TBODY>');
    writeln(arqTmp,'        <TR>');
    writeln(arqTmp,'          <TD colSpan=4 height="18">');
    writeln(arqTmp,'            <P align=left><FONT face="Arial, Helvetica, sans-serif" size=1><B>Razão Social</B></FONT> </P>');
    writeln(arqTmp,'          </TD>');
    writeln(arqTmp,'        </TR>');
    writeln(arqTmp,'        <TR align=middle>');
    writeln(arqTmp,'          <TD align=left width="20%" height="25">');
    writeln(arqTmp,'          <DIV align=left><FONT face="Arial, Helvetica, sans-serif" size=1>Primeira opção:</FONT></DIV></TD>');
    writeln(arqTmp,'          <TD align=left width="84%" colSpan=3 height="25"> <DIV align=left><FONT face="Arial, Helvetica, sans-serif" size=1> '+ qryFicha.FieldByName('razao1').AsString +'</font></DIV></TD>');
    writeln(arqTmp,'        </TR>');
    writeln(arqTmp,'        <TR align=middle>');
    writeln(arqTmp,'          <TD align=left width="20%" height="25"><DIV align=left><FONT face="Arial, Helvetica, sans-serif" size=1>Segunda opção:</FONT></DIV></TD>');
    writeln(arqTmp,'          <TD align=left width="84%" colSpan=3 height="25"><DIV align=left><FONT face="Arial, Helvetica, sans-serif" size=1>'+ qryFicha.FieldByName('razao2').AsString +'</font></DIV></TD>');
    writeln(arqTmp,'        </TR>');
    writeln(arqTmp,'        <TR align=middle>');
    writeln(arqTmp,'          <TD align=left width="20%" height="25"><DIV align=left><FONT face="Arial, Helvetica, sans-serif" size=1>Terceira opção:</FONT></DIV></TD>');
    writeln(arqTmp,'          <TD align=left width="84%" colSpan=3 height="25"><DIV align=left><FONT face="Arial, Helvetica, sans-serif" size=1>'+ qryFicha.FieldByName('razao3').AsString +'</font></DIV></TD>');
    writeln(arqTmp,'        </TR>');
    writeln(arqTmp,'        <TR align=middle>');
    writeln(arqTmp,'          <TD align=left width="20%" height="43"><DIV align=left><FONT face="Arial, Helvetica, sans-serif" size=1>Objetivo Social:</FONT></DIV></TD>');
    writeln(arqTmp,'          <TD align=left width="84%" colSpan=3 height="43"><DIV align=left><FONT face="Arial, Helvetica, sans-serif" size=1>'+ qryFicha.FieldByName('objeto_social').AsString +'</font></DIV></TD>');
    writeln(arqTmp,'        </TR>');
    writeln(arqTmp,'        <TR align=middle>');
    writeln(arqTmp,'          <TD align=left width="20%" height="35"><DIV align=left><FONT face="Arial, Helvetica, sans-serif" size=1>Endereço:</FONT></DIV></TD>');
    writeln(arqTmp,'          <TD align=left width="84%" colSpan=3 height="35"><DIV align=left><FONT face="Arial, Helvetica, sans-serif" size=1>'+ qryFicha.FieldByName('endereco').AsString +'</font></DIV></TD>');
    writeln(arqTmp,'        </TR>');
    writeln(arqTmp,'        </TBODY>');
    writeln(arqTmp,'      </TABLE>');
    writeln(arqTmp,'      <TABLE cellSpacing=0 cellPadding=0 width="668" border=1 height="100">');
    writeln(arqTmp,'        <TBODY>');
    qrySocios.First;
    x := 1;
    while not qrySocios.eof do
    begin
      if qrySocios.FieldByName('profissao').AsString = 'S' then
        procurador := ' (PROCURADOR) '
      else
        procurador := '';

      writeln(arqTmp,'        <TR align=middle>');
      writeln(arqTmp,'        <TD align="left">');
      writeln(arqTmp,'        <b>'+inttostr(x)+'º Sócio: </b>'+qrySocios.FieldByName('nome_razao').AsString + procurador +' <b>Profissão:</b> '+qrySocios.FieldByName('profissao').AsString);
      writeln(arqTmp,'        <br>');
      writeln(arqTmp,'          <b>Endereço:</b> '+qrySocios.FieldByName('endereco').AsString);
      writeln(arqTmp,'        <br>');
      writeln(arqTmp,'          <b>RG nº: </b>'+qrySocios.FieldByName('rg').AsString+'&nbsp;&nbsp; <b>CPF/CNPJ:</b>'+qrySocios.FieldByName('cpf_cnpj').AsString+' <b>Emissor:</b> '+qrySocios.FieldByName('orgao_emissor').AsString);
      writeln(arqTmp,'        <br>');
      vStr := '';
      if qrySocios.FieldByName('estado_civil').AsString = 'S' then
        vStr := 'Solteiro';
      if qrySocios.FieldByName('estado_civil').AsString = 'C' then
        vStr := 'Casado';
      if qrySocios.FieldByName('estado_civil').AsString = 'D' then
        vStr := 'Divorciado';
      if qrySocios.FieldByName('estado_civil').AsString = 'V' then
        vStr := 'Viuvo';
      if qrySocios.FieldByName('estado_civil').AsString = 'J' then
        vStr := 'Separado Judicialmente';

      writeln(arqTmp,'          <b>Est.Civil:</b> '+vStr+'&nbsp;&nbsp; <b>Org.Classe:</b> '+qrySocios.FieldByName('orgao_classe').AsString+'&nbsp;&nbsp;&nbsp; <b>Docto.Classe:</b>'+qrySocios.FieldByName('orgao_numero').AsString);
      writeln(arqTmp,'        <br>');
      vStr := '';
      if qrySocios.FieldByName('sexo').AsString = 'M' then
        vStr := 'Masculino'
      else
        vStr := 'Feminino';

      writeln(arqTmp,'          <b>Titulo Eleitor:</b> '+qrySocios.FieldByName('Titulo').AsString+'&nbsp;&nbsp <b>Sexo:</b> '+vStr+'&nbsp;&nbsp;');
      writeln(arqTmp,'          <b>Capital Social:</b> '+formatfloat(',0.00',qrySocios.FieldByName('valor_cap_soc').AsFloat)+' &nbsp;&nbsp;<b>% do Capital Social:</b> ' + formatfloat(',0.00',qrySocios.FieldByName('porc_cap_soc').AsFloat));
      writeln(arqTmp,'        </TD>');
      writeln(arqTmp,'        </TR>');
      qrySocios.Next;
      inc(x);
    end;
    qrySocios.First;
    writeln(arqTmp,'        </TBODY></TABLE>');
    writeln(arqTmp,'      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>');
    writeln(arqTmp,'        <TBODY>');
    writeln(arqTmp,'        <TR align=middle>');

    writeln(arqTmp,'          <TD colSpan=4><P align=left><b><FONT face="Arial, Helvetica, sans-serif" size=2>Capital Social</FONT></b> </P></TD>');
    writeln(arqTmp,'        </TR>');
    writeln(arqTmp,'        <TR align=middle>');
    writeln(arqTmp,'          <TD align=left width="23%"><DIV align=left><FONT face="Arial, Helvetica, sans-serif" size=1>Capital R$:</FONT></DIV></TD>');
    writeln(arqTmp,'          <TD align=left width="16%"><DIV align=left>'+ Formatfloat(',0.00',qryFicha.FieldByName('capital_social').AsFloat) +'</DIV></TD>');
    writeln(arqTmp,'          <TD align=left width="17%"><DIV align=left><FONT face="Arial, Helvetica, sans-serif" size=1>Integralizado:</FONT></DIV></TD>');
    writeln(arqTmp,'          <TD align=left width="44%"><DIV align=left>'+ Formatfloat(',0.00',qryFicha.FieldByName('integralizado').AsFloat) +'</DIV></TD>');
    writeln(arqTmp,'        </TR>');
    writeln(arqTmp,'        <TR align=middle>');
    writeln(arqTmp,'          <TD align=left width="23%"><DIV align=left><FONT face="Arial, Helvetica, sans-serif" size=1>A Integralizar</FONT></DIV></TD>');
    writeln(arqTmp,'          <TD align=left width="16%"><DIV align=left>'+ Formatfloat(',0.00',qryFicha.FieldByName('a_integralizar').AsFloat) +'</DIV></TD>');
    writeln(arqTmp,'          <TD align=left width="17%"><DIV align=left><FONT face="Arial, Helvetica, sans-serif" size=1>Prazo:</FONT></DIV></TD>');
    writeln(arqTmp,'          <TD align=left width="44%"><DIV align=left>'+ qryFicha.FieldByName('prazo').AsString +'</DIV></TD>');
    writeln(arqTmp,'        </TR>');
    writeln(arqTmp,'        </TBODY>');
    writeln(arqTmp,'      </TABLE>');
    writeln(arqTmp,'      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>');
    writeln(arqTmp,'        <TBODY>');
    writeln(arqTmp,'        <TR align=middle>');

    vStr := '';
    if qryFicha.FieldByName('FORMA_INTEGRALIZAR').AsString = '1' then
      vStr := 'Em Moeda Corrente'
    else if qryFicha.FieldByName('FORMA_INTEGRALIZAR').AsString = '2' then
      vStr := 'Em Moeda Corrente e Bens'
    else if qryFicha.FieldByName('FORMA_INTEGRALIZAR').AsString = '3' then
      vStr := 'Somente em bens';

    writeln(arqTmp,'          <TD><P align=left><B><font face="Arial, Helvetica, sans-serif" size="2">Formas de Integralização: </B>' + vStr + '</font> </P></TD>');
    writeln(arqTmp,'        </TR>');
    writeln(arqTmp,'        </TBODY>');
    writeln(arqTmp,'      </TABLE>');
    writeln(arqTmp,'      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>');
    writeln(arqTmp,'        <TBODY>');
    writeln(arqTmp,'        <TR align=middle>');
    writeln(arqTmp,'          <TD align=left width="20%"><DIV align=left><FONT face="Arial, Helvetica, sans-serif" size=1>Relacionar os bens:');
    writeln(arqTmp,'            (Descrição, marca, modelo, estado e valor)</FONT></DIV></TD>');
    writeln(arqTmp,'          <TD align=left colSpan=3><DIV align=left>'+ qryFicha.FieldByName('bens').AsString +'</DIV></TD>');
    writeln(arqTmp,'        </TR>');
    writeln(arqTmp,'        </TBODY>');
    writeln(arqTmp,'      </TABLE>');
    writeln(arqTmp,'      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>');
    writeln(arqTmp,'        <TBODY>');
    writeln(arqTmp,'        <TR align=middle>');

    vStr := '';
    if qryFicha.FieldByName('gerencia').AsString = 'I' then
      vStr := 'Isoladamente'
    else if qryFicha.FieldByName('gerencia').AsString = 'D' then
      vStr := 'Em Conjunto de Dois'
    else if qryFicha.FieldByName('gerencia').AsString = 'T' then
      vStr := 'Em Conjunto (Todos)'
    else if qryFicha.FieldByName('gerencia').AsString = 'O' then
      vStr := 'Outra Forma';

    writeln(arqTmp,'          <TD align=middle height=28><DIV align=left><FONT face="Arial, Helvetica, sans-serif" size=2><B>Gerencia da Sociedade (Assinaturas) :</B>'+ vStr +'</FONT></DIV></TD>');
    writeln(arqTmp,'        </TR>');
    writeln(arqTmp,'        </TBODY>');
    writeln(arqTmp,'      </TABLE>');
    writeln(arqTmp,'      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>');
    writeln(arqTmp,'        <TBODY>');
    writeln(arqTmp,'        <TR align=middle>');
    writeln(arqTmp,'          <TD align=middle colSpan=4><DIV align=left><FONT size=2><B><FONT face="Arial, Helvetica, sans-serif" size=2>Contato</FONT></B></FONT></DIV></TD>');
    writeln(arqTmp,'        </TR>');
    writeln(arqTmp,'        <TR align=middle>');
    writeln(arqTmp,'          <TD align=left width="10%"><DIV align=left><FONT face="Arial, Helvetica, sans-serif" size=1>Nome:</FONT></DIV></TD>');
    writeln(arqTmp,'          <TD align=left colSpan=3 width="40%"><DIV align=left>' + qryFicha.FieldByName('contato').AsString + '</DIV></TD>');
    writeln(arqTmp,'          <TD align=left width="10%"><DIV align=left><FONT face="Arial, Helvetica, sans-serif" size=1>Telefone:</FONT></DIV></TD>');
    writeln(arqTmp,'          <TD align=left colSpan=3 width="40%"><DIV align=left>' + qryFicha.FieldByName('fone1').AsString + ' / ' + qryFicha.FieldByName('fone2').AsString + '</DIV></TD>');
    writeln(arqTmp,'        </TR>');
    writeln(arqTmp,'        </TBODY>');
    writeln(arqTmp,'      </TABLE>');
    writeln(arqTmp,'  </TR>');
    writeln(arqTmp,'  <TR>');

    vStr := qryFicha.FieldByName('orgao1').AsString;
    if qryFicha.FieldByName('orgao2').AsString <> '' then
      vStr := vStr + ', ' + qryFicha.FieldByName('orgao2').AsString;
    if qryFicha.FieldByName('orgao3').AsString <> '' then
      vStr := vStr + ', ' + qryFicha.FieldByName('orgao3').AsString;
    if qryFicha.FieldByName('orgao4').AsString <> '' then
      vStr := vStr + ', ' + qryFicha.FieldByName('orgao4').AsString;
    if qryFicha.FieldByName('orgao5').AsString <> '' then
      vStr := vStr + ', ' + qryFicha.FieldByName('orgao5').AsString;
    if qryFicha.FieldByName('orgao6').AsString <> '' then
      vStr := vStr + ', ' + qryFicha.FieldByName('orgao6').AsString;
    if qryFicha.FieldByName('orgao7').AsString <> '' then
      vStr := vStr + ', ' + qryFicha.FieldByName('orgao7').AsString + '('+qryFicha.FieldByName('prefeitura').AsString+')';

    writeln(arqTmp,'    <TD width="728" colspan="2" height="19"><b>Orgãos: </b>'+ vStr + '</td>');
    writeln(arqTmp,'  </TR>');
    writeln(arqTmp,'  <TR>');
    vStr := '';
    if qryFicha.FieldByName('ALVARA_REGULAR').AsString = 'S' then
      vStr := 'Sim' else vStr := 'Não';
    writeln(arqTmp,'    <TD width="56%" height="29"><b>Licença/Alavará de Funcionamento Regular ? </b>'+vstr+'</td>');
    if qryFicha.FieldByName('PEDIDO_LICENCA').AsString = 'S' then
      vStr := 'Sim' else vStr := 'Não';
    writeln(arqTmp,'    <TD width="44%" height="29"><b>Pedido de&nbsp; Licença ? </b>'+vstr+'</td>');
    writeln(arqTmp,'  </TR>');
    writeln(arqTmp,'  <TR>');

    vStr := qryFicha.FieldByName('tributacao').AsString + '&nbsp;&nbsp;' +qryFicha.FieldByName('OUTRA_TRIB').AsString;

    writeln(arqTmp,'    <TD width="501" colspan="2" height="19"><b>Tributação: </b>' + vStr + '</td>');
    writeln(arqTmp,'  </TR>');
    writeln(arqTmp,'  <TR>');
    if Formatdatetime('dd/mm/yyyy',qryFicha.FieldByName('DT_INICIO').AsDateTime) <> '30/12/1899' then
      writeln(arqTmp,'    <TD width="184" height="19">Data Início Processo: ' + Formatdatetime('dd/mm/yyyy',qryFicha.FieldByName('DT_INICIO').AsDateTime) + '</td>')
    else
      writeln(arqTmp,'    <TD width="184" height="19">Data Início Processo: </td>');

    if Formatdatetime('dd/mm/yyyy',qryFicha.FieldByName('DT_PREV_TERMINO').AsDateTime) <> '30/12/1899' then
      writeln(arqTmp,'    <TD width="317" height="19">Data Prevista p/ Término: ' + Formatdatetime('dd/mm/yyyy',qryFicha.FieldByName('DT_PREV_TERMINO').AsDateTime) + '</td>')
    else
      writeln(arqTmp,'    <TD width="317" height="19">Data Prevista p/ Término: </td>');
    writeln(arqTmp,'  </TR>');
    writeln(arqTmp,'  <TR>');
    writeln(arqTmp,'    <td width="313">Local/Data: '+lerini(caminho+'Atendimento.ini','CIDADE','CIDADE')+' '+Formatdatetime('dd/mm/yyyy',qryFicha.FieldByName('DT_CONTATO').AsDateTime)+'</td>');
    writeln(arqTmp,'    <td width="355">Assinatura Cliente:_____________________</td>');
    writeln(arqTmp,'  </TR>');
    writeln(arqTmp,'</TABLE>');
    writeln(arqTmp,'</body>');
    writeln(arqTmp,'</html>');
  finally
    CloseFile(ArqTmp);
  end;
  shellexecute(Self.Handle,'open', pChar(NomeArq),'','',SW_SHOW);
end;

procedure TFicha2_f.BitBtn6Click(Sender: TObject);
begin
  inherited;
  qryAndamento.Insert;
  qryAndamento.FieldByName('dt_andamento').AsDateTime     := now();
  dbDateEdit5.SetFocus;
end;

procedure TFicha2_f.BitBtn7Click(Sender: TObject);
begin
  inherited;
  if qryAndamento.State = dsInsert then
  begin
    qryAndamento.FieldByName('cod_ficha').AsInteger     := strtoint(medFicha.text);
    qryAndamento.FieldByName('cod_andamento').AsInteger := proximo('gc_ficha_and','cod_andamento','cod_ficha='+medFicha.text, true);
    qryAndamento.FieldByName('cod_func').AsInteger      := cod_func;
    qryAndamento.Post;
    qryAndamento.Close;
    qryAndamento.Open;
  end;
  if qryAndamento.State = dsEdit then
    qryAndamento.Post;

end;

procedure TFicha2_f.PageControl1Change(Sender: TObject);
begin
  inherited;
  if tsAndamento.PageIndex = 4 then
  begin
    tsAndamento.Enabled := not (qryFicha.State = dsInsert);
  end;
  if pagecontrol1.ActivePage = tsFinanc then
  begin
    calcTotal.Value := calcTaxa.Value + calcServico.Value + calcOutro.Value;
  end;
end;

procedure TFicha2_f.calcTaxaExit(Sender: TObject);
begin
  inherited;
  calcTotal.Value := calcTaxa.Value + calcServico.Value + calcOutro.Value;
end;

procedure TFicha2_f.BitBtn8Click(Sender: TObject);
var x   : integer;
    cod : Integer;
begin
  inherited;

  if calcTotal.Value <= 0 then
  begin
    messagedlg('Valor total não pode estar zerado.',mtInformation,[mbOk],0);
    exit;
  end;

  if medParc.Text = '' then
    medParc.Text := '1';

  if qryFicha.State = dsInsert then
  begin
    cod := proximo('gc_ficha','cod_ficha', '',true);
    qryFicha.FieldByName('cod_ficha').AsInteger := cod;
    medFicha.Text := formatfloat('00000',cod);
    qryFicha.Post;
  end;

  if not qryPag.IsEmpty then
  begin
    if messagedlg('Deseja gerar novamente as parcelas. Os dados serão apagados.',mtWarning,[mbYes,mbNo],0) = idYes then
    begin
      qryPag.First;
      while not qryPag.eof do
      begin
        try
          qryPag.delete;
        except
          qryPag.next;
        end;
      end;
    end
    else
      exit;
  end;
  for x := 1 to strtoint(medParc.Text) do
  begin
    qryPag.insert;
    qryPag.FieldByName('cod_ficha').AsInteger     := strtoint(medFicha.text);
    qryPag.FieldByName('cod_pag').AsInteger       := proximo('gc_ficha_pag','cod_pag','cod_ficha='+medFicha.text, true);
    qryPag.FieldByName('Dt_Prev_Pag').AsDateTime  := date() + (30*(x-1));
    qryPag.FieldByName('Valor_Pag').AsFloat       := calcTotal.Value / strtoint(medParc.text);
    qryPag.post;
  end;
  qryPag.Close;
  qryPag.Open;
end;

procedure TFicha2_f.SpeedButton4Click(Sender: TObject);
begin
  dmFinanc.PesBanco.Execute;
  if dmFinanc.PesBanco.ValoresRetorno[0] <> '' then
  begin
    medConta.Clear;
    medConta.Text := dmFinanc.PesBanco.ValoresRetorno[0];
    medContaExit(sender);
  end;
end;

procedure TFicha2_f.SpeedButton3Click(Sender: TObject);
var sSql : String;
begin
  sSql := 'SELECT * FROM CF_PLANO_CONTA' +
          ' ORDER BY DESC_PLCONTA';

  dmFinanc.PesPlConta.StringSql.Clear;
  dmFinanc.PesPlConta.StringSql.Add(sSql);
  dmFinanc.PesPlConta.Execute;
  if dmFinanc.PesPlConta.ValoresRetorno[0] <> '' then
  begin
    medPlano.Clear;
    medPlano.Text := dmFinanc.PesPlConta.ValoresRetorno[0];
    medPlanoExit(sender);
  end;
end;

procedure TFicha2_f.medContaExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
  edit2.Clear;
  if medConta.Text <> '' then
  begin
    qryAux.close;
    qryAux.sql.Text := 'SELECT * FROM CF_BANCO WHERE COD_BANCO = ''' + medConta.Text + '''';
    qryAux.Open;
    if qryAux.Eof then
    begin
      messagedlg('Codigo do Banco não cadastrado.',mtInformation,[mbOk],0);
      medConta.SetFocus;
    end;
    edit2.Text := qryAux.FieldByName('NOME_BANCO').AsString;
    exit;
  end;
end;

procedure TFicha2_f.medPlanoExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
  edit3.Clear;
  if medPlano.Text <> '' then
  begin
    qryAux.close;
    qryAux.sql.Text := 'SELECT * FROM CF_PLANO_CONTA WHERE TIPO_PLCONTA = ''C'' AND COD_PLCONTA = ' + medPlano.Text;
    qryAux.Open;
    if qryAux.Eof then
    begin
      messagedlg('Codigo do Plano de Contas não cadastrado.',mtInformation,[mbOk],0);
      medPlano.SetFocus;
    end;
    edit3.Text := qryAux.FieldByName('desc_plconta').AsString;
    exit;
  end;
end;

procedure TFicha2_f.DBGrid3Exit(Sender: TObject);
begin
  inherited;
  if qryPag.State = dsEdit then
  begin
    qryPag.Post;
  end;
end;

procedure TFicha2_f.sbPesqClick(Sender: TObject);
begin
  inherited;
  dmPesq.PesCliente.StringSql.Clear;
  dmPesq.PesCliente.StringSql.Add('SELECT * FROM GC_CLIENTE WHERE TIPO_CLIFOR IN (''R'',''C'') ');
  dmPesq.PesCliente.StringSql.Add(' ORDER BY NOME_CLI');
  dmPesq.PesCliente.Execute;
  medCliente.Clear;
  edtNomeCli.Clear;
  if dmPesq.PesCliente.ValoresRetorno[0] <> '' then
  begin
    medCliente.Text := dmPesq.PesCliente.ValoresRetorno[0];
    edtNomeCli.Text := dmPesq.PesCliente.ValoresRetorno[2];
  end;
end;

procedure TFicha2_f.medClienteExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
  if medCliente.Text <> '' then
  begin
    qryAux2.Close;
    qryAux2.SQL.Text := 'SELECT * FROM GC_CLIENTE  WHERE TIPO_CLIFOR IN (''R'',''C'') AND COD_CLIENTE='+medCliente.Text;
    qryAux2.Open;
    if qryAux2.eof then
    begin
      messagedlg('Codigo de Cliente não cadastrado.',mtWarning,[mbOk],0);
      medCliente.SetFocus;
      exit;
    end;
    medCliente.Text  := qryAux2.FieldByName('Cod_Cliente').AsString;
    edtNomeCli.Text  := qryAux2.FieldByName('Nome_cli').AsString;
  end
  else
  begin
    medCliente.Clear;
    edtNomeCli.Clear;
  end;
end;

procedure TFicha2_f.Cliente1Click(Sender: TObject);
begin
  inherited;
  if assigned(CadCliente_f) then
    CadCliente_f := nil;

  CadCliente_f := TCadCliente_f.Create(Self);
  try
    CadCliente_f.Height := CadCliente_f.Height - 15;
    CadCliente_f.Show;
  except
    CadCliente_f := TCadCliente_f.Create(Self);
    CadCliente_f.Show;
  end;
end;

procedure TFicha2_f.qryAndamentoCalcFields(DataSet: TDataSet);
begin
  inherited;
  qryAndamento.fieldByName('desc2').AsString := copy(qryAndamento.fieldByName('desc_andamento').AsString,1,100);
end;

end.
