unit CadCliente_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Mask, DBCtrls, ExtCtrls, Db, DBTables, MasterEdit,
  MEdPesquisa, Deriva_u, Menus, RxDBComb, ComCtrls, ToolEdit, RXDBCtrl,
  ADODB, DBClient, Provider;

type
  TCadCliente_f = class(TDeriva_f)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit2: TDBEdit;
    rgTipo: TDBRadioGroup;
    Label4: TLabel;
    dbeCnpjCpf: TDBEdit;
    qryClientes: TADOQuery;
    medCodigo: TMaskEdit;
    sbPesq: TSpeedButton;
    DBEdit1: TDBEdit;
    Label16: TLabel;
    rgSituacao: TDBRadioGroup;
    DBEdit16: TDBEdit;
    MainMenu1: TMainMenu;
    AssociaDocumentosaClientes1: TMenuItem;
    Saida1: TMenuItem;
    Panel1: TPanel;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    pg: TPageControl;
    TabSheet2: TTabSheet;
    dsClientes: TDataSource;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label19: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit17: TDBEdit;
    tsFinan: TTabSheet;
    Label17: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label18: TLabel;
    cbNivel: TDBComboBox;
    Label20: TLabel;
    medConta: TMaskEdit;
    Label21: TLabel;
    medPlano: TMaskEdit;
    Label22: TLabel;
    SpeedButton1: TSpeedButton;
    Edit3: TEdit;
    Label23: TLabel;
    Edit2: TEdit;
    Label24: TLabel;
    SpeedButton4: TSpeedButton;
    qryAux: TQuery;
    DBRadioGroup1: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    DBCheckBox1: TDBCheckBox;
    Endere: TTabSheet;
    Label29: TLabel;
    DBEdit22: TDBEdit;
    Label25: TLabel;
    DBEdit18: TDBEdit;
    Label27: TLabel;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    Label28: TLabel;
    DBEdit19: TDBEdit;
    Label26: TLabel;
    DBEdit3: TDBEdit;
    Label15: TLabel;
    DBEdit23: TDBEdit;
    Label30: TLabel;
    Label31: TLabel;
    cbxRef: TDBComboBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    Label32: TLabel;
    DBDateEdit1: TDBDateEdit;
    Label33: TLabel;
    DBDateEdit2: TDBDateEdit;
    DBCheckBox5: TDBCheckBox;
    procedure sbPesqClick(Sender: TObject);
    procedure medCodigoExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbeCnpjCpfExit(Sender: TObject);
    procedure AssociaDocumentosaClientes1Click(Sender: TObject);
    procedure Saida1Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure pgChanging(Sender: TObject; var AllowChange: Boolean);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure medContaExit(Sender: TObject);
    procedure medPlanoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBEdit17Exit(Sender: TObject);
    procedure medContaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure medPlanoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure rgTipoClick(Sender: TObject);
  private
    { Private declarations }
  public
  end;

var
  CadCliente_f: TCadCliente_f;

implementation
uses Atendimento_dm, Principal, AssociaClienteDoc, Financeiro_dm, funcoes;

{$R *.DFM}

procedure TCadCliente_f.sbPesqClick(Sender: TObject);
begin
  dmPesq.PesCliente.StringSql.Clear;
  dmPesq.PesCliente.StringSql.Add('SELECT * FROM GC_CLIENTE ');
  dmPesq.PesCliente.StringSql.Add(' ORDER BY NOME_CLI');
  dmPesq.PesCliente.Execute;
  medCodigo.Text := dmPesq.PesCliente.ValoresRetorno[0];
  if medCodigo.Text <> '' then
  begin
    qryClientes.Close;
    qryClientes.Parameters.ParamByName('Cod_Cliente').Value  := medCodigo.Text;
    qryClientes.Open;
  end
  else
  begin
    medCodigo.SetFocus;
  end;
end;

procedure TCadCliente_f.medCodigoExit(Sender: TObject);
begin
  if medCodigo.Text = '' then
  begin
    exit;
  end;
  qryClientes.Close;
  qryClientes.Parameters.ParamByName('Cod_Cliente').Value  := medCodigo.Text;
  qryClientes.Open;
  if qryClientes.Eof then
  begin
    if messagedlg('Codigo de Cliente não Cadastrado. Deseja cadastrar ?',mtConfirmation,[mbYes,mbNo],0) = idYes then
    begin
      cdsCli.Close;
      cdsCli.Open;
      cdsCli.Insert;
      cdsCli.FieldByName('Tipo_cli').AsString    := 'F';
      cdsCli.FieldByName('Ativo_cli').AsString   := 'P';
      cdsCli.Post;


      qryClientes.Insert;
      qryClientes.FieldByName('Tipo_cli').AsString    := 'F';
      qryClientes.FieldByName('Ativo_cli').AsString   := 'P';
      qryClientes.FieldByName('Nivel_cli').AsString   := '1';
      qryClientes.FieldByName('Tipo_CliFor').AsString := 'C';
      if qryClientes.FieldByName('TIPO_CLI').Value = 'F' then
        qryClientes.FieldByName('CNPJCPF_CLI').EditMask := '###.###.###-##;0; '
      else if qryClientes.FieldByName('TIPO_CLI').Value = 'J' then
        qryClientes.FieldByName('CNPJCPF_CLI').EditMask := '##.###.###/####-##;0; '
      else
        qryClientes.FieldByName('CNPJCPF_CLI').EditMask := '';

      dbEdit1.SetFocus;
      exit;
    end;
    medCodigo.SetFocus;
    exit;
  end
  else
  begin
    qryClientes.Edit;
    if rgTipo.ItemIndex = 0 then
      qryClientes.FieldByName('CNPJCPF_CLI').EditMask := '###.###.###-##;0; '
    else if rgTipo.ItemIndex = 1 then
      qryClientes.FieldByName('CNPJCPF_CLI').EditMask := '##.###.###/####-##;0; '
    else
      qryClientes.FieldByName('CNPJCPF_CLI').EditMask := '';

    if qryClientes.FieldByName('Nivel_cli').AsString <> '' then
      cbNivel.ItemIndex := StrToInt(qryClientes.FieldByName('Nivel_cli').AsString)-1;
    medConta.Text := qryClientes.FieldByName('cod_banco').AsString;
    medContaExit(self);
    medPlano.Text := qryClientes.FieldByName('cod_plconta').AsString;
    medPlanoExit(Self);
  end;
end;

procedure TCadCliente_f.BitBtn1Click(Sender: TObject);
var cod : Integer;
begin
  if qryClientes.State in [dsInsert] then
  begin
    if medCodigo.Text = '' then
      cod := proximo('gc_cliente','cod_cliente','', true)
    else
      cod := strtoint(medCodigo.Text);
    qryClientes.FieldByName('Cod_Cliente').AsInteger  := cod;

    if medConta.Text <> '' then
      qryClientes.FieldByName('Cod_banco').AsString     := medConta.Text;
    if medPlano.Text <> '' then
      qryClientes.FieldByName('Cod_PlConta').AsString   := medPlano.Text;

    qryClientes.Post;
    qryClientes.close;
    medCodigo.Clear;
    medConta.Clear;
    medPlano.Clear;
    edit2.Clear;
    edit3.Clear;
    medCodigo.Text := IntToStr(cod);
    medCodigo.SetFocus;
  end;
  if qryClientes.State in [dsEdit] then
  begin
    if medConta.Text <> '' then
      qryClientes.FieldByName('Cod_banco').AsString     := medConta.Text;
    if medPlano.Text <> '' then
      qryClientes.FieldByName('Cod_PlConta').AsString   := medPlano.Text;
    qryClientes.Post;
    qryClientes.close;
    medConta.Clear;
    medPlano.Clear;
    medCodigo.Clear;
    medCodigo.SetFocus;
  end;
end;

procedure TCadCliente_f.BitBtn2Click(Sender: TObject);
begin
  if qryClientes.State in [dsEdit,dsInsert] then
  begin
    qryClientes.Cancel;
    qryClientes.close;
    medCodigo.Clear;
    medConta.Clear;
    medPlano.Clear;
    edit2.Clear;
    edit3.Clear;
    medCodigo.SetFocus;
  end;
end;

procedure TCadCliente_f.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if MessageDlg('Deseja realmente apagar este Cliente ?',mtWarning,[mbYes,mbNo],0) = idYes then
  begin
    if qryClientes.State = dsInsert then
    begin
      qryClientes.Cancel;
      medConta.Clear;
      medPlano.Clear;
      edit2.Clear;
      edit3.Clear;
    end
    else
    begin
      if qryClientes.State = dsEdit then
        qryClientes.Cancel;
      try
        qryClientes.Delete;
        medCodigo.Clear;
        medConta.Clear;
        medPlano.Clear;
        edit2.Clear;
        edit3.Clear;
        medCodigo.SetFocus;
      except
        MessageDlg('Não é possivel apagar cliente, verifique suas ocorrências.',mtError,[mbOk],0);
      end;
    end;
  end;
end;

procedure TCadCliente_f.FormDestroy(Sender: TObject);
begin
  inherited;
  CadCliente_f := nil;
end;

procedure TCadCliente_f.FormShow(Sender: TObject);
begin
  inherited;
  dbEdit15.Visible := (Nivel = 0);
  Label18.Visible  := (Nivel = 0);
  Label20.Visible  := (Nivel = 0);
  cbNivel.Visible  := (Nivel = 0);
end;

procedure TCadCliente_f.dbeCnpjCpfExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
  if (rgSituacao.ItemIndex <> 2) and (Trim(dbeCnpjCpf.Field.AsString) = '') then
  begin
    messagedlg('É necessário informar o CPF/CNPJ/CEI do cliente Ativo ou Inativo.',mtWarning,[mbOk],0);
    dbeCnpjCpf.SetFocus;
    exit;
  end;

  if rgTipo.ItemIndex < 2 then
  begin
    if (Trim(dbeCnpjCpf.Field.AsString) <> '') and (not CalculaCnpjCpf( qryClientes.FieldByName('CNPJCPF_CLI').AsString )) then
    begin
      MessageDlg('Cnpj/CPF inválido, favor digitar novamente.',mtError,[mbOk],0);
      dbeCnpjCpf.SetFocus;
      exit;
    end;
  end;

end;

procedure TCadCliente_f.AssociaDocumentosaClientes1Click(Sender: TObject);
begin
  inherited;
  if assigned(AssociaClienteDoc_f) then
    AssociaClienteDoc_f := nil;

  AssociaClienteDoc_f := TAssociaClienteDoc_f.Create(Self);
  try
    if medCodigo.Text <> '' then
    begin
      AssociaClienteDoc_f.medCliente.Text := medCodigo.Text;
      AssociaClienteDoc_f.medClienteExit(sender);
    end;
    AssociaClienteDoc_f.Height := AssociaClienteDoc_f.Height - 15;
    AssociaClienteDoc_f.Show;
  except
    AssociaClienteDoc_f := TAssociaClienteDoc_f.Create(Self);
    AssociaClienteDoc_f.Height := AssociaClienteDoc_f.Height - 15;
    AssociaClienteDoc_f.Show;
  end;
end;

procedure TCadCliente_f.Saida1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TCadCliente_f.BitBtn4Click(Sender: TObject);
begin
  inherited;
  qryClientes.close;
  qryClientes.Parameters.ParamByName('cod_cliente').Value := 0;
  qryClientes.Open;
  qryClientes.Insert;
  qryClientes.FieldByName('Tipo_cli').AsString    := 'F';
  qryClientes.FieldByName('Ativo_cli').AsString   := 'P';
  qryClientes.FieldByName('Nivel_cli').AsString   := '1';
  qryClientes.FieldByName('Tipo_CliFor').AsString := 'C';
  qryClientes.FieldByName('Ret_Pis').AsString     := 'S';
  qryClientes.FieldByName('Ret_Cofins').AsString  := 'S';
  qryClientes.FieldByName('Ret_CSocial').AsString := 'S';
  qryClientes.FieldByName('Correspondencia_cli').AsString   := '1';
  medCodigo.Clear;
  edit2.Clear;
  edit3.Clear;
  if qryClientes.FieldByName('TIPO_CLI').Value = 'F' then
    qryClientes.FieldByName('CNPJCPF_CLI').EditMask := '###.###.###-##;0; '
  else if qryClientes.FieldByName('TIPO_CLI').Value = 'J' then
    qryClientes.FieldByName('CNPJCPF_CLI').EditMask := '##.###.###/####-##;0; '
  else
    qryClientes.FieldByName('CNPJCPF_CLI').EditMask := '';
  dbedit1.SetFocus;
end;

procedure TCadCliente_f.pgChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  inherited;
  {AllowChange := (Nivel = 0);}
end;

procedure TCadCliente_f.SpeedButton4Click(Sender: TObject);
begin
  dmFinanc.PesBanco.Execute;
  if dmFinanc.PesBanco.ValoresRetorno[0] <> '' then
  begin
    medConta.Clear;
    medConta.Text := dmFinanc.PesBanco.ValoresRetorno[0];
    medContaExit(sender);
  end;
end;

procedure TCadCliente_f.SpeedButton1Click(Sender: TObject);
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

procedure TCadCliente_f.medContaExit(Sender: TObject);
begin
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
    edit2.Text := qryAux.FieldByName('NOME_BANCO').AsString;
    exit;
  end;
end;
procedure TCadCliente_f.medPlanoExit(Sender: TObject);
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

procedure TCadCliente_f.FormCreate(Sender: TObject);
begin
  inherited;
  tsFinan.TabVisible := nivel = 0;
end;

procedure TCadCliente_f.DBEdit17Exit(Sender: TObject);
begin
  inherited;
  if qryClientes.State = dsInsert then
  begin
    qryClientes.FieldByName('end_cob_cli').AsString    := dbEdit4.Field.AsString;
    qryClientes.FieldByName('bairro_cob_cli').AsString := dbEdit6.Field.AsString;
    qryClientes.FieldByName('cidade_cob_cli').AsString := dbEdit7.Field.AsString;
    qryClientes.FieldByName('uf_cob_cli').AsString     := dbEdit8.Field.AsString;
    qryClientes.FieldByName('cep_cob_cli').AsString    := dbEdit17.Field.AsString;
  end;
end;

procedure TCadCliente_f.medContaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = 34 then
    speedbutton4.Click;

end;

procedure TCadCliente_f.medPlanoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if key = 34 then
    speedbutton1.Click;
end;

procedure TCadCliente_f.rgTipoClick(Sender: TObject);
begin
  inherited;
  if rgTipo.ItemIndex = 0 then
    qryClientes.FieldByName('CNPJCPF_CLI').EditMask := '###.###.###-##;0; '
  else if rgTipo.ItemIndex = 1 then
    qryClientes.FieldByName('CNPJCPF_CLI').EditMask := '##.###.###/####-##;0; '
  else
    qryClientes.FieldByName('CNPJCPF_CLI').EditMask := '';
end;

end.
