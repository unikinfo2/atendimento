unit qrAtendLig;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, funcoes;

type
  TqrAtendLig_f = class(TQuickRep)
    QRBand1: TQRBand;
    QRBand3: TQRBand;
    Query1: TQuery;
    QRLabel1: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRSysData1: TQRSysData;
    QRSysData2: TQRSysData;
    lblPeriodo: TQRLabel;
    QRLabel10: TQRLabel;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRDBText3: TQRDBText;
    QRDBText1: TQRDBText;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel16: TQRLabel;
    QRDBText2: TQRDBText;
    QRLabel2: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    lblAtend: TQRLabel;
    lblRec: TQRLabel;
    lblSol: TQRLabel;
    Query2: TQuery;
    totAtend: TQRLabel;
    totRec: TQRLabel;
    totSol: TQRLabel;
    QRBand4: TQRBand;
    QRLabel7: TQRLabel;
    lblAtendG: TQRLabel;
    lblRecG: TQRLabel;
    lblSolG: TQRLabel;
    procedure QRBand2BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QuickRepBeforePrint(Sender: TCustomQuickRep;
      var PrintReport: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand4BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private
    gerAtend,  gerRec,  gerSol  : Integer;
    gerAtend2, gerRec2, gerSol2 : Integer;

  public

  end;

var
  qrAtendLig_f: TqrAtendLig_f;

implementation
uses principal, EmiteAtendLig_u;
{$R *.DFM}

procedure TqrAtendLig_f.QRBand2BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var sSql, dtini, dtfin:String;
begin

  query2.Close;
  sSql            := 'SELECT CLI.COD_CLIENTE, CLI.NOME_CLI, ATE.COD_FUNC, COUNT(*) TOTAL '+
                     ' FROM GC_CLIENTE CLI '+
                     ' INNER JOIN GC_ATENDIMENTO ATE ON (CLI.COD_CLIENTE = ATE.COD_CLIENTE) '+
                     ' WHERE ATE.COD_FUNC =  ' + query1.fieldbyname('Cod_Func').AsString + ' AND '+
                     '       CLI.COD_CLIENTE = '+ query1.fieldbyname('Cod_Cliente').AsString;

  if (EmiteAtendLig_f.dtDe.Text <> '  /  /    ') and (EmiteAtendLig_f.dtAte.Text <> '  /  /    ') then
  begin
    dtini  := formatDateTime('mm/dd/yyyy',EmiteAtendLig_f.dtDe.date)  + ' 00:00:00';
    dtFin  := formatDateTime('mm/dd/yyyy',EmiteAtendLig_f.dtAte.date) + ' 23:59:59';
    sSql := sSql +   ' AND ATE.DT_ATEND >= cast( '''+ dtIni + ''' as timestamp) ' + cr;
    sSql := sSql +   ' AND ATE.DT_ATEND <= cast( '''+ dtfin + ''' as timestamp) ' +  cr;
  end;
  sSQl := sSql + ' GROUP BY CLI.COD_CLIENTE, CLI.NOME_CLI, ATE.COD_FUNC';
  query2.SQL.Text := sSql;
  query2.Open;
  lblAtend.Caption := formatfloat('####0', query2.fieldbyname('Total').AsInteger);
  gerAtend := gerAtend + query2.fieldbyname('Total').AsInteger;

  query2.Close;
  sSql            := 'SELECT CLI.COD_CLIENTE, CLI.NOME_CLI, LIG.COD_FUNC, COUNT(*) TOTAL '+
                     ' FROM GC_CLIENTE CLI '+
                     ' INNER JOIN GC_LIGACAO LIG ON (CLI.COD_CLIENTE = LIG.COD_CLIENTE) ' +
                     ' WHERE LIG.COD_FUNC =  ' + query1.fieldbyname('Cod_Func').AsString  + ' AND '+
                     '       CLI.COD_CLIENTE = '+ query1.fieldbyname('Cod_Cliente').AsString + ' AND '+
                     '       LIG.TIPO_LIGACAO = ''R'' ' + cr;
  if (EmiteAtendLig_f.dtDe.Text <> '  /  /    ') and (EmiteAtendLig_f.dtAte.Text <> '  /  /    ') then
  begin
    dtini  := formatDateTime('mm/dd/yyyy',EmiteAtendLig_f.dtDe.date)  + ' 00:00:00';
    dtFin  := formatDateTime('mm/dd/yyyy',EmiteAtendLig_f.dtAte.date) + ' 23:59:59';
    sSql := sSql +   ' AND LIG.DT_PEDIDO_LIG >= cast( '''+ dtIni + ''' as timestamp) ' + cr;
    sSql := sSql +   ' AND LIG.DT_PEDIDO_LIG <= cast( '''+ dtfin + ''' as timestamp) ' +  cr;
  end;
  sSQl := sSql + ' GROUP BY CLI.COD_CLIENTE, CLI.NOME_CLI, LIG.COD_FUNC';
  query2.SQL.Text := sSql;
  query2.Open;
  lblRec.Caption := formatfloat('####0', query2.fieldbyname('Total').AsInteger);
  gerRec   := gerRec   + query2.fieldbyname('Total').AsInteger;

  query2.Close;
  sSql            := 'SELECT CLI.COD_CLIENTE, CLI.NOME_CLI, LIG.COD_FUNC, COUNT(*) TOTAL '+
                     ' FROM GC_CLIENTE CLI '+
                     ' INNER JOIN GC_LIGACAO LIG ON (CLI.COD_CLIENTE = LIG.COD_CLIENTE) ' +
                     ' WHERE LIG.COD_FUNC =  ' + query1.fieldbyname('Cod_Func').AsString  + ' AND '+
                     '       CLI.COD_CLIENTE = '+ query1.fieldbyname('Cod_Cliente').AsString + ' AND '+
                     '       LIG.TIPO_LIGACAO = ''S'' ' + cr;
  if (EmiteAtendLig_f.dtDe.Text <> '  /  /    ') and (EmiteAtendLig_f.dtAte.Text <> '  /  /    ') then
  begin
    dtini  := formatDateTime('mm/dd/yyyy',EmiteAtendLig_f.dtDe.date)  + ' 00:00:00';
    dtFin  := formatDateTime('mm/dd/yyyy',EmiteAtendLig_f.dtAte.date) + ' 23:59:59';
    sSql := sSql +   ' AND LIG.DT_PEDIDO_LIG >= cast( '''+ dtIni + ''' as timestamp) ' + cr;
    sSql := sSql +   ' AND LIG.DT_PEDIDO_LIG <= cast( '''+ dtfin + ''' as timestamp) ' +  cr;
  end;
  sSQl := sSql + ' GROUP BY CLI.COD_CLIENTE, CLI.NOME_CLI, LIG.COD_FUNC';
  query2.SQL.Text := sSql;
  query2.Open;
  lblSol.Caption := formatfloat('####0', query2.fieldbyname('Total').AsInteger);
  gerSol   := gerSol   + query2.fieldbyname('Total').AsInteger;

end;

procedure TqrAtendLig_f.QuickRepBeforePrint(Sender: TCustomQuickRep;
  var PrintReport: Boolean);
begin
  gerAtend  := 0;
  gerRec    := 0;
  gerSol    := 0;
  gerAtend2 := 0;
  gerRec2   := 0;
  gerSol2   := 0;
end;

procedure TqrAtendLig_f.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  totAtend.Caption := formatfloat('####0', gerAtend);
  totRec.Caption   := formatfloat('####0', gerRec);
  totSol.Caption   := formatfloat('####0', gerSol);

  gerAtend2 := gerAtend2 + gerAtend;
  gerRec2   := gerRec2   + gerRec;
  gerSol2   := gerSol2   + gerSol;

  gerAtend := 0;
  gerRec   := 0;
  gerSol   := 0;

end;

procedure TqrAtendLig_f.QRBand4BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lblAtendg.Caption := formatfloat('####0', gerAtend2);
  lblRecg.Caption   := formatfloat('####0', gerRec2);
  lblSolg.Caption   := formatfloat('####0', gerSol2);

  gerAtend2 := 0;
  gerRec2   := 0;
  gerSol2   := 0;
end;

end.
