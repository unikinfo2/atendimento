unit Licenca;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, Registry, inifiles;

type
  TForm1 = class(TForm)
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Procedure GravarIni(vArquivoIni,vSecao,vChave,vValor: String);
Function LerIni(vArquivoIni,vSecao,vChave: String): String;
function AnoBisexto (Ano: Word): boolean;
function UltimoDia (Data: TDateTime): TDateTime;

var
  Form1: TForm1;

implementation

{$R *.DFM}

function AnoBisexto (Ano: Word): boolean;
begin
  Result := ((Ano mod 4 = 0) and (Ano mod 100 <> 0)) or (Ano mod 400 = 0);
end;

function UltimoDia (Data: TDateTime): TDateTime;
var a,m,d:word;
begin

  decodedate( Data, a, m, d);

  d := 31;

  if (m = 4) or (m = 6) or (m = 9) or (m = 11) then
    d := 30;

  if (m = 2) then
    if (AnoBisexto (a))
      then d := 29
      else d := 28;
  result := enCodeDate(a,m,d);
end;

procedure TForm1.FormShow(Sender: TObject);
var MyReg : TRegistry;
    Data  : String;
begin
  inherited;
  data :=  formatdatetime('dd/mm/yyyy',ultimodia(strtodatetime('01/07/2003')));
  if fileExists(ExtractFilePath(Application.ExeName) + 'Atendimento.ini') then
  begin
    GravarIni('Atendimento.ini','Identificacao','Data',data);
    MyReg := TRegistry.Create;
    MyReg.RootKey := HKEY_LOCAL_MACHINE;
    MyReg.CreateKey('Atendimento');
    MyReg.Free;

    MyReg := TRegistry.Create;
    MyReg.RootKey := HKEY_LOCAL_MACHINE;
    MyReg.OpenKey('Atendimento',false);
    MyReg. WriteString('Dados', data);
    MyReg.Free;
  end;

  if fileExists(ExtractFilePath(Application.ExeName) + 'Controller.ini') then
  begin
    GravarIni('Controller.ini','Identificacao','Data',data);
    MyReg := TRegistry.Create;
    MyReg.RootKey := HKEY_LOCAL_MACHINE;
    MyReg.CreateKey('Controller');
    MyReg.Free;

    MyReg := TRegistry.Create;
    MyReg.RootKey := HKEY_LOCAL_MACHINE;
    MyReg.OpenKey('Controller',false);
    MyReg. WriteString('Dados', data);
    MyReg.Free;
  end;

  messagedlg('Licença alterada com sucesso.'+#13+#10+'Proximo vencimento dia ' + data,mtInformation,[mbOk],0);
  close;
end;

Function LerIni(vArquivoIni,vSecao,vChave: String): String;
var
  iniFile : TIniFile;
begin
  vArquivoIni := ExtractFilePath(Application.ExeName) + vArquivoIni;
  iniFile := TIniFile.Create(vArquivoIni);
  Result  := iniFile.ReadString(vSecao,vChave,'');
  iniFile.Free;
end;

Procedure GravarIni(vArquivoIni,vSecao,vChave,vValor: String);
var
  iniFile : TIniFile;
begin
  vArquivoIni := ExtractFilePath(Application.ExeName) + vArquivoIni;
  iniFile := TIniFile.Create(vArquivoIni);
  iniFile.WriteString(vSecao,vChave,vValor);
  iniFile.Free;
end;

end.
