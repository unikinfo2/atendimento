unit CadDepartamento_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, Menus, Db, DBTables, StdCtrls, Buttons, Mask, DBCtrls, RxCalc,
  ToolEdit, CurrEdit, RXDBCtrl, RxDBComb;

type
  TCadDepartamento_f = class(TDeriva_f)
    Label1: TLabel;
    edtCodigo: TEdit;
    SpeedButton1: TSpeedButton;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qryDepto: TQuery;
    dsDepto: TDataSource;
    RxDBCalcEdit1: TRxDBCalcEdit;
    Label3: TLabel;
    Label4: TLabel;
    cbxTipo: TRxDBComboBox;
    procedure edtCodigoExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadDepartamento_f: TCadDepartamento_f;

implementation
uses principal,
     Atendimento_dm;
{$R *.DFM}

procedure TCadDepartamento_f.edtCodigoExit(Sender: TObject);
begin
  inherited;
  if edtCodigo.Text <> '' then
  begin
    qryDepto.Close;
    qryDepto.ParamByName('Cod_Depto').AsString := edtCodigo.Text;
    qryDepto.Open;
    if qryDepto.eof then
      qryDepto.Insert
    else
      qryDepto.Edit;
  end
  else
    edtCodigo.SetFocus;

end;

procedure TCadDepartamento_f.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if qryDepto.State in [dsEdit,dsInsert] then
  begin
    qryDepto.Cancel;
    qryDepto.close;
    edtCodigo.Clear;
    edtCodigo.SetFocus;
  end;
end;

procedure TCadDepartamento_f.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if qryDepto.State in [dsEdit,dsInsert] then
  begin
    qryDepto.FieldByName('Cod_Depto').AsString := edtCodigo.Text;
    qryDepto.Post;
    qryDepto.close;
    edtCodigo.Clear;
    edtCodigo.SetFocus;
  end;
end;

procedure TCadDepartamento_f.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  dmPesq.PesDepto.Execute;
  edtCodigo.Text := dmPesq.PesDepto.ValoresRetorno[0];
  if edtCodigo.Text = '' then
  begin
    edtCodigo.SetFocus;
    exit;
  end;
  qryDepto.Close;
  qryDepto.ParamByName('Cod_Depto').AsString := edtCodigo.Text;
  qryDepto.Open;
  qryDepto.Edit;
end;

procedure TCadDepartamento_f.FormCreate(Sender: TObject);
begin
  inherited;
  dmPesq.pesDepto.StringSql.Clear;
  dmPesq.pesDepto.StringSql.Add('SELECT * FROM GC_DEPARTAMENTO');
end;

end.
