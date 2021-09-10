unit dmController_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  MEdPesquisa;

type
  TdmController = class(TDataModule)
    pesEmpresa: TPesquisa;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmController: TdmController;

implementation
uses principal;

{$R *.DFM}

end.
