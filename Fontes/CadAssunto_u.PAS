unit CadAssunto_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, Menus, Db, DBTables, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls,
  RxCalc, ComCtrls;

type
  TCadAssunto_f = class(TDeriva_f)
    Label1: TLabel;
    edtCodigo: TEdit;
    SpeedButton1: TSpeedButton;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qryAssunto: TQuery;
    dsAssunto: TDataSource;
    qryDepto: TQuery;
    BitBtn3: TBitBtn;
    qryAux: TQuery;
    edtDepto: TEdit;
    Label3: TLabel;
    SpeedButton2: TSpeedButton;
    edtDesc: TEdit;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    edtClassif: TEdit;
    Label5: TLabel;
    procedure edtCodigoExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edtDeptoExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadAssunto_f: TCadAssunto_f;

implementation
uses principal,
     Atendimento_dm, Financeiro_dm, funcoes;
{$R *.DFM}

procedure TCadAssunto_f.edtCodigoExit(Sender: TObject);
begin
  inherited;
  edtDepto.Clear;
  edtDesc.clear;

  if bitbtn3.Focused then
  begin
    edtCodigo.Clear;
    exit;
  end;
  if edtCodigo.Text <> '' then
  begin
    qryAssunto.Close;
    qryAssunto.ParamByName('Cod_Assunto').AsString := edtCodigo.Text;
    qryAssunto.Open;
    if qryAssunto.eof then
    begin
      messagedlg('Assunto não cadastrado.',mtInformation,[mbOk],0);
      edtCodigo.SetFocus;
      exit;
    end
    else
    begin
      edtDepto.Text := qryAssunto.FieldByName('Cod_Depto').AsString;
      edtDeptoExit(sender);
      edtClassif.Text := qryAssunto.FieldByName('classific_assunto').AsString;
      qryAssunto.Edit;
    end;
  end
  else
    edtCodigo.SetFocus;

end;

procedure TCadAssunto_f.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if qryAssunto.State in [dsEdit,dsInsert] then
  begin
    qryAssunto.Cancel;
    qryAssunto.close;
    edtCodigo.Clear;
    edtDesc.Clear;
    edtDepto.Clear;
    edtClassif.Clear;
    edtCodigo.SetFocus;
  end;
end;

procedure TCadAssunto_f.BitBtn1Click(Sender: TObject);
var vCod : Integer;
begin
  inherited;
  if qryAssunto.State in [dsEdit,dsInsert] then
  begin

    if qryAssunto.State in [dsInsert] then
      vCod := proximo('gc_assunto','cod_assunto','', true)
    else
      vCod := qryAssunto.FieldByName('Cod_Assunto').AsInteger;
    qryAssunto.FieldByName('Cod_Assunto').AsInteger := vCod;
    if edtDepto.Text <> '' then
      qryAssunto.FieldByName('Cod_Depto').AsString       := edtDepto.Text;
    qryAssunto.FieldByName('Classific_Assunto').AsString := edtClassif.Text;
    qryAssunto.Post;
    qryAssunto.close;
    edtDesc.Clear;
    edtDepto.Clear;
    edtClassif.Clear;
    edtCodigo.SetFocus;
  end;
end;

procedure TCadAssunto_f.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  dmPesq.PesAssunto.Execute;
  edtCodigo.Text := dmPesq.PesAssunto.ValoresRetorno[1];
  if edtCodigo.Text = '' then
  begin
    edtCodigo.SetFocus;
    exit;
  end;
  qryAssunto.Close;
  qryAssunto.ParamByName('Cod_Assunto').AsString := edtCodigo.Text;
  qryAssunto.Open;
  qryAssunto.Edit;
end;

procedure TCadAssunto_f.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  dmPesq.pesDepto.StringSql.Clear;
  dmPesq.pesDepto.StringSql.Add('SELECT * FROM GC_DEPARTAMENTO');
  dmPesq.PesDepto.Execute;
  edtDepto.Text := dmPesq.PesDepto.ValoresRetorno[0];
  edtDesc.Text  := dmPesq.PesDepto.ValoresRetorno[1];
  if edtDepto.Text = '' then
  begin
    edtDepto.SetFocus;
    exit;
  end;
end;

procedure TCadAssunto_f.edtDeptoExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := False;
    exit;
  end;
  if edtDepto.Text <> '' then
  begin
    qryDepto.Close;
    qryDepto.ParamByName('Cod_Depto').AsString := edtDepto.Text;
    qryDepto.Open;
    if qryDepto.eof then
    begin
      messagedlg('Departamento não cadastrado.',mtInformation,[mbOk],0);
      edtDepto.SetFocus;
    end
    else
      edtDesc.Text := qryDepto.fieldbyname('Desc_Depto').AsString;
  end
  else
    edtDepto.SetFocus;

end;

procedure TCadAssunto_f.BitBtn3Click(Sender: TObject);
begin
  inherited;
  qryAssunto.Close;
  qryAssunto.ParamByName('Cod_Assunto').AsInteger := 0;
  qryAssunto.Open;
  edtClassif.Clear;
  qryAssunto.Insert;
  edtClassif.SetFocus;
end;

end.
