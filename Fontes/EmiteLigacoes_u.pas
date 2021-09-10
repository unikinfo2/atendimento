unit EmiteLigacoes_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, RxCalc, Menus, StdCtrls, Buttons, Mask, Db, DBTables, ExtCtrls,
  ToolEdit, DBCtrls, RpDefine, RpBase, RpSystem, rpMemo;

type
  TEmiteLigacoes_f = class(TDeriva_f)
    BitBtn1: TBitBtn;
    medCliente: TMaskEdit;
    Label1: TLabel;
    sbPesq: TSpeedButton;
    edtNomeCli: TEdit;
    Label2: TLabel;
    qryAux: TQuery;
    qryDocto: TQuery;
    rgFiltro: TRadioGroup;
    edtCodigo: TEdit;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    edtFunc: TEdit;
    Label5: TLabel;
    dtDe: TDateEdit;
    Label3: TLabel;
    Label4: TLabel;
    dtAte: TDateEdit;
    medContato: TMaskEdit;
    Label14: TLabel;
    sbContato: TSpeedButton;
    edtNomeContato: TEdit;
    Label15: TLabel;
    Label7: TLabel;
    rgLigacao: TRadioGroup;
    rgLig: TRadioGroup;
    RvSystem1: TRvSystem;
    chkRelato: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure sbPesqClick(Sender: TObject);
    procedure medClienteExit(Sender: TObject);
    procedure edtCodDoctoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure sbContatoClick(Sender: TObject);
    procedure medContatoExit(Sender: TObject);
    procedure RvSystem1NewPage(Sender: TObject);
    procedure RvSystem1Print(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    vPag : Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmiteLigacoes_f: TEmiteLigacoes_f;

implementation

uses Atendimento_dm, principal, qrLigacao_u, funcoes;

{$R *.DFM}

procedure TEmiteLigacoes_f.BitBtn1Click(Sender: TObject);
var sSql : String;
begin
  inherited;
  vPag := 0;
  sSql := 'SELECT * FROM GC_LIGACAO LIG '+
          ' LEFT  JOIN GC_CLIENTE       CLI ON (LIG.COD_CLIENTE = CLI.COD_CLIENTE) '+
          ' LEFT  JOIN GC_AGENDA        AGE ON (LIG.COD_CONTATO = AGE.COD_CONTATO) '+
          ' LEFT  JOIN GC_FUNCIONARIO   FUN ON (LIG.COD_FUNC    = FUN.COD_FUNC) '+
          ' INNER JOIN GC_DEPARTAMENTO  DEP ON (LIG.COD_DEPTO   = DEP.COD_DEPTO) '+
          ' WHERE LIG.COD_LIGACAO > 0 ';
  if medCliente.text <> '' then
    sSql := sSql + ' AND LIG.COD_CLIENTE = ' + medCliente.text;

  if medContato.text <> '' then
    sSql := sSql + ' AND LIG.COD_CONTATO = ' + medContato.text;

  if edtCodigo.text <> '' then
    sSql := sSql + ' AND LIG.COD_FUNC = ' + edtCodigo.text;

  if dtDe.text <> '  /  /    ' then
    sSql := sSql + ' AND LIG.DT_PEDIDO_LIG >= :DATA1';

  if dtAte.text <> '  /  /    ' then
    sSql := sSql + ' AND LIG.DT_PEDIDO_LIG <= :DATA2';

  if rgLig.ItemIndex = 0 then sSql := sSql + ' AND LIG.COD_CLIENTE IS NULL AND LIG.PARTICULAR_LIG = ''P'' ';

  if rgFiltro.ItemIndex = 1 then sSql := sSql + ' AND LIG.STATUS_LIG = ''A''';
  if rgFiltro.ItemIndex = 2 then sSql := sSql + ' AND LIG.STATUS_LIG = ''F''';
  if rgFiltro.ItemIndex = 3 then sSql := sSql + ' AND LIG.STATUS_LIG = ''E''';

  if rgLigacao.ItemIndex = 1 then sSql := sSql + ' AND LIG.TIPO_LIGACAO = ''S''';
  if rgLigacao.ItemIndex = 2 then sSql := sSql + ' AND LIG.TIPO_LIGACAO = ''R''';

  sSql := sSql + ' ORDER BY LIG.COD_CLIENTE, LIG.COD_DEPTO, LIG.DT_PEDIDO_LIG DESC, LIG.COD_CONTATO, LIG.COD_FUNC_CAD';

  qryAux.close;
  qryAux.Sql.Text := sSql;
  qryAux.ParamByName('Data1').AsDateTime := StrToDAteTime(formatdatetime('dd/mm/yyyy',dtDe.Date)+'00:00:00');
  qryAux.ParamByName('Data2').AsDateTime := dtAte.Date + 0.99958;
  qryAux.open;
  rvSystem1.Execute;

end;

procedure TEmiteLigacoes_f.sbPesqClick(Sender: TObject);
begin
  inherited;
  dmPesq.PesCliente.StringSql.Clear;
  dmPesq.PesCliente.StringSql.Add('SELECT * FROM GC_CLIENTE ');
  dmPesq.PesCliente.StringSql.Add(' ORDER BY NOME_CLI');
  dmPesq.PesCliente.Execute;
  medCliente.Clear;
  edtNomeCli.Clear;

  medContato.Clear;
  edtNomeContato.Clear;

  medCliente.Text := dmPesq.PesCliente.ValoresRetorno[0];
  edtNomeCli.Text := dmPesq.PesCliente.ValoresRetorno[2];
end;

procedure TEmiteLigacoes_f.medClienteExit(Sender: TObject);
begin
  inherited;
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
    medCliente.Clear;
    edtNomeCli.Clear;
    medContato.Clear;
    edtNomeContato.Clear;
    medCliente.Text  := qryAux.FieldByName('Cod_Cliente').AsString;
    edtNomeCli.Text  := qryAux.FieldByName('Nome_cli').AsString;
  end;
end;

procedure TEmiteLigacoes_f.edtCodDoctoExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
end;

procedure TEmiteLigacoes_f.SpeedButton1Click(Sender: TObject);
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

procedure TEmiteLigacoes_f.edtCodigoExit(Sender: TObject);
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
  end;
end;

procedure TEmiteLigacoes_f.sbContatoClick(Sender: TObject);
begin
  inherited;
  dmPesq.PesAgenda.Execute;
  if dmPesq.PesAgenda.ValoresRetorno[0] <> '' then
  begin
    medCliente.Clear;
    edtNomeCli.Clear;
    medContato.Clear;
    edtNomeContato.Clear;
    medContato.Text     := dmPesq.PesAgenda.ValoresRetorno[0];
    edtNomeContato.Text := dmPesq.PesAgenda.ValoresRetorno[1];
  end;
end;

procedure TEmiteLigacoes_f.medContatoExit(Sender: TObject);
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
    medCliente.Clear;
    edtNomeCli.Clear;
    medContato.Clear;
    edtNomeContato.Clear;
    medContato.Text      := qryAux.FieldByName('Cod_Contato').AsString;
    edtNomeContato.Text  := qryAux.FieldByName('Nome_Contato').AsString;
  end
  else
  begin
    medContato.Clear;
    edtNomeContato.Clear;
  end;
end;

procedure TEmiteLigacoes_f.RvSystem1NewPage(Sender: TObject);
begin
  inherited;
  inc(vPag);
  with Sender as TBaseReport do
  begin
    SectionTop := 0.0;
    SetFont('Arial',8);
    Underline := false;
    Home;
    YPos := 0.3;
    FontRotation := 0;
    Bold := True;
    PrintLeft('Uni-K Desenvolvimento de Sistemas S/C Ltda.', 0.3); {,PageWidth / 2}
    SetFont('Arial',10);
    Bold := False;
    PrintRight('Pagina: '+formatfloat('00000',vPag),PageWidth - 0.3); {,PageWidth / 2}
    SomaLinha(Sender as TBaseReport);
    fLinha(Sender as TBaseReport, 3);

    SetFont('Arial',10);
    SomaLinha(Sender as TBaseReport);
    SetFont('Arial',16);
    Bold := True;
    PrintCenter(LerIni(caminho+'Atendimento.ini','CIDADE','CLIENTE'),PageWidth / 2); {,PageWidth / 2}
    SomaLinha(Sender as TBaseReport);
    PrintCenter('Relatório das Ligações',PageWidth / 2); 
    SetFont('Arial',10);
    SomaLinha(Sender as TBaseReport);
    PrintLeft('Período de ' + dtDe.Text + ' até ' + dtAte.Text, 0.3); {,PageWidth / 2}
    SomaLinha(Sender as TBaseReport);
    SomaLinha(Sender as TBaseReport);

    SetFont('Arial',8);
    Bold := true;

    ClearTabs;
    SetPen(clBlack,psClear,1,pmCopy);
    SetTab(0.3,pjLeft,0.4,1,BOXLINEALL,0);
    SetTab(NA,pjLeft,1.0,1,BOXLINEALL,0);
    SetTab(NA,pjCenter,0.6,1,BOXLINEALL,0);

    SetTab(NA,pjLeft,0.9,1,BOXLINEALL,0);
    SetTab(NA,pjLeft,0.9,1,BOXLINEALL,0);
    SetTab(NA,pjLeft,0.9,1,BOXLINEALL,0);

    SetTab(NA,pjLeft,0.8,1,BOXLINEALL,0);
    SetTab(NA,pjCenter,0.6,1,BOXLINEALL,0);
    SetTab(NA,pjLeft,0.8,1,BOXLINEALL,0);
    SetTab(NA,pjLeft,0.7,1,BOXLINEALL,0);
    SaveTabs(1);

    printTab('Cod.Ligação');
    printTab('Contato');
    printTab('Dt.Ligação');
    printTab('Fone 1');
    printTab('Fone 2');
    printTab('Fone 3');
    printTab('Status');
    printTab('Dt.Fechamento');
    printTab('Func.');
    printTab('Quem Fala');
    Bold := False;

    SomaLinha(Sender as TBaseReport);
    fLinha(Sender as TBaseReport);
    SomaLinha(Sender as TBaseReport);
    SetFont('Arial',7);

  end;
end;

procedure TEmiteLigacoes_f.RvSystem1Print(Sender: TObject);
var vTotal                : Integer;
    vValor                : Double;
    vTotMens              : Double;
    xLinha                : Double;
    vIncide               : String;
    vTipo, vStatus, vQuem : String;
    MemoBuf, MemoBuf2     : TMemoBuf;
    vCli, vTot            : Integer;
begin
  inherited;
  with Sender as TBaseReport do
  begin
    qryAux.First;
    vTot     := 0;
    vTotal   := 0;
    vTotMens := 0;
    while not qryAux.Eof do
    begin
      vCli     := qryAux.FieldByName('cod_cliente').AsInteger;
      SetFont('Arial',7);
      Bold := True;
      printLeft('Cliente: ',0.3);
      Bold := False;
      printLeft(formatfloat('00000', qryAux.fieldbyname('cod_cliente').AsInteger)+'-'+qryAux.fieldbyname('nome_cli').AsString,1.0);
      SomaLinha(Sender as TBaseReport);
      while (not qryAux.Eof) and (vCli = qryAux.FieldByName('cod_cliente').AsInteger) do
      begin
        vStatus := '';
        if qryAux.FieldByName('status_lig').AsString = 'A' then
          vStatus := 'Aberto'
        else if qryAux.FieldByName('status_lig').AsString = 'F' then
          vStatus := 'Fechado'
        else if qryAux.FieldByName('status_lig').AsString = 'E' then
          vStatus := 'Espera';

        if qryAux.FieldByName('tipo_ligacao').AsString = 'S' then
          vStatus := vStatus + '/Solicitada'
        else if qryAux.FieldByName('tipo_ligacao').AsString = 'R' then
          vStatus := vStatus + '/Recebida';

        if qryAux.FieldByName('quemfala').AsString = 'E' then
          vQuem := 'Requisitante'
        else
          vQuem := 'Recepcionista';

        SetFont('Arial',7);
        {Tabulação dos Detalhes}
        ClearTabs;
        SetPen(clBlack,psClear,1,pmCopy);
        RestoreTabs(1);

        printTab(formatfloat('00000', qryAux.fieldbyname('cod_ligacao').AsInteger));
        printTab(qryAux.fieldbyname('contato').AsString);
        printTab(formatdatetime('dd/mm/yyyy',qryAux.fieldbyname('dt_pedido_lig').AsDateTime));

        printTab(qryAux.fieldbyname('fone1').AsString);
        printTab(qryAux.fieldbyname('fone2').AsString);
        printTab(qryAux.fieldbyname('Fone3').AsString);

        printTab(vStatus);
        if not qryAux.fieldbyname('dt_fechamento_lig').IsNull then
          printTab(formatdatetime('dd/mm/yyyy',qryAux.fieldbyname('dt_fechamento_lig').AsDateTime))
        else
          printTab('');
        printTab(qryAux.fieldbyname('apelido_func').AsString);
        printTab(vQuem);
        SomaLinha(Sender as TBaseReport);
        if chkRelato.Checked then
        begin
          Bold := True;
          printLeft('Relato da Ligação',0.3);
          printLeft('Obs. da Baixa',4.1);
          Bold := False;
          SomaLinha(Sender as TBaseReport);

          xLinha := LineMiddle;
          MemoBuf            := TMemoBuf.Create;
          MemoBuf.Text       := qryAux.fieldbyname('desc_lig').AsString;
          MemoBuf.PrintStart := 0.3;
          MemoBuf.PrintEnd   := 4.0;
          MemoBuf.BaseReport := (sender as TBaseReport);
          MemoBuf.PrintLines(0,true);

          GotoXY(0, xLinha);
          MemoBuf2            := TMemoBuf.Create;
          MemoBuf2.Text       := qryAux.fieldbyname('obs_lig').AsString;
          MemoBuf2.PrintStart := 4.1;
          MemoBuf2.PrintEnd   := 7.0;
          MemoBuf2.BaseReport := (sender as TBaseReport);
          MemoBuf2.PrintLines(0,true);

          ClearColumns;
          MemoBuf.Free;
          MemoBuf2.Free;
          SomaLinha(Sender as TBaseReport);
        end;

        inc(vTot);
        inc(vTotal);
        qryAux.Next;
        if (qryAux.FieldByName('cod_cliente').AsInteger <> vCli) or (qryAux.Eof) then
        begin
          Bold := True;
          printLeft('Total do Cliente: ' + formatfloat('######0',vTot), 0.30);
          Bold := False;
          vTot := 0;
          SomaLinha(Sender as TBaseReport);
          fLinha(Sender as TBaseReport);
          SomaLinha(Sender as TBaseReport);
        end;
      end;
    end;

    Bold := True;
    printLeft('Total de Atendimentos:   ' + formatfloat('######0',vTotal), 0.30);
    Bold := False;

    SomaLinha(Sender as TBaseReport);
    fLinha(Sender as TBaseReport, 3);
    SomaLinha(Sender as TBaseReport);
  end;
end;

procedure TEmiteLigacoes_f.FormCreate(Sender: TObject);
begin
  inherited;
  dtDe.Date  := StrToDateTime('01/'+formatdatetime('mm/yyyy',date));
  dtAte.Date := ultimoDia(dtDe.Date);
end;

end.
