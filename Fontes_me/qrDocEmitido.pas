unit qrDocEmitido;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TqrDocEmitido_f = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand3: TQRBand;
    Query1: TQuery;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    lblPeriodo: TQRLabel;
    QRExpr1: TQRExpr;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    lblStatus: TQRLabel;
    QRDBText7: TQRDBText;
    QRGroup2: TQRGroup;
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    lblTipo: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel12: TQRLabel;
    QRSubDetail1: TQRSubDetail;
    Query2: TQuery;
    QRDBText6: TQRDBText;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRDBText10: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    DataSource1: TDataSource;
    QRDBText11: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText12: TQRDBText;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qrDocEmitido_f: TqrDocEmitido_f;

implementation
uses principal;
{$R *.DFM}

procedure TqrDocEmitido_f.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if query1.FieldByName('status_atend').AsString = 'A' then
    lblStatus.Caption := 'Aberto'
  else if query1.FieldByName('status_atend').AsString = 'F' then
    lblStatus.Caption := 'Fechado'
  else if query1.FieldByName('status_atend').AsString = 'C' then
    lblStatus.Caption := 'Cancelado'
  else if query1.FieldByName('status_atend').AsString = 'E' then
    lblStatus.Caption := 'Espera';

end;

procedure TqrDocEmitido_f.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if query1.FieldByName('tipo_atend').AsString = '0' then
    lblTipo.Caption := 'Tipo de Atendimento: Solicitação'
  else if query1.FieldByName('tipo_atend').AsString = '1' then
    lblTipo.Caption := 'Tipo de Atendimento: Reenvio'
  else if query1.FieldByName('tipo_atend').AsString = '2' then
    lblTipo.Caption := 'Tipo de Atendimento: Recalculo'
  else if query1.FieldByName('tipo_atend').AsString = '3' then
    lblTipo.Caption := 'Tipo de Atendimento: Reclamação'
  else if query1.FieldByName('tipo_atend').AsString = '4' then
    lblTipo.Caption := 'Tipo de Atendimento: Observação'
  else if query1.FieldByName('tipo_atend').AsString = '5' then
    lblTipo.Caption := 'Tipo de Atendimento: Atendimento ao Cliente'
  else
    lblTipo.Caption := 'Tipo de Atendimento: Outros';
end;

end.
