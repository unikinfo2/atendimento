unit qrLigacao_u;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables;

type
  TqrLigacao_f = class(TQuickRep)
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
    QRGroup2: TQRGroup;
    QRBand4: TQRBand;
    QRLabel11: TQRLabel;
    QRExpr2: TQRExpr;
    QRLabel9: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel2: TQRLabel;
    QRDBText1: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    lblquem: TQRLabel;
    QRLabel15: TQRLabel;
    QRDBText8: TQRDBText;
    QRLabel16: TQRLabel;
    QRDBText9: TQRDBText;
    QRLabel8: TQRLabel;
    QRDBText7: TQRDBText;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRGroup2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qrLigacao_f: TqrLigacao_f;

implementation
uses principal;
{$R *.DFM}

procedure TqrLigacao_f.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  if query1.FieldByName('status_lig').AsString = 'A' then
    lblStatus.Caption := 'Aberto'
  else if query1.FieldByName('status_lig').AsString = 'F' then
    lblStatus.Caption := 'Fechado'
  else if query1.FieldByName('status_lig').AsString = 'E' then
    lblStatus.Caption := 'Espera';

  if query1.FieldByName('tipo_ligacao').AsString = 'S' then
    lblStatus.Caption := lblStatus.Caption + '/Solicitada'
  else if query1.FieldByName('tipo_ligacao').AsString = 'R' then
    lblStatus.Caption := lblStatus.Caption + '/Recebida';

  if query1.FieldByName('quemfala').AsString = 'E' then
    lblquem.Caption := 'Requisitante'
  else
    lblquem.Caption := 'Recepcionista';
end;

procedure TqrLigacao_f.QRGroup2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
{  if query1.FieldByName('tipo_atend').AsString = '0' then
    lblTipo.Caption := 'Tipo de Atendimento: Solicitação'
  else if query1.FieldByName('tipo_atend').AsString = '1' then
    lblTipo.Caption := 'Tipo de Atendimento: Reenvio'
  else if query1.FieldByName('tipo_atend').AsString = '2' then
    lblTipo.Caption := 'Tipo de Atendimento: Recalculo'
  else if query1.FieldByName('tipo_atend').AsString = '3' then
    lblTipo.Caption := 'Tipo de Atendimento: Reclamação'
  else if query1.FieldByName('tipo_atend').AsString = '4' then
    lblTipo.Caption := 'Tipo de Atendimento: Observação'
  else
    lblTipo.Caption := 'Tipo de Atendimento: Outros';}
end;

end.
