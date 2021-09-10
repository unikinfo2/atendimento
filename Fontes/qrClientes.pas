unit qrClientes;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TqrClientes_f = class(TQuickRep)
    QRBand1: TQRBand;
    Query1: TQuery;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRDBText4: TQRDBText;
    lblTipo: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText1: TQRDBText;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qrClientes_f: TqrClientes_f;

implementation
uses principal;
{$R *.DFM}

procedure TqrClientes_f.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if query1.FieldByName('ativo_cli').AsString = 'A' then lblTipo.Caption := 'Ativo';
  if query1.FieldByName('ativo_cli').AsString = 'P' then lblTipo.Caption := 'Pr�-Cliente';
  if query1.FieldByName('ativo_cli').AsString = 'I' then lblTipo.Caption := 'Inativo';
end;

end.
