unit qrContato;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TqrContato_f = class(TQuickRep)
    QRBand1: TQRBand;
    Query1: TQuery;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRBand2: TQRBand;
    QRLabel14: TQRLabel;
    QRDBText4: TQRDBText;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText2: TQRDBText;
    QRDBText7: TQRDBText;
    QRLabel7: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
  private

  public

  end;

var
  qrContato_f: TqrContato_f;

implementation
uses principal;
{$R *.DFM}

end.
