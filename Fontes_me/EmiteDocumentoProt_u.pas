unit EmiteDocumentoProt_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, RxCalc, Menus, StdCtrls, Buttons, Mask, Db, DBTables, ExtCtrls,
  ToolEdit, funcoes, DBCtrls;

type
  TEmiteDocumentoProt_f = class(TDeriva_f)
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
    edtCodDocto: TEdit;
    Label5: TLabel;
    sbPesDocto: TSpeedButton;
    edtDescDocto: TEdit;
    Label6: TLabel;
    rgOrdem: TRadioGroup;
    chkOrdem: TCheckBox;
    rgFiltro: TRadioGroup;
    Label15: TLabel;
    Query1: TQuery;
    cbDepto: TDBLookupComboBox;
    DataSource1: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure sbPesqClick(Sender: TObject);
    procedure medClienteExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edtCodDoctoExit(Sender: TObject);
    procedure sbPesDoctoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmiteDocumentoProt_f: TEmiteDocumentoProt_f;

implementation

uses qrAtendLig, Atendimento_dm, principal, qrDocumentoPro;

{$R *.DFM}

procedure TEmiteDocumentoProt_f.BitBtn1Click(Sender: TObject);
var sSql, dtIni, dtFin : String;
begin
  inherited;

  qrDocumentoPro_f := TqrDocumentoPro_f.Create(nil);

  sSql := 'SELECT * FROM GC_PROTOCOLO PRO '+
          ' INNER JOIN GC_DOCUMENTO_EMITIDO EMI ON (PRO.COD_PROTOCOLO=EMI.COD_PROTOCOLO) '+ cr +
          ' INNER JOIN GC_CLIENTE   CLI ON (CLI.COD_CLIENTE = PRO.COD_CLIENTE) '+ cr +
          ' INNER JOIN GC_DOCUMENTO DOC ON (EMI.COD_DOCTO = DOC.COD_DOCTO) ' + cr +
          ' INNER JOIN GC_FUNCIONARIO FUN ON (PRO.COD_FUNC_CAD = FUN.COD_FUNC) ' + cr;

  if medCliente.text <> '' then
    sSql := sSql + ' WHERE CLI.TIPO_CLIFOR IN (''C'', ''R'') AND CLI.COD_CLIENTE = ' + medCliente.text +  cr
  else
    sSql := sSql + ' WHERE CLI.TIPO_CLIFOR IN (''C'', ''R'') AND CLI.COD_CLIENTE >= 0' +  cr;

  if edtCodDocto.text <> '' then
    sSql := sSql + ' AND EMI.COD_DOCTO = ' + edtCodDocto.Text +  cr;

  if (dtDe.Text <> '  /  /    ') and (dtAte.Text <> '  /  /    ') then
  begin
    dtini  := formatDateTime('mm/dd/yyyy',dtDe.date)  + ' 00:00:00';
    dtFin  := formatDateTime('mm/dd/yyyy',dtAte.date) + ' 23:59:59';
    sSql := sSql +   ' AND PRO.DT_EMISSAO_PROTO >= cast( '''+ dtIni + ''' as timestamp) ' + cr;
    sSql := sSql +   ' AND PRO.DT_EMISSAO_PROTO <= cast( '''+ dtfin + ''' as timestamp) ' + cr;
  end;

  case rgFiltro.ItemIndex of
    1 : sSql := sSql +   ' AND PRO.STATUS_ENTREGA = ''M''';
    2 : sSql := sSql +   ' AND PRO.STATUS_ENTREGA = ''X''';
    3 : sSql := sSql +   ' AND PRO.STATUS_ENTREGA = ''R''';
    4 : sSql := sSql +   ' AND PRO.STATUS_ENTREGA = ''E''';
    5 : sSql := sSql +   ' AND PRO.STATUS_ENTREGA = ''D''';
    6 : sSql := sSql +   ' AND PRO.STATUS_ENTREGA = ''N''';
    7 : sSql := sSql +   ' AND PRO.STATUS_ENTREGA = ''C''';
    8 : sSql := sSql +   ' AND PRO.STATUS_ENTREGA = ''P''';
  end;

  if cbDepto.Text <> '' then
    sSql := sSql +   ' AND FUN.COD_DEPTO = ' + query1.FieldByName('Cod_Depto').AsString;

  if not chkOrdem.Checked then
  begin
    if rgOrdem.ItemIndex = 0 then
      sSql := sSql + ' ORDER BY PRO.COD_PROTOCOLO'
    else if rgOrdem.ItemIndex = 1 then
      sSql := sSql + ' ORDER BY CLI.NOME_CLI, PRO.COD_PROTOCOLO'
    else if rgOrdem.ItemIndex = 2 then
      sSql := sSql + ' ORDER BY PRO.DT_EMISSAO_PROTO, CLI.NOME_CLI, PRO.COD_PROTOCOLO';
  end
  else
  begin
    if rgOrdem.ItemIndex = 0 then
      sSql := sSql + ' ORDER BY PRO.COD_PROTOCOLO DESC'
    else if rgOrdem.ItemIndex = 1 then
      sSql := sSql + ' ORDER BY CLI.NOME_CLI DESC, PRO.COD_PROTOCOLO'
    else if rgOrdem.ItemIndex = 2 then
      sSql := sSql + ' ORDER BY PRO.DT_EMISSAO_PROTO DESC, CLI.NOME_CLI, PRO.COD_PROTOCOLO';
  end;

  qrDocumentoPro_f.lblPeriodo.Caption := 'Período Emissão de '+dtDe.Text+ ' até '+dtAte.Text;
  qrDocumentoPro_f.Query1.Close;
  qrDocumentoPro_f.Query1.sql.Text := sSql;
  qrDocumentoPro_f.Query1.Open;
  qrDocumentoPro_f.Preview;

  query1.Close;
  cbDepto.KeyValue := 0;
  query1.Open;
end;

procedure TEmiteDocumentoProt_f.sbPesqClick(Sender: TObject);
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

procedure TEmiteDocumentoProt_f.medClienteExit(Sender: TObject);
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

procedure TEmiteDocumentoProt_f.FormShow(Sender: TObject);
begin
  inherited;
  dtDe.Date  := Date() - StrToInt(LerIni(caminho+'Atendimento.ini','Identificacao','Historico'));
  dtAte.Date := Date();
  query1.close;
  query1.open;
end;

procedure TEmiteDocumentoProt_f.edtCodDoctoExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
  edtDescDocto.Clear;
  if edtCodDocto.Text <> '' then
  begin
    qryAux.Close;
    qryAux.SQL.Text := 'SELECT * FROM GC_DOCUMENTO WHERE COD_DOCTO = :COD_DOCTO';
    qryAux.ParamByName('Cod_Docto').AsString := edtCodDocto.Text;
    qryAux.Open;
    if qryAux.eof then
    begin
      messagedlg('Documento não cadastrado, cadastre e tente novamente.',mtInformation,[mbOk],0);
      edtCodDocto.SetFocus;
    end
    else
    begin
      edtDescDocto.Text := qryAux.FieldByName('Desc_Docto').AsString;
    end;
  end
  else
    edtDescDocto.Clear;
end;

procedure TEmiteDocumentoProt_f.sbPesDoctoClick(Sender: TObject);
begin
  inherited;
  dmPesq.PesDocto.Execute;
  if dmPesq.PesDocto.ValoresRetorno[1] <> '' then
  begin
    edtCodDocto.Text  := dmPesq.PesDocto.ValoresRetorno[1];
    edtDescDocto.Text := dmPesq.PesDocto.ValoresRetorno[0];
  end
end;

end.
