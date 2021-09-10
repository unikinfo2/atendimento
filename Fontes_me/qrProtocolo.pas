unit qrProtocolo;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, funcoes;

type
  TqrProtocolo_f = class(TQuickRep)
    QRBand1: TQRBand;
    lblProtocolo: TQRLabel;
    lblEmpresa: TQRLabel;
    lblEndEmp: TQRLabel;
    lblFone: TQRLabel;
    qryImpPro: TQuery;
    QRShape1: TQRShape;
    QRShape2: TQRShape;
    lblCliente: TQRLabel;
    lblCliEnd: TQRLabel;
    QRShape3: TQRShape;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel19: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel22: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel25: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel28: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    QRLabel31: TQRLabel;
    QRLabel32: TQRLabel;
    QRLabel33: TQRLabel;
    QRLabel34: TQRLabel;
    QRLabel35: TQRLabel;
    QRLabel36: TQRLabel;
    QRLabel37: TQRLabel;
    QRLabel38: TQRLabel;
    QRLabel39: TQRLabel;
    QRLabel40: TQRLabel;
    QRLabel41: TQRLabel;
    QRLabel42: TQRLabel;
    QRShape4: TQRShape;
    lblEmissao: TQRLabel;
    lblAte: TQRLabel;
    lblEntrega: TQRLabel;
    QRLabel49: TQRLabel;
    lblDepto: TQRLabel;
    lblFunc: TQRLabel;
    qryLinhas: TQuery;
    lblCliEnd2: TQRLabel;
    lblCliente2: TQRLabel;
    QRShape5: TQRShape;
    lblProtocolo2: TQRLabel;
    lblEmpresa2: TQRLabel;
    lblEndEmp2: TQRLabel;
    lblFone2: TQRLabel;
    QRShape6: TQRShape;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRShape7: TQRShape;
    QRLabel46: TQRLabel;
    QRLabel47: TQRLabel;
    QRLabel48: TQRLabel;
    QRLabel50: TQRLabel;
    QRLabel51: TQRLabel;
    QRLabel52: TQRLabel;
    QRLabel53: TQRLabel;
    QRLabel54: TQRLabel;
    QRLabel55: TQRLabel;
    QRLabel56: TQRLabel;
    QRLabel57: TQRLabel;
    QRLabel58: TQRLabel;
    QRLabel59: TQRLabel;
    QRLabel60: TQRLabel;
    QRLabel61: TQRLabel;
    QRLabel62: TQRLabel;
    QRLabel63: TQRLabel;
    QRLabel64: TQRLabel;
    QRLabel65: TQRLabel;
    QRLabel66: TQRLabel;
    QRLabel67: TQRLabel;
    QRLabel68: TQRLabel;
    QRLabel69: TQRLabel;
    QRLabel70: TQRLabel;
    QRLabel71: TQRLabel;
    QRLabel72: TQRLabel;
    QRLabel73: TQRLabel;
    QRLabel74: TQRLabel;
    QRLabel75: TQRLabel;
    QRLabel76: TQRLabel;
    QRLabel77: TQRLabel;
    QRLabel78: TQRLabel;
    QRLabel79: TQRLabel;
    QRLabel80: TQRLabel;
    QRLabel81: TQRLabel;
    QRLabel82: TQRLabel;
    QRShape8: TQRShape;
    lblEmissao2: TQRLabel;
    lblAte2: TQRLabel;
    lblEntrega2: TQRLabel;
    QRLabel89: TQRLabel;
    lblDepto2: TQRLabel;
    lblFunc2: TQRLabel;
    lblCliEnd3: TQRLabel;
    lblCliente3: TQRLabel;
    lblCompl1: TQRLabel;
    lblCompl2: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qrProtocolo_f: TqrProtocolo_f;

implementation
uses principal;
{$R *.DFM}

procedure TqrProtocolo_f.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var x:Integer;
    y:integer;
begin
  lblProtocolo.Caption := 'Protocolo de Envio Nº: ' + formatfloat('000000000',qryImpPro.FieldByName('cod_protocolo').AsInteger);
  lblEmpresa.Caption   := lerIni(caminho+'Atendimento.ini','CIDADE','CLIENTE');
  lblEndEmp.Caption    := lerIni(caminho+'Atendimento.ini','CIDADE','ENDERECO');
  lblFone.Caption      := 'FONE: ' + lerIni(caminho+'Atendimento.ini','CIDADE','TELEFONE') + ' FAX: ' + lerIni(caminho+'Atendimento.ini','CIDADE','FAX');

  lblProtocolo2.Caption := 'Protocolo de Envio Nº: ' + formatfloat('000000000',qryImpPro.FieldByName('cod_protocolo').AsInteger);
  lblEmpresa2.Caption   := lerIni(caminho+'Atendimento.ini','CIDADE','CLIENTE');
  lblEndEmp2.Caption    := lerIni(caminho+'Atendimento.ini','CIDADE','ENDERECO');
  lblFone2.Caption      := 'FONE: ' + lerIni(caminho+'Atendimento.ini','CIDADE','TELEFONE') + ' FAX: ' + lerIni(caminho+'Atendimento.ini','CIDADE','FAX');

  lblCliente2.Caption  := formatfloat('0000',qryImpPro.FieldByName('cod_cliente').AsFloat) + '-' + qryImpPro.FieldByName('nome_cli').AsString;
  if qryImpPro.FieldByName('correspondencia_cli').AsString = '2' then
  begin
    lblCliEnd2.Caption   := qryImpPro.FieldByName('end_cob_cli').AsString;
    lblCompl1.Caption    := qryImpPro.FieldByName('bairro_cob_cli').AsString + ' - ' + qryImpPro.FieldByName('cidade_cob_cli').AsString + ' - ' + qryImpPro.FieldByName('uf_cob_cli').AsString;
  end
  else
  begin
    lblCliEnd2.Caption   := qryImpPro.FieldByName('endereco_cli').AsString + ' ' + qryImpPro.FieldByName('complemento_cli').AsString;
    lblCompl1.Caption    := qryImpPro.FieldByName('bairro_cli').AsString + ' - ' + qryImpPro.FieldByName('cidade_cli').AsString + ' - ' + qryImpPro.FieldByName('uf_cli').AsString;
  end;

  lblCliente3.Caption  := formatfloat('0000',qryImpPro.FieldByName('cod_cliente').AsFloat) + '-' + qryImpPro.FieldByName('nome_cli').AsString;
  if qryImpPro.FieldByName('correspondencia_cli').AsString = '2' then
  begin
    lblCliEnd3.Caption   := qryImpPro.FieldByName('end_cob_cli').AsString;
    lblCompl2.Caption    := qryImpPro.FieldByName('bairro_cob_cli').AsString + ' - ' + qryImpPro.FieldByName('cidade_cob_cli').AsString + ' - ' + qryImpPro.FieldByName('uf_cob_cli').AsString;
  end
  else
  begin
    lblCliEnd3.Caption   := qryImpPro.FieldByName('endereco_cli').AsString + ' ' + qryImpPro.FieldByName('complemento_cli').AsString;
    lblCompl2.Caption    := qryImpPro.FieldByName('bairro_cli').AsString + ' - ' + qryImpPro.FieldByName('cidade_cli').AsString + ' - ' + qryImpPro.FieldByName('uf_cli').AsString;
  end;

  qryLinhas.Close;
  qryLinhas.SQL.Text := 'SELECT EMI.*, DOC.DESC_DOCTO FROM GC_DOCUMENTO_EMITIDO EMI '+
                        ' LEFT JOIN GC_DOCUMENTO DOC ON (EMI.COD_DOCTO=DOC.COD_DOCTO) '+
                        ' WHERE COD_PROTOCOLO='+ qryImpPro.FieldByName('Cod_Protocolo').AsString;
  qryLinhas.Open;


  x := 0;
  y := 1;
  while (x <= 32) do
  begin
    if (qryLinhas.eof) then
    begin
      TQrLabel(self.FindComponent('QRLabel'+ IntToStr(x + 10))).Caption := '';
      TQrLabel(self.FindComponent('QRLabel'+ IntToStr(x + 11))).Caption := '';
      TQrLabel(self.FindComponent('QRLabel'+ IntToStr(x + 12))).Caption := '';

      TQrLabel(self.FindComponent('QRLabel'+ IntToStr(x + 50))).Caption := '';
      TQrLabel(self.FindComponent('QRLabel'+ IntToStr(x + 51))).Caption := '';
      TQrLabel(self.FindComponent('QRLabel'+ IntToStr(x + 52))).Caption := '';
    end
    else
    begin
      TQrLabel(self.FindComponent('QRLabel'+ IntToStr(x + 10))).Caption := formatfloat('00',y);
      TQrLabel(self.FindComponent('QRLabel'+ IntToStr(x + 11))).Caption := qryLinhas.FieldByName('Desc_Docto').AsString + ' ' + qryLinhas.FieldByName('Obs_Docto_Emi').AsString;

      if formatdatetime('dd/mm/yyyy',qryLinhas.FieldByName('Dt_Vencimento').AsDateTime) = '30/12/1899' then
        TQrLabel(self.FindComponent('QRLabel'+ IntToStr(x + 12))).Caption := ''
      else
        TQrLabel(self.FindComponent('QRLabel'+ IntToStr(x + 12))).Caption := qryLinhas.FieldByName('Dt_Vencimento').AsString;

      TQrLabel(self.FindComponent('QRLabel'+ IntToStr(x + 50))).Caption := formatfloat('00',y);
      TQrLabel(self.FindComponent('QRLabel'+ IntToStr(x + 51))).Caption := qryLinhas.FieldByName('Desc_Docto').AsString + ' ' + qryLinhas.FieldByName('Obs_Docto_Emi').AsString;

      if formatdatetime('dd/mm/yyyy',qryLinhas.FieldByName('Dt_Vencimento').AsDateTime) = '30/12/1899' then
        TQrLabel(self.FindComponent('QRLabel'+ IntToStr(x + 52))).Caption := ''
      else
        TQrLabel(self.FindComponent('QRLabel'+ IntToStr(x + 52))).Caption := qryLinhas.FieldByName('Dt_Vencimento').AsString;
      qryLinhas.Next;
      inc(y);
    end;
    x := x + 3;
  end;
  lblDepto.Caption := 'Departamento: '+qryImpPro.FieldByName('desc_depto').AsString;
  lblFunc.Caption  := 'Funcionário: '+qryImpPro.FieldByName('apelido_func').AsString;

  if formatdatetime('dd/mm/yyyy',qryImpPro.FieldByName('dt_entrega_prev').AsDateTime) <> '30/12/1899' then
    lblAte.Caption  := 'Entregar até: ' + formatdatetime('dd/mm/yyyy',qryImpPro.FieldByName('dt_entrega_prev').AsDateTime)
  else
    lblAte.Caption  := 'Entregar até:';

  lblEmissao.Caption  := 'Emissão: '+formatdatetime('dd/mm/yyyy',qryImpPro.FieldByName('dt_emissao_proto').AsDateTime);
  lblEntrega.Caption  := 'Entrega: ';

  {2º Protocolo}

  lblDepto2.Caption := 'Departamento: '+qryImpPro.FieldByName('desc_depto').AsString;
  lblFunc2.Caption  := 'Funcionário: '+qryImpPro.FieldByName('apelido_func').AsString;

  if formatdatetime('dd/mm/yyyy',qryImpPro.FieldByName('dt_entrega_prev').AsDateTime) <> '30/12/1899' then
    lblAte2.Caption  := 'Entregar até: ' + formatdatetime('dd/mm/yyyy',qryImpPro.FieldByName('dt_entrega_prev').AsDateTime)
  else
    lblAte2.Caption  := 'Entregar até:';

  lblEmissao2.Caption  := 'Emissão: '+formatdatetime('dd/mm/yyyy',qryImpPro.FieldByName('dt_emissao_proto').AsDateTime);
  lblEntrega2.Caption  := 'Entrega: ';

end;

end.
