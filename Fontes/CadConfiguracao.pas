unit CadConfiguracao;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, RxCalc, Menus, StdCtrls, Mask, ToolEdit, CurrEdit, Buttons, Funcoes,
  Grids, Outline, DirOutln, FileCtrl;

type
  TCadConfiguracao_f = class(TDeriva_f)
    medHistorico: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    medMensagem: TMaskEdit;
    Label4: TLabel;
    chkCor: TCheckBox;
    Label5: TLabel;
    edtCidade: TEdit;
    Label6: TLabel;
    edtEndereco: TEdit;
    edtCliente: TEdit;
    Label7: TLabel;
    medFone: TMaskEdit;
    medFax: TMaskEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtServerName: TEdit;
    Label10: TLabel;
    edtSMTP: TEdit;
    Label11: TLabel;
    GroupBox1: TGroupBox;
    edtBaixa: TRxCalcEdit;
    edtMedia: TRxCalcEdit;
    edtAlta: TRxCalcEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    BitBtn1: TBitBtn;
    btnCancel: TBitBtn;
    SpeedButton3: TSpeedButton;
    OpenDialog1: TOpenDialog;
    edtServidor: TDirectoryEdit;
    edtLocal: TDirectoryEdit;
    GroupBox2: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    edtBaixa2: TRxCalcEdit;
    edtMedia2: TRxCalcEdit;
    edtAlta2: TRxCalcEdit;
    medCedente: TMaskEdit;
    Label20: TLabel;
    Label21: TLabel;
    medAgenda: TMaskEdit;
    Label22: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadConfiguracao_f: TCadConfiguracao_f;

implementation
uses Principal;

{$R *.DFM}

procedure TCadConfiguracao_f.FormShow(Sender: TObject);
var cam : String;
begin
  inherited;
  cam                    := extractfilepath(Application.ExeName);
  medHistorico.Text      := LerIni(cam + 'Atendimento.ini','Identificacao','Historico');
  medMensagem.Text       := LerIni(cam + 'Atendimento.ini','Identificacao','Mensagem');
  medAgenda.Text         := LerIni(cam + 'Atendimento.ini','Identificacao','Agenda');
  medCedente.Text        := LerIni(cam + 'Atendimento.ini','Identificacao','Cedente');

  edtCidade.Text         := LerIni(cam + 'Atendimento.ini','CIDADE','CIDADE');
  edtEndereco.Text       := LerIni(cam + 'Atendimento.ini','CIDADE','ENDERECO');
  edtCliente.Text        := LerIni(cam + 'Atendimento.ini','CIDADE','CLIENTE');
  medFone.Text           := LerIni(cam + 'Atendimento.ini','CIDADE','TELEFONE');
  medFax.Text            := LerIni(cam + 'Atendimento.ini','CIDADE','FAX');
  edtServerName.Text     := LerIni(cam + 'Atendimento.ini','BANCO_LOCAL','SERVER_NAME');
  OpenDialog1.InitialDir := extractfilepath(LerIni(cam + 'Atendimento.ini','BANCO_LOCAL','SERVER_NAME'));
  edtSMTP.Text           := LerIni(cam + 'Atendimento.ini','EMAIL','SMTP');

  edtBaixa.Text          := LerIni(cam + 'Atendimento.ini','Prioridade','Baixa');
  edtMedia.Text          := LerIni(cam + 'Atendimento.ini','Prioridade','Media');
  edtAlta.Text           := LerIni(cam + 'Atendimento.ini','Prioridade','Alta');

  edtBaixa2.Text          := LerIni(cam + 'Atendimento.ini','Ligacao','Baixa');
  edtMedia2.Text          := LerIni(cam + 'Atendimento.ini','Ligacao','Media');
  edtAlta2.Text           := LerIni(cam + 'Atendimento.ini','Ligacao','Alta');

  edtServidor.Text       := LerIni(cam + 'Atendimento.ini','CAMINHO','SERVIDOR');
  edtServidor.InitialDir := LerIni(cam + 'Atendimento.ini','CAMINHO','SERVIDOR');
  edtLocal.Text          := LerIni(cam + 'Atendimento.ini','CAMINHO','LOCAL');
  edtLocal.InitialDir    := LerIni(cam + 'Atendimento.ini','CAMINHO','LOCAL');

  chkCor.Checked     := UpperCase(LerIni(cam + 'Atendimento.ini','Identificacao','Cor')) = 'SIM';
end;

procedure TCadConfiguracao_f.BitBtn1Click(Sender: TObject);
var cam : String;
begin
  inherited;
  if nivel > 0 then
  begin
    messagedlg('Usuário não tem permissão para alterar as configurações deste sistema.',mtWarning,[mbOk],0);
    exit;
  end
  else
  begin
    cam                := extractfilepath(Application.ExeName);
    GravarIni(cam + 'Atendimento.ini','Identificacao','Historico',medHistorico.Text);
    GravarIni(cam + 'Atendimento.ini','Identificacao','Mensagem', medMensagem.Text);
    GravarIni(cam + 'Atendimento.ini','Identificacao','Agenda', medAgenda.Text);
    GravarIni(cam + 'Atendimento.ini','CIDADE','CIDADE', edtCidade.Text);
    GravarIni(cam + 'Atendimento.ini','CIDADE','ENDERECO', edtEndereco.Text);
    GravarIni(cam + 'Atendimento.ini','CIDADE','CLIENTE', edtCliente.Text);
    GravarIni(cam + 'Atendimento.ini','CIDADE','TELEFONE',medFone.Text);
    GravarIni(cam + 'Atendimento.ini','CIDADE','FAX',medFax.Text);
    GravarIni(cam + 'Atendimento.ini','BANCO_LOCAL','SERVER_NAME', edtServerName.Text);
    GravarIni(cam + 'Atendimento.ini','EMAIL','SMTP',edtSMTP.Text);
    GravarIni(cam + 'Atendimento.ini','Prioridade','Baixa',edtBaixa.Text);
    GravarIni(cam + 'Atendimento.ini','Prioridade','Media',edtMedia.Text);
    GravarIni(cam + 'Atendimento.ini','Prioridade','Alta',edtAlta.Text);
    GravarIni(cam + 'Atendimento.ini','Ligacao','Baixa', edtBaixa2.Text);
    GravarIni(cam + 'Atendimento.ini','Ligacao','Media', edtMedia2.Text);
    GravarIni(cam + 'Atendimento.ini','Ligacao','Alta', edtAlta2.Text);
    GravarIni(cam + 'Atendimento.ini','CAMINHO','SERVIDOR',edtServidor.Text);
    GravarIni(cam + 'Atendimento.ini','CAMINHO','LOCAL',edtLocal.Text);
    GravarIni(cam + 'Atendimento.ini','Identificacao','Cedente',medCedente.Text);

    if chkCor.Checked then
      GravarIni(cam + 'Atendimento.ini','Identificacao','Cor', 'SIM')
    else
      GravarIni(cam + 'Atendimento.ini','Identificacao','Cor', 'NAO');

    cor := LerIni(cam + 'Atendimento.ini','Identificacao','Cor') = 'SIM';
    close;
  end;
end;

procedure TCadConfiguracao_f.btnCancelClick(Sender: TObject);
begin
  inherited;
  formShow(Sender);
end;

procedure TCadConfiguracao_f.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  if OpenDialog1.Execute then
    edtServerName.Text := OpenDialog1.FileName;
end;

end.
