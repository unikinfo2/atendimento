unit CadFerido_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, Menus, Db, DBTables, StdCtrls, Buttons, Mask, DBCtrls, RxCalc,
  ToolEdit, RXDBCtrl;

type
  TCadFeriado_f = class(TDeriva_f)
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qryFeriado: TQuery;
    dsFeriado: TDataSource;
    dtFeriado: TDateEdit;
    BitBtn3: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dtFeriadoExit(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadFeriado_f: TCadFeriado_f;

implementation
uses principal, funcoes,
     Atendimento_dm;
{$R *.DFM}

procedure TCadFeriado_f.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if qryFeriado.State in [dsEdit,dsInsert] then
  begin
    qryFeriado.Cancel;
    qryFeriado.close;
    dtFeriado.Clear;
    dtFeriado.SetFocus;
  end;
end;

procedure TCadFeriado_f.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if qryFeriado.State in [dsEdit,dsInsert] then
  begin
    qryFeriado.FieldByName('dt_Feriado').AsDateTime := dtFeriado.Date;
    qryFeriado.Post;
    qryFeriado.close;
    dtFeriado.Clear;
    dtFeriado.SetFocus;
  end;
end;

procedure TCadFeriado_f.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  dmPesq.PesFeriado.Execute;
  dtFeriado.Text := dmPesq.PesFeriado.ValoresRetorno[0];
  if dtFeriado.Text = '  /  /    ' then
  begin
    dtFeriado.SetFocus;
    exit;
  end;
  qryFeriado.Close;
  qryFeriado.ParamByName('dt_feriado').AsDateTime := dtFeriado.Date;
  qryFeriado.Open;
  qryFeriado.Edit;
end;

procedure TCadFeriado_f.FormCreate(Sender: TObject);
begin
  inherited;
  dmPesq.pesFeriado.StringSql.Clear;
  dmPesq.pesFeriado.StringSql.Add('SELECT * FROM GC_FERIADO');
  dmPesq.pesFeriado.StringSql.Add(' ORDER BY DT_FERIADO DESC, DESC_FERIADO');
end;

procedure TCadFeriado_f.dtFeriadoExit(Sender: TObject);
begin
  inherited;
  if dtFeriado.Text <> '  /  /    ' then
  begin
    qryFeriado.Close;
    qryFeriado.ParamByName('dt_feriado').AsDateTime := dtFeriado.Date;
    qryFeriado.Open;
    if qryFeriado.eof then
      qryFeriado.Insert
    else
      qryFeriado.Edit;
  end
  else
    dtFeriado.SetFocus;

end;

procedure TCadFeriado_f.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if messagedlg('Deseja realmente apagar este Registro.',mtInformation,[mbYes,mbNo],0) = idYes then
  begin
    if nivel > 0 then
    begin
      messagedlg('Usuário não possui permissão para apagar registros.',mtInformation,[mbOk],0);
      exit;
    end
    else
    begin
      {try}
      if qryFeriado.State = dsInsert then
      begin
        qryFeriado.Cancel;
        dtFeriado.Clear;
        dtFeriado.SetFocus;
        exit;
      end;
      if qryFeriado.State = dsEdit then
      begin
        qryFeriado.Cancel;
        dtFeriado.Clear;
        qryFeriado.Delete;
        dtFeriado.SetFocus;
        exit;
      end;
      if frmPrincipal.Database1.InTransaction then
        frmPrincipal.Database1.Commit;
      {except
        messagedlg('Não foi possivel apagar este registro.',mtInformation,[mbOk],0);
        exit;
      end;}
    end;
  end;
end;

end.
