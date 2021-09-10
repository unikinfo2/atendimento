unit EmiteDocAssoc_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, RxCalc, Menus, StdCtrls, Buttons, Mask, Db, DBTables, ExtCtrls,
  ToolEdit;

type
  TEmiteDocAssoc_f = class(TDeriva_f)
    BitBtn1: TBitBtn;
    medCliente: TMaskEdit;
    Label1: TLabel;
    sbPesq: TSpeedButton;
    edtNomeCli: TEdit;
    Label2: TLabel;
    qryAux: TQuery;
    edtCodDocto: TEdit;
    Label3: TLabel;
    sbPesDocto: TSpeedButton;
    edtDescDocto: TEdit;
    Label4: TLabel;
    qryDocto: TQuery;
    dtDe: TDateEdit;
    dtAte: TDateEdit;
    Label5: TLabel;
    Label6: TLabel;
    rgFiltro: TRadioGroup;
    rgMostra: TRadioGroup;
    procedure BitBtn1Click(Sender: TObject);
    procedure sbPesqClick(Sender: TObject);
    procedure medClienteExit(Sender: TObject);
    procedure sbPesDoctoClick(Sender: TObject);
    procedure edtCodDoctoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EmiteDocAssoc_f: TEmiteDocAssoc_f;

implementation

uses Atendimento_dm, principal, qrDocAssoc, funcoes;

{$R *.DFM}

procedure TEmiteDocAssoc_f.BitBtn1Click(Sender: TObject);
var sSql : String;
begin
  inherited;
  qrDocAssoc_f := TqrDocAssoc_f.Create(nil);
  sSql := 'SELECT * FROM EMISSAO_DOCTO  EMI '+
          ' LEFT  JOIN GC_CLIENTE       CLI ON (EMI.COD_CLIENTE = CLI.COD_CLIENTE) '+
          ' LEFT  JOIN GC_DOCUMENTO     DOC ON (EMI.COD_DOCTO   = DOC.COD_DOCTO)   '+
          ' INNER JOIN GC_DEPARTAMENTO  DEP ON (DOC.COD_DEPTO   = DEP.COD_DEPTO)   '+
          ' LEFT  JOIN gc_obrigacoes    OBR ON (OBR.COD_DOCTO   = EMI.cod_docto AND OBR.COD_CLIENTE = EMI.COD_CLIENTE) ';
  if medCliente.text <> '' then
    sSql := sSql + ' WHERE EMI.COD_CLIENTE = ' + medCliente.text
  else
    sSql := sSql + ' WHERE EMI.COD_CLIENTE >= 0';

  if edtCodDocto.text <> '' then
    sSql := sSql + ' AND EMI.COD_DOCTO = ' + edtCodDocto.text
  else
    sSql := sSql + ' AND EMI.COD_DOCTO >= 0';

  if (dtDe.Text <> '  /  /    ') and (dtAte.Text <> '  /  /    ') then
  begin
    if rgFiltro.ItemIndex = 0 then
    begin
      sSql := sSql + ' AND OBR.DT_VENCTO >= ' + DataSql(dtDe.Date) +
                     ' AND OBR.DT_VENCTO <= ' + DataSql(dtAte.Date);
    end
    else
    begin
      sSql := sSql + ' AND OBR.DT_ENVIO >= ' + DataSql(dtDe.Date) +
                     ' AND OBR.DT_ENVIO <= ' + DataSql(dtAte.Date);
    end;
  end;
  if rgMostra.ItemIndex = 1 then
    sSql := sSql + ' AND OBR.DT_ENVIO IS NOT NULL ';
  if rgMostra.ItemIndex = 2 then
    sSql := sSql + ' AND OBR.DT_ENVIO IS NULL ';

  sSql := sSql + ' ORDER BY CLI.NOME_CLI, EMI.COD_CLIENTE, OBR.DT_VENCTO, DEP.DESC_DEPTO, DOC.COD_DOCTO';
  qrDocAssoc_f.Query1.Close;
  qrDocAssoc_f.Query1.sql.Text := sSql;
  qrDocAssoc_f.Query1.Open;
  qrDocAssoc_f.Preview;
end;

procedure TEmiteDocAssoc_f.sbPesqClick(Sender: TObject);
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
end;

procedure TEmiteDocAssoc_f.medClienteExit(Sender: TObject);
begin
  inherited;
  if medCliente.Text <> '' then
  begin
    qryAux.Close;
    qryAux.SQL.Text := 'SELECT * FROM GC_CLIENTE WHERE COD_CLIENTE='+medCliente.Text;
    qryAux.Open;
    if qryAux.eof then
    begin
      messagedlg('Codigo de Cliente não cadastrado.',mtWarning,[mbOk],0);
      medCliente.SetFocus;
      exit;
    end;
    medCliente.Text  := qryAux.FieldByName('Cod_Cliente').AsString;
    edtNomeCli.Text  := qryAux.FieldByName('Nome_cli').AsString;
  end;
end;

procedure TEmiteDocAssoc_f.sbPesDoctoClick(Sender: TObject);
begin
  inherited;
  dmPesq.PesDocto.Execute;
  if dmPesq.PesDocto.ValoresRetorno[1] <> '' then
  begin
    edtCodDocto.Text  := dmPesq.PesDocto.ValoresRetorno[1];
    edtDescDocto.Text := dmPesq.PesDocto.ValoresRetorno[0];
    exit;
  end;
  qryDocto.Close;
  qryDocto.ParamByName('Cod_Docto').AsString := edtCodDocto.Text;
  qryDocto.Open;
end;

procedure TEmiteDocAssoc_f.edtCodDoctoExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
  edtDescDocto.Clear;
  if edtCodDocto.Text <> '' then
  begin
    qryDocto.Close;
    qryDocto.ParamByName('Cod_Docto').AsString := edtCodDocto.Text;
    qryDocto.Open;
    if qryDocto.eof then
    begin
      messagedlg('Documento não cadastrado, cadastre e tente novamente.',mtInformation,[mbOk],0);
      edtCodDocto.SetFocus;
    end
    else
    begin
      edtDescDocto.Text := qryDocto.FieldByName('Desc_Docto').AsString;
    end;
  end;
end;

end.
