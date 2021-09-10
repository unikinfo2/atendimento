unit CadFuncionario_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, Menus, Db, DBTables, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls,
  RxCalc, ComCtrls, ToolEdit, RXDBCtrl;

type
  TCadFuncionario_f = class(TDeriva_f)
    Label1: TLabel;
    edtCodigo: TEdit;
    SpeedButton1: TSpeedButton;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qryFunc: TQuery;
    dsFunc: TDataSource;
    edtDepto: TEdit;
    SpeedButton2: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    edtDesc: TEdit;
    qryDepto: TQuery;
    DBEdit2: TDBEdit;
    Label6: TLabel;
    Label7: TLabel;
    Edit1: TEdit;
    Label8: TLabel;
    DBEdit4: TDBEdit;
    Label9: TLabel;
    DBEdit5: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBRadioGroup1: TDBRadioGroup;
    qryFuncCOD_FUNC: TIntegerField;
    qryFuncCOD_DEPTO: TIntegerField;
    qryFuncNOME_FUNC: TStringField;
    qryFuncFONE1: TStringField;
    qryFuncFONE2: TStringField;
    qryFuncRESPONSAVEL: TStringField;
    qryFuncEMAIL_FUNC: TStringField;
    qryFuncAPELIDO_FUNC: TStringField;
    qryFuncSENHA_FUNC: TStringField;
    qryFuncNIVEL_FUNC: TStringField;
    Edit2: TEdit;
    Label10: TLabel;
    BitBtn3: TBitBtn;
    BitBtn5: TBitBtn;
    qryFuncATIVO_FUNC: TStringField;
    DBDateEdit1: TDBDateEdit;
    Label11: TLabel;
    qryFuncDT_NASCIMENTO: TDateTimeField;
    DBEdit6: TDBEdit;
    Label12: TLabel;
    qryFuncRAMAL_FUNC: TStringField;
    procedure edtCodigoExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edtDeptoExit(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadFuncionario_f: TCadFuncionario_f;

implementation
uses principal,
     Atendimento_dm,
     funcoes;
{$R *.DFM}

procedure TCadFuncionario_f.edtCodigoExit(Sender: TObject);
begin
  inherited;
  edtDepto.Clear;
  edtDesc.clear;
  edit1.Clear;
  edit2.Clear;
  Edit1.Clear;
  if edtCodigo.Text <> '' then
  begin
    qryFunc.Close;
    qryFunc.ParamByName('Cod_Func').AsString := edtCodigo.Text;
    qryFunc.Open;
    if qryFunc.eof then
    begin
      messagedlg('Funcionário não cadastrado.',mtInformation,[mbOk],0);
      edtCodigo.SetFocus;
      exit;
      {qryFunc.Insert;
      qryFunc.FieldByName('RESPONSAVEL').AsString := 'N';
      qryFunc.FieldByName('NIVEL_FUNC').AsString  := '1';
      edit1.Enabled := true;}
    end
    else
    begin
      edtDepto.Text := qryFunc.FieldByName('Cod_Depto').AsString;
      Edit1.text    := qryFunc.FieldByName('Senha_Func').AsString;
      edtDeptoExit(sender);
      if nivel = 0 then
      begin
        qryFunc.Edit;
      end;
      edit1.Enabled := false;
    end;
  end;

end;

procedure TCadFuncionario_f.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if qryFunc.State in [dsEdit,dsInsert] then
  begin
    qryFunc.Cancel;
    qryFunc.close;
    edtCodigo.Clear;
    edtDesc.Clear;
    edtDepto.Clear;
    edit1.Clear;
    edit2.Clear;
    edtCodigo.SetFocus;
  end;
end;

procedure TCadFuncionario_f.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if qryFunc.State in [dsInsert] then
  begin
    qryFunc.FieldByName('Cod_Func').AsInteger   := proximo('gc_funcionario','cod_func','', true);
    qryFunc.FieldByName('Cod_Depto').AsString   := edtDepto.Text;
    qryFunc.FieldByName('Senha_Func').AsString  := edit1.Text;
    qryFunc.Post;
    qryFunc.close;
    edtCodigo.Clear;
    edtDesc.Clear;
    edtDepto.Clear;
    edit1.Clear;
    edit2.Clear;
    edtCodigo.SetFocus;
  end;
  if (qryFunc.State in [dsEdit]) or (edit1.Text <> edit2.Text) then
  begin

    if not (qryFunc.State in [dsEdit]) then
      qryFunc.Edit;

    qryFunc.FieldByName('Cod_Depto').AsString   := edtDepto.Text;
    qryFunc.FieldByName('Senha_Func').AsString  := edit1.Text;
    qryFunc.Post;
    qryFunc.close;
    edtCodigo.Clear;
    edtDesc.Clear;
    edtDepto.Clear;
    edit1.Clear;
    edit2.Clear;
    edtCodigo.SetFocus;
  end;
end;

procedure TCadFuncionario_f.SpeedButton1Click(Sender: TObject);
var vsql : String;
begin
  inherited;
  vSql := dmPesq.PesFunc.StringSql.Text;
  dmPesq.PesFunc.StringSql.Text := 'SELECT * FROM GC_FUNCIONARIO WHERE ATIVO_FUNC <> ''N'' '+#13#10+
                                   ' ORDER BY NOME_FUNC ';
  dmPesq.PesFunc.Execute;
  dmPesq.PesFunc.StringSql.Text := vSql;
  edtCodigo.Text := dmPesq.PesFunc.ValoresRetorno[0];
  if edtCodigo.Text = '' then
  begin
    edtCodigo.SetFocus;
    exit;
  end;
  qryFunc.Close;
  qryFunc.ParamByName('Cod_Func').AsString := edtCodigo.Text;
  qryFunc.Open;
  edtCodigoExit(sender);
  qryFunc.Edit;
end;

procedure TCadFuncionario_f.FormCreate(Sender: TObject);
begin
  inherited;
  dmPesq.pesFunc.StringSql.Clear;
  dmPesq.pesFunc.StringSql.Add('SELECT * FROM GC_FUNCIONARIO');
  dmPesq.pesFunc.StringSql.Add(' ORDER BY NOME_FUNC ');
  bitbtn3.Enabled := (nivel = 0);
end;

procedure TCadFuncionario_f.SpeedButton2Click(Sender: TObject);
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

procedure TCadFuncionario_f.edtDeptoExit(Sender: TObject);
begin
  inherited;
  if edtDepto.Text <> '' then
  begin
    qryDepto.Close;
    qryDepto.ParamByName('Cod_Depto').AsString := edtDepto.Text;
    qryDepto.Open;
    if qryDepto.eof then
      messagedlg('Departamento não cadastrado.',mtInformation,[mbOk],0)
    else
      edtDesc.Text := qryDepto.fieldbyname('Desc_Depto').AsString;
  end
  else
    edtDepto.SetFocus;

end;

procedure TCadFuncionario_f.Edit2Exit(Sender: TObject);
begin
  inherited;
  if (edit2.Text = edit1.Text) and (inttostr(cod_func)=edtCodigo.Text) then
  begin
    {(qryFunc.State = dsEdit) and }
    edit1.Enabled := true;
    edit1.SetFocus;
  end;
end;

procedure TCadFuncionario_f.BitBtn3Click(Sender: TObject);
begin
  inherited;
  qryFunc.Close;
  qryFunc.ParamByName('Cod_Func').AsInteger := 0;
  qryFunc.Open;
  qryFunc.Insert;
  qryFunc.FieldByName('RESPONSAVEL').AsString := 'N';
  qryFunc.FieldByName('NIVEL_FUNC').AsString  := '1';
  qryFunc.FieldByName('ATIVO_FUNC').AsString  := 'S';
  edit1.Enabled := true;
  edit1.Clear;
  edit2.Clear;
  dbEdit1.SetFocus;
end;

procedure TCadFuncionario_f.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if Nivel <= 1 then
  begin
    if messagedlg('Deseja realmente apagar este Funcionário ?',mtWarning,[mbYes,mbNo],0) = IDYes then
    begin
      qryFunc.Edit;
      qryFunc.FieldByName('ativo_func').AsString   := 'N';
      qryFunc.Post;
      qryFunc.close;
      edtCodigo.Clear;
      edtDesc.Clear;
      edtDepto.Clear;
      edit1.Clear;
      edit2.Clear;
      edtCodigo.SetFocus;
    end;
  end
  else
  begin
    messagedlg('Não é possível apagar funcionário com este Nível de senha.',mtWarning,[mbOk],0);
    exit;
  end;
end;

end.
