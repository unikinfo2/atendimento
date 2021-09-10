unit ImportaCli_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Deriva_u, RxCalc, Menus, ExtCtrls, StdCtrls, Mask, ToolEdit, maskutils,
  Grids, Buttons, DB, DBTables, Gauges;

type
  TImportaCli_f = class(TDeriva_f)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    edtArq: TFilenameEdit;
    Label1: TLabel;
    gridDados: TStringGrid;
    btnImporta: TBitBtn;
    chkDados: TCheckBox;
    chkSeq: TCheckBox;
    qryAux: TQuery;
    qryAux2: TQuery;
    qryCli: TQuery;
    Panel4: TPanel;
    ga: TGauge;
    procedure edtArqChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnImportaClick(Sender: TObject);
  private
    procedure ApagaParam;
    { Private declarations }
  public
    { Public declarations }
  end;

type
  TReg_Cliente = Record
    COD_CLIENTE	         : ARRAY [1..9]  of char;
    COD_CLIENTE_ALT	     : ARRAY [1..9]  of char;
    CNPJCPF_CLI	         : ARRAY [1..18] of char;
    TIPO_CLI	           : ARRAY [1..1]  of char; {F-Fisica / J-Juridica / C-CEI}
    NOME_CLI	           : ARRAY [1..50] of char;
    FANTASIA_CLI	       : ARRAY [1..50] of char;
    ENDERECO_CLI	       : ARRAY [1..50] of char;
    END_COB_CLI	         : ARRAY [1..60] of char;
    COMPLEMENTO_CLI	     : ARRAY [1..20] of char;
    BAIRRO_CLI	         : ARRAY [1..20] of char;
    CIDADE_CLI	         : ARRAY [1..20] of char;
    UF_CLI	             : ARRAY [1..2]  of char;
    FONE1_CLI	           : ARRAY [1..12] of char; {Sem pontuação e com zeros a esquerda}
    FONE2_CLI	           : ARRAY [1..12] of char; {Sem pontuação e com zeros a esquerda}
    FONE3_CLI	           : ARRAY [1..12] of char; {Sem pontuação e com zeros a esquerda}
    EMAIL_CLI	           : ARRAY [1..50] of char;
    CONTATO_CLI	         : ARRAY [1..20] of char;
    ATIVO_CLI	           : ARRAY [1..1]  of char;
    STATUS_CLI	         : ARRAY [1..1]  of char; {Branco}
    VALOR_MENSAL	       : ARRAY [1..15] of char; {Valor sem mascara multimplicado por 100 e com zeros a esquerda Ex. 100.51 = 000000000010051}
    DIA_VENCTO	         : ARRAY [1..2]  of char;
    CEP_CLI	             : ARRAY [1..8]  of char; {Sem pontuação e com zeros a esquerda}
    NIVEL_CLI	           : ARRAY [1..1]  of char; {1 - Valor Fixo}
    TIPO_CLIFOR	         : ARRAY [1..1]  of char;
    BAIRRO_COB_CLI	     : ARRAY [1..20] of char;
    CIDADE_COB_CLI	     : ARRAY [1..20] of char;
    UF_COB_CLI	         : ARRAY [1..2]  of char;
    CEP_COB_CLI	         : ARRAY [1..8]  of char; {Sem pontuação e com zeros a esquerda}
    CORRESPONDENCIA_CLI	 : ARRAY [1..1]  of char; {1-End. Normal / 2.End. Cobrança}
    EMITE_NF_CLI	       : ARRAY [1..1]  of char;
    SENHA_INT	           : ARRAY [1..15] of char; {Brancos}
    TIPO_TAXA_CLI	       : ARRAY [1..1]  of char;
    VALOR_TAXA_CLI	     : ARRAY [1..15] of char; {Valor sem mascara multimplicado por 100 e com zeros a esquerda Ex. 100.51 = 000000000010051}
    MES_REF_CLI	         : ARRAY [1..6]  of char;
    FIM	                 : ARRAY [1..2]  of char; {Caracteres de Final de Linha chr(10)+char(13)}
end;

const
  Sql_Ins : String = 'INSERT INTO GC_CLIENTE ( '+
             ' COD_CLIENTE, '+
             ' COD_CLIENTE_ALT, '+
             ' CNPJCPF_CLI, '+
             ' TIPO_CLI, '+
             ' NOME_CLI, '+
             ' FANTASIA_CLI, '+
             ' ENDERECO_CLI, '+
             ' END_COB_CLI, '+
             ' COMPLEMENTO_CLI, '+
             ' BAIRRO_CLI, '+
             ' CIDADE_CLI, '+
             ' UF_CLI, '+
             ' FONE1_CLI, '+
             ' FONE2_CLI, '+
             ' FONE3_CLI, '+
             ' EMAIL_CLI, '+
             ' CONTATO_CLI, '+
             ' ATIVO_CLI, '+
             ' STATUS_CLI, '+
             ' VALOR_MENSAL, '+
             ' DIA_VENCTO, '+
             ' CEP_CLI, '+
             ' NIVEL_CLI, '+
             ' TIPO_CLIFOR, '+
             ' BAIRRO_COB_CLI, '+
             ' CIDADE_COB_CLI, '+
             ' UF_COB_CLI, '+
             ' CEP_COB_CLI, '+
             ' CORRESPONDENCIA_CLI, '+
             ' EMITE_NF_CLI, '+
             ' SENHA_INT, '+
             ' TIPO_TAXA_CLI, '+
             ' VALOR_TAXA_CLI, '+
             ' MES_REF_CLI '+
             ' ) VALUES ( '+
             ' :COD_CLIENTE, '+
             ' :COD_CLIENTE_ALT, '+
             ' :CNPJCPF_CLI, '+
             ' :TIPO_CLI, '+
             ' :NOME_CLI, '+
             ' :FANTASIA_CLI, '+
             ' :ENDERECO_CLI, '+
             ' :END_COB_CLI, '+
             ' :COMPLEMENTO_CLI, '+
             ' :BAIRRO_CLI, '+
             ' :CIDADE_CLI, '+
             ' :UF_CLI, '+
             ' :FONE1_CLI, '+
             ' :FONE2_CLI, '+
             ' :FONE3_CLI, '+
             ' :EMAIL_CLI, '+
             ' :CONTATO_CLI, '+
             ' :ATIVO_CLI, '+
             ' :STATUS_CLI, '+
             ' :VALOR_MENSAL, '+
             ' :DIA_VENCTO, '+
             ' :CEP_CLI, '+
             ' :NIVEL_CLI, '+
             ' :TIPO_CLIFOR, '+
             ' :BAIRRO_COB_CLI, '+
             ' :CIDADE_COB_CLI, '+
             ' :UF_COB_CLI, '+
             ' :CEP_COB_CLI, '+
             ' :CORRESPONDENCIA_CLI, '+
             ' :EMITE_NF_CLI, '+
             ' :SENHA_INT, '+
             ' :TIPO_TAXA_CLI, '+
             ' :VALOR_TAXA_CLI, '+
             ' :MES_REF_CLI '+
             ' )';

  Sql_Up  : String = 'UPDATE GC_CLIENTE SET '+
             ' COD_CLIENTE_ALT     = :COD_CLIENTE_ALT , '+
             ' TIPO_CLI            = :TIPO_CLI, '+
             ' NOME_CLI            = :NOME_CLI, '+
             ' FANTASIA_CLI        = :FANTASIA_CLI, '+
             ' ENDERECO_CLI        = :ENDERECO_CLI, '+
             ' END_COB_CLI         = :END_COB_CLI, '+
             ' COMPLEMENTO_CLI     = :COMPLEMENTO_CLI, '+
             ' BAIRRO_CLI          = :BAIRRO_CLI, '+
             ' CIDADE_CLI          = :CIDADE_CLI, '+
             ' UF_CLI              = :UF_CLI, '+
             ' FONE1_CLI           = :FONE1_CLI, '+
             ' FONE2_CLI           = :FONE2_CLI, '+
             ' FONE3_CLI           = :FONE3_CLI, '+
             ' EMAIL_CLI           = :EMAIL_CLI, '+
             ' CONTATO_CLI         = :CONTATO_CLI, '+
             ' ATIVO_CLI           = :ATIVO_CLI, '+
             ' STATUS_CLI          = :STATUS_CLI, '+
             ' VALOR_MENSAL        = :VALOR_MENSAL, '+
             ' DIA_VENCTO          = :DIA_VENCTO, '+
             ' CEP_CLI             = :CEP_CLI, '+
             ' NIVEL_CLI           = :NIVEL_CLI, '+
             ' TIPO_CLIFOR         = :TIPO_CLIFOR, '+
             ' BAIRRO_COB_CLI      = :BAIRRO_COB_CLI, '+
             ' CIDADE_COB_CLI      = :CIDADE_COB_CLI, '+
             ' UF_COB_CLI          = :UF_COB_CLI, '+
             ' CEP_COB_CLI         = :CEP_COB_CLI, '+
             ' CORRESPONDENCIA_CLI = :CORRESPONDENCIA_CLI, '+
             ' EMITE_NF_CLI        = :EMITE_NF_CLI, '+
             ' SENHA_INT           = :SENHA_INT, '+
             ' TIPO_TAXA_CLI       = :TIPO_TAXA_CLI, '+
             ' VALOR_TAXA_CLI      = :VALOR_TAXA_CLI, '+
             ' MES_REF_CLI         = :MES_REF_CLI'+
             ' WHERE ' +
             ' CNPJCPF_CLI         = :CNPJCPF_CLI';

var
  ImportaCli_f: TImportaCli_f;

implementation
uses principal, funcoes;

{$R *.dfm}

procedure TImportaCli_f.edtArqChange(Sender: TObject);
var vReg : TReg_Cliente;
    f1   : TFileStream;
    vTam : Integer;
    vLin : Integer;
begin
  inherited;
  if edtArq.Text <> '' then
  begin
    {Rotina para Busca do Arq. Texto 564 posições}
    f1 := TFileStream.Create( edtArq.Text, fmOpenRead );
    f1.Position := 0;
    vTam := sizeof(vReg);
    vLin := 1;
    while f1.Position < f1.Size do
    begin
      f1.Read(vReg, vTam);
      gridDados.Cells[0, vLin]  := trim(string(vReg.COD_CLIENTE));
      gridDados.Cells[1, vLin]  := trim(string(vReg.COD_CLIENTE_ALT));
      gridDados.Cells[2, vLin]  := trim(string(vReg.CNPJCPF_CLI));
      gridDados.Cells[3, vLin]  := trim(string(vReg.TIPO_CLI));
      gridDados.Cells[4, vLin]  := trim(string(vReg.NOME_CLI));
      gridDados.Cells[5, vLin]  := trim(string(vReg.FANTASIA_CLI));
      gridDados.Cells[6, vLin]  := trim(string(vReg.ENDERECO_CLI));
      gridDados.Cells[7, vLin]  := trim(string(vReg.END_COB_CLI));
      gridDados.Cells[8, vLin]  := trim(string(vReg.COMPLEMENTO_CLI));
      gridDados.Cells[9, vLin]  := trim(string(vReg.BAIRRO_CLI));
      gridDados.Cells[10, vLin] := trim(string(vReg.CIDADE_CLI));
      gridDados.Cells[11, vLin] := trim(string(vReg.UF_CLI));
      gridDados.Cells[12, vLin] := trim(string(vReg.FONE1_CLI));
      gridDados.Cells[13, vLin] := trim(string(vReg.FONE2_CLI));
      gridDados.Cells[14, vLin] := trim(string(vReg.FONE3_CLI));
      gridDados.Cells[15, vLin] := trim(string(vReg.EMAIL_CLI));
      gridDados.Cells[16, vLin] := trim(string(vReg.CONTATO_CLI));
      gridDados.Cells[17, vLin] := trim(string(vReg.ATIVO_CLI));
      gridDados.Cells[18, vLin] := trim(string(vReg.STATUS_CLI));
      gridDados.Cells[19, vLin] := trim(string(vReg.VALOR_MENSAL));
      gridDados.Cells[20, vLin] := trim(string(vReg.DIA_VENCTO));
      gridDados.Cells[21, vLin] := trim(string(vReg.CEP_CLI));
      gridDados.Cells[22, vLin] := trim(string(vReg.NIVEL_CLI));
      gridDados.Cells[23, vLin] := trim(string(vReg.TIPO_CLIFOR));
      gridDados.Cells[24, vLin] := trim(string(vReg.BAIRRO_COB_CLI));
      gridDados.Cells[25, vLin] := trim(string(vReg.CIDADE_COB_CLI));
      gridDados.Cells[26, vLin] := trim(string(vReg.UF_COB_CLI));
      gridDados.Cells[27, vLin] := trim(string(vReg.CEP_COB_CLI));
      gridDados.Cells[28, vLin] := trim(string(vReg.CORRESPONDENCIA_CLI));
      gridDados.Cells[29, vLin] := trim(string(vReg.EMITE_NF_CLI));
      gridDados.Cells[30, vLin] := trim(string(vReg.SENHA_INT));
      gridDados.Cells[31, vLin] := trim(string(vReg.TIPO_TAXA_CLI));
      gridDados.Cells[32, vLin] := trim(string(vReg.VALOR_TAXA_CLI));
      gridDados.Cells[33, vLin] := trim(string(vReg.MES_REF_CLI));
      if f1.Size > f1.Position then
      begin
        inc(vLin);
        gridDados.RowCount := vLin + 1;
      end;
    end;
    f1.Destroy;
    ga.MaxValue := gridDados.Cols[0].Count-1;
  end;
end;

procedure TImportaCli_f.FormCreate(Sender: TObject);
begin
  inherited;
  gridDados.colcount := 34;
  with gridDados.Rows[0] do
  begin
    Clear;
    add('COD_CLIENTE');
    add('COD_CLIENTE_ALT');
    add('CNPJCPF_CLI');
    add('TIPO_CLI');
    add('NOME_CLI');
    add('FANTASIA_CLI');
    add('ENDERECO_CLI');
    add('END_COB_CLI');
    add('COMPLEMENTO_CLI');
    add('BAIRRO_CLI');
    add('CIDADE_CLI');
    add('UF_CLI');
    add('FONE1_CLI');
    add('FONE2_CLI');
    add('FONE3_CLI');
    add('EMAIL_CLI');
    add('CONTATO_CLI');
    add('ATIVO_CLI');
    add('STATUS_CLI');
    add('VALOR_MENSAL');
    add('DIA_VENCTO');
    add('CEP_CLI');
    add('NIVEL_CLI');
    add('TIPO_CLIFOR');
    add('BAIRRO_COB_CLI');
    add('CIDADE_COB_CLI');
    add('UF_COB_CLI');
    add('CEP_COB_CLI');
    add('CORRESPONDENCIA_CLI');
    add('EMITE_NF_CLI');
    add('SENHA_INT');
    add('TIPO_TAXA_CLI');
    add('VALOR_TAXA_CLI');
    add('MES_REF_CLI');
  end;
end;

procedure TImportaCli_f.btnImportaClick(Sender: TObject);
var vLin   : Integer;
    vTodos : Boolean;
begin
  inherited;
  vTodos := (MessageDlg('Deseja gerar todas as empresas ?',mtWarning,[mbYes,mbNo],0) = idYes);
  if vTodos then
  begin
    gridDados.Col := 0;
    gridDados.Row := 1;
  end;
  vLin := 1;
  while vLin < gridDados.Cols[0].Count do
  begin
    qryAux.Close;
    qryAux.SQL.Text := 'SELECT * FROM GC_CLIENTE WHERE CNPJCPF_CLI = :CNPJCPF_CLI ';
    qryAux.ParamByName('CNPJCPF_CLI').AsString := gridDados.Cells[ chamaItem('CNPJCPF_CLI', gridDados.rows[0] ),vLin];
    qryAux.Open;

    if qryAux.eof then
    begin
      qryAux.Close;
      qryAux.SQL.Text := 'SELECT * FROM GC_CLIENTE WHERE COD_CLIENTE = :COD_CLIENTE ';
      qryAux.ParamByName('COD_CLIENTE').AsInteger := StrToInt(gridDados.Cells[ chamaItem('COD_CLIENTE', gridDados.rows[0], True ),vLin]);
      qryAux.Open;
      if not qryAux.eof then
      begin
        MessageDlg( 'Já existe um Cliente com o Código ' +
                    gridDados.Cells[ chamaItem('COD_CLIENTE', gridDados.rows[0], True ),vLin]+'.'+#13#10+'Dados não importados para este cliente, verifique.',mtWarning,[mbOk],0);
        inc(vLin);
        ga.AddProgress(1);
        continue;
      end;

      qryAux.Close;
      qryAux.SQL.Text := sql_Ins;
      ApagaParam;
      if chkSeq.Checked then
        qryAux.ParamByName('COD_CLIENTE').AsInteger      := Proximo('GC_CLIENTE','COD_CLIENTE','',true)
      else
        qryAux.ParamByName('COD_CLIENTE').AsInteger      := StrToInt(gridDados.Cells[ chamaItem('COD_CLIENTE', gridDados.rows[0], True ),vLin]);

      qryAux.ParamByName('CNPJCPF_CLI').AsString         := gridDados.Cells[ chamaItem('CNPJCPF_CLI', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('COD_CLIENTE_ALT').AsInteger    := StrToInt(gridDados.Cells[ chamaItem('COD_CLIENTE_ALT', gridDados.rows[0] ),vLin]);
      qryAux.ParamByName('TIPO_CLI').AsString            := gridDados.Cells[ chamaItem('TIPO_CLI', gridDados.rows[0], True ),vLin];
      qryAux.ParamByName('NOME_CLI').AsString            := gridDados.Cells[ chamaItem('NOME_CLI', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('FANTASIA_CLI').AsString        := gridDados.Cells[ chamaItem('FANTASIA_CLI', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('ENDERECO_CLI').AsString        := gridDados.Cells[ chamaItem('ENDERECO_CLI', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('END_COB_CLI').AsString         := gridDados.Cells[ chamaItem('END_COB_CLI', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('COMPLEMENTO_CLI').AsString     := gridDados.Cells[ chamaItem('COMPLEMENTO_CLI', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('BAIRRO_CLI').AsString          := gridDados.Cells[ chamaItem('BAIRRO_CLI', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('CIDADE_CLI').AsString          := gridDados.Cells[ chamaItem('CIDADE_CLI', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('UF_CLI').AsString              := gridDados.Cells[ chamaItem('UF_CLI', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('FONE1_CLI').AsString           := formatmasktext('(####)####-####;0; ',gridDados.Cells[ chamaItem('FONE1_CLI', gridDados.rows[0] ),vLin]);
      qryAux.ParamByName('FONE2_CLI').AsString           := formatmasktext('(####)####-####;0; ',gridDados.Cells[ chamaItem('FONE2_CLI', gridDados.rows[0] ),vLin]);
      qryAux.ParamByName('FONE3_CLI').AsString           := formatmasktext('(####)####-####;0; ',gridDados.Cells[ chamaItem('FONE3_CLI', gridDados.rows[0] ),vLin]);
      qryAux.ParamByName('EMAIL_CLI').AsString           := gridDados.Cells[ chamaItem('EMAIL_CLI', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('CONTATO_CLI').AsString         := gridDados.Cells[ chamaItem('CONTATO_CLI', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('ATIVO_CLI').AsString           := gridDados.Cells[ chamaItem('ATIVO_CLI', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('STATUS_CLI').AsString          := gridDados.Cells[ chamaItem('STATUS_CLI', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('VALOR_MENSAL').AsFloat         := StrToFloat(gridDados.Cells[ chamaItem('VALOR_MENSAL', gridDados.rows[0] ),vLin])/100;
      qryAux.ParamByName('DIA_VENCTO').AsInteger         := StrToInt(gridDados.Cells[ chamaItem('DIA_VENCTO', gridDados.rows[0] ),vLin]);
      qryAux.ParamByName('CEP_CLI').AsString             := formatmasktext('#####-###;0; ',gridDados.Cells[ chamaItem('CEP_CLI', gridDados.rows[0] ),vLin]);

      qryAux.ParamByName('NIVEL_CLI').AsString           := gridDados.Cells[ chamaItem('NIVEL_CLI', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('TIPO_CLIFOR').AsString         := gridDados.Cells[ chamaItem('TIPO_CLIFOR', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('BAIRRO_COB_CLI').AsString      := gridDados.Cells[ chamaItem('BAIRRO_COB_CLI', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('CIDADE_COB_CLI').AsString      := gridDados.Cells[ chamaItem('CIDADE_COB_CLI', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('UF_COB_CLI').AsString          := gridDados.Cells[ chamaItem('UF_COB_CLI', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('CEP_COB_CLI').AsString         := formatmasktext('#####-###;0; ',gridDados.Cells[ chamaItem('CEP_COB_CLI', gridDados.rows[0] ),vLin]);
      qryAux.ParamByName('CORRESPONDENCIA_CLI').AsString := gridDados.Cells[ chamaItem('CORRESPONDENCIA_CLI', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('EMITE_NF_CLI').AsString        := gridDados.Cells[ chamaItem('EMITE_NF_CLI', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('SENHA_INT').AsString           := gridDados.Cells[ chamaItem('SENHA_INT', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('TIPO_TAXA_CLI').AsString       := gridDados.Cells[ chamaItem('TIPO_TAXA_CLI', gridDados.rows[0] ),vLin];
      qryAux.ParamByName('VALOR_TAXA_CLI').AsFloat       := StrToFloat(gridDados.Cells[ chamaItem('VALOR_TAXA_CLI', gridDados.rows[0] ),vLin])/100;
      qryAux.ParamByName('MES_REF_CLI').AsString         := gridDados.Cells[ chamaItem('MES_REF_CLI', gridDados.rows[0] ),vLin];
      qryAux.ExecSQL;
    end
    else
    begin
      if chkDados.Checked then
      begin
        qryAux.Close;
        qryAux.SQL.Text := sql_Up;
        ApagaParam;
        qryAux.ParamByName('CNPJCPF_CLI').AsString         := gridDados.Cells[ chamaItem('CNPJCPF_CLI', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('COD_CLIENTE_ALT').AsInteger    := StrToInt(gridDados.Cells[ chamaItem('COD_CLIENTE_ALT', gridDados.rows[0] ),vLin]);
        qryAux.ParamByName('TIPO_CLI').AsString            := gridDados.Cells[ chamaItem('TIPO_CLI', gridDados.rows[0], True ),vLin];
        qryAux.ParamByName('NOME_CLI').AsString            := gridDados.Cells[ chamaItem('NOME_CLI', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('FANTASIA_CLI').AsString        := gridDados.Cells[ chamaItem('FANTASIA_CLI', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('ENDERECO_CLI').AsString        := gridDados.Cells[ chamaItem('ENDERECO_CLI', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('END_COB_CLI').AsString         := gridDados.Cells[ chamaItem('END_COB_CLI', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('COMPLEMENTO_CLI').AsString     := gridDados.Cells[ chamaItem('COMPLEMENTO_CLI', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('BAIRRO_CLI').AsString          := gridDados.Cells[ chamaItem('BAIRRO_CLI', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('CIDADE_CLI').AsString          := gridDados.Cells[ chamaItem('CIDADE_CLI', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('UF_CLI').AsString              := gridDados.Cells[ chamaItem('UF_CLI', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('FONE1_CLI').AsString           := formatmasktext('(####)####-####;0; ',gridDados.Cells[ chamaItem('FONE1_CLI', gridDados.rows[0] ),vLin]);
        qryAux.ParamByName('FONE2_CLI').AsString           := formatmasktext('(####)####-####;0; ',gridDados.Cells[ chamaItem('FONE2_CLI', gridDados.rows[0] ),vLin]);
        qryAux.ParamByName('FONE3_CLI').AsString           := formatmasktext('(####)####-####;0; ',gridDados.Cells[ chamaItem('FONE3_CLI', gridDados.rows[0] ),vLin]);
        qryAux.ParamByName('EMAIL_CLI').AsString           := gridDados.Cells[ chamaItem('EMAIL_CLI', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('CONTATO_CLI').AsString         := gridDados.Cells[ chamaItem('CONTATO_CLI', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('ATIVO_CLI').AsString           := gridDados.Cells[ chamaItem('ATIVO_CLI', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('STATUS_CLI').AsString          := gridDados.Cells[ chamaItem('STATUS_CLI', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('VALOR_MENSAL').AsFloat         := StrToFloat(gridDados.Cells[ chamaItem('VALOR_MENSAL', gridDados.rows[0] ),vLin])/100;
        qryAux.ParamByName('DIA_VENCTO').AsInteger         := StrToInt(gridDados.Cells[ chamaItem('DIA_VENCTO', gridDados.rows[0] ),vLin]);
        qryAux.ParamByName('CEP_CLI').AsString             := formatmasktext('#####-###;0; ',gridDados.Cells[ chamaItem('CEP_CLI', gridDados.rows[0] ),vLin]);
        qryAux.ParamByName('NIVEL_CLI').AsString           := gridDados.Cells[ chamaItem('NIVEL_CLI', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('TIPO_CLIFOR').AsString         := gridDados.Cells[ chamaItem('TIPO_CLIFOR', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('BAIRRO_COB_CLI').AsString      := gridDados.Cells[ chamaItem('BAIRRO_COB_CLI', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('CIDADE_COB_CLI').AsString      := gridDados.Cells[ chamaItem('CIDADE_COB_CLI', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('UF_COB_CLI').AsString          := gridDados.Cells[ chamaItem('UF_COB_CLI', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('CEP_COB_CLI').AsString         := formatmasktext('#####-###;0; ',gridDados.Cells[ chamaItem('CEP_COB_CLI', gridDados.rows[0] ),vLin]);
        qryAux.ParamByName('CORRESPONDENCIA_CLI').AsString := gridDados.Cells[ chamaItem('CORRESPONDENCIA_CLI', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('EMITE_NF_CLI').AsString        := gridDados.Cells[ chamaItem('EMITE_NF_CLI', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('SENHA_INT').AsString           := gridDados.Cells[ chamaItem('SENHA_INT', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('TIPO_TAXA_CLI').AsString       := gridDados.Cells[ chamaItem('TIPO_TAXA_CLI', gridDados.rows[0] ),vLin];
        qryAux.ParamByName('VALOR_TAXA_CLI').AsFloat       := StrToFloat(gridDados.Cells[ chamaItem('VALOR_TAXA_CLI', gridDados.rows[0] ),vLin])/100;
        qryAux.ParamByName('MES_REF_CLI').AsString         := gridDados.Cells[ chamaItem('MES_REF_CLI', gridDados.rows[0] ),vLin];
        qryAux.ExecSQL;
      end;
    end;
    if not vTodos then
      break;
    inc(vLin);
    ga.AddProgress(1);
  end;
  MessageDlg('Dados importados com sucesso.',mtInformation,[mbOk],0);
  ga.Progress := 0;
end;

procedure TImportaCli_f.ApagaParam;
var x : Integer;
begin
  {Zera valores de Parametros}
  for x := 0 to qryAux.ParamCount -1 do qryAux.Params[x].Clear;
end;

end.
