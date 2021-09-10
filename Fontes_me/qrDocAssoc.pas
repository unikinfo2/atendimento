unit qrDocAssoc;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TqrDocAssoc_f = class(TQuickRep)
    QRBand1: TQRBand;
    Query1: TQuery;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    lblCliente: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel6: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    codcliente : Integer;

  public

  end;

var
  qrDocAssoc_f: TqrDocAssoc_f;

implementation
uses principal;
{$R *.DFM}

procedure TqrDocAssoc_f.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if query1.FieldByName('cod_cliente').AsInteger <> codcliente then
  begin
    CodCliente := query1.FieldByName('cod_cliente').AsInteger;
    lblCliente.Caption := formatfloat('00000',query1.FieldByName('cod_cliente').AsInteger) + ' - ' + query1.FieldByName('nome_cli').AsString
  end
  else
    lblCliente.Caption := '';
end;

end.
