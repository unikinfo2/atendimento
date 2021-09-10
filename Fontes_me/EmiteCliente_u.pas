unit EmiteCliente_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, RxCalc, Menus, StdCtrls, Buttons, Mask, Db, DBTables, ExtCtrls,
  ToolEdit;

type
  TEmiteCliente_f = class(TDeriva_f)
    BitBtn1: TBitBtn;
    rgOrdem: TRadioGroup;
    rgFiltro: TRadioGroup;
    rgCliente: TRadioGroup;
    rgTipo: TRadioGroup;
    rgTipoList: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmiteCliente_f: TEmiteCliente_f;

implementation

uses qrClientes, Atendimento_dm, qrClientesSimples, qrClientesCompleta;

{$R *.DFM}

procedure TEmiteCliente_f.BitBtn1Click(Sender: TObject);
var sSql : String;
begin
  inherited;
  qrClientes_f         := TqrClientes_f.Create(nil);
  qrClientesSimples_f  := TqrClientesSimples_f.Create(nil);
  qrClientesCompleta_f := TqrClientesCompleta_f.Create(nil);

  sSql := 'SELECT * FROM GC_CLIENTE  CLI ';

  if rgFiltro.itemindex = 0 then sSql := sSql + ' WHERE cli.ativo_cli IS NOT NULL';
  if rgFiltro.itemindex = 1 then sSql := sSql + ' WHERE cli.ativo_cli = ''A''';
  if rgFiltro.itemindex = 2 then sSql := sSql + ' WHERE cli.ativo_cli = ''P''';
  if rgFiltro.itemindex = 3 then sSql := sSql + ' WHERE cli.ativo_cli = ''I''';

  if rgCliente.itemindex = 1 then sSql := sSql + ' AND (cli.email_cli IS NOT NULL)';
  if rgCliente.itemindex = 2 then sSql := sSql + ' AND (cli.email_cli IS NULL)';

  if rgTipoList.itemindex = 1 then sSql := sSql + ' AND cli.tipo_clifor IN (''C'',''R'')';
  if rgTipoList.itemindex = 2 then sSql := sSql + ' AND cli.tipo_clifor IN (''F'',''R'')';


  if rgOrdem.itemindex = 0 then sSql := sSql + ' ORDER BY CLI.NOME_CLI';
  if rgOrdem.itemindex = 1 then sSql := sSql + ' ORDER BY CLI.COD_CLIENTE';


  if rgTipo.itemindex = 0 then
  begin
    qrClientes_f.Query1.Close;
    qrClientes_f.Query1.sql.Text := sSql;
    qrClientes_f.Query1.Open;
    qrClientes_f.Preview;
  end;
  if rgTipo.itemindex = 1 then
  begin
    qrClientesSimples_f.Query1.Close;
    qrClientesSimples_f.Query1.sql.Text := sSql;
    qrClientesSimples_f.Query1.Open;
    qrClientesSimples_f.Preview;
  end;
  if rgTipo.itemindex = 2 then
  begin
    qrClientesCompleta_f.Query1.Close;
    qrClientesCompleta_f.Query1.sql.Text := sSql;
    qrClientesCompleta_f.Query1.Open;
    qrClientesCompleta_f.Preview;
  end;
end;

end.
