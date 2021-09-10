unit Deriva_u;

interface

uses
  Windows, Messages, Classes, Graphics, Controls, Forms, Dialogs, Menus, stdctrls, dbctrls,
  RxCalc, funcoes, ComCtrls;

type
  TDeriva_f = class(TForm)
    submenu: TMainMenu;
    Sada1: TMenuItem;
    Calculator1: TRxCalculator;
    Auxiliares1: TMenuItem;
    Calculadora1: TMenuItem;
    ListagemdeRamais1: TMenuItem;
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure Sada1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Calculadora1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListagemdeRamais1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Deriva_f: TDeriva_f;
  esc : Boolean;
  Visualiza : Boolean;
implementation
uses principal;
{$R *.DFM}

procedure TDeriva_f.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if (ActiveControl is TMemo) or (ActiveControl is TDBMemo) or (ActiveControl is TDBRichEdit) then
    exit;
  if key = #13 then
  begin
    esc := False;
    key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end
  else if key = #27 then
  begin
    esc := True;
    key := #0;
    Perform(WM_NEXTDLGCTL, 1, 0);
  end;
end;

procedure TDeriva_f.Sada1Click(Sender: TObject);
begin
  Close;
end;

procedure TDeriva_f.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmPrincipal.sgrdPend.Visible := Visualiza;
  action := caFree;
end;

procedure TDeriva_f.Calculadora1Click(Sender: TObject);
begin
  calculator1.Execute;
end;

procedure TDeriva_f.FormCreate(Sender: TObject);
begin
  Visualiza := frmPrincipal.sgrdPend.Visible;
  frmPrincipal.sgrdPend.Visible := False;
end;

procedure TDeriva_f.ListagemdeRamais1Click(Sender: TObject);
begin
  frmPrincipal.rvSystem1.Execute;
end;

end.
