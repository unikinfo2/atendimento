unit AssociaClienteDoc;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, StdCtrls, Buttons, Mask, ExtCtrls, Menus, DBCtrls, Db, DBTables,
  RxCalc, ComCtrls;

type
  TAssociaClienteDoc_f = class(TDeriva_f)
    Panel1: TPanel;
    Panel2: TPanel;
    medCliente: TMaskEdit;
    sbPesq: TSpeedButton;
    edtNomeCli: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    lbDocLivres: TListBox;
    Label3: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    Label4: TLabel;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    qryAux: TQuery;
    qryDocs: TQuery;
    lbDocAssoc: TListBox;
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    qryDocAssoc: TQuery;
    SpeedButton5: TSpeedButton;
    procedure medClienteExit(Sender: TObject);
    procedure sbPesqClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure lbDocLivresDblClick(Sender: TObject);
    procedure lbDocAssocDblClick(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AssociaClienteDoc_f: TAssociaClienteDoc_f;

implementation

uses Atendimento_dm, funcoes;

{$R *.DFM}

procedure TAssociaClienteDoc_f.medClienteExit(Sender: TObject);
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
  end
  else
  begin
    medCliente.Clear;
    edtNomeCli.Clear;
    sbPesqClick(Sender);
    exit;
  end;
  {Docs Livres}
  qryAux.Close;
  qryAux.SQL.Text := 'select * from gc_documento where cod_docto not in '+
                     ' (select cod_docto from emissao_docto where cod_cliente = ' + medCliente.Text + ')' +
                     ' order by desc_docto';
  qryAux.Open;
  lbDocLivres.Items.Clear;
  while not qryAux.Eof do
  begin
    lbDocLivres.Items.add(formatfloat('00000',qryAux.FieldByName('Cod_Docto').AsInteger) + '-' + qryAux.FieldByName('Desc_Docto').AsString);
    qryAux.Next;
  end;

  {Docs Associados}
  qryAux.Close;
  qryAux.SQL.Text := 'select * from gc_documento where cod_docto in '+
                     ' (select cod_docto from emissao_docto where cod_cliente = ' + medCliente.Text + ')' +
                     ' order by desc_docto';
  qryAux.Open;
  lbDocAssoc.Items.Clear;
  while not qryAux.Eof do
  begin
    lbDocAssoc.Items.add(formatfloat('00000',qryAux.FieldByName('Cod_Docto').AsInteger) + '-' + qryAux.FieldByName('Desc_Docto').AsString);
    qryAux.Next;
  end;
end;

procedure TAssociaClienteDoc_f.sbPesqClick(Sender: TObject);
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

procedure TAssociaClienteDoc_f.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  if lbDocLivres.ItemIndex >= 0 then
  begin
    lbDocAssoc.Items.Add(lbDocLivres.Items.Strings[lbDocLivres.ItemIndex]);
    lbDocLivres.Items.Delete(lbDocLivres.ItemIndex);
  end;
end;

procedure TAssociaClienteDoc_f.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  if lbDocAssoc.ItemIndex >= 0 then
  begin
    lbDocLivres.Items.Add(lbDocAssoc.Items.Strings[lbDocAssoc.ItemIndex]);
    lbDocAssoc.Items.Delete(lbDocAssoc.ItemIndex);
  end;
end;

procedure TAssociaClienteDoc_f.SpeedButton3Click(Sender: TObject);
var x:Integer;
begin
  inherited;
  x := 0;
  while x <= lbDocLivres.Items.Count-1 do
  begin
    lbDocAssoc.Items.Add(lbDocLivres.Items.Strings[x]);
    inc(x);
  end;
  lbDocLivres.Items.Clear;
end;

procedure TAssociaClienteDoc_f.SpeedButton4Click(Sender: TObject);
var x:Integer;
begin
  inherited;
  x := 0;
  while x <= lbDocAssoc.Items.Count-1 do
  begin
    lbDocLivres.Items.Add(lbDocAssoc.Items.Strings[x]);
    inc(x);
  end;
  lbDocAssoc.Items.Clear;
end;

procedure TAssociaClienteDoc_f.BitBtn1Click(Sender: TObject);
var x:Integer;
begin
  inherited;
  qryDocs.ParamByName('Cod_Cliente').AsString := medCliente.Text;
  qryDocs.ExecSQL;
  x := 0;
  qryDocAssoc.Close;
  qryDocAssoc.Open;
  while x <= lbDocAssoc.Items.Count-1 do
  begin
    qryDocAssoc.Insert;
    qryDocAssoc.FieldByName('Cod_Cliente').AsString := medCliente.Text;
    qryDocAssoc.FieldByName('Cod_Docto').AsString   := copy(lbDocAssoc.Items.Strings[x],1,5);
    qryDocAssoc.Post;
    inc(x);
  end;
  lbDocAssoc.Items.Clear;
  lbDocLivres.Items.Clear;
  edtNomeCli.Clear;
  medCliente.Clear;
  medCliente.SetFocus;
end;

procedure TAssociaClienteDoc_f.lbDocLivresDblClick(Sender: TObject);
begin
  inherited;
  speedButton1.Click;
end;

procedure TAssociaClienteDoc_f.lbDocAssocDblClick(Sender: TObject);
begin
  inherited;
  speedButton2.Click;
end;

procedure TAssociaClienteDoc_f.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  dmPesq.PesDocto.Execute;
  if dmPesq.PesDocto.ValoresRetorno[0] <> '' then
  begin
    lbDocLivres.ItemIndex := ChamaItem( formatfloat('00000',StrToInt(dmPesq.PesDocto.ValoresRetorno[1])) + '-' + dmPesq.PesDocto.ValoresRetorno[0], lbDocLivres.Items);
  end;
end;

end.
