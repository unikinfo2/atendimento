unit LigacaoSolicit_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, Menus, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Db,
  DBTables, DBCtrls, RxCalc, funcoes, ComCtrls, dialerPlus;

type
  TLigacaoSolicit_f = class(TDeriva_f)
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    btnBaixa: TBitBtn;
    qryLigacao: TQuery;
    dsLigacao: TDataSource;
    Label1: TLabel;
    memoObs: TMemo;
    btnEspera: TBitBtn;
    qryLigacao2: TQuery;
    AgendamentodeLigao1: TMenuItem;
    Panel1: TPanel;
    Agendamento1: TMenuItem;
    Visita1: TMenuItem;
    qryLigacaoEuRecep: TStringField;
    Timer1: TTimer;
    qryAux: TQuery;
    rgSelect: TRadioGroup;
    qryLigacaoPrioridade: TStringField;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label3: TLabel;
    Label2: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Dialer1: TDialer;
    rgDisca: TRadioGroup;
    btnAtendimento: TBitBtn;
    qryLigacaoCOD_LIGACAO: TIntegerField;
    qryLigacaoCOD_CLIENTE: TIntegerField;
    qryLigacaoCOD_CONTATO: TIntegerField;
    qryLigacaoCOD_FUNC: TIntegerField;
    qryLigacaoCOD_DEPTO: TIntegerField;
    qryLigacaoDESC_LIG: TMemoField;
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
    qryLigacaoOBS_LIG: TMemoField;
    qryLigacaoQUEMFALA: TStringField;
    qryLigacaoTIPO_LIGACAO: TStringField;
    qryLigacaoINFORMADO_LIG: TStringField;
    qryLigacaoPARTICULAR_LIG: TStringField;
    qryLigacaoCOD_ASSUNTO: TIntegerField;
    qryLigacaoNOME_CLI: TStringField;
    qryLigacaoNOME_FUNC: TStringField;
    qryLigacaoRAMAL_FUNC: TStringField;
    qryLigacaoDESC_DEPTO: TStringField;
    qryLigacaoDESC_LIG2: TMemoField;
    qryLigacaodesc_lig3: TStringField;
    procedure FormShow(Sender: TObject);
    procedure qryLigacaoAfterScroll(DataSet: TDataSet);
    procedure btnBaixaClick(Sender: TObject);
    procedure btnEsperaClick(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure AgendamentodeLigao1Click(Sender: TObject);
    procedure Visita1Click(Sender: TObject);
    procedure qryLigacaoCalcFields(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure memoObsEnter(Sender: TObject);
    procedure memoObsExit(Sender: TObject);
    procedure rgSelectClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure btnAtendimentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LigacaoSolicit_f: TLigacaoSolicit_f;

implementation
uses Principal, CadLigacao_u, CadVisita_u, Atendimento_u;

{$R *.DFM}

procedure TLigacaoSolicit_f.FormShow(Sender: TObject);
var sSql:String;
begin
  inherited;
  qryLigacao.close;
  sSql := 'SELECT LIG.*, CLI.NOME_CLI, FUN.NOME_FUNC, FUN.RAMAL_FUNC, DEP.DESC_DEPTO, '+
          ' LIG.DESC_LIG DESC_LIG2 '+
          ' FROM GC_LIGACAO LIG '+
          ' LEFT JOIN GC_CLIENTE CLI ON (LIG.COD_CLIENTE=CLI.COD_CLIENTE) '+
          ' LEFT JOIN GC_FUNCIONARIO FUN ON (LIG.COD_FUNC=FUN.COD_FUNC) '+
          ' LEFT JOIN GC_DEPARTAMENTO DEP ON (LIG.COD_DEPTO=DEP.COD_DEPTO) '+
          ' WHERE LIG.STATUS_LIG IN (''A'',''E'') AND LIG.TIPO_LIGACAO = ''S'' '+
          ' ORDER BY LIG.DT_PEDIDO_LIG ';
  qryLigacao.SQL.Text := sSql;
  qryLigacao.Open;
  timer1.Enabled := true;
end;

procedure TLigacaoSolicit_f.qryLigacaoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  memoObs.Text           := copy(qryLigacao.fieldByName('Obs_Lig').AsString, 1, 250);
  btnAtendimento.Enabled := qryLigacao.FieldByName('Tipo_Ligacao').AsString = 'R';
end;

procedure TLigacaoSolicit_f.btnBaixaClick(Sender: TObject);
begin
  inherited;
  with qryAux do
  begin
    close;
    sql.clear;
    sql.add('SELECT * FROM GC_FUNCIONARIO WHERE NIVEL_FUNC = ''4''');
    open;
    if eof then
    begin
      qryLigacao2.Close;
      qryLigacao2.ParamByName('Cod_Ligacao').AsInteger := qryLigacao.FieldByName('Cod_Ligacao').AsInteger;
      qryLigacao2.Open;
      qryLigacao2.Edit;
      qryLigacao2.FieldByName('Status_Lig').AsString          := 'F';
      qryLigacao2.FieldByName('Dt_Fechamento_lig').AsDateTime := Now();
      qryLigacao2.FieldByName('Obs_Lig').AsString             := memoObs.Text;
      qryLigacao2.Post;
      qryLigacao.Close;
      qryLigacao.Open;
    end
    else
    begin
      close;
      sql.clear;
      sql.add('SELECT * FROM GC_FUNCIONARIO WHERE NIVEL_FUNC = ''4'' AND COD_FUNC=' +inttostr(cod_func));
      open;
      if (eof) and (rgSelect.ItemIndex = 0) then
      begin
        messagedlg('Usuário não possue permissão para baixar ligações.'+#13+'Solicite para a Telefonista.',mtWarning,[mbOk],0);
        exit;
      end
      else
      begin
        qryLigacao2.Close;
        qryLigacao2.ParamByName('Cod_Ligacao').AsInteger := qryLigacao.FieldByName('Cod_Ligacao').AsInteger;
        qryLigacao2.Open;
        if not qryLigacao2.eof then
        begin
          qryLigacao2.Edit;
          qryLigacao2.FieldByName('Status_Lig').AsString          := 'F';
          qryLigacao2.FieldByName('Dt_Fechamento_lig').AsDateTime := Now();
          qryLigacao2.FieldByName('Obs_Lig').AsString             := memoObs.Text;
          qryLigacao2.Post;
        end;
        qryLigacao.Close;
        qryLigacao.Open;
      end;
    end;
  end;

end;

procedure TLigacaoSolicit_f.btnEsperaClick(Sender: TObject);
begin
  inherited;
  if rgSelect.ItemIndex = 0 then
  begin
    qryLigacao2.Close;
    qryLigacao2.ParamByName('Cod_Ligacao').AsInteger := qryLigacao.FieldByName('Cod_Ligacao').AsInteger;
    qryLigacao2.Open;
    qryLigacao2.Edit;
    qryLigacao2.FieldByName('Status_Lig').AsString          := 'E';
    qryLigacao2.FieldByName('Dt_Fechamento_lig').AsDateTime := Now();
    qryLigacao2.FieldByName('Obs_Lig').AsString             := memoObs.Text;
    qryLigacao2.Post;
    qryLigacao.Close;
    qryLigacao.Open;
    qryLigacao.Locate('Cod_Ligacao',qryLigacao2.FieldByName('Cod_Ligacao').AsInteger,[]);
  end
  else
  begin
    messagedlg('Não é possível colocar ligações recebidas em modo de Espera.',mtInformation,[mbOk],0);
    exit;    
  end;
end;

procedure TLigacaoSolicit_f.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var pri_Baixa, pri_Media, pri_Alta : Double;
    vDia, vHora : String;
begin
  inherited;

  try
    DiaHora_dif(vDia,vHora,qryLigacao.FieldByName('Dt_Pedido_lig').AsDateTime, now());
  except
    vDia  := '00';
    vHora := '00';
  end;

  try
    pri_Baixa  := StrToFloat(lerIni(caminho+'Atendimento.ini','Ligacao','Baixa'));
    pri_Media  := StrToFloat(lerIni(caminho+'Atendimento.ini','Ligacao','Media'));
    pri_Alta   := StrToFloat(lerIni(caminho+'Atendimento.ini','Ligacao','Alta'));
  except
    pri_Baixa  := 3;
    pri_Media  := 2;
    pri_Alta   := 1;
  end;

  if qryLigacao.FieldByName('Status_lig').AsString = 'E' then // condição
  begin
    if cor then
      Dbgrid1.Canvas.Brush.Color := $0080FFFF;
    Dbgrid1.Canvas.Font.Color    := clBlack;
  end
  else
  begin
    try
      if ((qryLigacao.FieldByName('Prioridade').AsString = 'Baixa') and (strtoint(copy(vHora,4,2)) > pri_Baixa)) or
         ((qryLigacao.FieldByName('Prioridade').AsString = 'Média') and (strtoint(copy(vHora,4,2)) > pri_Media)) or
         ((qryLigacao.FieldByName('Prioridade').AsString = 'Alta')  and (strtoint(copy(vHora,4,2)) > pri_Alta))  or
         (strtoint(copy(vHora,1,2)) > 0) or
         (strtoint(copy(vDia,1,2)) > 0) then
      begin
        if cor then
          Dbgrid1.Canvas.Brush.Color := $00CBD0FE;
        Dbgrid1.Canvas.Font.Color    := clRed;
      end
      else
      begin
        if cor then
          Dbgrid1.Canvas.Brush.Color := $00F4FAFF;
        Dbgrid1.Canvas.Font.Color    := clBlack;
      end;
    except
      if cor then
        Dbgrid1.Canvas.Brush.Color := $00F4FAFF;
      Dbgrid1.Canvas.Font.Color    := clBlack;
    end;
  end;
  Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
end;

procedure TLigacaoSolicit_f.AgendamentodeLigao1Click(Sender: TObject);
begin
  inherited;
  if assigned(CadLigacao_f) then
    CadLigacao_f := nil;

  CadLigacao_f := TCadLigacao_f.Create(application.MainForm);
  try
    CadLigacao_f.WindowState := wsNormal;
    CadLigacao_f.Show;
  except
    CadLigacao_f := TCadLigacao_f.Create(application.MainForm);
    CadLigacao_f.Show;
  end;
end;

procedure TLigacaoSolicit_f.Visita1Click(Sender: TObject);
begin
  inherited;
  if assigned(CadVisita_f) then
    CadVisita_f := nil;

  CadVisita_f := TCadVisita_f.Create(application.MainForm);
  try
    CadVisita_f.WindowState := wsNormal;
    CadVisita_f.Show;
  except
    CadVisita_f := TCadVisita_f.Create(application.MainForm);
    CadVisita_f.Show;
  end;
end;

procedure TLigacaoSolicit_f.qryLigacaoCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qryLigacao.FieldByName('quemfala').AsString = 'E' then
    qryLigacao.FieldByName('EuRecep').AsString := 'Eu'
  else
    qryLigacao.FieldByName('EuRecep').AsString := 'Recepcionista';

  if qryLigacao.FieldByName('prioridade_lig').AsString = 'B' then
    qryLigacao.FieldByName('Prioridade').AsString := 'Baixa'
  else if qryLigacao.FieldByName('prioridade_lig').AsString = 'M' then
    qryLigacao.FieldByName('Prioridade').AsString := 'Média'
  else if qryLigacao.FieldByName('prioridade_lig').AsString = 'A' then
    qryLigacao.FieldByName('Prioridade').AsString := 'Alta';

  qryLigacao.FieldByName('desc_lig3').AsString := copy(qryLigacao.FieldByName('desc_lig2').AsString,1,250);
end;

procedure TLigacaoSolicit_f.Timer1Timer(Sender: TObject);
begin
  inherited;
  qryLigacao.Close;
  qryLigacao.Open;
end;

procedure TLigacaoSolicit_f.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  timer1.Enabled := False;
end;

procedure TLigacaoSolicit_f.memoObsEnter(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := False;
end;

procedure TLigacaoSolicit_f.memoObsExit(Sender: TObject);
begin
  inherited;
  Timer1.Enabled := True;
end;

procedure TLigacaoSolicit_f.rgSelectClick(Sender: TObject);
var sSql : String;
begin
  inherited;
  if rgSelect.ItemIndex = 0 then
  begin
    qryLigacao.close;
    sSql := 'SELECT LIG.*, CLI.NOME_CLI, FUN.NOME_FUNC, FUN.RAMAL_FUNC, DEP.DESC_DEPTO, '+
            ' LIG.DESC_LIG DESC_LIG2 '+
            ' FROM GC_LIGACAO LIG '+
            ' LEFT JOIN GC_CLIENTE CLI ON (LIG.COD_CLIENTE=CLI.COD_CLIENTE) '+
            ' LEFT JOIN GC_FUNCIONARIO FUN ON (LIG.COD_FUNC=FUN.COD_FUNC) '+
            ' LEFT JOIN GC_DEPARTAMENTO DEP ON (LIG.COD_DEPTO=DEP.COD_DEPTO) '+
            ' WHERE LIG.STATUS_LIG IN (''A'',''E'') AND LIG.TIPO_LIGACAO = ''S'' '+
            ' ORDER BY LIG.DT_PEDIDO_LIG ';
    qryLigacao.SQL.Text := sSql;
    qryLigacao.Open;
  end
  else
  begin
    qryLigacao.close;
    sSql := 'SELECT LIG.*, CLI.NOME_CLI, FUN.NOME_FUNC, FUN.RAMAL_FUNC, DEP.DESC_DEPTO, '+
            ' LIG.DESC_LIG DESC_LIG2 '+
            ' FROM GC_LIGACAO LIG '+
            ' LEFT JOIN GC_CLIENTE CLI ON (LIG.COD_CLIENTE=CLI.COD_CLIENTE) '+
            ' LEFT JOIN GC_FUNCIONARIO FUN ON (LIG.COD_FUNC=FUN.COD_FUNC) '+
            ' LEFT JOIN GC_DEPARTAMENTO DEP ON (LIG.COD_DEPTO=DEP.COD_DEPTO) '+
            ' WHERE LIG.STATUS_LIG IN (''A'',''E'') AND LIG.TIPO_LIGACAO = ''R'' AND COD_FUNC = '+ inttostr(Cod_func) +
            ' ORDER BY LIG.DT_PEDIDO_LIG ';
    qryLigacao.SQL.Text := sSql;
    qryLigacao.Open;
  end;

end;

procedure TLigacaoSolicit_f.FormCreate(Sender: TObject);
var pri_Baixa, pri_Media, pri_Alta : Double;
begin
  inherited;
  try
    pri_Baixa  := StrToFloat(lerIni(caminho+'Atendimento.ini','Ligacao','Baixa'));
    pri_Media  := StrToFloat(lerIni(caminho+'Atendimento.ini','Ligacao','Media'));
    pri_Alta   := StrToFloat(lerIni(caminho+'Atendimento.ini','Ligacao','Alta'));
  except
    pri_Baixa  := 3;
    pri_Media  := 2;
    pri_Alta   := 1;
    {MessageDlg('Não existe tempo definido para as prioridades das ligações verifique as configurações.',mtError,[mbOk],0);
    close;}
  end;
end;

procedure TLigacaoSolicit_f.DBGrid1DblClick(Sender: TObject);
var ddd : String;
    tel : String;
begin
  inherited;
  try
    dialer1.DialCommand  := lerini(caminho+'Atendimento.ini','DISCAGEM','COMANDO');
    case strtoint(lerini(caminho+'Atendimento.ini','DISCAGEM','PORTA')) of
      1 : dialer1.ComPort  := dpCOM1;
      2 : dialer1.ComPort  := dpCOM2;
      3 : dialer1.ComPort  := dpCOM3;
      4 : dialer1.ComPort  := dpCOM4;
    end;

    Tel := inttostr(rgDisca.ItemIndex+1);

    ddd := trim(copy(qryLigacao.FieldByName('fone'+tel).AsString,2,4));
    if ddd = '' then
      ddd := '011'
    else
      ddd := formatfloat('000',strtoint(ddd));

    if ddd <> '011' then
      ddd := lerini(caminho+'Atendimento.ini','DISCAGEM','OPERADORA') + copy(ddd,2,2)
    else
      ddd := '';
    dialer1.NumberToDial := ddd +
                            trim(copy(qryLigacao.FieldByName('fone'+tel).AsString,7,4))+
                            trim(copy(qryLigacao.FieldByName('fone'+tel).AsString,12,4));
    dialer1.Execute;
  except
  end;
end;

procedure TLigacaoSolicit_f.btnAtendimentoClick(Sender: TObject);
var Baixa : Boolean;
    vTipo : String;
begin
  inherited;
  Baixa := messagedlg('Deseja que esta ligação seja baixada ?',mtConfirmation,[mbYes, mbNo],0) = idYes;

  if qryLigacao.FieldByName('Tipo_Ligacao').AsString = 'S' then
    vTipo := 'Solicitada'
  else
    vTipo := 'Recebida';

  if assigned(Atendimento_f) then
    Atendimento_f := nil;

  Atendimento_f := TAtendimento_f.Create(Self);
  try
    Atendimento_f.Width    := frmPrincipal.Width  - 20;
    Atendimento_f.Height   := frmPrincipal.Height - 80;
    Atendimento_f.Position := poDesigned;
    Atendimento_f.Top      := 3;
    Atendimento_f.Left     := 3;
    Atendimento_f.BitBtn1.Click;
    Atendimento_f.chkMeuDepto.Checked := False;
    Atendimento_f.qryAtendimento.FieldByName('Cod_Func').AsInteger       := qryLigacao.FieldByName('Cod_Func').AsInteger;
    Atendimento_f.qryAtendimento.Fieldbyname('Cod_Depto').AsInteger      := qryLigacao.FieldByName('Cod_Depto').AsInteger;
    Atendimento_f.qryAtendimento.Fieldbyname('Cod_Cliente').AsInteger    := qryLigacao.FieldByName('Cod_Cliente').AsInteger;
    if trim(memoObs.Lines.Text) <> '' then
      Atendimento_f.qryAtendimento.Fieldbyname('Descricao_Atend').AsString := 'Atendimento originado da Ligação '+vTipo+' Nº: ' +
                                                                              formatfloat('00000', qryLigacao.FieldByName('Cod_Ligacao').AsInteger) + #13#10 +
                                                                              'Data da Ligação: '+ formatdatetime('dd/mm/yyyy hh:nn', qryLigacao.FieldByName('dt_pedido_lig').AsDateTime) + #13#10 +
                                                                              memoObs.Lines.Text
    else
      Atendimento_f.qryAtendimento.Fieldbyname('Descricao_Atend').AsString := 'Atendimento originado da Ligação '+vTipo+' Nº: ' +
                                                                              formatfloat('00000', qryLigacao.FieldByName('Cod_Ligacao').AsInteger) + #13#10 +
                                                                              'Data da Ligação: '+ formatdatetime('dd/mm/yyyy hh:nn', qryLigacao.FieldByName('dt_pedido_lig').AsDateTime) + #13#10 +
                                                                              qryLigacao.FieldByName('Desc_Lig').AsString;

    Atendimento_f.medCliente.Text := qryLigacao.FieldByName('Cod_Cliente').AsString;
    Atendimento_f.edtCodigo.Text  := qryLigacao.FieldByName('Cod_Func').AsString;
    Atendimento_f.edtFunc.Text    := qryLigacao.FieldByName('Contato').AsString;
    Atendimento_f.edtCodigoExit(Sender);
    Atendimento_f.medClienteExit(Sender);
    {Atendimento_f.medAtendimentoExit(self);}
  except
  end;

  if baixa then
  begin
    with qryAux do
    begin
      close;
      sql.clear;
      sql.add('SELECT * FROM GC_FUNCIONARIO WHERE NIVEL_FUNC = ''4''');
      open;
      if not eof then
      begin
        close;
        sql.clear;
        sql.add('SELECT * FROM GC_FUNCIONARIO WHERE NIVEL_FUNC = ''4'' AND COD_FUNC=' +inttostr(cod_func));
        open;
        if (eof) and (rgSelect.ItemIndex = 0) then
        begin
          messagedlg('Usuário não possue permissão para baixar ligações.'+#13+'Solicite para a Telefonista.',mtWarning,[mbOk],0);
        end
        else
        begin
          btnBaixa.Click;
        end;
      end;
    end;
  end;

end;

end.
