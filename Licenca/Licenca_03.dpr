program Licenca_03;

uses
  Forms,
  Licenca in 'Licenca.pas' {Form1};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
