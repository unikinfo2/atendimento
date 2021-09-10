unit EmiteDarf_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, Menus, ComCtrls, StdCtrls, Buttons, Mask, ExtCtrls,
  Db, DBTables, QRExport, ComObj, shellapi, RxCalc, ToolEdit, CurrEdit;

type
  TEmiteDarf_f = class(TDeriva_f)
    Label3: TLabel;
    Label4: TLabel;
    BitBtn1: TBitBtn;
    medAte: TMaskEdit;
    medVencto: TMaskEdit;
    qryDarf: TQuery;
    Edit1: TEdit;
    Label1: TLabel;
    medCliente: TMaskEdit;
    Label2: TLabel;
    sbPesq: TSpeedButton;
    edtNomeCli: TEdit;
    Label5: TLabel;
    RxCalcEdit1: TRxCalcEdit;
    RxCalcEdit2: TRxCalcEdit;
    RxCalcEdit3: TRxCalcEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Edit2: TEdit;
    Label10: TLabel;
    CheckBox1: TCheckBox;
    qryCliente: TQuery;
    Edit3: TEdit;
    Label11: TLabel;
    RxCalcEdit4: TRxCalcEdit;
    RxCalcEdit5: TRxCalcEdit;
    RxCalcEdit6: TRxCalcEdit;
    Label9: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    RxCalcEdit7: TRxCalcEdit;
    Label14: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure GeraDarf;
    procedure sbPesqClick(Sender: TObject);
    procedure medClienteExit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmiteDarf_f: TEmiteDarf_f;

implementation
uses principal, Atendimento_dm;
{$R *.DFM}

procedure TEmiteDarf_f.BitBtn1Click(Sender: TObject);
begin
  inherited;

  GeraDarf;
  exit;

end;

procedure TEmiteDarf_f.FormCreate(Sender: TObject);
begin
  inherited;
  medAte.Text    := formatDateTime('dd/mm/yyyy',date);
  medVencto.Text := formatDateTime('dd/mm/yyyy',date);
end;

procedure TEmiteDarf_f.GeraDarf;
var ArqTmp           : TextFile;
    NomeArq, CodDARF : String;
    ValorIrf         : Double;
    BaseIrf          : Double;
    CpfCnpj          : TMaskEdit;
    qtdDarf          : Integer;
    vTexto           : String;
    vTexto2          : String;
begin

  CodDarf := edit1.Text;

  CpfCnpj := TMaskEdit.Create(self);

  BaseIrf := rxCalcEdit7.Value;

  if checkbox1.Checked then
    vTexto  := '<td width="450">'+
               '  <table border="0" cellspacing="0">'+
               '    <tr>'+
               '    <td><font size="0">'+
               '      ATENÇÃO para o preenchimento dos seguites campos:'+
               '    </font></td>'+
               '    </tr>'+
               '    <tr>'+
               '    <td><font size="0">'+
               '      02 - Informe a data de ecerramento do período de apuração no formato DD/MM/AA. Ex. período de apuração de janeiro de 1997 -> 31/01/97'+
               '    </font></td>'+
               '    </tr>'+
               '    <tr>'+
               '    <td><font size="0">'+
               '      05 - Informe a soma das receitas brutas mensais de janeiro até o mês de apuração.'+
               '    </font></td>'+
               '    </tr>'+
               '    <tr>'+
               '    <td><font size="0">'+
               '      06 - Informe o percetual decorrentem da receita bruta acumulada a ser aplicado sobre a receita mensal, com duas casas decimais.'+
               '    </font></td>'+
               '    </tr>'+
               '    <tr>'+
               '    <td><font size="0">'+
               '      07 - Informe o resultado da aplicação do percentual do campo 06 sobre a receita bruta mensal.'+
               '    </font></td>'+
               '    </tr>'+
               '  </table>'+
               '</td>'
  else
    vTexto  := '<td width="450">É vedado o'      +
               ' recolhimento de tributos e'     +
               ' contribuições administrados'    +
               ' pela Secretaria da Receita'     +
               ' Federal cujo valor total seja'  +
               ' inferior a R$ 10,00. Ocorrendo' +
               ' tal situação adicione esse'     +
               ' valor ao tributo/contribuição'  +
               ' de mesmo código de períodos'    +
               ' subseqüentes, até que o total'  +
               ' seja igual ou superior a R$'    +
               ' 10,00.</td>';

  if checkbox1.Checked then
    vTexto2 := '<td width="450"><font size="0"><strong>Documento'+
               ' de Arrecadação do Sistema Integrado de Pagamento de Impostos e Contribuições' +
               ' das Microempresas e Empresas de Pequeno Porte</strong></font></td>'
  else
    vTexto2 := '<td width="450"><font size="1"><strong>Documento'+
               ' de Arrecadação de Receitas' +
               ' Federais</strong></font></td>';


  CpfCnpj.Text            := qryCliente.FieldByName('CNPJCPF_CLI').AsString;
  CpfCnpj.EditMask        := '##.###.###/####-##;1; ';
  ValorIrf                := rxCalcEdit1.Value;

  {if BaseIrf <= 0 then
  begin
    messagedlg('Base de Calculo zerada, não será possível gerar DARF. Verifique as datas de apuração',mtInformation,[mbOk],0);
    exit;
  end;}

  NomeArq := ExtractFileDir(application.ExeName) + '\TMP_Darf.html';
  assignfile(ArqTmp,NomeArq);
  ReWrite(ArqTmp);
  try
    writeln(arqTmp,'<html>');
    writeln(arqTmp,'<head>');
    writeln(arqTmp,'<meta http-equiv="Content-Type"');
    writeln(arqTmp,'content="text/html; charset=iso-8859-1">');
    writeln(arqTmp,'<meta name="GENERATOR" content="Antonio">');
    writeln(arqTmp,'<title>Uni-K Informatica - Emissão de DARF´s</title>');
    writeln(arqTmp,'</head>');
    writeln(arqTmp,'<body bgcolor="#FFFFFF" leftmargin=1 topmargin=1>');
    for qtdDarf := 1 to 2 do
    begin
      writeln(arqTmp,'<table border="1" cellspacing="0" width="737">');
      writeln(arqTmp,'    <tr>');
      writeln(arqTmp,'        <td><table border="0" cellspacing="0">');
      writeln(arqTmp,'            <tr>');
      writeln(arqTmp,'                <td><table border="0" cellspacing="0">');
      writeln(arqTmp,'                    <tr>');
      writeln(arqTmp,'                        <td width="70"><img');
      writeln(arqTmp,'                        src="file:'+ ExtractFileDir(application.ExeName) +'\imagens\Brasao.gif"');
      writeln(arqTmp,'                        width="54" height="55"></td>');
      writeln(arqTmp,'                        <td><table border="0" cellspacing="0">');
      writeln(arqTmp,'                            <tr>');
      writeln(arqTmp,'                                <td width="380"><font size="3"><strong>MINISTÉRIO');
      writeln(arqTmp,'                                DA FAZENDA</strong></font></td>');
      writeln(arqTmp,'                            </tr>');
      writeln(arqTmp,'                            <tr>');
      writeln(arqTmp,'                                <td><font size="2"><strong>SECRETARIA');
      writeln(arqTmp,'                                DA RECEITA FEDERAL</strong></font></td>');
      writeln(arqTmp,'                            </tr>');
      writeln(arqTmp,'                            <tr>');
      writeln(arqTmp, vTexto2);
      writeln(arqTmp,'                            </tr>');
      writeln(arqTmp,'                            <tr>');
      writeln(arqTmp,'                                <td><font size="4"><strong>DARF');
      if checkbox1.Checked then
        writeln(arqTmp,'                                 - SIMPLES');
      writeln(arqTmp,'                                </strong></font></td>');
      writeln(arqTmp,'                            </tr>');
      writeln(arqTmp,'                        </table>');
      writeln(arqTmp,'                        </td>');
      writeln(arqTmp,'                    </tr>');
      writeln(arqTmp,'                </table>');
      writeln(arqTmp,'                </td>');
      writeln(arqTmp,'            </tr>');
      writeln(arqTmp,'            <tr>');
      writeln(arqTmp,'                <td><table border="1" cellspacing="0"');
      writeln(arqTmp,'                width="100%">');
      writeln(arqTmp,'                    <tr>');
      writeln(arqTmp,'                        <td width="450"><table border="0"');
      writeln(arqTmp,'                        cellspacing="0" width="100%">');
      writeln(arqTmp,'                            <tr>');
      writeln(arqTmp,'                                <td><strong>01</strong> -');
      writeln(arqTmp,'                                <font size="1">NOME/TELEFONE</font></td>');
      writeln(arqTmp,'                            </tr>');
      writeln(arqTmp,'                            <tr>');
      writeln(arqTmp,'                                <td><font size="2">'+qryCliente.FieldByName('NOME_CLI').AsString+' / '+qryCliente.FieldByName('FONE1_CLI').AsString + '</font></td>');
      writeln(arqTmp,'                            </tr>');
      writeln(arqTmp,'                        </table>');
      writeln(arqTmp,'                        </td>');
      writeln(arqTmp,'                    </tr>');
      writeln(arqTmp,'                    <tr>');
      writeln(arqTmp,'                        <td align="center" width="450"><font');
      writeln(arqTmp,'                        size="4"><strong>'+CodDarf);
      if edit3.Text <> '' then
      writeln(arqTmp,'                         - ' + edit3.Text);
      writeln(arqTmp,'</strong></font>');
      writeln(arqTmp,'                        </td>');
      writeln(arqTmp,'                    </tr>');
      writeln(arqTmp,'                    <tr>');
      writeln(arqTmp,'                        <td><table border="0" width="100%">');
      writeln(arqTmp,'                            <tr>');
      if checkbox1.Checked then
        writeln(arqTmp,'                                <td align="center">RECEITA = R$ ' + FormatFloat(',0.00',RxCalcEdit4.Value))
      else
        writeln(arqTmp,'                                <td align="center">BASE DE CALCULO = R$ ' + FormatFloat(',0.00',BaseIrf));

      writeln(arqTmp,'                                </td>');
      writeln(arqTmp,'                            </tr>');
      writeln(arqTmp,'                            <tr>');
      if checkbox1.Checked then
        writeln(arqTmp,'                                <td align="center">VENCIMENTO: '+FormatDateTime('dd/mm/yy', StrToDate(medVencto.Text))+'</td>')
      else
        writeln(arqTmp,'                                <td align="center">ATENÇÃO</td>');

      writeln(arqTmp,'                            </tr>');
      writeln(arqTmp,'                            <tr>');
      writeln(arqTmp, vTexto);
      writeln(arqTmp,'                            </tr>');
      writeln(arqTmp,'                        </table>');
      writeln(arqTmp,'                        </td>');
      writeln(arqTmp,'                    </tr>');
      writeln(arqTmp,'                </table>');
      writeln(arqTmp,'                </td>');
      writeln(arqTmp,'            </tr>');
      writeln(arqTmp,'        </table>');
      writeln(arqTmp,'        </td>');
      writeln(arqTmp,'        <td valign="top"><table border="1" cellspacing="0"');
      writeln(arqTmp,'        width="320">');
      writeln(arqTmp,'            <tr>');
      writeln(arqTmp,'                <td width="175"><font size="4"><strong>02 </strong></font><font');
      writeln(arqTmp,'                size="1">PERÍODO DE APURAÇÃO</font></td>');
      writeln(arqTmp,'                <td width="150" align="center">'+FormatDateTime('dd/mm/yyyy', StrToDate(medAte.Text))+'</td>');
      writeln(arqTmp,'            </tr>');
      writeln(arqTmp,'            <tr>');
      writeln(arqTmp,'                <td width="175"><font size="4"><strong>03 </strong></font><font');
      writeln(arqTmp,'                size="1">NÚMERO DO CPF/CGC</font></td>');
      writeln(arqTmp,'                <td width="150">' + CpfCnpj.Text + '</td>');
      writeln(arqTmp,'            </tr>');
      writeln(arqTmp,'            <tr>');
      writeln(arqTmp,'                <td width="175"><font size="4"><strong>04</strong>');
      writeln(arqTmp,'                </font><font size="1">CÓDIGO DA RECEITA</font></td>');
      writeln(arqTmp,'                <td width="150" align="center"><font size="4"><strong>'+CodDarf+'</strong></font></td>');
      writeln(arqTmp,'            </tr>');
      writeln(arqTmp,'            <tr>');

      if checkbox1.Checked then
      begin
        writeln(arqTmp,'                <td width="175"><font size="4"><strong>05</strong></font><font');
        writeln(arqTmp,'                size="1"><strong> </strong>VALOR DA RECEITA BRUTA ACUMULADA</font></td>');
        writeln(arqTmp,'                <td width="150" align="right">'+FormatFloat('R$ ,0.00',rxCalcEdit5.Value)+'</td>');
      end
      else
      begin
        writeln(arqTmp,'                <td width="175"><font size="4"><strong>05</strong></font><font');
        writeln(arqTmp,'                size="1"><strong> </strong>NÚMERO DE REFERÊNCIA</font></td>');
        writeln(arqTmp,'                <td width="150">'+edit2.text+'</td>');
      end;

      writeln(arqTmp,'            </tr>');
      writeln(arqTmp,'            <tr>');
      if checkbox1.Checked then
      begin
        writeln(arqTmp,'                <td width="175"><font size="4"><strong>06 </strong></font><font');
        writeln(arqTmp,'                size="1">PERCENTUAL</font></td>');
        writeln(arqTmp,'                <td width="150" align="center">' + formatfloat(',0.00',rxCalcEdit6.Value) + '%</td>');
      end
      else
      begin
        writeln(arqTmp,'                <td width="175"><font size="4"><strong>06 </strong></font><font');
        writeln(arqTmp,'                size="1">DATA DE VENCIMENTO</font></td>');
        writeln(arqTmp,'                <td width="150" align="center">' + FormatDateTime('dd/mm/yyyy', StrToDate(medVencto.Text)) + '</td>');
      end;

      writeln(arqTmp,'            </tr>');
      writeln(arqTmp,'            <tr>');
      writeln(arqTmp,'                <td width="175"><font size="4"><strong>07 </strong></font><font');
      writeln(arqTmp,'                size="1">VALOR DO PRINCIPAL</font></td>');
      writeln(arqTmp,'                <td width="150" align="right">'+FormatFloat('R$ ,0.00',ValorIrf)+'</td>');
      writeln(arqTmp,'            </tr>');
      writeln(arqTmp,'            <tr>');
      writeln(arqTmp,'                <td width="175"><font size="4"><strong>08 </strong></font><font');
      writeln(arqTmp,'                size="1">VALOR DA MULTA</font></td>');
      writeln(arqTmp,'                <td width="150" align="right">'+FormatFloat('R$ ,0.00',rxCalcEdit2.Value)+'</td>');
      writeln(arqTmp,'            </tr>');
      writeln(arqTmp,'            <tr>');
      writeln(arqTmp,'                <td width="175"><font size="4"><strong>09 </strong></font><font');
      if checkbox1.Checked then
        writeln(arqTmp,'                size="1">VALOR DOS JUROS</font></td>')
      else
        writeln(arqTmp,'                size="1">VALOR DOS JUROS E/OU ENCARGOS DL-1.025/69</font></td>');
      writeln(arqTmp,'                <td width="150" align="right">'+FormatFloat('R$ ,0.00',rxCalcEdit3.Value)+'</td>');
      writeln(arqTmp,'            </tr>');
      writeln(arqTmp,'            <tr>');
      writeln(arqTmp,'                <td width="175"><font size="4"><strong>10 </strong></font><font');
      writeln(arqTmp,'                size="1">VALOR TOTAL</font></td>');
      writeln(arqTmp,'                <td width="150" align="right">'+FormatFloat('R$ ,0.00',ValorIrf+rxCalcEdit2.Value+rxCalcEdit3.Value)+'</td>');
      writeln(arqTmp,'            </tr>');
      writeln(arqTmp,'        </table>');
      writeln(arqTmp,'        <table border="0" cellspacing="0" width="320">');
      writeln(arqTmp,'            <tr>');
      writeln(arqTmp,'                <td width="320"><font size="4"><strong>11 </strong></font><font');
      writeln(arqTmp,'                size="1">AUTENTICAÇÃO BANCÁRIA (Somente 1ª e');
      writeln(arqTmp,'                2ª Vias)</font></td>');
      writeln(arqTmp,'            </tr>');
      writeln(arqTmp,'        </table>');
      writeln(arqTmp,'        </td>');
      writeln(arqTmp,'    </tr>');
      writeln(arqTmp,'</table>');
      writeln(arqTmp,'<br><br><br>');
      writeln(arqTmp,'<br><br><br>');
    end;
    writeln(arqTmp,'</body>');
    writeln(arqTmp,'</html>');
  finally
    CloseFile(ArqTmp);
  end;

  shellexecute(Self.Handle,'open', pChar(NomeArq),'','',SW_SHOW);

end;

procedure TEmiteDarf_f.sbPesqClick(Sender: TObject);
begin
  inherited;
  dmPesq.PesCliente.StringSql.Clear;
  dmPesq.PesCliente.StringSql.Add('SELECT * FROM GC_CLIENTE ');
  dmPesq.PesCliente.StringSql.Add(' ORDER BY NOME_CLI');
  dmPesq.PesCliente.Execute;
  medCliente.Clear;
  edtNomeCli.Clear;
  medCliente.Text := dmPesq.PesCliente.ValoresRetorno[0];
  edtNomeCli.Text := dmPesq.PesCliente.ValoresRetorno[2];
  medClienteExit(self);
end;

procedure TEmiteDarf_f.medClienteExit(Sender: TObject);
begin
  inherited;
  if medCliente.Text <> '' then
  begin
    qryCliente.Close;
    qryCliente.SQL.Text := 'SELECT * FROM GC_CLIENTE WHERE COD_CLIENTE='+medCliente.Text;
    qryCliente.Open;
    if qryCliente.eof then
    begin
      messagedlg('Codigo de Cliente não cadastrado.',mtWarning,[mbOk],0);
      medCliente.SetFocus;
      exit;
    end;
    medCliente.Text  := qryCliente.FieldByName('Cod_Cliente').AsString;
    edtNomeCli.Text  := qryCliente.FieldByName('Nome_cli').AsString;
  end
  else
  begin
    medCliente.Clear;
    edtNomeCli.Clear;
    medCliente.SetFocus;
  end;
end;

procedure TEmiteDarf_f.CheckBox1Click(Sender: TObject);
begin
  inherited;
  if checkbox1.Checked then
  begin
    edit1.Text := '6106';
    RxCalcEdit4.Enabled := True;
    RxCalcEdit5.Enabled := True;
    RxCalcEdit6.Enabled := True;
  end
  else
  begin
    edit1.Clear;
    RxCalcEdit4.Enabled := False;
    RxCalcEdit5.Enabled := False;
    RxCalcEdit6.Enabled := False;
  end;
end;

end.
