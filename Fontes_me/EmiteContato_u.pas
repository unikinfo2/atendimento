unit EmiteContato_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, RxCalc, Menus, StdCtrls, Buttons, Mask, Db, DBTables, ExtCtrls,
  ToolEdit;

type
  TEmiteContato_f = class(TDeriva_f)
    BitBtn1: TBitBtn;
    rgCliente: TRadioGroup;
    rgOrdem: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmiteContato_f: TEmiteContato_f;

implementation

uses qrClientes, Atendimento_dm, qrClientesSimples, qrClientesCompleta,
  qrContato;

{$R *.DFM}

procedure TEmiteContato_f.BitBtn1Click(Sender: TObject);
var sSql : String;
begin
  inherited;
  qrContato_f := TqrContato_f.Create(nil);
  sSql := 'SELECT * FROM GC_AGENDA  CON ';

  if rgCliente.itemindex = 1 then sSql := sSql + ' WHERE (con.email_contato IS NOT NULL)';
  if rgCliente.itemindex = 2 then sSql := sSql + ' WHERE (con.email_contato IS NULL)';

  if rgOrdem.ItemIndex = 0 then
    sSql := sSql + ' ORDER BY CON.NOME_CONTATO'
  else
    sSql := sSql + ' ORDER BY CON.EMPRESA_CONTATO, CON.NOME_CONTATO';
    
  qrContato_f.Query1.Close;
  qrContato_f.Query1.sql.Text := sSql;
  qrContato_f.Query1.Open;
  qrContato_f.Preview;
end;

end.
