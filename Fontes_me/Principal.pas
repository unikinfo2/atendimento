unit Principal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBTables, ComCtrls, inifiles, ExtCtrls, StdCtrls, dbCtrls,
  Mask, buttons, dbGrids, MDIImage, RxCalc, Funcoes, RxGIF, MDIWallp,
  ColorGrd, Grids, RXCtrls, ImgList, PicClip,
  Animate, GIFCtrl, IBDatabase, SakEmail, RpDefine, RpBase, RpSystem,
  TimerLst, ADODB, ZConnection;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Saida1: TMenuItem;
    Cadastro1: TMenuItem;
    Processos1: TMenuItem;
    Clientes1: TMenuItem;
    Emisso1: TMenuItem;
    NotaFiscalServio1: TMenuItem;
    Database1: TDatabase;
    StatusBar1: TStatusBar;
    Ocorrencias1: TMenuItem;
    Impresso1: TMenuItem;
    DARF1: TMenuItem;
    Trabalhos1: TMenuItem;
    Ligacoes1: TMenuItem;
    AlteraUsurioEmpresa1: TMenuItem;
    UsurioEmpresa1: TMenuItem;
    Visitas1: TMenuItem;
    Documentos1: TMenuItem;
    GrficodoAtendimento1: TMenuItem;
    Atendimento1: TMenuItem;
    Ligaes1: TMenuItem;
    VisitasSolicitadas1: TMenuItem;
    DocumentosEmitidos1: TMenuItem;
    EMail1: TMenuItem;
    AssociaDocumentosaClientes1: TMenuItem;
    AgendaTelefnica1: TMenuItem;
    Calculator1: TRxCalculator;
    Auxiliar1: TMenuItem;
    Calcudora1: TMenuItem;
    Pendncias1: TMenuItem;
    Legal1: TMenuItem;
    DARFAvulso1: TMenuItem;
    Timer1: TTimer;
    InformarPendncias1: TMenuItem;
    qryPendencias: TQuery;
    DocumentosObrigaesporCliente1: TMenuItem;
    Clientes2: TMenuItem;
    AendimentosXLigaes1: TMenuItem;
    DocumentosProtocolosEmitidos1: TMenuItem;
    ConfiguraesdoSistema1: TMenuItem;
    MDIWallpaper1: TMDIWallpaper;
    sgrdPend: TStringGrid;
    MostrarJaneladePendncia1: TMenuItem;
    MemorandoInterno1: TMenuItem;
    ImageList1: TImageList;
    LeituradeMemorandos1: TMenuItem;
    SakSMTP1: TSakSMTP;
    SakMsg1: TSakMsg;
    qryAtendimento: TQuery;
    InformarAniversriosdaSemana1: TMenuItem;
    qryAux: TQuery;
    db: TIBDatabase;
    AgendadeContatos1: TMenuItem;
    SobreoSistemaAtendimento1: TMenuItem;
    ImportararquivodeClientes1: TMenuItem;
    EtiquetasdeClientesFornecedores1: TMenuItem;
    rvSystem1: TRvSystem;
    qryFun: TQuery;
    ListagemdeRamais1: TMenuItem;
    AberturaAlterao1: TMenuItem;
    RegularizaoCancelamentoCertidesOutros1: TMenuItem;
    Feriados1: TMenuItem;
    GeraAgendadeObrigaes1: TMenuItem;
    MostrarAgendaObrigaes1: TMenuItem;
    Assuntos1: TMenuItem;
    GerenciamentodasInformaesdoSistema1: TMenuItem;
    Timer2: TTimer;
    adoConn: TADOConnection;
    procedure Saida1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Clientes1Click(Sender: TObject);
    procedure UsurioEmpresa1Click(Sender: TObject);
    procedure EventosTela(var Msg: TMsg; var Handled: Boolean);
    procedure Ocorrencias1Click(Sender: TObject);
    procedure Documentos1Click(Sender: TObject);
    procedure Trabalhos1Click(Sender: TObject);
    procedure NotaFiscalServio1Click(Sender: TObject);
    procedure Ligaes1Click(Sender: TObject);
    procedure Visitas1Click(Sender: TObject);
    procedure VisitasSolicitadas1Click(Sender: TObject);
    procedure Atendimento1Click(Sender: TObject);
    procedure DocumentosEmitidos1Click(Sender: TObject);
    procedure EMail1Click(Sender: TObject);
    procedure AssociaDocumentosaClientes1Click(Sender: TObject);
    procedure GrficodoAtendimento1Click(Sender: TObject);
    procedure AgendaTelefnica1Click(Sender: TObject);
    procedure Calcudora1Click(Sender: TObject);
    procedure Pendncias1Click(Sender: TObject);
    procedure DARF1Click(Sender: TObject);
    procedure DARFAvulso1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure InformarPendncias1Click(Sender: TObject);
    procedure DocumentosObrigaesporCliente1Click(Sender: TObject);
    procedure Clientes2Click(Sender: TObject);
    procedure Ligacoes1Click(Sender: TObject);
    procedure AendimentosXLigaes1Click(Sender: TObject);
    procedure DocumentosProtocolosEmitidos1Click(Sender: TObject);
    procedure ConfiguraesdoSistema1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MostrarJaneladePendncia1Click(Sender: TObject);
    procedure sgrdPendDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure MemorandoInterno1Click(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure StatusBar1DblClick(Sender: TObject);
    procedure LeituradeMemorandos1Click(Sender: TObject);
    procedure InformarAniversriosdaSemana1Click(Sender: TObject);
    procedure AgendadeContatos1Click(Sender: TObject);
    procedure SobreoSistemaAtendimento1Click(Sender: TObject);
    procedure ImportararquivodeClientes1Click(Sender: TObject);
    procedure EtiquetasdeClientesFornecedores1Click(Sender: TObject);
    procedure rvSystem1Print(Sender: TObject);
    procedure ListagemdeRamais1Click(Sender: TObject);
    procedure rvSystem1NewPage(Sender: TObject);
    procedure rvSystem1BeforePrint(Sender: TObject);
    procedure AberturaAlterao1Click(Sender: TObject);
    procedure RegularizaoCancelamentoCertidesOutros1Click(Sender: TObject);
    procedure Feriados1Click(Sender: TObject);
    procedure GeraAgendadeObrigaes1Click(Sender: TObject);
    procedure MostrarAgendaObrigaes1Click(Sender: TObject);
    procedure Assuntos1Click(Sender: TObject);
    procedure GerenciamentodasInformaesdoSistema1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    vPag : Integer;
    procedure Aniversarios;
    procedure DisparaEmail(pMens:String);
  end;

Function Proximo(Tabela,Campo:String; Condicao:String=''): Integer;
function AnoBisexto (Ano: Word): boolean;
function UltimoDia (Data: TDateTime): TDateTime;
function CalculaCnpjCpf(Num : String) : Boolean;

var
  frmPrincipal   : TfrmPrincipal;
  Percentual_irf : Double;
  Ramo           : String;
  Digita_irf,
  Digita_nf      : Boolean;
  Cor            : Boolean;
  {Cod_Func       : Integer;}
  {Cod_Depto      : Integer;}
  EMail_Func     : String;
  Caminho        : String;
  mostra         : Boolean;
  obrigacao      : Boolean;
  vMemorandos    : String;

const
  sistema : String = 'ATENDIMENTO';
  
implementation
Uses CadCliente_u,
     LogOn_u,
     CadDepartamento_u,
     CadDocumento_u,
     CadFuncionario_u,
     CadLigacao_u,
     LigacaoSolicit_u,
     CadVisita_u,
     VisitaSolicit_u,
     Atendimento_u,
     EMail_u,
     DocEmitido_u,
     AssociaClienteDoc,
     GraficoAtendimento,
     Agenda_u,
     Pendencia_u, Ficha_u, EmiteRelatorios_u, EmiteDarf_u, EmiteDocAssoc_u,
  EmiteCliente_u, EmiteLigacoes_u, EmiteAtendLig_u, EmiteDocumentoProt_u,
  CadConfiguracao, CadMemorando_u, LerMemorando_u, EmiteContato_u, Sobre_u,
  ImportaCli_u, ImpEtq_u, Ficha2_u, CadFerido_u, GeraVencimento_u,
  CadAssunto_u, GerenciaOcorrencia_u, qrDocAssoc;

{$R *.DFM}

procedure TfrmPrincipal.Saida1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin

  ShortDateFormat := 'dd/mm/yyyy';
  LongDateFormat  := 'dd/mm/yyyy';
  ShortTimeFormat := 'hh:nn:ss';
  LongTimeFormat  := 'hh:nn:ss';

  vMemorandos := '';
  application.OnMessage := EventosTela;
  Caminho := extractfilePath(application.ExeName);

  adoConn.Close;
  adoConn.ConnectionString := LerIni(caminho+'Atendimento.ini','BANCO','CONEXAO');
  adoConn.Open;

  with DataBase1.Params do
  begin
    Clear;
    Add('SERVER NAME='+LerIni(caminho+'Atendimento.ini','BANCO_LOCAL','SERVER_NAME'));
    Add('USER NAME='  +LerIni(caminho+'Atendimento.ini','BANCO_LOCAL','USER_NAME'));
    Add('PASSWORD='+LerIni(caminho+'Atendimento.ini','BANCO_LOCAL','PASSWORD'));
  end;
  DataBase1.Open;
  Cor                   := not(uppercase(LerIni(caminho+'Atendimento.ini','Identificacao','Cor')) = 'NAO');
  Cod_Func              := 0;
  Email_Func            := '';
  Nivel                 := 9;
  Cod_Depto             := 0;
  StatusBar1.Font.Size  := 12;
  StatusBar1.Font.Style := [fsBold];
  application.HintColor := clYellow;

  Mostra                      := (uppercase(LerIni(caminho+'Atendimento.ini','Identificacao','Pendencia')) = 'SIM');
  InformarPendncias1.Checked  := Mostra;

  Obrigacao                       := (uppercase(LerIni(caminho+'Atendimento.ini','Identificacao','Obrigacao')) = 'SIM');
  MostrarAgendaObrigaes1.Checked  := Obrigacao;

  sgrdPend.Visible      := (uppercase(LerIni(caminho+'Atendimento.ini','Identificacao','Janela'))    = 'SIM');
  MostrarJaneladePendncia1.Checked := sgrdPend.Visible;

  self.Caption := 'Gerenciamento de Escritório Contabil - Atendimento / Ultima Atualização ' + formatdatetime('dd/mm/yyyy hh:nn', ExeDateTime);

end;

function Proximo(Tabela, Campo, Condicao: String): Integer;
var vStr : String;
begin
  with TQuery.Create(Nil) do
  begin
    DatabaseName := 'db';
    vStr := '';
    if condicao <> '' then
      vStr := ' WHERE ' + condicao;
    Sql.Text := 'SELECT MAX(' + CAMPO + ') AS CODIGO FROM '+ TABELA +
                vStr;
    Open;
    result := FieldByName('Codigo').AsInteger + 1;
  end;
end;

function AnoBisexto (Ano: Word): boolean;
begin
  Result := ((Ano mod 4 = 0) and (Ano mod 100 <> 0)) or (Ano mod 400 = 0);
end;

function UltimoDia (Data: TDateTime): TDateTime;
var a,m,d:word;
begin

  decodedate( Data, a, m, d);

  d := 31;

  if (m = 4) or (m = 6) or (m = 9) or (m = 11) then
    d := 30;

  if (m = 2) then
    if (AnoBisexto (a))
      then d := 29
      else d := 28;
  result := enCodeDate(a,m,d);
end;

function CalculaCnpjCpf(Num : String) : Boolean;
var
  CNPJ : Boolean;
  n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12: integer;
  d1,d2: integer;
  digitado, calculado: string;
begin
  Result := False;
  case Length(Num) of
    11 : CNPJ := False;
    14 : CNPJ := True;
  else
    Exit;
  end;
  if CNPJ then
  begin
    n1  := StrToInt(num[1]);
    n2  := StrToInt(num[2]);
    n3  := StrToInt(num[3]);
    n4  := StrToInt(num[4]);
    n5  := StrToInt(num[5]);
    n6  := StrToInt(num[6]);
    n7  := StrToInt(num[7]);
    n8  := StrToInt(num[8]);
    n9  := StrToInt(num[9]);
    n10 := StrToInt(num[10]);
    n11 := StrToInt(num[11]);
    n12 := StrToInt(num[12]);
    d1  := n12*2+n11*3+n10*4+n9*5+n8*6+n7*7+n6*8+n5*9+n4*2+n3*3+n2*4+n1*5;
    d1  := 11-(d1 mod 11);
    if d1 >= 10 then d1 := 0;
    d2  := d1*2+n12*3+n11*4+n10*5+n9*6+n8*7+n7*8+n6*9+n5*2+n4*3+n3*4+n2*5+n1*6;
    d2  := 11-(d2 mod 11);
    if d2 >= 10 then d2 := 0;
    calculado := inttostr(d1)+inttostr(d2);
    digitado  := num[13]+num[14];
    if calculado = digitado then
      Result := true
    else
      Result := false;
  end
  else
  begin
    n1 := StrToInt(num[1]);
    n2 := StrToInt(num[2]);
    n3 := StrToInt(num[3]);
    n4 := StrToInt(num[4]);
    n5 := StrToInt(num[5]);
    n6 := StrToInt(num[6]);
    n7 := StrToInt(num[7]);
    n8 := StrToInt(num[8]);
    n9 := StrToInt(num[9]);
    d1 := n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
    d1 := 11-(d1 mod 11);
    if d1 >= 10 then d1 := 0;
    d2 := d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
    d2 := 11-(d2 mod 11);
    if d2 >= 10 then d2 := 0;
    calculado := inttostr(d1)+inttostr(d2);
    digitado  := num[10]+num[11];
    if calculado = digitado then
      result := true
    else
      result := false;
  end;
end;

procedure TfrmPrincipal.Clientes1Click(Sender: TObject);
begin
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

procedure TfrmPrincipal.UsurioEmpresa1Click(Sender: TObject);
begin
  if assigned(LogOn_f) then
    LogOn_f := nil;
  LogOn_f := TLogOn_f.Create(Self);
  try
    LogOn_f.Show;
  except
    LogOn_f := TLogOn_f.Create(Self);
    LogOn_f.Show;
  end;
end;

procedure TfrmPrincipal.EventosTela(var Msg: TMsg; var Handled: Boolean);
begin
  {Eventos da tela}
end;

procedure TfrmPrincipal.Ocorrencias1Click(Sender: TObject);
begin
  if assigned(CadDepartamento_f) then
    CadDepartamento_f := nil;

  CadDepartamento_f := TCadDepartamento_f.Create(Self);
  try
    CadDepartamento_f.Show;
  except
    CadDepartamento_f := TCadDepartamento_f.Create(Self);
    CadDepartamento_f.Show;
  end;
end;

procedure TfrmPrincipal.Documentos1Click(Sender: TObject);
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

procedure TfrmPrincipal.Trabalhos1Click(Sender: TObject);
begin
  if assigned(CadFuncionario_f) then
    CadFuncionario_f := nil;

  CadFuncionario_f := TCadFuncionario_f.Create(Self);
  try
    CadFuncionario_f.Show;
  except
    CadFuncionario_f := TCadFuncionario_f.Create(Self);
    CadFuncionario_f.Show;
  end;
end;

procedure TfrmPrincipal.NotaFiscalServio1Click(Sender: TObject);
begin
  if assigned(CadLigacao_f) then
    CadLigacao_f := nil;

  CadLigacao_f := TCadLigacao_f.Create(Self);
  try
    CadLigacao_f.Height := CadLigacao_f.Height - 15;
    CadLigacao_f.Show;
  except
    CadLigacao_f := TCadLigacao_f.Create(Self);
    CadLigacao_f.Height := CadLigacao_f.Height - 15;
    CadLigacao_f.Show;
  end;
end;

procedure TfrmPrincipal.Ligaes1Click(Sender: TObject);
begin
  if assigned(LigacaoSolicit_f) then
    LigacaoSolicit_f := nil;

  LigacaoSolicit_f := TLigacaoSolicit_f.Create(Self);
  try
    LigacaoSolicit_f.Width    := frmPrincipal.Width  - 20;
    LigacaoSolicit_f.Height   := frmPrincipal.Height - 80;
    LigacaoSolicit_f.Position := poDesigned;
    LigacaoSolicit_f.Top      := 3;
    LigacaoSolicit_f.Left     := 3;

    {LicacaoSolicit_f.Show;}
  except
    LigacaoSolicit_f := TLigacaoSolicit_f.Create(Self);
    LigacaoSolicit_f.Width  := frmPrincipal.Width  - 10;
    LigacaoSolicit_f.Height := frmPrincipal.Height - 10;
    LigacaoSolicit_f.Show;
  end;
end;

procedure TfrmPrincipal.Visitas1Click(Sender: TObject);
begin
  if assigned(CadVisita_f) then
    CadVisita_f := nil;

  CadVisita_f := TCadVisita_f.Create(Self);
  try
    CadVisita_f.Height := CadVisita_f.Height - 15;
    CadVisita_f.Show;
  except
    CadVisita_f := TCadVisita_f.Create(Self);
    CadVisita_f.Height := CadVisita_f.Height - 15;
    CadVisita_f.Show;
  end;
end;

procedure TfrmPrincipal.VisitasSolicitadas1Click(Sender: TObject);
begin
  if assigned(VisitaSolicit_f) then
    VisitaSolicit_f := nil;

  VisitaSolicit_f := TVisitaSolicit_f.Create(Self);
  try
    VisitaSolicit_f.Width    := frmPrincipal.Width  - 20;
    VisitaSolicit_f.Height   := frmPrincipal.Height - 80;
    VisitaSolicit_f.Position := poDesigned;
    VisitaSolicit_f.Top      := 3;
    VisitaSolicit_f.Left     := 3;
  except
    VisitaSolicit_f := TVisitaSolicit_f.Create(Self);
    VisitaSolicit_f.Width  := frmPrincipal.Width  - 10;
    VisitaSolicit_f.Height := frmPrincipal.Height - 10;
    VisitaSolicit_f.Show;
  end;
end;

procedure TfrmPrincipal.Atendimento1Click(Sender: TObject);
begin
  if assigned(Atendimento_f) then
    Atendimento_f := nil;

  Atendimento_f := TAtendimento_f.Create(Self);
  try
    Atendimento_f.Width    := frmPrincipal.Width  - 20;
    Atendimento_f.Height   := frmPrincipal.Height - 80;
    Atendimento_f.Position := poDesigned;
    Atendimento_f.Top      := 3;
    Atendimento_f.Left     := 3;
  except
    Atendimento_f          := TAtendimento_f.Create(Self);
    Atendimento_f.Width    := frmPrincipal.Width  - 10;
    Atendimento_f.Height   := frmPrincipal.Height - 10;
    Atendimento_f.Show;
  end;
end;

procedure TfrmPrincipal.DocumentosEmitidos1Click(Sender: TObject);
begin
  if assigned(DocEmitido_f) then
    DocEmitido_f := nil;

  DocEmitido_f := TDocEmitido_f.Create(Self);
  try
    DocEmitido_f.Show;
  except
    DocEmitido_f := TDocEmitido_f.Create(Self);
    DocEmitido_f.Show;
  end;
end;

procedure TfrmPrincipal.EMail1Click(Sender: TObject);
begin
  if assigned(EMail_f) then
    EMail_f := nil;

  EMail_f := TEMail_f.Create(Self);
  try
    EMail_f.Show;
  except
    EMail_f := TEMail_f.Create(Self);
    EMail_f.Show;
  end;
end;

procedure TfrmPrincipal.AssociaDocumentosaClientes1Click(Sender: TObject);
begin
  if assigned(AssociaClienteDoc_f) then
    AssociaClienteDoc_f := nil;

  AssociaClienteDoc_f := TAssociaClienteDoc_f.Create(Self);
  try
    AssociaClienteDoc_f.Show;
  except
    AssociaClienteDoc_f := TAssociaClienteDoc_f.Create(Self);
    AssociaClienteDoc_f.Show;
  end;
end;

procedure TfrmPrincipal.GrficodoAtendimento1Click(Sender: TObject);
begin
  if assigned(GraficoAtendimento_f) then
    GraficoAtendimento_f := nil;

  GraficoAtendimento_f := TGraficoAtendimento_f.Create(Self);
  try
    GraficoAtendimento_f.Width    := frmPrincipal.Width  - 20;
    GraficoAtendimento_f.Height   := frmPrincipal.Height - 80;
    GraficoAtendimento_f.Position := poDesigned;
    GraficoAtendimento_f.Top      := 3;
    GraficoAtendimento_f.Left     := 3;
  except
    GraficoAtendimento_f          := TGraficoAtendimento_f.Create(Self);
    GraficoAtendimento_f.Width    := frmPrincipal.Width  - 10;
    GraficoAtendimento_f.Height   := frmPrincipal.Height - 10;
    GraficoAtendimento_f.Show;
  end;
end;

procedure TfrmPrincipal.AgendaTelefnica1Click(Sender: TObject);
begin
  if assigned(Agenda_f) then
    Agenda_f := nil;

  Agenda_f := TAgenda_f.Create(Self);
  try
    Agenda_f.Width    := frmPrincipal.Width  - 20;
    Agenda_f.Height   := frmPrincipal.Height - 80;
    Agenda_f.Position := poDesigned;
    Agenda_f.Top      := 3;
    Agenda_f.Left     := 3;
  except
    Agenda_f          := TAgenda_f.Create(Self);
    Agenda_f.Width    := frmPrincipal.Width  - 10;
    Agenda_f.Height   := frmPrincipal.Height - 10;
    Agenda_f.Show;
  end;
end;

procedure TfrmPrincipal.Calcudora1Click(Sender: TObject);
begin
  calculator1.Execute;
end;

procedure TfrmPrincipal.Pendncias1Click(Sender: TObject);
begin
  if assigned(Pendencia_f) then
    Pendencia_f := nil;

  Pendencia_f := TPendencia_f.Create(Self);
  try
    Pendencia_f.Width    := frmPrincipal.Width  - 20;
    Pendencia_f.Height   := frmPrincipal.Height - 80;
    Pendencia_f.Position := poDesigned;
    Pendencia_f.Top      := 3;
    Pendencia_f.Left     := 3;
  except
    Pendencia_f          := TPendencia_f.Create(Self);
    Pendencia_f.Width    := frmPrincipal.Width  - 10;
    Pendencia_f.Height   := frmPrincipal.Height - 10;
    Pendencia_f.Show;
  end;
end;

procedure TfrmPrincipal.DARF1Click(Sender: TObject);
begin
  if assigned(EmiteRelatorios_f) then
    EmiteRelatorios_f := nil;

  EmiteRelatorios_f := TEmiteRelatorios_f.Create(Self);
  try
    EmiteRelatorios_f.Show;
  except
    EmiteRelatorios_f := TEmiteRelatorios_f.Create(Self);
    EmiteRelatorios_f.Show;
  end;
end;

procedure TfrmPrincipal.DARFAvulso1Click(Sender: TObject);
begin
  if assigned(EmiteDarf_f) then
    EmiteDarf_f := nil;

  EmiteDarf_f := TEmiteDarf_f.Create(Self);
  try
    EmiteDarf_f.Show;
  except
    EmiteDarf_f := TEmiteDarf_f.Create(Self);
    EmiteDarf_f.Show;
  end;
end;

procedure TfrmPrincipal.Timer1Timer(Sender: TObject);
var sSQl : String;
    de   : TDateTime;
    ate  : TDateTime;
    Pend : Boolean;
    pri_Baixa, pri_Media, pri_Alta : Double;
    vDat : TDateTime;
    vMens: String;
    cr   : String;
begin
  inherited;
  {(StrToInt(LerIni(caminho+'Atendimento.ini','Identificacao','Historico'))/2)}
  De   := now() - StrToInt(LerIni(caminho+'Atendimento.ini','Identificacao','Historico'));
  Ate  := now();
  Pend := False;

  sgrdPend.Cells[0,0] := 'Pendência';
  sgrdPend.Cells[1,0] := 'Qtde.';

  {Ligações Recebidas}
  qryPendencias.Close;
  sSql := 'SELECT COUNT( * ) AS QTD FROM GC_LIGACAO LIG ';
  sSql := sSql + ' WHERE LIG.STATUS_LIG = ''A'' AND LIG.TIPO_LIGACAO = ''R'' ';
  sSql := sSql + ' AND LIG.COD_FUNC = ' + IntToStr(Cod_Func);
  sSql := sSql + ' AND LIG.DT_PEDIDO_LIG >= CAST(''' + FormatDateTime('yyyy-mm-dd hh:nn',StrToDateTime(formatdatetime('dd/mm/yyyy',De)  + ' 00:00')) + ''' AS TIMESTAMP)';
  sSql := sSql + ' AND LIG.DT_PEDIDO_LIG <= CAST(''' + FormatDateTime('yyyy-mm-dd hh:nn',StrToDateTime(formatdatetime('dd/mm/yyyy',Ate) + ' 23:59')) + ''' AS TIMESTAMP)';
  qryPendencias.SQL.Text := sSql;
  qryPendencias.Open;
  if qryPendencias.FieldByName('QTD').AsFloat > 0 then
  begin
    Pend := True;
  end;
  sgrdPend.Cells[0,1] := 'Ligações Rec.';
  sgrdPend.Cells[1,1] := formatfloat('###0',qryPendencias.FieldByName('QTD').AsFloat);

  {Ligações Solicitadas}
  qryPendencias.Close;
  sSql := 'SELECT COUNT( * ) AS QTD FROM GC_LIGACAO LIG ';
  sSql := sSql + ' WHERE LIG.STATUS_LIG = ''A'' AND LIG.TIPO_LIGACAO = ''S'' ';
  sSql := sSql + ' AND LIG.COD_FUNC = ' + IntToStr(Cod_Func);
  sSql := sSql + ' AND LIG.DT_PEDIDO_LIG >= CAST(''' + FormatDateTime('yyyy-mm-dd hh:nn',StrToDateTime(formatdatetime('dd/mm/yyyy',De)  + ' 00:00')) + ''' AS TIMESTAMP)';
  sSql := sSql + ' AND LIG.DT_PEDIDO_LIG <= CAST(''' + FormatDateTime('yyyy-mm-dd hh:nn',StrToDateTime(formatdatetime('dd/mm/yyyy',Ate) + ' 23:59')) + ''' AS TIMESTAMP)';
  qryPendencias.SQL.Text := sSql;
  qryPendencias.Open;
  if qryPendencias.FieldByName('QTD').AsFloat > 0 then
  begin
    Pend := True;
  end;
  sgrdPend.Cells[0,2] := 'Ligações Solic.';
  sgrdPend.Cells[1,2] := formatfloat('###0',qryPendencias.FieldByName('QTD').AsFloat);

  {Atendimento Pendentes}
  sSql := 'SELECT count( * ) AS QTD FROM GC_ATENDIMENTO ATE ';
  sSql := sSql + ' WHERE ATE.STATUS_ATEND = ''A''';
  sSql := sSql + ' AND ATE.COD_FUNC = ' + IntToStr(Cod_Func);
  sSql := sSql + ' AND ATE.DT_ATEND >= CAST(''' + FormatDateTime('yyyy-mm-dd hh:nn',StrToDateTime(formatdatetime('dd/mm/yyyy',De)  + ' 00:00')) + ''' AS TIMESTAMP)';
  sSql := sSql + ' AND ATE.DT_ATEND <= CAST(''' + FormatDateTime('yyyy-mm-dd hh:nn',StrToDateTime(formatdatetime('dd/mm/yyyy',Ate) + ' 23:59')) + ''' AS TIMESTAMP)';
  qryPendencias.Close;
  qryPendencias.SQL.Text := sSql;
  qryPendencias.Open;
  if qryPendencias.FieldByName('QTD').AsFloat > 0 then
  begin
    Pend := True;
  end;
  sgrdPend.Cells[0,3] := 'Atendimentos Pendentes';
  sgrdPend.Cells[1,3] := formatfloat('###0',qryPendencias.FieldByName('QTD').AsFloat);

  if LerIni(caminho+'Atendimento.ini','EMAIL','CONTROLLER') = 'SIM' then
  begin
    {E-Mail Atendimentos Pendentes}
    sSql := 'SELECT * FROM GC_ATENDIMENTO ATE ';
    sSql := sSql + ' INNER JOIN GC_CLIENTE      CLI ON (ATE.COD_CLIENTE=CLI.COD_CLIENTE) ';
    sSql := sSql + ' LEFT  JOIN GC_DOCUMENTO    DOC ON (ATE.COD_DOCTO=DOC.COD_DOCTO) ';
    sSql := sSql + ' LEFT  JOIN GC_FUNCIONARIO  FUN ON (ATE.COD_FUNC=FUN.COD_FUNC) ';
    sSql := sSql + ' LEFT  JOIN GC_DEPARTAMENTO DEP ON (FUN.COD_DEPTO=DEP.COD_DEPTO) ';
    sSql := sSql + ' WHERE ATE.STATUS_ATEND = ''A'' AND ATE.EMAIL_ATEND=''N'' ';
    sSql := sSql + ' AND ATE.COD_FUNC = ' + IntToStr(Cod_Func);
    sSql := sSql + ' AND ATE.DT_ATEND >= CAST(''' + FormatDateTime('yyyy-mm-dd hh:nn',StrToDateTime(formatdatetime('dd/mm/yyyy',De)  + ' 00:00')) + ''' AS TIMESTAMP)';
    sSql := sSql + ' AND ATE.DT_ATEND <= CAST(''' + FormatDateTime('yyyy-mm-dd hh:nn',StrToDateTime(formatdatetime('dd/mm/yyyy',Ate) + ' 23:59')) + ''' AS TIMESTAMP)';
    qryPendencias.Close;
    qryPendencias.SQL.Text := sSql;
    qryPendencias.Open;

    pri_Baixa  := StrToFloat(lerIni(caminho+'Atendimento.ini','Prioridade','Baixa')) - 1;
    pri_Media  := StrToFloat(lerIni(caminho+'Atendimento.ini','Prioridade','Media')) - 1;
    pri_Alta   := StrToFloat(lerIni(caminho+'Atendimento.ini','Prioridade','Alta'))  - (1/2);
    while not qryPendencias.eof do
    begin
      cr := #13#10;
      vDat  := now() - qryPendencias.FieldByName('dt_atend').AsDateTime;

      vMens :=         'Atendimento: ' + formatfloat('000000000',qryPendencias.FieldByName('cod_atendimento').AsInteger)+cr;
      vMens := vMens + 'Cliente: '+ formatfloat('00000',qryPendencias.FieldByName('cod_cliente').AsInteger)+'-'+qryPendencias.FieldByName('nome_cli').AsString+cr;
      vMens := vMens + 'Contato Solicitante: '+qryPendencias.FieldByName('nome_clifunc').AsString+cr;
      vMens := vMens + 'Data e Hora do Atendimento: ' + formatdatetime('dd/mm/yyyy hh:nn:ss',qryPendencias.FieldByName('dt_atend').AsDateTime)+cr;
      vMens := vMens + 'Data e Hora do E-Mail: ' + formatdatetime('dd/mm/yyyy hh:nn:ss',now())+cr;
      vMens := vMens + 'Funcionário: '+ qryPendencias.FieldByName('nome_func').AsString+cr;
      vMens := vMens + 'Departamento: '+ qryPendencias.FieldByName('desc_depto').AsString+cr;

      if qryPendencias.FieldByName('tipo_atend').AsString = '0' then vMens := vMens + 'Tipo: Solicitação'+cr;
      if qryPendencias.FieldByName('tipo_atend').AsString = '1' then vMens := vMens + 'Tipo: Reenvio'+cr;
      if qryPendencias.FieldByName('tipo_atend').AsString = '2' then vMens := vMens + 'Tipo: Recalculo'+cr;
      if qryPendencias.FieldByName('tipo_atend').AsString = '3' then vMens := vMens + 'Tipo: Reclamação'+cr;
      if qryPendencias.FieldByName('tipo_atend').AsString = '4' then vMens := vMens + 'Tipo: Observação'+cr;
      if qryPendencias.FieldByName('tipo_atend').AsString = '5' then vMens := vMens + 'Tipo: Informação'+cr;

      if qryPendencias.FieldByName('prioridade_atend').AsString = 'A' then vMens := vMens + 'Prioridade: Alta'+cr;
      if qryPendencias.FieldByName('prioridade_atend').AsString = 'M' then vMens := vMens + 'Prioridade: Média'+cr;
      if qryPendencias.FieldByName('prioridade_atend').AsString = 'B' then vMens := vMens + 'Prioridade: Baixa'+cr;

      vMens := vMens + 'Documento: '+formatfloat('00000',qryPendencias.FieldByName('cod_docto').AsInteger) + '-' + qryPendencias.FieldByName('desc_docto').AsString+cr;
      vMens := vMens + 'Relato do Cliente: ' + qryPendencias.FieldByName('descricao_atend').AsString+cr;


      if (qryPendencias.FieldByName('prioridade_atend').AsString = 'A') and
         ( vDat >= pri_Alta ) then
      begin
        DisparaEmail(vMens);
      end;
      if (qryPendencias.FieldByName('prioridade_atend').AsString = 'M') and
         ( vDat >=  pri_Media) then
      begin
        DisparaEmail(vMens);
      end;
      if (qryPendencias.FieldByName('prioridade_atend').AsString = 'B') and
         ( vDat >=  pri_Baixa) then
      begin
        DisparaEmail(vMens);
      end;

      qryAtendimento.close;
      qryAtendimento.ParamByName('Cod_Atendimento').AsInteger := qryPendencias.FieldByName('Cod_Atendimento').AsInteger;
      qryAtendimento.Open;
      qryAtendimento.Edit;
      qryAtendimento.FieldByName('EMail_Atend').AsString := 'S';
      qryAtendimento.Post;

      qryPendencias.next;
    end;
  end;

  {Atendimento Espera}
  sSql := 'SELECT COUNT( * ) AS QTD  FROM GC_ATENDIMENTO ATE ';
  sSql := sSql + ' WHERE ATE.STATUS_ATEND = ''E'' ';
  sSql := sSql + ' AND ATE.COD_FUNC = ' + IntToStr(Cod_Func);
  sSql := sSql + ' AND ATE.DT_ATEND >= CAST(''' + FormatDateTime('yyyy-mm-dd hh:nn',StrToDateTime(formatdatetime('dd/mm/yyyy',De)  + ' 00:00')) + ''' AS TIMESTAMP)';
  sSql := sSql + ' AND ATE.DT_ATEND <= CAST(''' + FormatDateTime('yyyy-mm-dd hh:nn',StrToDateTime(formatdatetime('dd/mm/yyyy',Ate) + ' 23:59')) + ''' AS TIMESTAMP)';
  qryPendencias.Close;
  qryPendencias.SQL.Text := sSql;
  qryPendencias.Open;
  if qryPendencias.FieldByName('QTD').AsFloat > 0 then
  begin
    Pend := True;
  end;
  sgrdPend.Cells[0,4] := 'Atendimentos em Espera';
  sgrdPend.Cells[1,4] := formatfloat('###0',qryPendencias.FieldByName('QTD').AsFloat);

  {Visitas}
  sSql := 'SELECT COUNT( * ) AS QTD FROM GC_VISITA VIS ';
  sSql := sSql + ' WHERE VIS.STATUS_VISITA = ''A'' AND VIS.TIPO_COMPROMISSO=''V'' ';
  sSql := sSql + ' AND VIS.COD_FUNC = ' + IntToStr(Cod_Func);
  sSql := sSql + ' AND VIS.DT_VISITA >= CAST(''' + FormatDateTime('yyyy-mm-dd hh:nn',StrToDateTime(formatdatetime('dd/mm/yyyy',De)  + ' 00:00')) + ''' AS TIMESTAMP)';
  sSql := sSql + ' AND VIS.DT_VISITA <= CAST(''' + FormatDateTime('yyyy-mm-dd hh:nn',StrToDateTime(formatdatetime('dd/mm/yyyy',Ate) + ' 23:59')) + ''' AS TIMESTAMP)';
  qryPendencias.Close;
  qryPendencias.SQL.Text := sSql;
  qryPendencias.Open;
  if qryPendencias.FieldByName('QTD').AsFloat > 0 then
  begin
    Pend := True;
  end;
  sgrdPend.Cells[0,5] := 'Visitas Agendadas';
  sgrdPend.Cells[1,5] := formatfloat('###0',qryPendencias.FieldByName('QTD').AsFloat);

  {Fiscalizações}
  sSql := 'SELECT  COUNT( * ) AS QTD  FROM GC_VISITA VIS ';
  sSql := sSql + ' WHERE VIS.STATUS_VISITA = ''A'' AND VIS.TIPO_COMPROMISSO=''F'' ';
  sSql := sSql + ' AND VIS.COD_FUNC = ' + IntToStr(Cod_Func);
  sSql := sSql + ' AND VIS.DT_VISITA >= CAST(''' + FormatDateTime('yyyy-mm-dd hh:nn',StrToDateTime(formatdatetime('dd/mm/yyyy',De)  + ' 00:00')) + ''' AS TIMESTAMP)';
  sSql := sSql + ' AND VIS.DT_VISITA <= CAST(''' + FormatDateTime('yyyy-mm-dd hh:nn',StrToDateTime(formatdatetime('dd/mm/yyyy',Ate) + ' 23:59')) + ''' AS TIMESTAMP)';
  qryPendencias.Close;
  qryPendencias.SQL.Text := sSql;
  qryPendencias.Open;
  if qryPendencias.FieldByName('QTD').AsFloat > 0 then
  begin
    Pend := True;
  end;
  sgrdPend.Cells[0,6] := 'Fiscalizações Agendadas';
  sgrdPend.Cells[1,6] := formatfloat('###0',qryPendencias.FieldByName('QTD').AsFloat);

  {Homologação}
  sSql := 'SELECT  COUNT( * ) AS QTD  FROM GC_VISITA VIS ';
  sSql := sSql + ' WHERE VIS.STATUS_VISITA = ''A'' AND VIS.TIPO_COMPROMISSO=''H'' ';
  sSql := sSql + ' AND VIS.COD_FUNC = ' + IntToStr(Cod_Func);
  sSql := sSql + ' AND VIS.DT_VISITA >= CAST(''' + FormatDateTime('yyyy-mm-dd hh:nn',StrToDateTime(formatdatetime('dd/mm/yyyy',De)  + ' 00:00')) + ''' AS TIMESTAMP)';
  sSql := sSql + ' AND VIS.DT_VISITA <= CAST(''' + FormatDateTime('yyyy-mm-dd hh:nn',StrToDateTime(formatdatetime('dd/mm/yyyy',Ate) + ' 23:59')) + ''' AS TIMESTAMP)';
  qryPendencias.Close;
  qryPendencias.SQL.Text := sSql;
  qryPendencias.Open;
  if qryPendencias.FieldByName('QTD').AsFloat > 0 then
  begin
    Pend := True;
  end;
  sgrdPend.Cells[0,7] := 'Homologações Agendadas';
  sgrdPend.Cells[1,7] := formatfloat('###0',qryPendencias.FieldByName('QTD').AsFloat);

  {Memorandos não Lidos}
  qryPendencias.Close;
  sSql := 'SELECT COUNT( * ) AS QTD FROM GC_MEMORANDO MEM ';
  sSql := sSql + ' INNER JOIN GC_MEMORANDO_FUNC FUN ON (MEM.COD_MEMO=FUN.COD_MEMO)';
  sSql := sSql + ' WHERE MEM.STATUS_MEMO = ''A'' AND FUN.STATUS_MEMO_FUNC = ''A'' ';
  sSql := sSql + ' AND FUN.COD_FUNC = ' + IntToStr(Cod_Func);
  sSql := sSql + ' AND MEM.DT_MEMO >= CAST(''' + FormatDateTime('yyyy-mm-dd hh:nn',StrToDateTime(formatdatetime('dd/mm/yyyy',De)  + ' 00:00')) + ''' AS TIMESTAMP)';
  sSql := sSql + ' AND MEM.DT_MEMO <= CAST(''' + FormatDateTime('yyyy-mm-dd hh:nn',StrToDateTime(formatdatetime('dd/mm/yyyy',Ate) + ' 23:59')) + ''' AS TIMESTAMP)';
  qryPendencias.SQL.Text := sSql;
  qryPendencias.Open;
  vMemorandos := '';
  if qryPendencias.FieldByName('QTD').AsFloat > 0 then
  begin
    vMemorandos := 'Você possui ' + formatfloat('###0',qryPendencias.FieldByName('QTD').AsFloat) + ' Memorandos não Lidos';
    StatusBar1.Refresh;
    Pend := True;
  end;
  sgrdPend.Cells[0,8] := 'Memorandos não Lidos';
  sgrdPend.Cells[1,8] := formatfloat('###0',qryPendencias.FieldByName('QTD').AsFloat);

  if (pend) and (mostra) then
  begin
    timer1.Enabled := False;
    messagedlg('Existem pendências para você. Verifique.',mtInformation,[mbOk],0);
    timer1.Enabled := True;
    exit;
  end;
end;

procedure TfrmPrincipal.DisparaEmail(pMens:String);
begin
  {Dispara email do atendimento}
  {Conectar}
  if email_func = '' then
  begin
    messagedlg('Funcionário logado não possui e-mail cadastrado.',mtWarning,[mbOk],0);
    exit;
  end;
{  try
    if UpperCase(LerIni(caminho+'Atendimento.ini','EMAIL','CONTROLLER')) = 'SIM' then
    begin
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
        ToAddress.Add(LerIni(caminho+'Atendimento.ini','EMAIL','EMAILCONTR'));

        if LerIni(caminho+'Atendimento.ini','EMAIL','EMAILCC') <> '' then
        begin
          ToAddress.Add(LerIni(caminho+'Atendimento.ini','EMAIL','EMAILCC'));
        end;
        Subject := LerIni(caminho+'Atendimento.ini','EMAIL','EMAILMENS');
        Body.Text := pMens;
      end;
      NMSMTP1.SendMail;
      NMSMTP1.Disconnect;
    end;
  except}
    if UpperCase(LerIni(caminho+'Atendimento.ini','EMAIL','CONTROLLER')) = 'SIM' then
    begin
      sakSMTP1.Host     := LerIni(caminho+'Atendimento.ini','EMAIL','SMTP');
      sakSMTP1.Connect;
      if not sakSMTP1.Connected then
        raise Exception.Create('Erro de conexão');
      sakMsg1.From      := Email_Func;
      sakMsg1.Subject   := LerIni(caminho+'Atendimento.ini','EMAIL','EMAILMENS');
      sakMsg1.Text.Clear;
      sakMsg1.Text.Text := pMens;
      sakMsg1.sendTo    := LerIni(caminho+'Atendimento.ini','EMAIL','EMAILCONTR');
      sakSMTP1.SendMessage(sakMsg1);
      sakMsg1.CC        := '';

      if LerIni(caminho+'Atendimento.ini','EMAIL','EMAILCC') <> '' then
      begin
        sakMsg1.sendTo    := LerIni(caminho+'Atendimento.ini','EMAIL','EMAILCC');
        sakSMTP1.SendMessage(sakMsg1);
        sakMsg1.CC        := '';
      end;
      sakSMTP1.Quit;
    end;
  {end;}
end;


procedure TfrmPrincipal.InformarPendncias1Click(Sender: TObject);
begin
  if InformarPendncias1.Checked then
  begin
    InformarPendncias1.Checked := False;
    Mostra                     := False;
    GravarIni(caminho+'Atendimento.ini','Identificacao','Pendencia','NAO');
  end
  else
  begin
    InformarPendncias1.Checked := True;
    Mostra                     := True;
    try
      Timer1.Interval := StrToInt(LerIni(caminho+'Atendimento.ini','Identificacao','Mensagem'))*1000;
    except
      Timer1.Interval := 60000;
    end;
    Timer1.Enabled    := True;
    GravarIni(caminho+'Atendimento.ini','Identificacao','Pendencia','SIM');
  end;
end;

procedure TfrmPrincipal.DocumentosObrigaesporCliente1Click(
  Sender: TObject);
begin
//EmiteDocAssoc_f
  if assigned(EmiteDocAssoc_f) then
    EmiteDocAssoc_f := nil;

  EmiteDocAssoc_f := TEmiteDocAssoc_f.Create(Self);
  try
    EmiteDocAssoc_f.Show;
  except
    EmiteDocAssoc_f := TEmiteDocAssoc_f.Create(Self);
    EmiteDocAssoc_f.Show;
  end;

end;

procedure TfrmPrincipal.Clientes2Click(Sender: TObject);
begin
  if assigned(EmiteCliente_f) then
    EmiteCliente_f := nil;

  EmiteCliente_f := TEmiteCliente_f.Create(Self);
  try
    EmiteCliente_f.Show;
  except
    EmiteCliente_f := TEmiteCliente_f.Create(Self);
    EmiteCliente_f.Show;
  end;
end;

procedure TfrmPrincipal.Ligacoes1Click(Sender: TObject);
begin
  if assigned(EmiteLigacoes_f) then
    EmiteLigacoes_f := nil;

  EmiteLigacoes_f := TEmiteLigacoes_f.Create(Self);
  try
    EmiteLigacoes_f.Show;
  except
    EmiteLigacoes_f := TEmiteLigacoes_f.Create(Self);
    EmiteLigacoes_f.Show;
  end;
end;

procedure TfrmPrincipal.AendimentosXLigaes1Click(Sender: TObject);
begin
  if assigned(EmiteAtendLig_f) then
    EmiteAtendLig_f := nil;

  EmiteAtendLig_f := TEmiteAtendLig_f.Create(Self);
  try
    EmiteAtendLig_f.Show;
  except
    EmiteAtendLig_f := TEmiteAtendLig_f.Create(Self);
    EmiteAtendLig_f.Show;
  end;
end;

procedure TfrmPrincipal.DocumentosProtocolosEmitidos1Click(
  Sender: TObject);
begin
  if assigned(EmiteDocumentoProt_f) then
    EmiteDocumentoProt_f := nil;

  EmiteDocumentoProt_f := TEmiteDocumentoProt_f.Create(Self);
  try
    EmiteDocumentoProt_f.Show;
  except
    EmiteDocumentoProt_f := TEmiteDocumentoProt_f.Create(Self);
    EmiteDocumentoProt_f.Show;
  end;
end;

procedure TfrmPrincipal.ConfiguraesdoSistema1Click(Sender: TObject);
begin
  if assigned(CadConfiguracao_f) then
    CadConfiguracao_f := nil;

  CadConfiguracao_f := TCadConfiguracao_f.Create(Self);
  try
    CadConfiguracao_f.Show;
  except
    CadConfiguracao_f := TCadConfiguracao_f.Create(Self);
    CadConfiguracao_f.Show;
  end;
end;


procedure TfrmPrincipal.FormShow(Sender: TObject);
begin
  sgrdPend.Left := self.Width - (sgrdPend.Width + 20);
  sgrdPend.Cells[0,0] := 'Pendência';
  sgrdPend.Cells[1,0] := 'Qtde.';
end;

procedure TfrmPrincipal.MostrarJaneladePendncia1Click(Sender: TObject);
begin
  if MostrarJaneladePendncia1.Checked then
  begin
    MostrarJaneladePendncia1.Checked := False;
    sgrdPend.Visible                 := False;
    GravarIni(caminho+'Atendimento.ini','Identificacao','Janela','NAO');
  end
  else
  begin
    MostrarJaneladePendncia1.Checked := True;
    sgrdPend.Visible                 := True;
    GravarIni(caminho+'Atendimento.ini','Identificacao','Janela','SIM');
  end;
end;

procedure TfrmPrincipal.sgrdPendDrawCell(Sender: TObject; ACol,
  ARow: Integer; Rect: TRect; State: TGridDrawState);
begin
  if ARow = 1 then
    sgrdPend.Canvas.Brush.Color := $0093DFE3;
end;

procedure TfrmPrincipal.MemorandoInterno1Click(Sender: TObject);
begin
  if assigned(CadMemorando_f) then
    CadMemorando_f := nil;

  CadMemorando_f := TCadMemorando_f.Create(Self);
  try
    CadMemorando_f.Show;
  except
    CadMemorando_f := TCadMemorando_f.Create(Self);
    CadMemorando_f.Show;
  end;
end;

procedure TfrmPrincipal.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
begin
  if vMemorandos <> '' then
  begin
    {Imagem}
    with StatusBar1.Canvas do
    begin
      Brush.Color := clRed;
      FillRect(Rect);
      Font.Color := clYellow;
      Font.Size  := 8;
      TextOut(Rect.left + 5, Rect.top, vMemorandos);
    end;
  end
  else
  begin
    with StatusBar1.Canvas do
    begin
      Brush.Color := StatusBar1.Color;
      FillRect(Rect);
      Font.Color := StatusBar1.Font.Color;
      Font.Size  := 8;
      TextOut(Rect.left + 5, Rect.top, vMemorandos);
    end;
  end;
end;

procedure TfrmPrincipal.StatusBar1DblClick(Sender: TObject);
begin
  if assigned(LerMemorando_f) then
    LerMemorando_f := nil;

  LerMemorando_f := TLerMemorando_f.Create(Self);
  try
    LerMemorando_f.Show;
  except
    LerMemorando_f := TLerMemorando_f.Create(Self);
    LerMemorando_f.Show;
  end;
end;

procedure TfrmPrincipal.LeituradeMemorandos1Click(Sender: TObject);
begin
  if assigned(LerMemorando_f) then
    LerMemorando_f := nil;

  LerMemorando_f := TLerMemorando_f.Create(Self);
  try
    LerMemorando_f.Show;
  except
    LerMemorando_f := TLerMemorando_f.Create(Self);
    LerMemorando_f.Show;
  end;
end;

procedure TfrmPrincipal.InformarAniversriosdaSemana1Click(Sender: TObject);
begin
  if InformarAniversriosdaSemana1.Checked then
  begin
    InformarAniversriosdaSemana1.Checked := False;
    GravarIni(caminho+'Atendimento.ini','Identificacao','Aniversario','NAO');
  end
  else
  begin
    InformarAniversriosdaSemana1.Checked := True;
    GravarIni(caminho+'Atendimento.ini','Identificacao','Aniversario','SIM');
  end;
end;

procedure TfrmPrincipal.Aniversarios;
var sStr : String;
    dias1, dias2 : Integer;
begin
  {Mostra Aniversários da Semans}
  qryAux.close;
  qryAux.Sql.Text := 'SELECT * FROM GC_FUNCIONARIO FUN LEFT JOIN GC_DEPARTAMENTO DEP ON (FUN.COD_DEPTO = DEP.COD_DEPTO) '+
                     ' WHERE ATIVO_FUNC <> ''N'' ' +
                     ' ORDER BY APELIDO_FUNC';
  qryAux.Open;
  sStr := '';
  while not qryAux.eof do
  begin
    dias1 := DayOfWeek(date())-1;
    dias2 := 7 - DayOfWeek(date());
    if (formatdatetime('mmdd',qryAux.FieldByName('dt_Nascimento').AsDateTime) <= formatdatetime('mmdd',date() + dias2)) and
       (formatdatetime('mmdd',qryAux.FieldByName('dt_Nascimento').AsDateTime) >= formatdatetime('mmdd',date() - dias1)) then
    begin
      sStr := sStr + qryAux.FieldByName('apelido_func').AsString + ' - ' + formatdatetime('dd/mm',qryAux.FieldByName('dt_Nascimento').AsDateTime) + ' - '+ qryAux.FieldByName('desc_depto').AsString + #13#10;
    end;
    qryAux.next;
  end;
  if sStr <> '' then
  begin
    messagedlg('Aniversáriantes da Semana:'+#13#13#10+sStr,mtInformation,[mbOk],0);
  end;
end;

procedure TfrmPrincipal.AgendadeContatos1Click(Sender: TObject);
begin
  if assigned(EmiteContato_f) then
    EmiteContato_f := nil;

  EmiteContato_f := TEmiteContato_f.Create(Self);
  try
    EmiteContato_f.Show;
  except
    EmiteContato_f := TEmiteContato_f.Create(Self);
    EmiteContato_f.Show;
  end;
end;

procedure TfrmPrincipal.SobreoSistemaAtendimento1Click(Sender: TObject);
begin
  if assigned(Sobre_f) then
    Sobre_f := nil;
  Sobre_f := TSobre_f.Create(Self);
  Sobre_f.ShowModal;
end;

procedure TfrmPrincipal.ImportararquivodeClientes1Click(Sender: TObject);
begin
  if assigned(ImportaCli_f) then
    ImportaCli_f := nil;
  ImportaCli_f := TImportaCli_f.Create(Self);
  ImportaCli_f.Show;
end;

procedure TfrmPrincipal.EtiquetasdeClientesFornecedores1Click(
  Sender: TObject);
begin
  if assigned(ImpEtq_f) then
    ImpEtq_f := nil;
  ImpEtq_f := TImpEtq_f.Create(Self);
  ImpEtq_f.Show;
end;

procedure TfrmPrincipal.rvSystem1Print(Sender: TObject);
begin
  qryFun.close;
  qryFun.open;
  with Sender as TBaseReport do
  begin
    SomaLinha(Sender as TBaseReport);
    while not qryFun.eof do
    begin
      ClearTabs;
      SetPen(clBlack,psClear,1,pmCopy);
      restoretabs(1);
      SetFont('Arial', 8);
      PrintTab( qryFun.FieldByName('ramal_func').AsString );
      PrintTab( qryFun.FieldByName('Apelido_func').AsString );
      PrintTab( qryFun.FieldByName('Nome_func').AsString );
      SomaLinha(Sender as TBaseReport);
      qryFun.Next;
    end;
  end;
end;

procedure TfrmPrincipal.ListagemdeRamais1Click(Sender: TObject);
begin
  rvSystem1.Execute;
end;

procedure TfrmPrincipal.rvSystem1NewPage(Sender: TObject);
begin
  with Sender as TBaseReport do
  begin
    inc(vPag);
    SectionTop := 0.0;
    Underline := false;
    Home;
    YPos := 0.3;
    FontRotation := 0;
    Bold := True;
    SetFont('Arial',6);
    PrintLeft('Uni-K Desenvolvimento de Sistemas', 0.3);
    SetFont('Arial',14);
    SomaLinha(Sender as TBaseReport);
    PrintCenter('Listagem de Ramais', PageWidth / 2);
    SetFont('Arial',10);
    Bold := False;
    PrintRight('Pagina: '+formatfloat('00000',vPag),PageWidth - 0.3);
    SomaLinha(Sender as TBaseReport);
    SomaLinha(Sender as TBaseReport);

    ClearTabs;
    SetPen(clBlack,psClear,1,pmCopy);
    SetTab(2.5,pjLeft,0.5,5,BOXLINEALL,0);
    SetTab(NA,pjLeft,1.5,5,BOXLINEALL,0);
    SetTab(NA,pjLeft,2.5,5,BOXLINEALL,0);
    SaveTabs(1);
    PrintTab('Ramal');
    PrintTab('Apelido');
    PrintTab('Nome Completo');
    SomaLinha(Sender as TBaseReport);
    fLinha(Sender as TBaseReport);
  end;
end;

procedure TfrmPrincipal.rvSystem1BeforePrint(Sender: TObject);
begin
  vPag := 0;
end;

procedure TfrmPrincipal.AberturaAlterao1Click(Sender: TObject);
begin
  if assigned(Ficha_f) then
    Ficha_f := nil;

  Ficha_f := TFicha_f.Create(Self);
  try
    Ficha_f.Width    := 772;
    Ficha_f.Height   := 525;
    Ficha_f.Position := poDesigned;
    Ficha_f.Top      := 10;
    Ficha_f.Left     := 13;
    Ficha_f.Show;
  except
    Ficha_f := TFicha_f.Create(Self);
    Ficha_f.Width    := 772;
    Ficha_f.Height   := 525;
    Ficha_f.Position := poDesigned;
    Ficha_f.Top      := 10;
    Ficha_f.Left     := 13;
    Ficha_f.Show;
  end;
end;

procedure TfrmPrincipal.RegularizaoCancelamentoCertidesOutros1Click(
  Sender: TObject);
begin
  if assigned(Ficha2_f) then
    Ficha2_f := nil;

  Ficha2_f := TFicha2_f.Create(Self);
  try
    Ficha2_f.Width    := 772;
    Ficha2_f.Height   := 525;
    Ficha2_f.Position := poDesigned;
    Ficha2_f.Top      := 10;
    Ficha2_f.Left     := 13;
    Ficha2_f.Show;
  except
    Ficha2_f := TFicha2_f.Create(Self);
    Ficha2_f.Width    := 772;
    Ficha2_f.Height   := 525;
    Ficha2_f.Position := poDesigned;
    Ficha2_f.Top      := 10;
    Ficha2_f.Left     := 13;
    Ficha2_f.Show;
  end;
end;

procedure TfrmPrincipal.Feriados1Click(Sender: TObject);
begin
  if assigned(CadFeriado_f) then
    CadFeriado_f := nil;

  CadFeriado_f := TCadFeriado_f.Create(Self);
  try
    CadFeriado_f.Show;
  except
    CadFeriado_f := TCadFeriado_f.Create(Self);
    CadFeriado_f.Show;
  end;
end;

procedure TfrmPrincipal.GeraAgendadeObrigaes1Click(Sender: TObject);
begin
  if assigned(GeraVencimento_f) then
    GeraVencimento_f := nil;

  GeraVencimento_f := TGeraVencimento_f.Create(Self);
  try
    GeraVencimento_f.Show;
  except
    GeraVencimento_f := TGeraVencimento_f.Create(Self);
    GeraVencimento_f.Show;
  end;
end;

procedure TfrmPrincipal.MostrarAgendaObrigaes1Click(Sender: TObject);
begin
  if MostrarAgendaObrigaes1.Checked then
  begin
    MostrarAgendaObrigaes1.Checked := False;
    GravarIni(caminho+'Atendimento.ini','Identificacao','Obrigacao','NAO');
    Timer2.Enabled := False;
  end
  else
  begin
    MostrarAgendaObrigaes1.Checked := True;
    GravarIni(caminho+'Atendimento.ini','Identificacao','Obrigacao','SIM');
    Timer2.Enabled := True;
  end;
end;

procedure TfrmPrincipal.Assuntos1Click(Sender: TObject);
begin
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

procedure TfrmPrincipal.GerenciamentodasInformaesdoSistema1Click(
  Sender: TObject);
begin
  if assigned(GerenciaOcorrencia_f) then
    GerenciaOcorrencia_f := nil;

  GerenciaOcorrencia_f := TGerenciaOcorrencia_f.Create(Self);
  try
    GerenciaOcorrencia_f.Show;
  except
    GerenciaOcorrencia_f := TGerenciaOcorrencia_f.Create(Self);
    GerenciaOcorrencia_f.Show;
  end;
end;

procedure TfrmPrincipal.Timer2Timer(Sender: TObject);
var sSql : String;
begin
  if not MostrarAgendaObrigaes1.Checked then
  begin
    exit;
  end;
  Timer2.Enabled := False;
  if (obrigacao) and (sistema = 'ATENDIMENTO') then
  begin
    qrDocAssoc_f := TqrDocAssoc_f.Create(nil);
    sSql := 'SELECT * FROM EMISSAO_DOCTO  EMI '+
            ' LEFT  JOIN GC_CLIENTE       CLI ON (EMI.COD_CLIENTE = CLI.COD_CLIENTE) '+
            ' LEFT  JOIN GC_DOCUMENTO     DOC ON (EMI.COD_DOCTO   = DOC.COD_DOCTO)   '+
            ' INNER JOIN GC_DEPARTAMENTO  DEP ON (DOC.COD_DEPTO   = DEP.COD_DEPTO)   '+
            ' LEFT  JOIN gc_obrigacoes    OBR ON (OBR.COD_DOCTO   = EMI.cod_docto AND OBR.COD_CLIENTE = EMI.COD_CLIENTE) ';
    sSql := sSql + ' WHERE EMI.COD_CLIENTE >= 0';
    sSql := sSql + ' AND EMI.COD_DOCTO >= 0'+
    {sSql := sSql + ' AND OBR.DT_VENCTO >= ' + DataSql(date)+}
                   ' AND OBR.DT_VENCTO <= ' + DataSql(date+4);
    sSql := sSql + ' AND OBR.DT_ENVIO IS NULL ';
    sSql := sSql + ' ORDER BY CLI.NOME_CLI, EMI.COD_CLIENTE, OBR.DT_VENCTO, DEP.DESC_DEPTO, DOC.COD_DOCTO';
    qrDocAssoc_f.Query1.Close;
    qrDocAssoc_f.Query1.sql.Text := sSql;
    qrDocAssoc_f.Query1.Open;
    if not qrDocAssoc_f.Query1.eof then
      qrDocAssoc_f.Preview;
    qrDocAssoc_f.Query1.close;
    qrDocAssoc_f.Free;
  end;
  Timer2.Enabled := True;
end;

end.
