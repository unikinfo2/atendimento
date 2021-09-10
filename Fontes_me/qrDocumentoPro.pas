unit qrDocumentoPro;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, funcoes;

type
  TqrDocumentoPro_f = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand3: TQRBand;
    Query1: TQuery;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    lblPeriodo: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    Query2: TQuery;
    QRLabel7: TQRLabel;
    QRDBText4: TQRDBText;
    QRDBText5: TQRDBText;
    QRLabel8: TQRLabel;
    lblSituacao: TQRLabel;
    QRLabel5: TQRLabel;
    QRDBText6: TQRDBText;
    QRLabel6: TQRLabel;
    QRDBText7: TQRDBText;
    QRLabel9: TQRLabel;
    QRDBText8: TQRDBText;
    QRDBText9: TQRDBText;
    QRLabel10: TQRLabel;
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRGroup1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    gerAtend, gerRec, gerSol : Integer;

  public

  end;

var
  qrDocumentoPro_f: TqrDocumentoPro_f;

implementation
uses principal, EmiteAtendLig_u;
{$R *.DFM}

procedure TqrDocumentoPro_f.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  gerAtend := 0;
  gerRec   := 0;
  gerSol   := 0;
end;

procedure TqrDocumentoPro_f.QRGroup1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  lblSituacao.Caption := '';
  if      query1.fieldbyname('Status_Entrega').AsString = 'M' then lblSituacao.Caption := 'Emitido'
  else if query1.fieldbyname('Status_Entrega').AsString = 'X' then lblSituacao.Caption := 'Expedido'
  else if query1.fieldbyname('Status_Entrega').AsString = 'R' then lblSituacao.Caption := 'Retirado'
  else if query1.fieldbyname('Status_Entrega').AsString = 'E' then lblSituacao.Caption := 'Entregue'
  else if query1.fieldbyname('Status_Entrega').AsString = 'D' then lblSituacao.Caption := 'Devolvido'
  else if query1.fieldbyname('Status_Entrega').AsString = 'N' then lblSituacao.Caption := 'Endereço Errado'
  else if query1.fieldbyname('Status_Entrega').AsString = 'C' then lblSituacao.Caption := 'Entrega Cancelada'
  else if query1.fieldbyname('Status_Entrega').AsString = 'P' then lblSituacao.Caption := 'Entregue com Retorno de Protocolo';

end;

end.
