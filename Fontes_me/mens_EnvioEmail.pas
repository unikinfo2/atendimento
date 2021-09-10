unit mens_EnvioEmail;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Gauges;

type
  Tmens_EnvioEmail_f = class(TForm)
    lblCliente: TLabel;
    Gauge1: TGauge;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mens_EnvioEmail_f: Tmens_EnvioEmail_f;

implementation

{$R *.DFM}

end.
