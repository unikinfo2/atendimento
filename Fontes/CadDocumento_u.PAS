unit CadDocumento_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, Menus, Db, DBTables, StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls,
  RxCalc, ComCtrls;

type
  TCadDocumento_f = class(TDeriva_f)
    Label1: TLabel;
    edtCodigo: TEdit;
    SpeedButton1: TSpeedButton;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qryDocto: TQuery;
    dsDocto: TDataSource;
    qryDepto: TQuery;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label3: TLabel;
    edtDepto: TEdit;
    SpeedButton2: TSpeedButton;
    edtDesc: TEdit;
    Label4: TLabel;
    DBRadioGroup2: TDBRadioGroup;
    DBEdit3: TDBEdit;
    Label5: TLabel;
    DBRadioGroup1: TDBRadioGroup;
    Label21: TLabel;
    Label22: TLabel;
    SpeedButton3: TSpeedButton;
    Label23: TLabel;
    Label24: TLabel;
    SpeedButton4: TSpeedButton;
    medConta: TMaskEdit;
    medPlano: TMaskEdit;
    Edit3: TEdit;
    Edit2: TEdit;
    medServico: TMaskEdit;
    Label11: TLabel;
    SpeedButton5: TSpeedButton;
    Edit1: TEdit;
    Label12: TLabel;
    qryAux: TQuery;
    DBRadioGroup3: TDBRadioGroup;
    DBCheckBox1: TDBCheckBox;
    procedure edtCodigoExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edtDeptoExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure medServicoExit(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure medContaExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure medPlanoExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadDocumento_f: TCadDocumento_f;

implementation
uses principal,
     Atendimento_dm, Financeiro_dm, funcoes;
{$R *.DFM}

procedure TCadDocumento_f.edtCodigoExit(Sender: TObject);
begin
  inherited;
  edtDepto.Clear;
  edtDesc.clear;

  medServico.Clear;
  medConta.Clear;
  medPlano.Clear;
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;

  if bitbtn3.Focused then
  begin
    edtCodigo.Clear;
    exit;
  end;
  if edtCodigo.Text <> '' then
  begin
    qryDocto.Close;
    qryDocto.ParamByName('Cod_Docto').AsString := edtCodigo.Text;
    qryDocto.Open;
    if qryDocto.eof then
    begin
      messagedlg('Documento não cadastrado.',mtInformation,[mbOk],0);
      edtCodigo.SetFocus;
      exit;
    end
    else
    begin
      edtDepto.Text := qryDocto.FieldByName('Cod_Depto').AsString;
      edtDeptoExit(sender);
      edtDepto.Text   := qryDocto.FieldByName('Cod_Depto').AsString;
      medServico.Text := qryDocto.FieldByName('Cod_Serv').AsString;
      medConta.Text   := qryDocto.FieldByName('Cod_Banco').AsString;
      medPlano.Text   := qryDocto.FieldByName('Cod_PlConta').AsString;

      medServicoExit(self);
      medContaExit(Self);
      medPlanoExit(Self);

      qryDocto.Edit;
    end;
  end
  else
    edtCodigo.SetFocus;

end;

procedure TCadDocumento_f.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if qryDocto.State in [dsEdit,dsInsert] then
  begin
    qryDocto.Cancel;
    qryDocto.close;
    edtCodigo.Clear;
    edtDesc.Clear;
    edtDepto.Clear;
    medServico.Clear;
    medConta.Clear;
    medPlano.Clear;
    edit1.Clear;
    edit2.Clear;
    edit3.Clear;
    edtCodigo.SetFocus;
  end;
end;

procedure TCadDocumento_f.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if qryDocto.State in [dsEdit,dsInsert] then
  begin

    if qryDocto.State in [dsInsert] then
      qryDocto.FieldByName('Cod_Docto').AsInteger := proximo('gc_documento','cod_docto', '', true);

    if edtDepto.Text <> '' then
      qryDocto.FieldByName('Cod_Depto').AsString := edtDepto.Text;
    if medServico.Text <> '' then
      qryDocto.FieldByName('Cod_Serv').AsString     := medServico.Text;
    if medConta.Text <> '' then
      qryDocto.FieldByName('Cod_Banco').AsString     := medConta.Text;
    if medPlano.Text <> '' then
      qryDocto.FieldByName('Cod_PlConta').AsString   := medPlano.Text;

    qryDocto.Post;
    qryDocto.close;
    edtCodigo.Clear;
    edtDesc.Clear;
    edtDepto.Clear;

    medServico.Clear;
    medConta.Clear;
    medPlano.Clear;
    edit1.Clear;
    edit2.Clear;
    edit3.Clear;

    edtCodigo.SetFocus;
  end;
end;

procedure TCadDocumento_f.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  dmPesq.PesDocto.Execute;
  edtCodigo.Text := dmPesq.PesDocto.ValoresRetorno[1];
  if edtCodigo.Text = '' then
  begin
    edtCodigo.SetFocus;
    exit;
  end;
  qryDocto.Close;
  qryDocto.ParamByName('Cod_Docto').AsString := edtCodigo.Text;
  qryDocto.Open;
  qryDocto.Edit;
end;

procedure TCadDocumento_f.FormCreate(Sender: TObject);
begin
  inherited;
  dmPesq.pesDocto.StringSql.Clear;
  dmPesq.pesDocto.StringSql.Add('SELECT * FROM GC_DOCUMENTO');
  TabSheet2.TabVisible := nivel = 0;
end;

procedure TCadDocumento_f.SpeedButton2Click(Sender: TObject);
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

procedure TCadDocumento_f.edtDeptoExit(Sender: TObject);
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

procedure TCadDocumento_f.BitBtn3Click(Sender: TObject);
begin
  inherited;
  qryDocto.Close;
  qryDocto.ParamByName('Cod_Docto').AsInteger := 0;
  qryDocto.Open;
  qryDocto.Insert;
  qryDocto.FieldByName('COMPETENCIA_DOCTO').AsString := 'M';
  qryDocto.FieldByName('STATUS_DIAS_DOCTO').AsString := 'C';
  qryDocto.FieldByName('TIPO_VENCTO').AsString       := 'F';
  medServico.Clear;
  medConta.Clear;
  medPlano.Clear;
  edit1.Clear;
  edit2.Clear;
  edit3.Clear;
  dbEdit1.SetFocus;
end;

procedure TCadDocumento_f.medServicoExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
  if medServico.Text <> '' then
  begin
    qryAux.close;
    qryAux.sql.Text := 'SELECT * FROM CF_SERVICO WHERE COD_SERV = '+medServico.Text;
    qryAux.Open;
    if qryAux.Eof then
    begin
      messagedlg('Codigo do Serviço não cadastrado.',mtInformation,[mbOk],0);
      edit1.Clear;
      exit;
    end;
    edit1.Text := qryAux.FieldByName('desc_serv').AsString;
    exit;
  end;
end;

procedure TCadDocumento_f.SpeedButton5Click(Sender: TObject);
begin
  inherited;
  dmFinanc.PesServico.Execute;
  if dmFinanc.PesServico.ValoresRetorno[0] <> '' then
  begin
    medServico.Text := dmFinanc.PesServico.ValoresRetorno[0];
    medServicoExit(Self);
  end
  else
  begin
    medServico.SetFocus;
  end;
end;

procedure TCadDocumento_f.SpeedButton4Click(Sender: TObject);
var sSql : String;
begin
  dmFinanc.PesBanco.Execute;
  if dmFinanc.PesBanco.ValoresRetorno[0] <> '' then
  begin
    medConta.Clear;
    medConta.Text := dmFinanc.PesBanco.ValoresRetorno[0];
    medContaExit(sender);
  end;
end;

procedure TCadDocumento_f.medContaExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
  edit2.Clear;
  if medConta.Text <> '' then
  begin
    qryAux.close;
    qryAux.sql.Text := 'SELECT * FROM CF_BANCO WHERE COD_BANCO = ''' + medConta.Text + '''';
    qryAux.Open;
    if qryAux.Eof then
    begin
      messagedlg('Codigo do Banco não cadastrado.',mtInformation,[mbOk],0);
      medConta.SetFocus;
    end;
    edit2.Text := qryAux.FieldByName('conta_desc_banco').AsString;
    exit;
  end;
end;

procedure TCadDocumento_f.SpeedButton3Click(Sender: TObject);
var sSql : String;
begin
  sSql := 'SELECT * FROM CF_PLANO_CONTA' +
          ' ORDER BY DESC_PLCONTA';

  dmFinanc.PesPlConta.StringSql.Clear;
  dmFinanc.PesPlConta.StringSql.Add(sSql);
  dmFinanc.PesPlConta.Execute;
  if dmFinanc.PesPlConta.ValoresRetorno[0] <> '' then
  begin
    medPlano.Clear;
    medPlano.Text := dmFinanc.PesPlConta.ValoresRetorno[0];
    medPlanoExit(sender);
  end;
end;

procedure TCadDocumento_f.medPlanoExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
  edit3.Clear;
  if medPlano.Text <> '' then
  begin
    qryAux.close;
    qryAux.sql.Text := 'SELECT * FROM CF_PLANO_CONTA WHERE TIPO_PLCONTA = ''C'' AND COD_PLCONTA = ' + medPlano.Text;
    qryAux.Open;
    if qryAux.Eof then
    begin
      messagedlg('Codigo do Plano de Contas não cadastrado.',mtInformation,[mbOk],0);
      medPlano.SetFocus;
    end;
    edit3.Text := qryAux.FieldByName('desc_plconta').AsString;
    exit;
  end;
end;

end.
