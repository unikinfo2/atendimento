unit Sobre_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RXCtrls, DB, IBCustomDataSet, IBQuery, shellApi, RxGIF,
  DBTables;

type
  TSobre_f = class(TForm)
    lblSistema: TRxLabel;
    lblEmpresa: TRxLabel;
    Image1: TImage;
    lblAtualiza: TRxLabel;
    lblScript: TRxLabel;
    lblLiberado: TRxLabel;
    lblBanco: TRxLabel;
    lblEXE: TRxLabel;
    lblSite: TRxLabel;
    qryAux: TQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lblSiteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Sobre_f: TSobre_f;

implementation
uses funcoes, principal;

{$R *.dfm}

procedure TSobre_f.FormShow(Sender: TObject);
var ArqIni  : String;
begin
  ArqIni := ExtractFilePath(Application.ExeName) + 'Atendimento.ini';
  qryAux.close;
  qryAux.Sql.Text := 'SELECT * FROM SEG_LIBERA';
  qryAux.open;

  lblSistema.Caption  := 'Módulo: ' + Sistema;
  lblAtualiza.caption := 'Ultima atualização: ' + formatdatetime('dd/mm/yyyy hh:nn', ExeDateTime);
  lblScript.Caption   := 'Data do ultimo Script: ' + qryAux.FieldByName('ultimo_script').AsString;
  lblLiberado.Caption := 'Sistema liberado até: ' + Descriptografa( qryAux.fieldbyname('libera').asString );
  lblBanco.Caption    := 'Caminho do Banco de Dados: ' + LerIni(ArqIni, 'BANCO_LOCAL','SERVER_NAME');
  lblExe.Caption      := 'Caminho do Executável: ' + application.ExeName;


end;

procedure TSobre_f.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

procedure TSobre_f.lblSiteClick(Sender: TObject);
begin
  ShellExecute(Application.Handle, nil, PChar('http://www.unik-info.com.br'), nil, nil, SW_SHOWNORMAL);
end;

end.
