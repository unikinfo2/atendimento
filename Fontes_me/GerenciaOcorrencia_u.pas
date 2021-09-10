unit GerenciaOcorrencia_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Deriva_u, RxCalc, Menus, StdCtrls, Mask, ToolEdit, Buttons,
  ComCtrls, RpDefine, RpBase, RpSystem, DB, DBTables, CurrEdit, RXCtrls,
  ExtCtrls;

type
  TGerenciaOcorrencia_f = class(TDeriva_f)
    pc: TPageControl;
    TabSheet1: TTabSheet;
    dtDe: TDateEdit;
    dtAte: TDateEdit;
    Label1: TLabel;
    Label2: TLabel;
    medCliente: TMaskEdit;
    Label3: TLabel;
    sbPesq: TSpeedButton;
    edtNomeCli: TEdit;
    Label4: TLabel;
    edtCodigo: TEdit;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    edtFunc: TEdit;
    Label5: TLabel;
    qryAux: TQuery;
    RvSystem1: TRvSystem;
    edtDepto: TEdit;
    Label7: TLabel;
    SpeedButton2: TSpeedButton;
    edtDesc: TEdit;
    Label8: TLabel;
    BitBtn1: TBitBtn;
    tsCli: TTabSheet;
    tsFun: TTabSheet;
    tsDepto: TTabSheet;
    tvCli: TTreeView;
    qryAux2: TQuery;
    qryDocto: TQuery;
    qryDepto: TQuery;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    vlrSol: TRxCalcEdit;
    vlrRec: TRxCalcEdit;
    vlrLig: TRxCalcEdit;
    VlrFec: TRxCalcEdit;
    vlrAbe: TRxCalcEdit;
    vlrEsp: TRxCalcEdit;
    vlrAtend: TRxCalcEdit;
    RxLabel1: TRxLabel;
    Label16: TLabel;
    vlrDoc: TRxCalcEdit;
    medDia: TMaskEdit;
    medHora: TMaskEdit;
    medMin: TMaskEdit;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    SpeedButton3: TSpeedButton;
    tvFun: TTreeView;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    vlrSol2: TRxCalcEdit;
    vlrRec2: TRxCalcEdit;
    vlrLig2: TRxCalcEdit;
    vlrFec2: TRxCalcEdit;
    vlrAbe2: TRxCalcEdit;
    vlrEsp2: TRxCalcEdit;
    vlrAtend2: TRxCalcEdit;
    RxLabel2: TRxLabel;
    Label28: TLabel;
    vlrDoc2: TRxCalcEdit;
    medDia2: TMaskEdit;
    medHora2: TMaskEdit;
    medMin2: TMaskEdit;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    SpeedButton4: TSpeedButton;
    tvDepto: TTreeView;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    vlrSol3: TRxCalcEdit;
    vlrRec3: TRxCalcEdit;
    vlrLig3: TRxCalcEdit;
    vlrFec3: TRxCalcEdit;
    vlrAbe3: TRxCalcEdit;
    vlrEsp3: TRxCalcEdit;
    vlrAtend3: TRxCalcEdit;
    RxLabel3: TRxLabel;
    Label41: TLabel;
    vlrDoc3: TRxCalcEdit;
    medDia3: TMaskEdit;
    medHora3: TMaskEdit;
    medMin3: TMaskEdit;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    SpeedButton5: TSpeedButton;
    rgApu: TRadioGroup;
    Label33: TLabel;
    vlrParticular: TRxCalcEdit;
    Label47: TLabel;
    vlrFuncionario: TRxCalcEdit;
    Label48: TLabel;
    vlrCliente: TRxCalcEdit;
    Label49: TLabel;
    vlrParticular2: TRxCalcEdit;
    Label50: TLabel;
    vlrFuncionario2: TRxCalcEdit;
    Label51: TLabel;
    vlrCliente2: TRxCalcEdit;
    procedure sbPesqClick(Sender: TObject);
    procedure medClienteExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edtDeptoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

function ChamaNode(Items:TTreeView; vStr:String; pTodo : Boolean=False) : Integer;
procedure PegaDiaHoraMin(pMedia : Double; var pDia, pHora, pMin : Integer );

var
  GerenciaOcorrencia_f: TGerenciaOcorrencia_f;

implementation

uses Atendimento_dm, funcoes;

{$R *.dfm}

procedure TGerenciaOcorrencia_f.sbPesqClick(Sender: TObject);
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

procedure TGerenciaOcorrencia_f.medClienteExit(Sender: TObject);
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
    medCliente.Text  := qryAux.FieldByName('Cod_Cliente').AsString;
    edtNomeCli.Text  := qryAux.FieldByName('Nome_cli').AsString;
  end;
end;

procedure TGerenciaOcorrencia_f.SpeedButton1Click(Sender: TObject);
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

procedure TGerenciaOcorrencia_f.edtCodigoExit(Sender: TObject);
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

procedure TGerenciaOcorrencia_f.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  dmPesq.pesDepto.StringSql.Clear;
  dmPesq.pesDepto.StringSql.Add('SELECT * FROM GC_DEPARTAMENTO');
  dmPesq.PesDepto.Execute;
  edtDepto.Text := dmPesq.PesDepto.ValoresRetorno[0];
  edtDesc.Text  := dmPesq.PesDepto.ValoresRetorno[1];
  if edtDepto.Text = '' then
  begin
    edtDepto.SetFocus;
    exit;
  end;
end;

procedure TGerenciaOcorrencia_f.edtDeptoExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := False;
    exit;
  end;
  edtDesc.Clear;
  if edtDepto.Text <> '' then
  begin
    qryDepto.Close;
    qryDepto.ParamByName('Cod_Depto').AsString := edtDepto.Text;
    qryDepto.Open;
    if qryDepto.eof then
    begin
      messagedlg('Departamento não cadastrado.',mtInformation,[mbOk],0);
      edtDepto.SetFocus;
    end
    else
      edtDesc.Text := qryDepto.fieldbyname('Desc_Depto').AsString;
  end;
end;

procedure TGerenciaOcorrencia_f.BitBtn1Click(Sender: TObject);
var vLigSol, vLigRec,  vAtendFec, vAtendAbe, vAtendEsp, vDocto,
    vMed,    vLigFunc, vLigCli,   vLigPart : Double;
    vItem1                                 : TTreeNode;
    vQtdAtend, vDia, vHora, vMin           : Integer;
    sSql, vFilLig, vFilAte, vFilPro        : String;
begin
  inherited;
  if (dtDe.Text  = '  /  /    ') or
     (dtAte.Text = '  /  /    ') then
  begin
    messagedlg('Informe o período para filtro.',mtWarning,[mbOk],0);
    dtDe.SetFocus;
    exit;
  end;
  tsCli.TabVisible   := rgApu.ItemIndex = 0;
  tsFun.TabVisible   := rgApu.ItemIndex = 1;
  tsDepto.TabVisible := rgApu.ItemIndex = 2;

  vFilLig := ' and lig.dt_pedido_lig >= ' + DataSql(dtDe.Date) +
             ' and lig.dt_pedido_lig <= ' + DataSql(dtAte.Date);

  vFilAte := ' and ate.dt_atend >= ' + DataSql(dtDe.Date) +
             ' and ate.dt_atend <= ' + DataSql(dtAte.Date);

  vFilPro := ' and pro.dt_emissao_proto >= ' + DataSql(dtDe.Date) +
             ' and pro.dt_emissao_proto <= ' + DataSql(dtAte.Date);

  if rgApu.ItemIndex = 0 then
  begin
    {Empresa}
    sSql := 'SELECT * FROM GC_CLIENTE ';
    if medCliente.Text <> '' then
      sSql := sSql + ' where cod_cliente = ' + medCliente.Text
    else
      sSql := sSql + ' where cod_cliente > 0';

      {sSql := sSql + ' where ativo_cli = ''A''';}

    sSql := sSql + ' order by nome_cli';

    qryAux.close;
    qryAux.Sql.Text := sSql;
    qryAux.open;

    tvCli.Items.Clear;

    while not qryAux.Eof do
    begin
      {Ligações Solicitadas}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_ligacao lig where cod_cliente = ' + qryAux.fieldbyname('cod_cliente').AsString +
                          ' and tipo_ligacao = ''S''' + vFilLig;
      qryAux2.open;
      vLigSol := qryAux2.fieldbyname('total').AsFloat;

      {Ligações Recebidas}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_ligacao lig where cod_cliente = ' + qryAux.fieldbyname('cod_cliente').AsString +
                          ' and tipo_ligacao = ''R''' + vFilLig;
      qryAux2.open;
      vLigRec := qryAux2.fieldbyname('total').AsFloat;

      {Ligações Particulares}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_ligacao lig where cod_cliente = ' + qryAux.fieldbyname('cod_cliente').AsString +
                          ' and particular_lig = ''P''' + vFilLig;
      qryAux2.open;
      vLigPart := qryAux2.fieldbyname('total').AsFloat;

      {Ligações de Funcionarios}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_ligacao lig where cod_cliente = ' + qryAux.fieldbyname('cod_cliente').AsString +
                          ' and particular_lig = ''F''' + vFilLig;
      qryAux2.open;
      vLigFunc := qryAux2.fieldbyname('total').AsFloat;

      {Ligações de Clientes}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_ligacao lig where cod_cliente = ' + qryAux.fieldbyname('cod_cliente').AsString +
                          ' and particular_lig = ''C''' + vFilLig;
      qryAux2.open;
      vLigCli := qryAux2.fieldbyname('total').AsFloat;

      {Atendimentos Fechados}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_atendimento ate where cod_cliente = ' + qryAux.fieldbyname('cod_cliente').AsString +
                          ' and status_atend = ''F''' + vFilAte;
      qryAux2.open;
      vAtendFec := qryAux2.fieldbyname('total').AsFloat;

      {Atendimentos Aberto}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_atendimento ate where cod_cliente = ' + qryAux.fieldbyname('cod_cliente').AsString +
                          ' and status_atend = ''A''' + vFilAte;
      qryAux2.open;
      vAtendAbe := qryAux2.fieldbyname('total').AsFloat;

      {Atendimentos Espera}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_atendimento ate where cod_cliente = ' + qryAux.fieldbyname('cod_cliente').AsString +
                          ' and status_atend = ''E''' + vFilAte;
      qryAux2.open;
      vAtendEsp := qryAux2.fieldbyname('total').AsFloat;

      {Média de Fechamento dos Atendimentos}
      qryAux2.Sql.Text := 'select count(*) qtdatend, sum(oco.dt_ocorrencia - ate.dt_atend) total from gc_atendimento ate '+
                          ' inner join gc_ocorrencia oco on (ate.cod_atendimento = oco.cod_atendimento) '+
                          '  where ate.status_atend = ''F'' and oco.status_ocorr = ''F'' '+
                          '    and ate.cod_cliente = ' + qryAux.fieldbyname('cod_cliente').AsString + vFilAte;
      qryAux2.open;
      vMed       := qryAux2.FieldByName('Total').AsFloat;
      vQtdAtend  := qryAux2.FieldByName('qtdatend').AsInteger;
      try
        PegaDiaHoraMin(vMed / vQtdAtend, vDia, vHora, vMin );
      except
        vDia  := 0;
        vHora := 0;
        vMin  := 0;
      end;

      {Documentos com retorno de Protocolo = 'P'}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_protocolo pro '+
                          ' inner join gc_documento_emitido emi on (pro.cod_protocolo = emi.cod_protocolo) '+
                          ' where cod_cliente = ' + qryAux.fieldbyname('cod_cliente').AsString +
                          '   and status_entrega = ''P''' + vFilPro;
      qryAux2.open;
      vDocto := qryAux2.fieldbyname('total').AsFloat;

      tvCli.Items.Add( nil  ,formatfloat('000',qryAux.FieldByName('cod_cliente').AsInteger) + '-' +
                            qryAux.FieldByName('nome_cli').AsString);

      vItem1 := tvCli.Items[chamanode(tvCli, formatfloat('000',qryAux.FieldByName('cod_cliente').AsInteger) + '-' +
                            qryAux.FieldByName('nome_cli').AsString)];

      tvCli.Items.AddChild( vItem1, FloatToStr(vLigRec+vLigSol) + ' Ligações');
      tvCli.Items.AddChild( vItem1, FloatToStr(vLigSol)         + ' Ligações Solicitadas');
      tvCli.Items.AddChild( vItem1, FloatToStr(vLigRec)         + ' Ligações Recebidas');
      tvCli.Items.AddChild( vItem1, FloatToStr(vLigPart)        + ' Origem Particular');
      tvCli.Items.AddChild( vItem1, FloatToStr(vLigFunc)        + ' Origem Funcionario');
      tvCli.Items.AddChild( vItem1, FloatToStr(vLigCli)         + ' Origem Cliente');
      tvCli.Items.AddChild( vItem1, FloatToStr(vAtendFec+vAtendAbe+vAtendEsp) + ' Atendimentos');
      tvCli.Items.AddChild( vItem1, FloatToStr(vAtendFec) + ' Atendimentos Fechados');
      tvCli.Items.AddChild( vItem1, FloatToStr(vAtendAbe) + ' Atendimentos Em Aberto');
      tvCli.Items.AddChild( vItem1, FloatToStr(vAtendEsp) + ' Atendimentos Em Espera');
      tvCli.Items.AddChild( vItem1, FloatToStr(vDocto) + ' Documentos entregues');
      tvCli.Items.AddChild( vItem1, formatfloat('0', vDia) + ' Dias, '+
                                    formatfloat('00', vHora) + ':'+
                                    formatfloat('00', vMin)  + ':'+
                                    ' Em Média para fechar um atendimento');
      qryAux.Next;
    end;
  end
  else if rgApu.ItemIndex = 1 then
  begin
    {Funcionários}
    sSql := 'SELECT * FROM GC_FUNCIONARIO ';
    if edtCodigo.Text <> '' then
      sSql := sSql + ' where cod_FUNC = ' + edtCodigo.Text
    else
      sSql := sSql + ' where ativo_func = ''S''';

    sSql := sSql + ' order by nome_func';

    qryAux.close;
    qryAux.Sql.Text := sSql;
    qryAux.open;
    tvFun.Items.Clear;

    while not qryAux.Eof do
    begin
      {Ligações Solicitadas}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_ligacao lig where cod_func = ' + qryAux.fieldbyname('cod_func').AsString +
                          ' and tipo_ligacao = ''S''' + vFilLig;
      qryAux2.open;
      vLigSol := qryAux2.fieldbyname('total').AsFloat;

      {Ligações Recebidas}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_ligacao lig where cod_func = ' + qryAux.fieldbyname('cod_func').AsString +
                          ' and tipo_ligacao = ''R''' + vFilLig;
      qryAux2.open;
      vLigRec := qryAux2.fieldbyname('total').AsFloat;

      {Ligações Particulares}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_ligacao lig where cod_func = ' + qryAux.fieldbyname('cod_func').AsString +
                          ' and particular_lig = ''P''' + vFilLig;
      qryAux2.open;
      vLigPart := qryAux2.fieldbyname('total').AsFloat;

      {Ligações de Funcionarios}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_ligacao lig where cod_func = ' + qryAux.fieldbyname('cod_func').AsString +
                          ' and particular_lig = ''F''' + vFilLig;
      qryAux2.open;
      vLigFunc := qryAux2.fieldbyname('total').AsFloat;

      {Ligações de Clientes}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_ligacao lig where cod_func = ' + qryAux.fieldbyname('cod_func').AsString +
                          ' and particular_lig = ''C''' + vFilLig;
      qryAux2.open;
      vLigCli := qryAux2.fieldbyname('total').AsFloat;

      {Atendimentos Fechados}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_atendimento ate where ate.cod_func = ' + qryAux.fieldbyname('cod_func').AsString +
                          ' and ate.status_atend = ''F''' + vFilAte;
      qryAux2.open;
      vAtendFec := qryAux2.fieldbyname('total').AsFloat;

      {Atendimentos Aberto}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_atendimento ate where ate.cod_func = ' + qryAux.fieldbyname('cod_func').AsString +
                          ' and ate.status_atend = ''A''' + vFilAte;
      qryAux2.open;
      vAtendAbe := qryAux2.fieldbyname('total').AsFloat;

      {Atendimentos Espera}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_atendimento ate where ate.cod_func = ' + qryAux.fieldbyname('cod_func').AsString +
                          ' and ate.status_atend = ''E''' + vFilAte;
      qryAux2.open;
      vAtendEsp := qryAux2.fieldbyname('total').AsFloat;

      {Média de Fechamento dos Atendimentos}
      qryAux2.Sql.Text := 'select count(*) qtdatend, sum(oco.dt_ocorrencia - ate.dt_atend) total from gc_atendimento ate '+
                          ' inner join gc_ocorrencia oco on (ate.cod_atendimento = oco.cod_atendimento) '+
                          '  where ate.status_atend = ''F'' and oco.status_ocorr = ''F'' '+
                          '    and ate.cod_func = ' + qryAux.fieldbyname('cod_func').AsString + vFilAte;
      qryAux2.open;
      vMed       := qryAux2.FieldByName('Total').AsFloat;
      vQtdAtend  := qryAux2.FieldByName('qtdatend').AsInteger;
      try
        PegaDiaHoraMin(vMed / vQtdAtend, vDia, vHora, vMin );
      except
        vDia  := 0;
        vHora := 0;
        vMin  := 0;
      end;

      {Documentos com retorno de Protocolo = 'P'}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_protocolo pro '+
                          ' inner join gc_documento_emitido emi on (pro.cod_protocolo = emi.cod_protocolo) '+
                          ' where cod_func_cad = ' + qryAux.fieldbyname('cod_func').AsString +
                          '   and status_entrega = ''P''' + vFilPro;
      qryAux2.open;
      vDocto := qryAux2.fieldbyname('total').AsFloat;

      tvFun.Items.Add( nil  ,formatfloat('000',qryAux.FieldByName('cod_func').AsInteger) + '-' +
                            qryAux.FieldByName('nome_func').AsString);

      vItem1 := tvFun.Items[chamanode(tvFun, formatfloat('000',qryAux.FieldByName('cod_func').AsInteger) + '-' +
                            qryAux.FieldByName('nome_func').AsString)];

      tvFun.Items.AddChild( vItem1, FloatToStr(vLigRec+vLigSol) + ' Ligações');
      tvFun.Items.AddChild( vItem1, FloatToStr(vLigSol)         + ' Ligações Solicitadas');
      tvFun.Items.AddChild( vItem1, FloatToStr(vLigRec)         + ' Ligações Recebidas');
      tvFun.Items.AddChild( vItem1, FloatToStr(vLigPart)        + ' Origem Particular');
      tvFun.Items.AddChild( vItem1, FloatToStr(vLigFunc)        + ' Origem Funcionario');
      tvFun.Items.AddChild( vItem1, FloatToStr(vLigCli)         + ' Origem Cliente');

      tvFun.Items.AddChild( vItem1, FloatToStr(vAtendFec+vAtendAbe+vAtendEsp) + ' Atendimentos');
      tvFun.Items.AddChild( vItem1, FloatToStr(vAtendFec) + ' Atendimentos Fechados');
      tvFun.Items.AddChild( vItem1, FloatToStr(vAtendAbe) + ' Atendimentos Em Aberto');
      tvFun.Items.AddChild( vItem1, FloatToStr(vAtendEsp) + ' Atendimentos Em Espera');
      tvFun.Items.AddChild( vItem1, FloatToStr(vDocto) + ' Documentos entregues');
      tvFun.Items.AddChild( vItem1, formatfloat('0', vDia) + ' Dias, '+
                                    formatfloat('00', vHora) + ':'+
                                    formatfloat('00', vMin)  + ':'+
                                    ' Em Média para fechar um atendimento');
      qryAux.Next;
    end;
  end
  else
  begin
    {Departamento}
    sSql := 'SELECT * FROM GC_DEPARTAMENTO ';
    if edtDepto.Text <> '' then
      sSql := sSql + ' where cod_depto = ' + edtDepto.Text;

    sSql := sSql + ' order by desc_depto';

    qryAux.close;
    qryAux.Sql.Text := sSql;
    qryAux.open;

    tvDepto.Items.Clear;

    while not qryAux.Eof do
    begin
      {Ligações Solicitadas}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_ligacao lig where cod_depto = ' + qryAux.fieldbyname('cod_depto').AsString +
                          ' and tipo_ligacao = ''S''' + vFilLig;
      qryAux2.open;
      vLigSol := qryAux2.fieldbyname('total').AsFloat;

      {Ligações Recebidas}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_ligacao lig where cod_depto = ' + qryAux.fieldbyname('cod_depto').AsString +
                          ' and tipo_ligacao = ''R''' + vFilLig;
      qryAux2.open;
      vLigRec := qryAux2.fieldbyname('total').AsFloat;

      {Ligações Particulares}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_ligacao lig where cod_depto = ' + qryAux.fieldbyname('cod_depto').AsString +
                          ' and particular_lig = ''P''' + vFilLig;
      qryAux2.open;
      vLigPart := qryAux2.fieldbyname('total').AsFloat;

      {Ligações de Funcionarios}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_ligacao lig where cod_depto = ' + qryAux.fieldbyname('cod_depto').AsString +
                          ' and particular_lig = ''F''' + vFilLig;
      qryAux2.open;
      vLigFunc := qryAux2.fieldbyname('total').AsFloat;

      {Ligações de Clientes}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_ligacao lig where cod_depto = ' + qryAux.fieldbyname('cod_depto').AsString +
                          ' and particular_lig = ''C''' + vFilLig;
      qryAux2.open;
      vLigCli := qryAux2.fieldbyname('total').AsFloat;

      {Atendimentos Fechados}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_atendimento ate where ate.cod_depto = ' + qryAux.fieldbyname('cod_depto').AsString +
                          ' and ate.status_atend = ''F''' + vFilAte;
      qryAux2.open;
      vAtendFec := qryAux2.fieldbyname('total').AsFloat;

      {Atendimentos Aberto}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_atendimento ate where ate.cod_depto = ' + qryAux.fieldbyname('cod_depto').AsString +
                          ' and ate.status_atend = ''A''' + vFilAte;
      qryAux2.open;
      vAtendAbe := qryAux2.fieldbyname('total').AsFloat;

      {Atendimentos Espera}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_atendimento ate where ate.cod_depto = ' + qryAux.fieldbyname('cod_depto').AsString +
                          ' and ate.status_atend = ''E''' + vFilAte;
      qryAux2.open;
      vAtendEsp := qryAux2.fieldbyname('total').AsFloat;

      {Média de Fechamento dos Atendimentos}
      qryAux2.Sql.Text := 'select count(*) qtdatend, sum(oco.dt_ocorrencia - ate.dt_atend) total from gc_atendimento ate '+
                          ' inner join gc_ocorrencia oco on (ate.cod_atendimento = oco.cod_atendimento) '+
                          '  where ate.status_atend = ''F'' and oco.status_ocorr = ''F'' '+
                          '    and ate.cod_depto = ' + qryAux.fieldbyname('cod_depto').AsString + vFilAte;
      qryAux2.open;
      vMed       := qryAux2.FieldByName('Total').AsFloat;
      vQtdAtend  := qryAux2.FieldByName('qtdatend').AsInteger;
      try
        PegaDiaHoraMin(vMed / vQtdAtend, vDia, vHora, vMin );
      except
        vDia  := 0;
        vHora := 0;
        vMin  := 0;
      end;

      {Documentos com retorno de Protocolo = 'P'}
      qryAux2.close;
      qryAux2.Sql.Text := 'select count(*) total from gc_protocolo pro '+
                          ' inner join gc_documento_emitido emi on (pro.cod_protocolo = emi.cod_protocolo) '+
                          ' inner join gc_funcionario fun on (pro.cod_func_cad = fun.cod_func) '+
                          ' where cod_depto = ' + qryAux.fieldbyname('cod_depto').AsString +
                          '   and status_entrega = ''P''' + vFilPro;
      qryAux2.open;
      vDocto := qryAux2.fieldbyname('total').AsFloat;

      tvDepto.Items.Add( nil  ,formatfloat('000',qryAux.FieldByName('cod_depto').AsInteger) + '-' +
                            qryAux.FieldByName('desc_depto').AsString);

      vItem1 := tvDepto.Items[chamanode(tvDepto, formatfloat('000',qryAux.FieldByName('cod_depto').AsInteger) + '-' +
                            qryAux.FieldByName('desc_depto').AsString)];

      tvDepto.Items.AddChild( vItem1, FloatToStr(vLigRec+vLigSol)  + ' Ligações');
      tvDepto.Items.AddChild( vItem1, FloatToStr(vLigSol)          + ' Ligações Solicitadas');
      tvDepto.Items.AddChild( vItem1, FloatToStr(vLigRec)          + ' Ligações Recebidas');
      tvDepto.Items.AddChild( vItem1, FloatToStr(vLigPart)         + ' Origem Particular');
      tvDepto.Items.AddChild( vItem1, FloatToStr(vLigFunc)         + ' Origem Funcionario');
      tvDepto.Items.AddChild( vItem1, FloatToStr(vLigCli)          + ' Origem Cliente');

      tvDepto.Items.AddChild( vItem1, FloatToStr(vAtendFec+vAtendAbe+vAtendEsp) + ' Atendimentos');
      tvDepto.Items.AddChild( vItem1, FloatToStr(vAtendFec) + ' Atendimentos Fechados');
      tvDepto.Items.AddChild( vItem1, FloatToStr(vAtendAbe) + ' Atendimentos Em Aberto');
      tvDepto.Items.AddChild( vItem1, FloatToStr(vAtendEsp) + ' Atendimentos Em Espera');
      tvDepto.Items.AddChild( vItem1, FloatToStr(vDocto) + ' Documentos entregues');
      tvDepto.Items.AddChild( vItem1, formatfloat('0', vDia) + ' Dias, '+
                                    formatfloat('00', vHora) + ':'+
                                    formatfloat('00', vMin)  + ':'+
                                    ' Em Média para fechar um atendimento');
      qryAux.Next;
    end;
  end;

  qryAux2.close;
  qryAux2.Sql.Text := 'select count(*) total from gc_ligacao lig where '+
                      ' tipo_ligacao = ''S''' + vFilLig;
  qryAux2.open;
  vLigSol := qryAux2.fieldbyname('total').AsFloat;

  {Ligações Recebidas}
  qryAux2.close;
  qryAux2.Sql.Text := 'select count(*) total from gc_ligacao lig where ' +
                      ' tipo_ligacao = ''R''' + vFilLig;
  qryAux2.open;
  vLigRec := qryAux2.fieldbyname('total').AsFloat;

  {Ligações Particulares}
  qryAux2.close;
  qryAux2.Sql.Text := 'select count(*) total from gc_ligacao lig where '+
                      ' particular_lig = ''P''' + vFilLig;
  qryAux2.open;
  vLigPart := qryAux2.fieldbyname('total').AsFloat;

  {Ligações de Funcionarios}
  qryAux2.close;
  qryAux2.Sql.Text := 'select count(*) total from gc_ligacao lig where ' +
                      ' particular_lig = ''F''' + vFilLig;
  qryAux2.open;
  vLigFunc := qryAux2.fieldbyname('total').AsFloat;

  {Ligações de Clientes}
  qryAux2.close;
  qryAux2.Sql.Text := 'select count(*) total from gc_ligacao lig where ' +
                      ' particular_lig = ''C''' + vFilLig;
  qryAux2.open;
  vLigCli := qryAux2.fieldbyname('total').AsFloat;

  vlrSol.Value   := vLigSol;
  vlrRec.Value   := vLigRec;
  vlrLig.Value   := vLigRec+vLigSol;

  vlrSol2.Value   := vLigSol;
  vlrRec2.Value   := vLigRec;
  vlrLig2.Value   := vLigRec+vLigSol;

  vlrSol3.Value   := vLigSol;
  vlrRec3.Value   := vLigRec;
  vlrLig3.Value   := vLigRec+vLigSol;

  vlrParticular.Value   := vLigPart;
  vlrFuncionario.Value  := vLigFunc;
  vlrCliente.Value      := vLigCli;

  vlrParticular2.Value  := vLigPart;
  vlrFuncionario2.Value := vLigFunc;
  vlrCliente2.Value     := vLigCli;

  {Atendimentos Fechados}
  qryAux2.close;
  qryAux2.Sql.Text := 'select count(*) total from gc_atendimento ate where ate.status_atend = ''F''' + vFilAte;
  qryAux2.open;
  vAtendFec := qryAux2.fieldbyname('total').AsFloat;

  {Atendimentos Aberto}
  qryAux2.close;
  qryAux2.Sql.Text := 'select count(*) total from gc_atendimento ate where ate.status_atend = ''A''' + vFilAte;
  qryAux2.open;
  vAtendAbe := qryAux2.fieldbyname('total').AsFloat;

  {Atendimentos Espera}
  qryAux2.close;
  qryAux2.Sql.Text := 'select count(*) total from gc_atendimento ate where ate.status_atend = ''E''' + vFilAte;
  qryAux2.open;
  vAtendEsp := qryAux2.fieldbyname('total').AsFloat;

  {Média de Fechamento dos Atendimentos}
  qryAux2.Sql.Text := 'select count(*) qtdatend, sum(oco.dt_ocorrencia - ate.dt_atend) total from gc_atendimento ate '+
                      ' inner join gc_ocorrencia oco on (ate.cod_atendimento = oco.cod_atendimento) '+
                      '  where ate.status_atend = ''F'' and oco.status_ocorr = ''F'' ' + vFilAte;
  qryAux2.open;
  vMed       := qryAux2.FieldByName('Total').AsFloat;
  vQtdAtend  := qryAux2.FieldByName('qtdatend').AsInteger;
  try
    PegaDiaHoraMin(vMed / vQtdAtend, vDia, vHora, vMin );
  except
    vDia  := 0;
    vHora := 0;
    vMin  := 0;
  end;

  medDia3.Text  := formatfloat('0',vDia);
  medHora3.Text := formatfloat('00',vHora);
  medMin3.Text  := formatfloat('00',vMin);

  medDia2.Text  := formatfloat('0',vDia);
  medHora2.Text := formatfloat('00',vHora);
  medMin2.Text  := formatfloat('00',vMin);

  medDia.Text   := formatfloat('0',vDia);
  medHora.Text  := formatfloat('00',vHora);
  medMin.Text   := formatfloat('00',vMin);

  vlrFec3.Value   := vAtendFec;
  vlrAbe3.Value   := vAtendAbe;
  vlrEsp3.Value   := vAtendEsp;
  vlrAtend3.Value := vAtendFec+vAtendAbe+vAtendEsp;

  vlrFec2.Value   := vAtendFec;
  vlrAbe2.Value   := vAtendAbe;
  vlrEsp2.Value   := vAtendEsp;
  vlrAtend2.Value := vAtendFec+vAtendAbe+vAtendEsp;

  vlrFec.Value    := vAtendFec;
  vlrAbe.Value    := vAtendAbe;
  vlrEsp.Value    := vAtendEsp;
  vlrAtend.Value  := vAtendFec+vAtendAbe+vAtendEsp;

  qryAux2.close;
  qryAux2.Sql.Text := 'select count(*) total from gc_protocolo pro '+
                      ' inner join gc_documento_emitido emi on (pro.cod_protocolo = emi.cod_protocolo) '+
                      ' where status_entrega = ''P''' + vFilPro;
  qryAux2.open;
  vDocto := qryAux2.fieldbyname('total').AsFloat;

  vlrDoc3.Value   := vDocto;
  vlrDoc2.Value   := vDocto;
  vlrDoc.Value    := vDocto;

  messagedlg('Informações geradas com sucesso.',mtInformation,[mbOk],0);

end;

procedure PegaDiaHoraMin(pMedia : Double; var pDia, pHora, pMin : Integer );
var vHora : Double;
begin
  pDia  := round( Int(pMedia) );
  vHora := 24 * (pMedia - Int(pMedia));
  pHora := round( int(vHora) );
  pMin  := round(int(60 * ( vHora - int(vHora))));
end;

function ChamaNode(Items:TTreeView; vStr:String; pTodo : Boolean=False) : Integer;
var x : Integer;
begin
  result := -1;
  for x := 0 to Items.Items.Count-1 do
  begin
    if pTodo then
    begin
      if pos( vStr, items.items.Item[x].Text) > 0 then
      begin
        result := x;
        break;
      end;
    end
    else
    begin
      if vStr = items.items.Item[x].Text then
      begin
        result := x;
        break;
      end;
    end;
  end;
end;
procedure TGerenciaOcorrencia_f.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  dmPesq.PesCliente.StringSql.Clear;
  dmPesq.PesCliente.StringSql.Add('SELECT * FROM GC_CLIENTE ');
  dmPesq.PesCliente.StringSql.Add(' ORDER BY NOME_CLI');
  dmPesq.PesCliente.Execute;
  if trim(dmPesq.PesCliente.ValoresRetorno[2]) <> '' then
    tvCli.Selected := tvCli.Items.Item[ChamaNode(tvCli, dmPesq.PesCliente.ValoresRetorno[2], True)];
end;

procedure TGerenciaOcorrencia_f.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  dmPesq.PesFunc.Execute;
  if trim(dmPesq.PesFunc.ValoresRetorno[1]) <> '' then
    tvFun.Selected := tvFun.Items.Item[ChamaNode(tvFun, dmPesq.PesFunc.ValoresRetorno[1], True)];
end;

procedure TGerenciaOcorrencia_f.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  dmPesq.pesDepto.StringSql.Clear;
  dmPesq.pesDepto.StringSql.Add('SELECT * FROM GC_DEPARTAMENTO');
  dmPesq.PesDepto.Execute;
  if trim(dmPesq.PesDepto.ValoresRetorno[1]) <> '' then
    tvDepto.Selected := tvDepto.Items.Item[ChamaNode(tvDepto, dmPesq.PesDepto.ValoresRetorno[1], True)];
end;

procedure TGerenciaOcorrencia_f.FormCreate(Sender: TObject);
begin
  inherited;
  tsCli.TabVisible   := False;
  tsFun.TabVisible   := False;
  tsDepto.TabVisible := False;
end;

end.
