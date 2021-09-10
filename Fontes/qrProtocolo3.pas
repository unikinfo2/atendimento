unit qrProtocolo3;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, funcoes;

type
  TqrProtocolo3_f = class(TQuickRep)
    QRBand1: TQRBand;
    lblProtocolo: TQRLabel;
    lblEmpresa: TQRLabel;
    lblEndEmp: TQRLabel;
    lblFone: TQRLabel;
    qryImpPro: TQuery;
    QRLabel11: TQRLabel;
    QRLabel12: TQRLabel;
    QRLabel14: TQRLabel;
    QRLabel15: TQRLabel;
    QRLabel17: TQRLabel;
    QRLabel18: TQRLabel;
    QRLabel20: TQRLabel;
    QRLabel21: TQRLabel;
    QRLabel23: TQRLabel;
    QRLabel24: TQRLabel;
    QRLabel26: TQRLabel;
    QRLabel27: TQRLabel;
    QRLabel29: TQRLabel;
    QRLabel30: TQRLabel;
    lblEmissao: TQRLabel;
    lblAte: TQRLabel;
    lblDepto: TQRLabel;
    lblFunc: TQRLabel;
    qryLinhas: TQuery;
    lblCliEnd: TQRLabel;
    lblCliente: TQRLabel;
    QRImage1: TQRImage;
    lblBairro: TQRLabel;
    lblCidade: TQRLabel;
    lblCodCli: TQRLabel;
    lblHora: TQRLabel;
    ChildBand1: TQRChildBand;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    QRLabel9: TQRLabel;
    QRLabel10: TQRLabel;
    QRLabel13: TQRLabel;
    QRLabel16: TQRLabel;
    QRLabel19: TQRLabel;
    lblProtocolo2: TQRLabel;
    lblEmpresa2: TQRLabel;
    lblEndEmp2: TQRLabel;
    lblFone2: TQRLabel;
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
    QRLabel43: TQRLabel;
    QRLabel44: TQRLabel;
    QRLabel45: TQRLabel;
    lblEmissao2: TQRLabel;
    lblAte2: TQRLabel;
    lblDepto2: TQRLabel;
    lblFunc2: TQRLabel;
    lblCliEnd2: TQRLabel;
    lblCliente2: TQRLabel;
    QRImage2: TQRImage;
    lblBairro2: TQRLabel;
    lblCidade2: TQRLabel;
    lblCodCli2: TQRLabel;
    lblHora2: TQRLabel;
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
    lblResp1: TQRLabel;
    lblResp2: TQRLabel;
    lblVal1: TQRLabel;
    lblVal2: TQRLabel;
    lblVal3: TQRLabel;
    lblVal4: TQRLabel;
    lblVal5: TQRLabel;
    lblVal6: TQRLabel;
    lblVal7: TQRLabel;
    lblVal8: TQRLabel;
    lblVal9: TQRLabel;
    lblVal10: TQRLabel;
    lblVal11: TQRLabel;
    lblVal12: TQRLabel;
    lblVal13: TQRLabel;
    lblVal14: TQRLabel;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
  private

  public

  end;

var
  qrProtocolo3_f: TqrProtocolo3_f;

implementation
uses principal;
{$R *.DFM}

procedure TqrProtocolo3_f.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
var x, xx:Integer;
    y:integer;
begin
  lblProtocolo.Caption := formatfloat('000000000',qryImpPro.FieldByName('cod_protocolo').AsInteger);
  lblEmpresa.Caption   := lerIni(caminho+'Atendimento.ini','CIDADE','CLIENTE');
  lblEndEmp.Caption    := lerIni(caminho+'Atendimento.ini','CIDADE','ENDERECO');
  lblFone.Caption      := 'FONE: ' + lerIni(caminho+'Atendimento.ini','CIDADE','TELEFONE') + ' FAX: ' + lerIni(caminho+'Atendimento.ini','CIDADE','FAX');

  lblProtocolo2.Caption := formatfloat('000000000',qryImpPro.FieldByName('cod_protocolo').AsInteger);
  lblEmpresa2.Caption   := lerIni(caminho+'Atendimento.ini','CIDADE','CLIENTE');
  lblEndEmp2.Caption    := lerIni(caminho+'Atendimento.ini','CIDADE','ENDERECO');
  lblFone2.Caption      := 'FONE: ' + lerIni(caminho+'Atendimento.ini','CIDADE','TELEFONE') + ' FAX: ' + lerIni(caminho+'Atendimento.ini','CIDADE','FAX');

{  lblProtocolo2.Caption := 'Protocolo de Envio Nº: ' + formatfloat('000000000',qryImpPro.FieldByName('cod_protocolo').AsInteger);
  lblEmpresa2.Caption   := lerIni(caminho+'Atendimento.ini','CIDADE','CLIENTE');
  lblEndEmp2.Caption    := lerIni(caminho+'Atendimento.ini','CIDADE','ENDERECO');
  lblFone2.Caption      := 'FONE: ' + lerIni(caminho+'Atendimento.ini','CIDADE','TELEFONE') + ' FAX: ' + lerIni(caminho+'Atendimento.ini','CIDADE','FAX');}

  lblResp1.Caption     := qryImpPro.FieldByName('responsavel_proto').AsString;
  lblResp2.Caption     := qryImpPro.FieldByName('responsavel_proto').AsString;


  lblCodCli.Caption    := formatfloat('0000',qryImpPro.FieldByName('cod_cliente').AsFloat);
  lblCliente.Caption   := qryImpPro.FieldByName('nome_cli').AsString;
  if qryImpPro.FieldByName('correspondencia_cli').AsString = '2' then
  begin
    lblCliEnd.Caption    := qryImpPro.FieldByName('end_cob_cli').AsString;
    lblBairro.Caption    := qryImpPro.FieldByName('bairro_cob_cli').AsString;
    lblCidade.Caption    := qryImpPro.FieldByName('cidade_cob_cli').AsString;
  end
  else
  begin
    lblCliEnd.Caption    := qryImpPro.FieldByName('endereco_cli').AsString + ' ' + qryImpPro.FieldByName('complemento_cli').AsString;
    lblBairro.Caption    := qryImpPro.FieldByName('bairro_cli').AsString;
    lblCidade.Caption    := qryImpPro.FieldByName('cidade_cli').AsString;
  end;

  lblCodCli2.Caption   := formatfloat('0000',qryImpPro.FieldByName('cod_cliente').AsFloat);
  lblCliente2.Caption  := qryImpPro.FieldByName('nome_cli').AsString;

  if qryImpPro.FieldByName('correspondencia_cli').AsString = '2' then
  begin
    lblCliEnd2.Caption    := qryImpPro.FieldByName('end_cob_cli').AsString;
    lblBairro2.Caption    := qryImpPro.FieldByName('bairro_cob_cli').AsString;
    lblCidade2.Caption    := qryImpPro.FieldByName('cidade_cob_cli').AsString;
  end
  else
  begin
    lblCliEnd2.Caption   := qryImpPro.FieldByName('endereco_cli').AsString + ' ' + qryImpPro.FieldByName('complemento_cli').AsString;
    lblBairro2.Caption   := qryImpPro.FieldByName('bairro_cli').AsString;
    lblCidade2.Caption   := qryImpPro.FieldByName('cidade_cli').AsString;
  end;

{  lblCliente3.Caption  := formatfloat('0000',qryImpPro.FieldByName('cod_cliente').AsFloat) + '-' + qryImpPro.FieldByName('nome_cli').AsString;
  lblCliEnd3.Caption   := qryImpPro.FieldByName('endereco_cli').AsString;}

  qryLinhas.Close;
  qryLinhas.SQL.Text := 'SELECT EMI.*, DOC.DESC_DOCTO FROM GC_DOCUMENTO_EMITIDO EMI '+
                        ' LEFT JOIN GC_DOCUMENTO DOC ON (EMI.COD_DOCTO=DOC.COD_DOCTO) '+
                        ' WHERE COD_PROTOCOLO='+ qryImpPro.FieldByName('Cod_Protocolo').AsString;
  qryLinhas.Open;


  x  := 0;
  xx := 0;
  y  := 1;
  while (x <= 35) do
  begin
    if (qryLinhas.eof) then
    begin
      TQrLabel(self.FindComponent('QRLabel'+ IntToStr(x + 11))).Caption := '';
      TQrLabel(self.FindComponent('QRLabel'+ IntToStr(x + 12))).Caption := '';

      TQrLabel(self.FindComponent('QRLabel'+ IntToStr(xx + 32))).Caption := '';
      TQrLabel(self.FindComponent('QRLabel'+ IntToStr(xx + 33))).Caption := '';

      TQrLabel(self.FindComponent('lblVal'+ IntToStr(y))).Caption     := '';
      TQrLabel(self.FindComponent('lblVal'+ IntToStr(y + 7))).Caption := '';
    end
    else
    begin
      TQrLabel(self.FindComponent('QRLabel'+ IntToStr(x + 11))).Caption := qryLinhas.FieldByName('Desc_Docto').AsString + ' ' + qryLinhas.FieldByName('Obs_Docto_Emi').AsString;

      if formatdatetime('dd/mm/yyyy',qryLinhas.FieldByName('Dt_Vencimento').AsDateTime) = '30/12/1899' then
        TQrLabel(self.FindComponent('QRLabel'+ IntToStr(x + 12))).Caption := ''
      else
        TQrLabel(self.FindComponent('QRLabel'+ IntToStr(x + 12))).Caption := qryLinhas.FieldByName('Dt_Vencimento').AsString;


      TQrLabel(self.FindComponent('QRLabel'+ IntToStr(xx + 32))).Caption := qryLinhas.FieldByName('Desc_Docto').AsString + ' ' + qryLinhas.FieldByName('Obs_Docto_Emi').AsString;

      if formatdatetime('dd/mm/yyyy',qryLinhas.FieldByName('Dt_Vencimento').AsDateTime) = '30/12/1899' then
        TQrLabel(self.FindComponent('QRLabel'+ IntToStr(xx + 33))).Caption := ''
      else
        TQrLabel(self.FindComponent('QRLabel'+ IntToStr(xx + 33))).Caption := qryLinhas.FieldByName('Dt_Vencimento').AsString;


      if qryLinhas.FieldByName('valor_Docto_emi').AsFloat > 0 then
      begin
        TQrLabel(self.FindComponent('lblVal'+ IntToStr(y))).Caption     := formatfloat(',0.00',qryLinhas.FieldByName('valor_Docto_emi').AsFloat);
        TQrLabel(self.FindComponent('lblVal'+ IntToStr(y + 7))).Caption := formatfloat(',0.00',qryLinhas.FieldByName('valor_Docto_emi').AsFloat);
      end
      else
      begin
        TQrLabel(self.FindComponent('lblVal'+ IntToStr(y))).Caption     := '';
        TQrLabel(self.FindComponent('lblVal'+ IntToStr(y + 7))).Caption := '';
      end;

      qryLinhas.Next;
    end;
    inc(y);
    x := x + 3;
    xx := xx + 2;
    if y > 7 then break;
  end;
  lblDepto.Caption := ''+qryImpPro.FieldByName('desc_depto').AsString;
  lblFunc.Caption  := 'Funcionário: '+qryImpPro.FieldByName('apelido_func').AsString;
  lblDepto2.Caption := ''+qryImpPro.FieldByName('desc_depto').AsString;
  lblFunc2.Caption  := 'Funcionário: '+qryImpPro.FieldByName('apelido_func').AsString;

  if formatdatetime('dd/mm/yyyy',qryImpPro.FieldByName('dt_entrega_prev').AsDateTime) <> '30/12/1899' then
  begin
    lblAte.Caption  := formatdatetime('dd/mm/yyyy',qryImpPro.FieldByName('dt_entrega_prev').AsDateTime);
    lblAte2.Caption  := formatdatetime('dd/mm/yyyy',qryImpPro.FieldByName('dt_entrega_prev').AsDateTime);
  end
  else
  begin
    lblAte.Caption  := '';
    lblAte2.Caption  := '';
  end;

  lblEmissao.Caption  := ''+formatdatetime('dd/mm/yyyy',qryImpPro.FieldByName('dt_emissao_proto').AsDateTime);
  lblHora.Caption     := ''+formatdatetime('HH:NN',qryImpPro.FieldByName('dt_emissao_proto').AsDateTime);
  lblEmissao2.Caption  := ''+formatdatetime('dd/mm/yyyy',qryImpPro.FieldByName('dt_emissao_proto').AsDateTime);
  lblHora2.Caption     := ''+formatdatetime('HH:NN',qryImpPro.FieldByName('dt_emissao_proto').AsDateTime);

end;

end.
