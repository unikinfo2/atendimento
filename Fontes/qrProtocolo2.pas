unit qrProtocolo2;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, Db, DBTables, funcoes;

type
  TqrProtocolo2_f = class(TQuickRep)
    QRBand1: TQRBand;
    qryImpPro: TQuery;
    qryLinhas: TQuery;
    lblCliEnd2: TQRLabel;
    lblCliente2: TQRLabel;
    lblData: TQRLabel;
    QRLabel1: TQRLabel;
    lblResponsavel: TQRLabel;
    QRLabel2: TQRLabel;
    memoTexto: TQRMemo;
    QRGroup1: TQRGroup;
    QRBand2: TQRBand;
    QRDBText1: TQRDBText;
    QRDBText2: TQRDBText;
    QRDBText3: TQRDBText;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRBand3: TQRBand;
    lblEmpresa: TQRLabel;
    lblEndEmp: TQRLabel;
    lblCidade: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel7: TQRLabel;
    QRLabel8: TQRLabel;
    lblFone: TQRLabel;
    qryImpProCOD_PROTOCOLO: TIntegerField;
    qryImpProCOD_CLIENTE: TIntegerField;
    qryImpProOBS_PROTOCOLO: TStringField;
    qryImpProDT_EMISSAO_PROTO: TDateTimeField;
    qryImpProDT_ENTREGA_PREV: TDateTimeField;
    qryImpProDT_ENTREGA_PROTO: TDateTimeField;
    qryImpProSTATUS_ENTREGA: TStringField;
    qryImpProCOD_FUNC: TIntegerField;
    qryImpProCOD_FUNC_CAD: TIntegerField;
    qryImpProCOD_CLIENTE_1: TIntegerField;
    qryImpProCOD_CLIENTE_ALT: TIntegerField;
    qryImpProCNPJCPF_CLI: TStringField;
    qryImpProTIPO_CLI: TStringField;
    qryImpProNOME_CLI: TStringField;
    qryImpProFANTASIA_CLI: TStringField;
    qryImpProENDERECO_CLI: TStringField;
    qryImpProEND_COB_CLI: TStringField;
    qryImpProCOMPLEMENTO_CLI: TStringField;
    qryImpProBAIRRO_CLI: TStringField;
    qryImpProCIDADE_CLI: TStringField;
    qryImpProUF_CLI: TStringField;
    qryImpProFONE1_CLI: TStringField;
    qryImpProFONE2_CLI: TStringField;
    qryImpProFONE3_CLI: TStringField;
    qryImpProEMAIL_CLI: TStringField;
    qryImpProCONTATO_CLI: TStringField;
    qryImpProATIVO_CLI: TStringField;
    qryImpProSTATUS_CLI: TStringField;
    qryImpProVALOR_MENSAL: TFloatField;
    qryImpProDIA_VENCTO: TSmallintField;
    qryImpProCEP_CLI: TStringField;
    qryImpProCOD_PLCONTA: TIntegerField;
    qryImpProCOD_CONTA: TStringField;
    qryImpProNIVEL_CLI: TStringField;
    qryImpProTIPO_CLIFOR: TStringField;
    qryImpProCOD_FUNC_1: TIntegerField;
    qryImpProCOD_DEPTO: TIntegerField;
    qryImpProNOME_FUNC: TStringField;
    qryImpProFONE1: TStringField;
    qryImpProFONE2: TStringField;
    qryImpProRESPONSAVEL: TStringField;
    qryImpProEMAIL_FUNC: TStringField;
    qryImpProAPELIDO_FUNC: TStringField;
    qryImpProSENHA_FUNC: TStringField;
    qryImpProNIVEL_FUNC: TStringField;
    qryImpProATIVO_FUNC: TStringField;
    qryImpProCOD_DEPTO_1: TIntegerField;
    qryImpProDESC_DEPTO: TStringField;
    qryImpProCOD_PROTOCOLO_1: TIntegerField;
    qryImpProCOD_DOCTO_EMI: TIntegerField;
    qryImpProCOD_DOCTO: TIntegerField;
    qryImpProOBS_DOCTO_EMI: TStringField;
    qryImpProDT_VENCIMENTO: TDateTimeField;
    qryImpProCOD_DOCTO_1: TIntegerField;
    qryImpProCOD_DEPTO_2: TIntegerField;
    qryImpProDESC_DOCTO: TStringField;
    qryImpProCOMPETENCIA_DOCTO: TStringField;
    qryImpProDIAS_DOCTO: TIntegerField;
    qryImpProSTATUS_DIAS_DOCTO: TStringField;
    qryImpProCOD_SERV: TIntegerField;
    qryImpProCOD_PLCONTA_1: TIntegerField;
    qryImpProCOD_CONTA_1: TStringField;
    qryImpProBAIRRO_COB_CLI: TStringField;
    qryImpProCIDADE_COB_CLI: TStringField;
    qryImpProUF_COB_CLI: TStringField;
    qryImpProCEP_COB_CLI: TStringField;
    qryImpProDT_NASCIMENTO: TDateTimeField;
    qryImpProCORRESPONDENCIA_CLI: TStringField;
    procedure QRBand1BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3BeforePrint(Sender: TQRCustomBand;
      var PrintBand: Boolean);
    procedure QRBand3AfterPrint(Sender: TQRCustomBand;
      BandPrinted: Boolean);
  private

  public

  end;

var
  qrProtocolo2_f: TqrProtocolo2_f;

implementation
uses principal;
{$R *.DFM}

procedure TqrProtocolo2_f.QRBand1BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin

  lblData.Caption := lerIni(caminho+'Atendimento.ini','CIDADE','CIDADE') + ' ' +DataExtenso(qryImpPro.FieldByName('dt_emissao_proto').AsDateTime);

  memoTexto.Lines.Text  := 'Estamos Enviando a documentação abaixo relacionada, conforme nosso numero de controle '+formatfloat('000000',qryImpPro.FieldByName('cod_protocolo').AsInteger)+
                           '.'+#13#10#13#10+
                           'Documentos:';

  lblCliente2.Caption    := formatfloat('0000',qryImpPro.FieldByName('cod_cliente').AsFloat) + '-' + qryImpPro.FieldByName('nome_cli').AsString;
  if qryImpPro.FieldByName('correspondencia_cli').AsString = '2' then
  begin
    lblCliEnd2.Caption     := qryImpPro.FieldByName('end_cob_cli').AsString;
  end
  else
  begin
    lblCliEnd2.Caption     := qryImpPro.FieldByName('endereco_cli').AsString + ' ' + qryImpPro.FieldByName('complemento_cli').AsString;
  end;
  lblResponsavel.Caption := '';
  if qryImpPro.FieldByName('Contato_cli').AsString <> '' then
    lblResponsavel.Caption := 'At. Sr (a) ' + qryImpPro.FieldByName('Contato_cli').AsString;

end;

procedure TqrProtocolo2_f.QRBand3BeforePrint(Sender: TQRCustomBand;
  var PrintBand: Boolean);
begin
  lblEmpresa.Caption   := lerIni(caminho+'Atendimento.ini','CIDADE','CLIENTE');
  lblEndEmp.Caption    := lerIni(caminho+'Atendimento.ini','CIDADE','ENDERECO');
  lblFone.Caption      := 'FONE: ' + lerIni(caminho+'Atendimento.ini','CIDADE','TELEFONE') + ' FAX: ' + lerIni(caminho+'Atendimento.ini','CIDADE','FAX');
  lblCidade.Caption    := 'Cidade ' + lerIni(caminho+'Atendimento.ini','CIDADE','CIDADE');
end;

procedure TqrProtocolo2_f.QRBand3AfterPrint(Sender: TQRCustomBand;
  BandPrinted: Boolean);
begin
{  if not qryImpPro.eof then self.NewPage;}
end;

end.
