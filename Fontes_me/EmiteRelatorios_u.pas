unit EmiteRelatorios_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, RxCalc, Menus, StdCtrls, Buttons, Mask, Db, DBTables, ExtCtrls,
  ToolEdit, DBCtrls, funcoes, RpDefine, RpBase, RpSystem, rpMemo;

type
  TEmiteRelatorios_f = class(TDeriva_f)
    BitBtn1: TBitBtn;
    medCliente: TMaskEdit;
    Label1: TLabel;
    sbPesq: TSpeedButton;
    edtNomeCli: TEdit;
    Label2: TLabel;
    Label22: TLabel;
    cbTipo: TComboBox;
    qryAux: TQuery;
    rgSituacao: TRadioGroup;
    Label3: TLabel;
    Label4: TLabel;
    dtAte: TDateEdit;
    dtDe: TDateEdit;
    edtCodigo: TEdit;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    edtFunc: TEdit;
    Label5: TLabel;
    cbDepto: TDBLookupComboBox;
    Label15: TLabel;
    Query1: TQuery;
    DataSource1: TDataSource;
    medAtend1: TMaskEdit;
    medAtend2: TMaskEdit;
    Label7: TLabel;
    Label8: TLabel;
    RvSystem1: TRvSystem;
    qryOcorrencia: TQuery;
    rgOrdem: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure sbPesqClick(Sender: TObject);
    procedure medClienteExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure RvSystem1NewPage(Sender: TObject);
    procedure RvSystem1Print(Sender: TObject);
  private
    vPag : Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmiteRelatorios_f: TEmiteRelatorios_f;

implementation

uses qrDocEmitido, Atendimento_dm, principal;

{$R *.DFM}

procedure TEmiteRelatorios_f.BitBtn1Click(Sender: TObject);
var sSql, dtIni, dtFin : String;
begin
  inherited;
  sSql := 'SELECT * FROM GC_ATENDIMENTO ATE '+
          ' LEFT JOIN GC_DOCUMENTO    DOC ON (DOC.COD_DOCTO = ATE.COD_DOCTO) '+
          ' LEFT JOIN GC_DEPARTAMENTO DEP ON (DEP.COD_DEPTO = ATE.COD_DEPTO) '+
          ' LEFT JOIN GC_FUNCIONARIO  FUN ON (FUN.COD_FUNC = ATE.COD_FUNC)   '+
          ' LEFT JOIN GC_CLIENTE      CLI ON (CLI.COD_CLIENTE = ATE.COD_CLIENTE) ';
  if medCliente.text <> '' then
    sSql := sSql + ' WHERE COD_CLIENTE = ' + medCliente.text
  else
    sSql := sSql + ' WHERE COD_CLIENTE >= 0';

  if (dtDe.Text <> '  /  /    ') and (dtAte.Text <> '  /  /    ') then
  begin
    dtini  := formatDateTime('mm/dd/yyyy',StrToDateTime(dtDe.Text))  + ' 00:00:00';
    dtFin  := formatDateTime('mm/dd/yyyy',StrToDateTime(dtAte.Text)) + ' 23:59:59';
    sSql := sSql +   ' and ATE.DT_ATEND >= cast( '''+ dtIni + ''' as timestamp) ';
    sSql := sSql +   ' and ATE.DT_ATEND <= cast( '''+ dtfin + ''' as timestamp) ';
  end;

  if edtCodigo.Text <> '' then
  begin
    sSql := sSql + ' AND ATE.COD_FUNC = ' + edtCodigo.Text;
  end;

  if cbDepto.Text <> '' then
  begin
    sSql := sSql + ' AND ATE.COD_DEPTO = ' + query1.fieldbyname('Cod_Depto').AsString;
  end;

  if cbTipo.itemindex <= 5 then
  begin
    sSql := sSql + ' AND ATE.TIPO_ATEND = ''' + IntToStr(cbTipo.itemindex) + '''' ;
  end;
  if rgSituacao.itemindex = 3 then
    sSql := sSql + ' AND ATE.STATUS_ATEND = ''E''';
  if rgSituacao.itemindex = 2 then
    sSql := sSql + ' AND ATE.STATUS_ATEND = ''C''';
  if rgSituacao.itemindex = 1 then
    sSql := sSql + ' AND ATE.STATUS_ATEND = ''F''';
  if rgSituacao.itemindex = 0 then
    sSql := sSql + ' AND ATE.STATUS_ATEND = ''A''';

  if medAtend1.Text <> '' then
    sSql := sSql + ' AND ATE.COD_ATENDIMENTO >= ' + medAtend1.Text;

  if medAtend2.Text <> '' then
    sSql := sSql + ' AND ATE.COD_ATENDIMENTO <= ' + medAtend2.Text;

  if rgOrdem.ItemIndex = 0 then
  begin
    sSql := sSql + ' ORDER BY ATE.COD_CLIENTE, ATE.TIPO_ATEND, ATE.DT_ATEND DESC, ATE.COD_DEPTO, ATE.COD_DOCTO ';
  end
  else if rgOrdem.ItemIndex = 1 then
  begin
    sSql := sSql + ' ORDER BY CLI.NOME_CLI, ATE.TIPO_ATEND, ATE.DT_ATEND DESC, ATE.COD_DEPTO, ATE.COD_DOCTO ';
  end
  else if rgOrdem.ItemIndex = 2 then
  begin
    sSql := sSql + ' ORDER BY ATE.DT_ATEND DESC, CLI.NOME_CLI, ATE.TIPO_ATEND, ATE.COD_DEPTO, ATE.COD_DOCTO ';
  end;

  qryAux.Close;
  qryAux.sql.Text := sSql;
  qryAux.Open;
  rvSystem1.Execute;
end;

procedure TEmiteRelatorios_f.sbPesqClick(Sender: TObject);
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

procedure TEmiteRelatorios_f.medClienteExit(Sender: TObject);
begin
  inherited;
  edtNomeCli.Clear;
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
  end;
end;

procedure TEmiteRelatorios_f.FormShow(Sender: TObject);
begin
  inherited;
  cbTipo.ItemIndex := 6;
  dtDe.Date  := Date() - StrToInt(LerIni(caminho+'Atendimento.ini','Identificacao','Historico'));
  dtAte.Date := Date();
  query1.close;
  query1.open;
end;

procedure TEmiteRelatorios_f.SpeedButton1Click(Sender: TObject);
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

procedure TEmiteRelatorios_f.edtCodigoExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
  edtFunc.Clear;
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

procedure TEmiteRelatorios_f.RvSystem1NewPage(Sender: TObject);
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
    PrintCenter('Atendimentos Efetuados ',PageWidth / 2); {,PageWidth / 2}
    SetFont('Arial',10);
    SomaLinha(Sender as TBaseReport);
    PrintLeft('Período de ' + dtDe.Text + ' até ' + dtAte.Text, 0.3); {,PageWidth / 2}
    SomaLinha(Sender as TBaseReport);
    SomaLinha(Sender as TBaseReport);

    SetFont('Arial',9);
    Bold := true;

    ClearTabs;
    SetPen(clBlack,psClear,1,pmCopy);
    SetTab(0.3,pjLeft,0.5,2,BOXLINEALL,0);
    SetTab(NA,pjLeft,1.0,2,BOXLINEALL,0);
    SetTab(NA,pjLeft,0.8,2,BOXLINEALL,0);
    SetTab(NA,pjCenter,0.5,2,BOXLINEALL,0);
    SetTab(NA,pjRight,0.6,2,BOXLINEALL,0);
    SaveTabs(1);

    printTab('Atend.');
    printTab('Contato');
    printTab('Dt.Atendimento');
    printTab('Status');
    printTab('Depto');
    Bold := False;

    SomaLinha(Sender as TBaseReport);
    fLinha(Sender as TBaseReport, 3);
    SomaLinha(Sender as TBaseReport);
    SetFont('Arial',8);

  end;
end;

procedure TEmiteRelatorios_f.RvSystem1Print(Sender: TObject);
var vTotal : Integer;
    vValor : Double;
    vTotMens : Double;
    vIncide        : String;
    vTipo, vStatus : String;
    MemoBuf        : TMemoBuf;
    vCli, vTot     : Integer;
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
      if qryAux.FieldByName('tipo_atend').AsString = '0' then
        vTipo := 'Normal'
      else if qryAux.FieldByName('tipo_atend').AsString = '1' then
        vTipo := 'Com O.S.'
      else if qryAux.FieldByName('tipo_atend').AsString = '2' then
        vTipo := 'Solicitação'
      else if qryAux.FieldByName('tipo_atend').AsString = '3' then
        vTipo := 'Reenvio'
      else if qryAux.FieldByName('tipo_atend').AsString = '4' then
        vTipo := 'Recalculo'
      else if qryAux.FieldByName('tipo_atend').AsString = '5' then
        vTipo := 'Reclamação'
      else if qryAux.FieldByName('tipo_atend').AsString = '6' then
        vTipo := 'Observação'
      else
        vTipo := 'Outros';

      if qryAux.FieldByName('status_atend').AsString = 'A' then
        vStatus := 'Aberto'
      else if qryAux.FieldByName('status_atend').AsString = 'F' then
        vStatus := 'Fechado'
      else if qryAux.FieldByName('status_atend').AsString = 'C' then
        vStatus := 'Cancelado'
      else if qryAux.FieldByName('status_atend').AsString = 'E' then
        vStatus := 'Espera';

      SetFont('Arial',8);
      Bold := True;
      printLeft('Cliente: ',0.3);
      Bold := False;
      printLeft(formatfloat('00000', qryAux.fieldbyname('cod_cliente').AsInteger)+'-'+qryAux.fieldbyname('nome_cli').AsString,1.0);
      Bold := True;
      printLeft('Tipo Atendimento: ',6.0);
      Bold := False;
      printLeft(vTipo,7.3);
      SomaLinha(Sender as TBaseReport);

      {Tabulação dos Detalhes}
      ClearTabs;
      SetPen(clBlack,psClear,1,pmCopy);
      RestoreTabs(1);

      printTab(formatfloat('00000', qryAux.fieldbyname('cod_atendimento').AsFloat));
      printTab(qryAux.fieldbyname('nome_clifunc').AsString);
      printTab(formatdatetime('dd/mm/yyyy',qryAux.fieldbyname('dt_atend').AsDateTime));
      printTab(vStatus);
      printTab(qryAux.fieldbyname('DESC_DEPTO').AsString);
      SomaLinha(Sender as TBaseReport);
      Bold := True;
      printLeft('Relato do Cliente',0.3);
      Bold := False;
      SomaLinha(Sender as TBaseReport);
      MemoBuf            := TMemoBuf.Create;
      MemoBuf.Text       := qryAux.fieldbyname('descricao_atend').AsString;
      MemoBuf.PrintStart := 0.30;
      MemoBuf.PrintEnd   := 7.70;
      MemoBuf.BaseReport := (sender as TBaseReport);
      MemoBuf.PrintLines(0,true);
      ClearColumns;
      MemoBuf.Free;
      SomaLinha(Sender as TBaseReport);
      Bold := True;
      printLeft('Ocorrências',0.3);
      printLeft('Nome Funcionario: ',5.10);
      Bold := False;
      printLeft(qryAux.fieldbyname('nome_func').AsString, 6.40);

      qryOcorrencia.Close;
      qryOcorrencia.ParamByName('cod_atendimento').AsInteger := qryAux.FieldByName('cod_atendimento').AsInteger;
      qryOcorrencia.ParamByName('cod_cliente').AsInteger     := qryAux.FieldByName('cod_cliente').AsInteger;
      qryOcorrencia.Open;

      if not qryOcorrencia.Eof then
      begin
        SomaLinha(Sender as TBaseReport);
        fLinha(Sender as TBaseReport, 2);
        SomaLinha(Sender as TBaseReport);
        MemoBuf            := TMemoBuf.Create;
        MemoBuf.PrintStart := 1.20;
        MemoBuf.PrintEnd   := 7.80;
        MemoBuf.BaseReport := (sender as TBaseReport);
        while not qryOcorrencia.Eof do
        begin
          if (PageHeight - 2.0) <= LineMiddle then
            NewPage;
          PrintLeft(formatdatetime('dd/mm/yyyy hh:nn',qryOcorrencia.FieldByName('dt_ocorrencia').AsDateTime), 0.3);
          {PrintLeft(qryOcorrencia.FieldByName('descricao_ocorr').AsString, 1.0);}
          MemoBuf.Text     := qryOcorrencia.FieldByName('descricao_ocorr').AsString;
          MemoBuf.PrintLines(0,true);
          {SomaLinha(Sender as TBaseReport);}
          qryOcorrencia.next;
        end;
        ClearColumns;
        MemoBuf.Free;
        fLinha(Sender as TBaseReport, 2);
      end
      else
      begin
        SomaLinha(Sender as TBaseReport);
        fLinha(Sender as TBaseReport, 2);
        SomaLinha(Sender as TBaseReport);
        Bold := True;
        printcenter('Não existem ocorrências',PageWidth/2);
        Bold := False;
        SomaLinha(Sender as TBaseReport);
        fLinha(Sender as TBaseReport,2);
      end;
      SomaLinha(Sender as TBaseReport);
      inc(vTot);
      inc(vTotal);
      qryAux.Next;
      if (qryAux.FieldByName('cod_cliente').AsInteger <> vCli) or (qryAux.Eof) then
      begin
        Bold := True;
        printLeft('Total do Cliente: ' + formatfloat('######0',vTot), 0.30);
        Bold := False;
        vTot := 0;
        vCli := qryAux.FieldByName('cod_cliente').AsInteger;
        SomaLinha(Sender as TBaseReport);
        fLinha(Sender as TBaseReport);
        SomaLinha(Sender as TBaseReport);
        if (PageHeight - 2.0) <= LineMiddle then
          NewPage;
      end;
    end;

    Bold := True;
    printLeft('Total de Atendimentos: ' + formatfloat('######0',vTotal), 0.30);
    Bold := False;

    SomaLinha(Sender as TBaseReport);
    fLinha(Sender as TBaseReport, 3);
    SomaLinha(Sender as TBaseReport);
  end;
end;

end.
