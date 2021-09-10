unit EMail_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, Menus, StdCtrls, CheckLst, Buttons, OleServer, Outlook8,
  ExtCtrls, Db, DBTables, Mask, SakEmail, RxCalc, 
  ComCtrls, DBCtrls, IDSMTP, IDMessage;

type
  TEMail_f = class(TDeriva_f)
    Panel1: TPanel;
    btnEnviar: TBitBtn;
    btnCancelar: TBitBtn;
    Panel2: TPanel;
    memoTexto: TMemo;
    Panel3: TPanel;
    Label1: TLabel;
    clbCliente: TCheckListBox;
    Label2: TLabel;
    Label3: TLabel;
    edtComCopia: TEdit;
    edtAssunto: TEdit;
    dsEmail: TDataSource;
    qryEmail: TQuery;
    qryAux: TQuery;
    Arquivo: TOpenDialog;
    memoArquivo: TMemo;
    btnArquivo: TBitBtn;
    medEmail: TMaskEdit;
    sbPesEmail: TSpeedButton;
    Label10: TLabel;
    SakSMTP1: TSakSMTP;
    SakMsg1: TSakMsg;
    qryEmailCli: TQuery;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnArquivoClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    function chkCliente:Boolean;
    function Email_Cliente:String;
    procedure SakSMTP1Quit(Sender: TObject);
    procedure SakSMTP1BeforeSend(Sender: TObject);
    procedure SakSMTP1SendProgress(Sender: TObject; Percent: Word);
    procedure btnCancelarClick(Sender: TObject);
    procedure medEmailExit(Sender: TObject);
    procedure sbPesEmailClick(Sender: TObject);
    procedure NMSMTP1SendStart(Sender: TObject);
    procedure NMSMTP1Success(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    EmailCli : array of array[1..3] of string;
  end;

var
  EMail_f: TEMail_f;

implementation
uses Principal, mens_EnvioEmail, Atendimento_dm, funcoes;
{$R *.DFM}

procedure TEMail_f.FormCreate(Sender: TObject);
var x:Integer;
begin
  inherited;
  x := 0;
  setLength(EmailCli,x+1);
  {Docs Livres}
  qryAux.Close;
  qryAux.SQL.Text := 'SELECT * FROM GC_CLIENTE';
  qryAux.Open;
  clbCliente.Items.Clear;
  while not qryAux.Eof do
  begin
    if qryAux.FieldByName('Email_Cli').AsString <> '' then
    begin
      clbCliente.Items.add(qryAux.FieldByName('Nome_Cli').AsString);
      EmailCli[x,1] := qryAux.FieldByName('Email_Cli').AsString;
      EmailCli[x,2] := formatfloat('000000000',qryAux.FieldByName('Cod_Cliente').AsInteger);
      EmailCli[x,3] := 'Cli';
      inc(x);
      setLength(EmailCli,x+1);
    end;
    qryAux.Next;
  end;

  qryAux.Close;
  qryAux.SQL.Text := 'SELECT * FROM GC_AGENDA';
  qryAux.Open;
  while not qryAux.Eof do
  begin
    if qryAux.FieldByName('Email_Contato').AsString <> '' then
    begin
      clbCliente.Items.add(qryAux.FieldByName('Nome_Contato').AsString);
      EmailCli[x,1] := qryAux.FieldByName('Email_Contato').AsString;
      EmailCli[x,2] := formatfloat('000000000',qryAux.FieldByName('Cod_Contato').AsInteger);
      EmailCli[x,3] := 'Age';
      inc(x);
      setLength(EmailCli,x+1);
    end;
    qryAux.Next;
  end;
end;

procedure TEMail_f.btnArquivoClick(Sender: TObject);
begin
  inherited;
  if arquivo.Execute then
  begin
    arquivo.InitialDir := ExtractFilePath( arquivo.FileName );
    memoArquivo.Lines.Add(arquivo.FileName);
    sakMsg1.AttachedFiles.Add(arquivo.FileName);
  end;
end;

procedure TEMail_f.btnEnviarClick(Sender: TObject);
var x, cod_email, email_cli_cont:integer;
    email : TIDSMTP;
    Mens  : TIDMessage;
begin
  inherited;
  if (not chkCliente) then
  begin
    messagedlg('É necessário informar pelo menos um Cliente.',mtInformation,[mbOk],0);
    clbCliente.SetFocus;
    exit;
  end;
  if edtAssunto.Text = '' then
  begin
    messagedlg('É necessário informar o assunto.',mtInformation,[mbOk],0);
    edtAssunto.SetFocus;
    exit;
  end;
  if email_func = '' then
  begin
    messagedlg('É necessário cadastrar o e-mail do funcionário.',mtInformation,[mbOk],0);
    medEMail.SetFocus;
    exit;
  end;

  qryEMail.Close;
  qryEMail.Open;
  qryEMail.Insert;
  qryEMail.FieldByName('Cod_Func').AsInteger      := Cod_Func;
  qryEMail.FieldByName('Assunto_email').AsString  := edtAssunto.Text;
  qryEMail.FieldByName('dt_email').AsDateTime     := now;
  qryEMail.FieldByName('cc_email').AsString       := edtComCopia.Text;
  qryEMail.FieldByName('Texto_email').AsString    := memoTexto.Lines.Text;
  qryEMail.FieldByName('Arquivos_email').AsString := memoArquivo.Lines.Text;
  cod_email := Proximo('GC_EMAIL','COD_EMAIL','', true);
  qryEMail.FieldByName('Cod_EMail').AsInteger      := Cod_email;
  qryEMail.Post;

  qryEMailCli.Close;
  qryEMailCli.ParamByName('Cod_Email').AsInteger := Cod_EMail;
  qryEMailCli.Open;

  for x := 0 to clbCliente.Items.Count -1 do
  begin
    if clbCliente.Checked[x] then
    begin
      email_cli_cont := Proximo('GC_EMAIL_CLI','EMAIL_CLI_CONT','', true);
      qryEMailCli.Insert;
      if emailcli[x,3] = 'Cli' then
        qryEMailCli.FieldByName('Cod_Cliente').AsString    := emailcli[x,2]
      else
        qryEMailCli.FieldByName('Cod_Contato').AsString    := emailcli[x,2];

      qryEMailCli.FieldByName('EMail_Cli_Cont').AsInteger  := email_cli_cont;
      qryEMailCli.FieldByName('Cod_EMail').AsInteger       := Cod_EMail;
      qryEMailCli.Post;
    end;
  end;

  eMail := TIDSMTP.Create(nil);
  mens  := TIDMessage.Create(self);

  mens.from.Address := email_func;

  mens_EnvioEmail_f := TMens_EnvioEmail_f.Create(self);
  mens_EnvioEmail_f.Show;
  btnEnviar.Enabled := False;

  for x := 0 to clbCliente.Items.Count -1 do
  begin
    if clbCliente.Checked[x] then
    begin
      if mens.Recipients.EMailAddresses <> '' then
        mens.Recipients.EMailAddresses := mens.Recipients.EMailAddresses + ', ';
      mens.Recipients.EMailAddresses := mens.Recipients.EMailAddresses + emailcli[x,1];
    end;
  end;
  if edtComCopia.Text <> '' then
    mens.ccList.EMailAddresses := edtComCopia.Text;

  mens.Subject   := edtAssunto.Text;
  mens.Body.Text := memoTexto.Lines.Text;

  for x := 0 to memoArquivo.Lines.Count-1 do
  begin
    //TIdAttachment.Create(Mens.MessageParts , memoArquivo.Lines[x]);
  end;


  eMail.Host     := LerIni(caminho+'Atendimento.ini','EMAIL','SMTP');
  eMail.Port     := 25;
  eMail.Username := email_func;
  eMail.Password := '';
  eMail.Connect();
  if not eMail.Connected then
    raise Exception.Create('Erro de conexão');
  eMail.Send(mens);
  eMail.Disconnect;
  eMail.Free;
  mens_EnvioEmail_f.Close;
  mens_EnvioEmail_f.Free;

(*  mens_EnvioEmail_f := TMens_EnvioEmail_f.Create(self);
  mens_EnvioEmail_f.Show;
  btnEnviar.Enabled := False;

  NMSMTP1.Host := LerIni(caminho+'Atendimento.ini','EMAIL','SMTP');
  NMSMTP1.Port := 25;
  NMSMTP1.UserID := email_func;
  NMSMTP1.Connect;
  if not NMSMTP1.Connected then
    raise Exception.Create('Erro de conexão');

  with NMSMTP1.PostMessage do
  begin
    FromAddress := email_func;
    FromName    := email_func;
    ToAddress.Clear;
    for x := 0 to clbCliente.Items.Count -1 do
    begin
      if clbCliente.Checked[x] then
      begin
        ToAddress.Add(emailcli[x,1]);
      end;
    end;
    if edtComCopia.Text <> '' then
      ToAddress.Add(edtComCopia.Text);
    Subject := edtAssunto.Text;
    Body.Text := memoTexto.Lines.Text;
    Attachments.Text := memoArquivo.Lines.Text;
  end;
  NMSMTP1.SendMail;
  NMSMTP1.Disconnect;*)

(*  mens_EnvioEmail_f := TMens_EnvioEmail_f.Create(self);
  mens_EnvioEmail_f.Show;
  btnEnviar.Enabled := False;
  {Conectar}
  sakSMTP1.Host     := LerIni(caminho+'Atendimento.ini','EMAIL','SMTP');
  sakSMTP1.Connect;
  sakMsg1.From      := email_func;
  sakMsg1.Subject   := edtAssunto.Text;
  sakMsg1.CC        := edtComCopia.Text;
  sakMsg1.Text.Assign(memoTexto.Lines);

  for x := 0 to clbCliente.Items.Count -1 do
  begin
    if clbCliente.Checked[x] then
    begin
      sakMsg1.sendTo    := emailcli[x,1];
      sakSMTP1.SendMessage(sakMsg1);
      sakMsg1.CC        := '';
    end;
  end;
  sakSMTP1.Quit;*)
end;


function TEMail_f.chkCliente: Boolean;
var x:Integer;
begin
  result := false;
  for x := 0 to clbCliente.Items.Count -1 do
    if clbCliente.Checked[x] then result := true;
end;

function TEMail_f.Email_Cliente: String;
var x:Integer;
begin
  result := '';
  for x := 0 to clbCliente.Items.Count -1 do
    if clbCliente.Checked[x] then result := result + emailcli[x,1] + ';';
end;

procedure TEMail_f.SakSMTP1Quit(Sender: TObject);
begin
  inherited;
  mens_EnvioEmail_f.Close;
  mens_EnvioEmail_f.Free;
  btnCancelar.Click;
end;

procedure TEMail_f.SakSMTP1BeforeSend(Sender: TObject);
begin
  inherited;
  mens_EnvioEmail_f.lblCliente.Caption := sakMsg1.sendTo;
  mens_EnvioEmail_f.Gauge1.Progress    := 0;
  mens_EnvioEmail_f.Refresh;
end;

procedure TEMail_f.SakSMTP1SendProgress(Sender: TObject; Percent: Word);
begin
  inherited;
  mens_EnvioEmail_f.Gauge1.Progress := Percent;
end;

procedure TEMail_f.btnCancelarClick(Sender: TObject);
var x:integer;
begin
  inherited;
  memoTexto.Lines.Clear;
  memoArquivo.Lines.Clear;
  edtAssunto.Clear;
  edtComCopia.Clear;
  btnEnviar.Enabled := True;
  for x := 0 to clbCliente.Items.Count -1 do
    clbCliente.Checked[x] := false;
  medEmail.Clear;
  medEmail.SetFocus;
end;

procedure TEMail_f.medEmailExit(Sender: TObject);
var x : Integer;
begin
  inherited;
  if medEmail.Text <> '' then
  begin
    qryEmail.Close;
    qryEmail.ParamByName('Cod_EMail').AsString := medEmail.Text;
    qryEmail.Open;
    if qryEmail.eof then
    begin
      messagedlg('Codigo de E-Mail não cadastrado.',mtWarning,[mbOk],0);
      medEMail.SetFocus;
      exit;
    end
    else
    begin
      edtAssunto.Text  := qryEMail.FieldByName('Assunto_email').AsString;
      edtComCopia.Text :=qryEMail.FieldByName('cc_email').AsString;
      memoTexto.Lines.Text := qryEMail.FieldByName('Texto_email').AsString;
      memoArquivo.Lines.Text := qryEMail.FieldByName('Arquivos_email').AsString;
      sakMsg1.AttachedFiles.Clear;
      for x := 0 to memoArquivo.Lines.Count -1 do
        sakMsg1.AttachedFiles.Add(memoArquivo.Lines[x]);
      qryEmailCli.Close;
      qryEmailCli.ParamByName('Cod_EMail').AsString := medEMail.Text;
      qryEmailCli.Open;
      for x := 0 to clbCliente.Items.Count -1 do
      begin
        if qryEmailCli.locate('cod_cliente',strtoint(emailcli[x,2]),[loCaseInsensitive]) then
        begin
          clbCliente.Checked[x] := True;
        end;
      end;
    end;
  end;
end;

procedure TEMail_f.sbPesEmailClick(Sender: TObject);
begin
  inherited;
  dmPesq.PesEMail.Execute;
  medEmail.Text  := dmPesq.PesEMail.ValoresRetorno[0];
  if medEmail.Text = '' then
  begin
    medEMail.SetFocus;
    exit;
  end;
  medEMailExit(Sender);
end;
procedure TEMail_f.NMSMTP1SendStart(Sender: TObject);
begin
  inherited;
{  mens_EnvioEmail_f.lblCliente.Caption := NMSMTP1.PostMessage.ToAddress.Text;
  mens_EnvioEmail_f.Gauge1.Progress    := 0;
  mens_EnvioEmail_f.Refresh;}
end;

procedure TEMail_f.NMSMTP1Success(Sender: TObject);
begin
  inherited;
{  mens_EnvioEmail_f.Close;
  mens_EnvioEmail_f.Free;
  btnCancelar.Click;}
end;

end.
