unit EmiteAtendLig_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, RxCalc, Menus, StdCtrls, Buttons, Mask, Db, DBTables, ExtCtrls,
  ToolEdit, funcoes;

type
  TEmiteAtendLig_f = class(TDeriva_f)
    BitBtn1: TBitBtn;
    medCliente: TMaskEdit;
    Label1: TLabel;
    sbPesq: TSpeedButton;
    edtNomeCli: TEdit;
    Label2: TLabel;
    qryAux: TQuery;
    Label3: TLabel;
    Label4: TLabel;
    dtAte: TDateEdit;
    dtDe: TDateEdit;
    edtCodigo: TEdit;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    edtFunc: TEdit;
    Label5: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure sbPesqClick(Sender: TObject);
    procedure medClienteExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmiteAtendLig_f: TEmiteAtendLig_f;

implementation

uses qrAtendLig, Atendimento_dm, principal;

{$R *.DFM}

procedure TEmiteAtendLig_f.BitBtn1Click(Sender: TObject);
var sSql, dtIni, dtFin : String;
begin
  inherited;
  qrAtendLig_f := TqrAtendLig_f.Create(nil);

  {LIGAÇÕES ATENDIMENTOS}
  sSql := 'SELECT DISTINCT CLI.*, FUN.* FROM GC_CLIENTE CLI '+ cr +
          ' LEFT JOIN GC_ATENDIMENTO  ATE ON (CLI.COD_CLIENTE = ATE.COD_CLIENTE) '+ cr +
          ' LEFT JOIN GC_FUNCIONARIO  FUN ON (FUN.COD_FUNC = ATE.COD_FUNC) ' +  cr;
  if medCliente.text <> '' then
    sSql := sSql + ' WHERE CLI.TIPO_CLIFOR IN (''C'', ''R'') AND CLI.COD_CLIENTE = ' + medCliente.text +  cr
  else
    sSql := sSql + ' WHERE CLI.TIPO_CLIFOR IN (''C'', ''R'') AND CLI.COD_CLIENTE >= 0' +  cr;

  if edtCodigo.text <> '' then
    sSql := sSql + ' AND ATE.COD_FUNC = ' + edtCodigo.Text +  cr;

  if (dtDe.Text <> '  /  /    ') and (dtAte.Text <> '  /  /    ') then
  begin
    dtini  := formatDateTime('mm/dd/yyyy',dtDe.date)  + ' 00:00:00';
    dtFin  := formatDateTime('mm/dd/yyyy',dtAte.date) + ' 23:59:59';
    sSql := sSql +   ' and ATE.DT_ATEND >= cast( '''+ dtIni + ''' as timestamp) ' + cr;
    sSql := sSql +   ' and ATE.DT_ATEND <= cast( '''+ dtfin + ''' as timestamp) ' + cr;
  end;

  {LIGAÇÕES SOLICITADAS}
  sSql := sSql + ' UNION ' + cr +
          ' SELECT CLI2.*, FUN2.* '+ cr +
          ' FROM GC_CLIENTE CLI2 '+ cr +
          ' LEFT JOIN GC_LIGACAO  LIG ON (CLI2.COD_CLIENTE = LIG.COD_CLIENTE) '+ cr +
          ' LEFT JOIN GC_FUNCIONARIO  FUN2 ON (FUN2.COD_FUNC = LIG.COD_FUNC) '+ cr;

  if medCliente.text <> '' then
    sSql := sSql + ' WHERE CLI2.TIPO_CLIFOR IN (''C'', ''R'') AND CLI2.COD_CLIENTE = ' + medCliente.text +  cr
  else
    sSql := sSql + ' WHERE CLI2.TIPO_CLIFOR IN (''C'', ''R'') AND CLI2.COD_CLIENTE >= 0'+ cr;

  if edtCodigo.text <> '' then
    sSql := sSql + ' AND LIG.COD_FUNC = ' + edtCodigo.Text +  cr;

  sSql := sSql + ' AND LIG.TIPO_LIGACAO = ''S'' ' + cr;
  if (dtDe.Text <> '  /  /    ') and (dtAte.Text <> '  /  /    ') then
  begin
    dtini  := formatDateTime('mm/dd/yyyy',dtDe.date)  + ' 00:00:00';
    dtFin  := formatDateTime('mm/dd/yyyy',dtAte.date) + ' 23:59:59';
    sSql := sSql +   ' AND LIG.DT_PEDIDO_LIG >= cast( '''+ dtIni + ''' as timestamp) '+ cr;
    sSql := sSql +   ' AND LIG.DT_PEDIDO_LIG <= cast( '''+ dtfin + ''' as timestamp) '+ cr;
  end;

  {LIGAÇÕES RECEBIDAS}
  sSql := sSql + ' UNION ' +  cr +
          ' SELECT CLI2.*, FUN2.* '+ cr +
          ' FROM GC_CLIENTE CLI2 '+ cr +
          ' LEFT JOIN GC_LIGACAO  LIG ON (CLI2.COD_CLIENTE = LIG.COD_CLIENTE) '+ cr +
          ' LEFT JOIN GC_FUNCIONARIO  FUN2 ON (FUN2.COD_FUNC = LIG.COD_FUNC) '+ cr;

  if medCliente.text <> '' then
    sSql := sSql + ' WHERE CLI2.TIPO_CLIFOR IN (''C'', ''R'') AND CLI2.COD_CLIENTE = ' + medCliente.text + cr
  else
    sSql := sSql + ' WHERE CLI2.TIPO_CLIFOR IN (''C'', ''R'') AND CLI2.COD_CLIENTE >= 0'+ cr;

  if edtCodigo.text <> '' then
    sSql := sSql + ' AND LIG.COD_FUNC = ' + edtCodigo.Text +  cr;

  sSql := sSql + ' AND LIG.TIPO_LIGACAO = ''R'' ' + cr;
  if (dtDe.Text <> '  /  /    ') and (dtAte.Text <> '  /  /    ') then
  begin
    dtini  := formatDateTime('mm/dd/yyyy',dtDe.date)  + ' 00:00:00';
    dtFin  := formatDateTime('mm/dd/yyyy',dtAte.date) + ' 23:59:59';
    sSql := sSql +   ' AND LIG.DT_PEDIDO_LIG >= cast( '''+ dtIni + ''' as timestamp) ' + cr;
    sSql := sSql +   ' AND LIG.DT_PEDIDO_LIG <= cast( '''+ dtfin + ''' as timestamp) ' +  cr;
  end;
  sSql := sSql + ' ORDER BY 5' + cr;

  qrAtendLig_f.lblPeriodo.Caption := 'Período de '+dtDe.Text+ ' até '+dtAte.Text;
  qrAtendLig_f.Query1.Close;
  qrAtendLig_f.Query1.sql.Text := sSql;
  qrAtendLig_f.Query1.Open;
  qrAtendLig_f.Preview;

end;

procedure TEmiteAtendLig_f.sbPesqClick(Sender: TObject);
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

procedure TEmiteAtendLig_f.medClienteExit(Sender: TObject);
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

procedure TEmiteAtendLig_f.FormShow(Sender: TObject);
begin
  inherited;
  dtDe.Date  := Date() - StrToInt(LerIni(caminho+'Atendimento.ini','Identificacao','Historico'));
  dtAte.Date := Date();
end;

procedure TEmiteAtendLig_f.SpeedButton1Click(Sender: TObject);
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

procedure TEmiteAtendLig_f.edtCodigoExit(Sender: TObject);
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

end.
