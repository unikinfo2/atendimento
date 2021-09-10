unit qrMemorando;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TqrMemorando_f = class(TQuickRep)
    Query1: TQuery;
    QRBand1: TQRBand;
    QRSysData1: TQRSysData;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBRichText1: TQRDBRichText;
    QRLabel6: TQRLabel;
    QRDBText3: TQRDBText;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    lblPara: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qrMemorando_f: TqrMemorando_f;

implementation
uses principal;
{$R *.DFM}

procedure TqrMemorando_f.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var nome : String;
begin
  with tQuery.Create(self) do
  begin
    close;
    DatabaseName := 'db';
    sql.Text := 'SELECT * FROM GC_MEMORANDO_FUNC MEM INNER JOIN GC_FUNCIONARIO FUN '+
                ' ON (MEM.COD_FUNC = FUN.COD_FUNC) WHERE MEM.COD_MEMO='+query1.fieldbyname('cod_memo').AsString;
    open;
    nome := '';
    while not eof do
    begin
      nome := nome + fieldbyname('apelido_func').AsString;
      next;
      if not eof then nome := nome + ', ';
    end;
  end;
  lblPara.Caption := nome;
end;

end.
