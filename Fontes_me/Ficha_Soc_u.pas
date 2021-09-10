unit Ficha_Soc_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, RxCalc, Menus, ExtCtrls, StdCtrls, Buttons, ToolEdit, CurrEdit,
  RXDBCtrl, DBCtrls, Mask, Db, DBTables;

type
  TFicha_Soc_f = class(TDeriva_f)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn2: TBitBtn;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBRadioGroup1: TDBRadioGroup;
    DBEdit7: TDBEdit;
    RxDBCalcEdit1: TRxDBCalcEdit;
    RxDBCalcEdit2: TRxDBCalcEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    qrySocio: TQuery;
    dsSocio: TDataSource;
    DBEdit8: TDBEdit;
    Label10: TLabel;
    DBRadioGroup2: TDBRadioGroup;
    DBEdit9: TDBEdit;
    Label11: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBRadioGroup3: TDBRadioGroup;
    DBEdit10: TDBEdit;
    Label12: TLabel;
    DBEdit11: TDBEdit;
    Label13: TLabel;
    DBEdit12: TDBEdit;
    Label14: TLabel;
    DBCheckBox2: TDBCheckBox;
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Ficha_Soc_f: TFicha_Soc_f;

implementation
uses Ficha_u, principal, funcoes;
{$R *.DFM}

procedure TFicha_Soc_f.BitBtn2Click(Sender: TObject);
var cod : Integer;
begin
  inherited;
  if qrySocio.State = dsInsert then
  begin
    cod := proximo('gc_ficha_soc','cod_socio','', true);
    qrySocio.FieldByName('cod_socio').AsInteger := cod;
    qrySocio.Post;
    Ficha_f.qrySocios.Close;
    Ficha_f.qrySocios.Open;
    close;
  end;
  if qrySocio.State = dsEdit then
  begin
    qrySocio.Post;
    Ficha_f.qrySocios.Close;
    Ficha_f.qrySocios.Open;
    close;
  end;
end;

procedure TFicha_Soc_f.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  if Ficha_f.BitBtn3.Enabled then
    Ficha_f.qryFicha.Edit;
end;

end.
