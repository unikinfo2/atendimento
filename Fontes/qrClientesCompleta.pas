unit qrClientesCompleta;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TqrClientesCompleta_f = class(TQuickRep)
    QRBand1: TQRBand;
    Query1: TQuery;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText4: TQRDBText;
    lblTipo: TQRLabel;
    QRDBText1: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText5: TQRDBText;
    QRDBText6: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel8: TQRLabel;
    lblClass: TQRLabel;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel10: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel11: TQRLabel;
    QRDBText10: TQRDBText;
    QRLabel12: TQRLabel;
    QRDBText11: TQRDBText;
    QRLabel15: TQRLabel;
    QRDBText12: TQRDBText;
    QRDBText13: TQRDBText;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRDBText14: TQRDBText;
    QRLabel18: TQRLabel;
    QRDBText15: TQRDBText;
    QRLabel19: TQRLabel;
    QRDBText16: TQRDBText;
    QRLabel20: TQRLabel;
    QRDBText17: TQRDBText;
    QRLabel21: TQRLabel;
    QRDBText18: TQRDBText;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRDBText19: TQRDBText;
    QRDBText20: TQRDBText;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qrClientesCompleta_f: TqrClientesCompleta_f;

implementation
uses principal;
{$R *.DFM}

procedure TqrClientesCompleta_f.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  QRLabel9.Font.Style  := [];
  QRLabel18.Font.Style := [];
  if query1.FieldByName('correspondencia_cli').AsString = '1' then
    QRLabel9.Font.Style := [fsBold,fsUnderline];
  if query1.FieldByName('correspondencia_cli').AsString = '2' then
    QRLabel18.Font.Style := [fsBold,fsUnderline];

  if query1.FieldByName('ativo_cli').AsString = 'A' then lblTipo.Caption := 'Ativo';
  if query1.FieldByName('ativo_cli').AsString = 'P' then lblTipo.Caption := 'Pré-Cliente';
  if query1.FieldByName('ativo_cli').AsString = 'I' then lblTipo.Caption := 'Inativo';

  if query1.FieldByName('tipo_clifor').AsString = 'C' then lblClass.Caption := 'Cliente';
  if query1.FieldByName('tipo_clifor').AsString = 'F' then lblClass.Caption := 'Fornecedor';
  if query1.FieldByName('tipo_clifor').AsString = 'R' then lblClass.Caption := 'Cliente/Fornecedor';

end;

end.
