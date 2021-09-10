unit Pendencia_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, Menus, ExtCtrls, Grids, DBGrids, StdCtrls, Mask, ToolEdit,
  RxCalc, Db, DBTables, ComCtrls, Buttons, RxMemDS, RxCombos, DBCtrls, funcoes;

type
  TPendencia_f = class(TDeriva_f)
    Panel1: TPanel;
    Panel2: TPanel;
    rg: TRadioGroup;
    dtDe: TDateEdit;
    dtAte: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    dsPendencias: TDataSource;
    qryPendencias: TQuery;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    DBGrid1: TDBGrid;
    medCliente: TMaskEdit;
    Label3: TLabel;
    sbPesq: TSpeedButton;
    edtNomeCli: TEdit;
    Label4: TLabel;
    qryAux: TQuery;
    BitBtn1: TBitBtn;
    memoPend: TRxMemoryData;
    cbDepto: TDBLookupComboBox;
    Label15: TLabel;
    edtCodigo: TEdit;
    SpeedButton3: TSpeedButton;
    edtFunc: TEdit;
    Label10: TLabel;
    Label9: TLabel;
    Query1: TQuery;
    DataSource1: TDataSource;
    Label5: TLabel;
    Label6: TLabel;
    edtAtend: TEdit;
    edtAtraso: TEdit;
    Label7: TLabel;
    Label8: TLabel;
    procedure medClienteExit(Sender: TObject);
    procedure sbPesqClick(Sender: TObject);
    procedure rgClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Pendencia_f: TPendencia_f;

implementation

uses Atendimento_dm,
     Principal, Atendimento_u, CadLigacao_u, CadVisita_u;

{$R *.DFM}

procedure TPendencia_f.medClienteExit(Sender: TObject);
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
    qryAux.SQL.Text := 'SELECT * FROM GC_CLIENTE  WHERE TIPO_CLIFOR IN (''R'',''C'') AND COD_CLIENTE='+medCliente.Text;
    qryAux.Open;
    if qryAux.eof then
    begin
      messagedlg('Codigo de Cliente não cadastrado.',mtWarning,[mbOk],0);
      medCliente.SetFocus;
      exit;
    end;
    medCliente.Text  := qryAux.FieldByName('Cod_Cliente').AsString;
    edtNomeCli.Text  := qryAux.FieldByName('Nome_cli').AsString;
  end
  else
  begin
    medCliente.Clear;
    edtNomeCli.Clear;
  end;
end;

procedure TPendencia_f.sbPesqClick(Sender: TObject);
begin
  inherited;
  dmPesq.PesCliente.StringSql.Clear;
  dmPesq.PesCliente.StringSql.Add('SELECT * FROM GC_CLIENTE WHERE TIPO_CLIFOR IN (''R'',''C'') ');
  dmPesq.PesCliente.StringSql.Add(' ORDER BY NOME_CLI');
  dmPesq.PesCliente.Execute;
  medCliente.Clear;
  edtNomeCli.Clear;
  medCliente.Text := dmPesq.PesCliente.ValoresRetorno[0];
  edtNomeCli.Text := dmPesq.PesCliente.ValoresRetorno[2];
end;

procedure TPendencia_f.rgClick(Sender: TObject);
begin
  inherited;
  medCliente.Enabled := rg.ItemIndex = 2;
  sbPesq.Enabled     := rg.ItemIndex = 2;
  edtNomeCli.Enabled := rg.ItemIndex = 2;

  if nivel = 0 then
  begin
    if rg.ItemIndex = 4 then
    begin
      cbDepto.Enabled := True;
      query1.Close;
      cbDepto.KeyValue := 0;
      query1.Open;
    end
    else
    begin
      cbDepto.Enabled := False;
      query1.Close;
    end;

    if rg.ItemIndex = 5 then
    begin
      edtCodigo.Enabled    := True;
      SpeedButton3.Enabled := True;
      edtCodigo.Clear;
      edtFunc.Clear;
    end
    else
    begin
      edtCodigo.Enabled    := False;
      SpeedButton3.Enabled := False;
      edtCodigo.Clear;
      edtFunc.Clear;
    end;
  end;


  if rg.ItemIndex = 2 then
  begin
    medCliente.Clear;
    edtNomeCli.Clear;
  end;

end;

procedure TPendencia_f.BitBtn1Click(Sender: TObject);
var sSQl:String;
    vQtdeAtend, vQtdeAtraso : Integer;
    pri_Baixa, pri_Media, pri_Alta : Double;
    vDat                           : TDateTime;
begin
  inherited;
  if (rg.ItemIndex = 4) and (cbDepto.Text = '') then
  begin
    messagedlg('É necessário informar o Departamento.',mtWarning,[mbOk],0);
    exit;
  end;
  if (rg.ItemIndex = 5) and (edtCodigo.Text = '') then
  begin
    messagedlg('É necessário informar o Funcionário.',mtWarning,[mbOk],0);
    exit;
  end;
  {Ligações}
  sSql := 'SELECT LIG.COD_LIGACAO, LIG.COD_CLIENTE, CLI.NOME_CLI, AGE.NOME_CONTATO, LIG.COD_FUNC, FUN.NOME_FUNC, LIG.DT_PEDIDO_LIG, LIG.CONTATO, LIG.DESC_LIG, LIG.PRIORIDADE_LIG, DEP.DESC_DEPTO FROM GC_LIGACAO LIG ';
  sSql := sSql + ' LEFT  JOIN GC_CLIENTE      CLI ON (LIG.COD_CLIENTE = CLI.COD_CLIENTE) ';
  sSql := sSql + ' INNER JOIN GC_FUNCIONARIO  FUN ON (LIG.COD_FUNC    = FUN.COD_FUNC) ';
  sSql := sSql + ' LEFT  JOIN GC_AGENDA       AGE ON (LIG.COD_CONTATO = AGE.COD_CONTATO) ';
  sSql := sSql + ' LEFT  JOIN GC_DEPARTAMENTO DEP ON (LIG.COD_DEPTO  = DEP.COD_DEPTO) ';
  sSql := sSql + ' WHERE LIG.STATUS_LIG IN (''A'') AND LIG.TIPO_LIGACAO = ''R'' ';
  if rg.ItemIndex = 0 then
    sSql := sSql + ' AND LIG.COD_FUNC = ' + IntToStr(Cod_Func);
  if rg.ItemIndex = 1 then
    sSql := sSql + ' AND LIG.COD_DEPTO = ' + IntToStr(Cod_Depto);
  if rg.ItemIndex = 2 then
  begin
    if medCliente.Text = '' then
    begin
      messagedlg('É necessário informar o Cliente.',mtWarning,[mbOk],0);
      exit;
    end;
    sSql := sSql + ' AND LIG.COD_CLIENTE = ' + medCliente.Text;
  end;
  if (dtDe.Text <> '  /  /    ') and (dtAte.Text <> '  /  /    ') then
  begin
    sSql := sSql + ' AND LIG.DT_PEDIDO_LIG >= CAST(''' + FormatDateTime('mm/dd/yyyy hh:nn',StrToDateTime(dtDe.Text  + ' 00:00')) + ''' AS TIMESTAMP)';
    sSql := sSql + ' AND LIG.DT_PEDIDO_LIG <= CAST(''' + FormatDateTime('mm/dd/yyyy hh:nn',StrToDateTime(dtAte.Text + ' 23:59')) + ''' AS TIMESTAMP)';
  end;

  if rg.ItemIndex = 4 then
    sSql := sSql + ' AND FUN.COD_DEPTO = ' + query1.FieldByName('Cod_Depto').AsString;

  if rg.ItemIndex = 5 then
    sSql := sSql + ' AND FUN.COD_FUNC = ' + edtCodigo.Text;

  qryPendencias.SQL.Text := sSql;
  qryPendencias.Open;
  with memoPend do
  begin
    Close;
    Open;
    while not qryPendencias.eof do
    begin
      insert;
      fieldbyname('tipo').AsString         := 'LIGAÇÃO REC.';
      fieldbyname('nr').AsInteger          := qryPendencias.fieldbyname('cod_ligacao').AsInteger;
      fieldbyname('cod_cliente').AsInteger := qryPendencias.fieldbyname('cod_cliente').AsInteger;
      if qryPendencias.fieldbyname('nome_cli').AsString = '' then
        fieldbyname('nome').AsString         := qryPendencias.fieldbyname('nome_contato').AsString
      else
        fieldbyname('nome').AsString         := qryPendencias.fieldbyname('nome_cli').AsString;

      fieldbyname('cod_func').AsInteger    := qryPendencias.fieldbyname('cod_func').AsInteger;
      fieldbyname('nome_func').AsString    := qryPendencias.fieldbyname('nome_func').AsString;
      fieldbyname('data').AsDateTime       := qryPendencias.fieldbyname('dt_pedido_lig').AsDateTime;
      fieldbyname('contato').AsString      := qryPendencias.fieldbyname('contato').AsString;
      fieldbyname('descricao').AsString    := qryPendencias.fieldbyname('desc_lig').AsString;
      fieldbyname('DESC_DEPTO').AsString   := qryPendencias.fieldbyname('desc_DEPTO').AsString;

      if qryPendencias.fieldbyname('PRIORIDADE_LIG').AsString = 'B' then
        fieldbyname('prioridade').AsString   := 'Baixa'
      else if qryPendencias.fieldbyname('PRIORIDADE_LIG').AsString = 'M' then
        fieldbyname('prioridade').AsString   := 'Média'
      else if qryPendencias.fieldbyname('PRIORIDADE_LIG').AsString = 'A' then
        fieldbyname('prioridade').AsString   := 'Alta';
      post;
      qryPendencias.Next;
    end;
  end;

  {Visitas}
  sSql := 'SELECT VIS.TIPO_COMPROMISSO, VIS.COD_VISITA, VIS.COD_CLIENTE, CLI.NOME_CLI, VIS.COD_FUNC, FUN.NOME_FUNC, VIS.DT_VISITA, VIS.CONTATO_VISITA, VIS.OBS_VISITA, DEP.DESC_DEPTO FROM GC_VISITA VIS ';
  sSql := sSql + ' INNER JOIN GC_CLIENTE     CLI ON (VIS.COD_CLIENTE = CLI.COD_CLIENTE) ';
  sSql := sSql + ' INNER JOIN GC_FUNCIONARIO FUN ON (VIS.COD_FUNC    = FUN.COD_FUNC) ';
  sSql := sSql + ' LEFT JOIN GC_DEPARTAMENTO DEP ON (FUN.COD_DEPTO   = DEP.COD_DEPTO) ';
  sSql := sSql + ' WHERE VIS.STATUS_VISITA = ''A''';
  if rg.ItemIndex = 0 then
    sSql := sSql + ' AND VIS.COD_FUNC = ' + IntToStr(Cod_Func);
  if rg.ItemIndex = 1 then
    sSql := sSql + ' AND FUN.COD_DEPTO = ' + IntToStr(Cod_Depto);
  if rg.ItemIndex = 2 then
  begin
    if medCliente.Text = '' then
    begin
      messagedlg('É necessário informar o Cliente.',mtWarning,[mbOk],0);
      exit;
    end;
    sSql := sSql + ' AND VIS.COD_CLIENTE = ' + medCliente.Text;
  end;
  if (dtDe.Text <> '  /  /    ') and (dtAte.Text <> '  /  /    ') then
  begin
    sSql := sSql + ' AND VIS.DT_VISITA >= CAST(''' + FormatDateTime('mm/dd/yyyy hh:nn',StrToDateTime(dtDe.Text  + ' 00:00')) + ''' AS TIMESTAMP)';
    sSql := sSql + ' AND VIS.DT_VISITA <= CAST(''' + FormatDateTime('mm/dd/yyyy hh:nn',StrToDateTime(dtAte.Text + ' 23:59')) + ''' AS TIMESTAMP)';
  end;

  if rg.ItemIndex = 4 then
    sSql := sSql + ' AND FUN.COD_DEPTO = ' + query1.FieldByName('Cod_Depto').AsString;

  if rg.ItemIndex = 5 then
    sSql := sSql + ' AND FUN.COD_FUNC = ' + edtCodigo.Text;

  qryPendencias.Close;
  qryPendencias.SQL.Text := sSql;
  qryPendencias.Open;
  with memoPend do
  begin
    while not qryPendencias.eof do
    begin
      insert;
      if qryPendencias.fieldbyname('tipo_compromisso').AsString = 'V' then
        fieldbyname('tipo').AsString         := 'VISITA'
      else if qryPendencias.fieldbyname('tipo_compromisso').AsString = 'F' then
        fieldbyname('tipo').AsString         := 'FISCALIZAÇÃO'
      else if qryPendencias.fieldbyname('tipo_compromisso').AsString = 'H' then
        fieldbyname('tipo').AsString         := 'HOMOLOGAÇÃO'
      else
        fieldbyname('tipo').AsString         := 'COMPROMISSO';

      fieldbyname('nr').AsInteger          := qryPendencias.fieldbyname('cod_visita').AsInteger;
      fieldbyname('cod_cliente').AsInteger := qryPendencias.fieldbyname('cod_cliente').AsInteger;
      fieldbyname('nome').AsString         := qryPendencias.fieldbyname('nome_cli').AsString;
      fieldbyname('cod_func').AsInteger    := qryPendencias.fieldbyname('cod_func').AsInteger;
      fieldbyname('nome_func').AsString    := qryPendencias.fieldbyname('nome_func').AsString;
      fieldbyname('data').AsDateTime       := qryPendencias.fieldbyname('dt_visita').AsDateTime;
      fieldbyname('contato').AsString      := qryPendencias.fieldbyname('contato_visita').AsString;
      fieldbyname('descricao').AsString    := qryPendencias.fieldbyname('obs_visita').AsString;
      fieldbyname('prioridade').AsString   := 'Alta';
      fieldbyname('DESC_DEPTO').AsString   := qryPendencias.fieldbyname('desc_DEPTO').AsString;
      post;
      qryPendencias.Next;
    end;
  end;

  {Atendimento}
  sSql := 'SELECT ATE.COD_ATENDIMENTO, ATE.COD_CLIENTE, CLI.NOME_CLI, ATE.COD_FUNC, FUN.NOME_FUNC, ATE.DT_ATEND, ATE.NOME_CLIFUNC, ATE.DESCRICAO_ATEND, ATE.PRIORIDADE_ATEND, DEP.DESC_DEPTO, ATE.STATUS_ATEND  FROM GC_ATENDIMENTO ATE ';
  sSql := sSql + ' INNER JOIN GC_CLIENTE     CLI ON (ATE.COD_CLIENTE = CLI.COD_CLIENTE) ';
  sSql := sSql + ' INNER JOIN GC_FUNCIONARIO FUN ON (ATE.COD_FUNC    = FUN.COD_FUNC) ';
  sSql := sSql + ' LEFT JOIN GC_DEPARTAMENTO DEP ON (ATE.COD_DEPTO   = DEP.COD_DEPTO) ';
  sSql := sSql + ' WHERE ATE.STATUS_ATEND IN (''A'', ''E'')';
  if rg.ItemIndex = 0 then
    sSql := sSql + ' AND ATE.COD_FUNC = ' + IntToStr(Cod_Func);
  if rg.ItemIndex = 1 then
    sSql := sSql + ' AND ATE.COD_DEPTO = ' + IntToStr(Cod_Depto);
  if rg.ItemIndex = 2 then
  begin
    if medCliente.Text = '' then
    begin
      messagedlg('É necessário informar o Cliente.',mtWarning,[mbOk],0);
      exit;
    end;
    sSql := sSql + ' AND ATE.COD_CLIENTE = ' + medCliente.Text;
  end;
  if (dtDe.Text <> '  /  /    ') and (dtAte.Text <> '  /  /    ') then
  begin
    sSql := sSql + ' AND ATE.DT_ATEND >= CAST(''' + FormatDateTime('mm/dd/yyyy hh:nn',StrToDateTime(dtDe.Text  + ' 00:00')) + ''' AS TIMESTAMP)';
    sSql := sSql + ' AND ATE.DT_ATEND <= CAST(''' + FormatDateTime('mm/dd/yyyy hh:nn',StrToDateTime(dtAte.Text + ' 23:59')) + ''' AS TIMESTAMP)';
  end;

  if rg.ItemIndex = 4 then
    sSql := sSql + ' AND FUN.COD_DEPTO = ' + query1.FieldByName('Cod_Depto').AsString;

  if rg.ItemIndex = 5 then
    sSql := sSql + ' AND FUN.COD_FUNC = ' + edtCodigo.Text;

  qryPendencias.Close;
  qryPendencias.SQL.Text := sSql;
  qryPendencias.Open;
  with memoPend do
  begin
    vQtdeAtend  := 0;
    vQtdeAtraso := 0;
    pri_Baixa  := StrToFloat(lerIni(caminho+'Atendimento.ini','Prioridade','Baixa'));
    pri_Media  := StrToFloat(lerIni(caminho+'Atendimento.ini','Prioridade','Media'));
    pri_Alta   := StrToFloat(lerIni(caminho+'Atendimento.ini','Prioridade','Alta'));
    while not qryPendencias.eof do
    begin
      insert;
      fieldbyname('tipo').AsString         := 'ATENDIMENTO';
      fieldbyname('nr').AsInteger          := qryPendencias.fieldbyname('cod_atendimento').AsInteger;
      fieldbyname('cod_cliente').AsInteger := qryPendencias.fieldbyname('cod_cliente').AsInteger;
      fieldbyname('nome').AsString         := copy(qryPendencias.fieldbyname('nome_cli').AsString,1,20);
      fieldbyname('cod_func').AsInteger    := qryPendencias.fieldbyname('cod_func').AsInteger;
      fieldbyname('nome_func').AsString    := copy(qryPendencias.fieldbyname('nome_func').AsString,1,20);
      fieldbyname('data').AsDateTime       := qryPendencias.fieldbyname('dt_atend').AsDateTime;
      fieldbyname('contato').AsString      := copy(qryPendencias.fieldbyname('nome_clifunc').AsString,1,20);
      fieldbyname('descricao').AsString    := copy(qryPendencias.fieldbyname('descricao_atend').AsString,1,50);
      fieldbyname('DESC_DEPTO').AsString   := qryPendencias.fieldbyname('desc_DEPTO').AsString;
      fieldbyname('Status').AsString       := qryPendencias.fieldbyname('Status_Atend').AsString;
      if qryPendencias.fieldbyname('prioridade_atend').AsString = 'B' then
        fieldbyname('prioridade').AsString   := 'Baixa'
      else if qryPendencias.fieldbyname('prioridade_atend').AsString = 'M' then
        fieldbyname('prioridade').AsString   := 'Média'
      else if qryPendencias.fieldbyname('prioridade_atend').AsString = 'A' then
        fieldbyname('prioridade').AsString   := 'Alta';
      post;

      if memoPend.FieldByName('status').AsString = 'A' then
      begin
        vDat := now() - memoPend.FieldByName('data').AsDateTime;
        if ( qryPendencias.fieldbyname('prioridade_atend').AsString = 'A') and
           ( vDat >= pri_Alta ) then
          inc(vQtdeAtraso);
        if ( qryPendencias.fieldbyname('prioridade_atend').AsString = 'M') and
           ( vDat >=  pri_Media) then
          inc(vQtdeAtraso);
        if ( qryPendencias.fieldbyname('prioridade_atend').AsString = 'B') and
           ( vDat >=  pri_Baixa) then
          inc(vQtdeAtraso);
      end
      else if qryPendencias.fieldbyname('Status_Atend').AsString = 'E' then
      begin
        {Atendimentos em Espera}
      end;

      inc(vQtdeAtend);
      qryPendencias.Next;
    end;
  end;
  edtAtend.Text  := formatfloat('0',vQtdeAtend);
  edtAtraso.Text := formatfloat('0',vQtdeAtraso);
  memoPend.SortOnFields('tipo;data',true,false);
  memoPend.First;
end;

procedure TPendencia_f.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
var vDat, pri_Baixa, pri_Media, pri_Alta : Double;
begin
  inherited;
  if (memoPend.FieldByName('tipo').AsString      = 'LIGAÇÃO') and (cor)     then
      Dbgrid1.Canvas.Brush.Color := $0093DFE3
  else if (memoPend.FieldByName('tipo').AsString = 'VISITA') and (cor)      then
    Dbgrid1.Canvas.Brush.Color := $00F7F7BB
  else if (memoPend.FieldByName('tipo').AsString = 'FISCALIZAÇÃO') and (cor)      then
    Dbgrid1.Canvas.Brush.Color := $00F7F7BB
  else if (memoPend.FieldByName('tipo').AsString = 'HOMOLOGAÇÃO') and (cor)      then
    Dbgrid1.Canvas.Brush.Color := $00F7F7BB
  else if (memoPend.FieldByName('tipo').AsString = 'COMPROMISSO') and (cor)      then
    Dbgrid1.Canvas.Brush.Color := $00F7F7BB
  else if (memoPend.FieldByName('tipo').AsString = 'ATENDIMENTO') and (cor) then
    Dbgrid1.Canvas.Brush.Color := $00BBC8EC;
  if column.FieldName = 'PRIORIDADE' then
  begin
    if memoPend.FieldByName('status').AsString = 'A' then
    begin
      vDat := now() - memoPend.FieldByName('data').AsDateTime;
      if memoPend.FieldByName('tipo').AsString = 'LIGAÇÃO' then
      begin
        pri_Baixa  := StrToFloat(lerIni(caminho+'Atendimento.ini','Ligacao','Baixa'));
        pri_Media  := StrToFloat(lerIni(caminho+'Atendimento.ini','Ligacao','Media'));
        pri_Alta   := StrToFloat(lerIni(caminho+'Atendimento.ini','Ligacao','Alta'));
      end
      else
      begin
        pri_Baixa  := StrToFloat(lerIni(caminho+'Atendimento.ini','Prioridade','Baixa'));
        pri_Media  := StrToFloat(lerIni(caminho+'Atendimento.ini','Prioridade','Media'));
        pri_Alta   := StrToFloat(lerIni(caminho+'Atendimento.ini','Prioridade','Alta'));
      end;

      if (memoPend.FieldByName('prioridade').AsString = 'Alta') and
      ( vDat >= pri_Alta ) then
      begin
        if cor then
          Dbgrid1.Canvas.Brush.Color := $001C32FD
        else
        begin
          Dbgrid1.Canvas.Brush.Color := clBlack;
          Dbgrid1.Canvas.Font.Color  := clWhite;
        end;
      end;
      if (memoPend.FieldByName('prioridade').AsString = 'Média') and
      ( vDat >=  pri_Media) then
      begin
        if cor then
          Dbgrid1.Canvas.Brush.Color := $001C32FD
        else
        begin
          Dbgrid1.Canvas.Brush.Color := clBlack;
          Dbgrid1.Canvas.Font.Color  := clWhite;
        end;
      end;
      if (memoPend.FieldByName('prioridade').AsString = 'Baixa') and
      ( vDat >=  pri_Baixa) then
      begin
        if cor then
          Dbgrid1.Canvas.Brush.Color := $001C32FD
        else
        begin
          Dbgrid1.Canvas.Brush.Color := clBlack;
          Dbgrid1.Canvas.Font.Color  := clWhite;
        end;
      end;
    end
    else if memoPend.FieldByName('status').AsString = 'E' then
    begin
      if cor then
        Dbgrid1.Canvas.Brush.Color := clYellow
      else
      begin
        Dbgrid1.Canvas.Brush.Color := clMaroon;
        Dbgrid1.Canvas.Font.Color  := clWhite;
      end;
    end;
  end;
  Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
end;

procedure TPendencia_f.FormShow(Sender: TObject);
begin
  inherited;
  dtDe.Date  := now() - StrToInt(LerIni(caminho+'Atendimento.ini','Identificacao','Historico'));
  dtAte.Date := now() + (StrToInt(LerIni(caminho+'Atendimento.ini','Identificacao','Historico'))/2);
end;

procedure TPendencia_f.DBGrid1DblClick(Sender: TObject);
begin
  inherited;

  if memoPend.FieldByName('tipo').AsString = 'ATENDIMENTO' then
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
      Atendimento_f.chkMeuDepto.Checked := False;
      Atendimento_f.medAtendimento.Text := memoPend.FieldByName('Nr').AsString;
      Atendimento_f.medCliente.Text     := memoPend.FieldByName('Cod_Cliente').AsString;
      Atendimento_f.medAtendimentoExit(self);
    except
      Atendimento_f          := TAtendimento_f.Create(Self);
      Atendimento_f.Width    := frmPrincipal.Width  - 10;
      Atendimento_f.Height   := frmPrincipal.Height - 10;
      Atendimento_f.Show;
    end;

  end
  else if memoPend.FieldByName('tipo').AsString = 'LIGAÇÃO REC.' then
  begin
    if assigned(CadLigacao_f) then
      CadLigacao_f := nil;

    CadLigacao_f := TCadLigacao_f.Create(Self);
    try
      CadLigacao_f.Height := CadLigacao_f.Height - 15;
      CadLigacao_f.medLigacao.Text := memoPend.FieldByName('Nr').AsString;
      CadLigacao_f.medLigacaoExit(self);

      CadLigacao_f.Show;
    except
      CadLigacao_f := TCadLigacao_f.Create(Self);
      CadLigacao_f.Height := CadLigacao_f.Height - 15;
      CadLigacao_f.medLigacao.Text := memoPend.FieldByName('Nr').AsString;
      CadLigacao_f.medLigacaoExit(self);
      CadLigacao_f.Show;
    end;
  end
  else if (memoPend.FieldByName('tipo').AsString = 'VISITA')       or
          (memoPend.FieldByName('tipo').AsString = 'FISCALIZAÇÃO') or
          (memoPend.FieldByName('tipo').AsString = 'HOMOLOGAÇÃO')  or
          (memoPend.FieldByName('tipo').AsString = 'COMPROMISSO')  then
  begin
    if assigned(CadVisita_f) then
      CadVisita_f := nil;

    CadVisita_f := TCadVisita_f.Create(Self);
    try
      CadVisita_f.Height := CadVisita_f.Height - 15;
      CadVisita_f.medVisita.Text := memoPend.FieldByName('Nr').AsString;
      CadVisita_f.medVisitaExit(self);
      CadVisita_f.Show;
    except
      CadVisita_f := TCadVisita_f.Create(Self);
      CadVisita_f.Height := CadVisita_f.Height - 15;
      CadVisita_f.Show;
    end;
  end;

end;

procedure TPendencia_f.SpeedButton3Click(Sender: TObject);
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

procedure TPendencia_f.edtCodigoExit(Sender: TObject);
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

procedure TPendencia_f.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  frmPrincipal.sgrdPend.Visible := frmPrincipal.MostrarJaneladePendncia1.Checked;
end;

end.
