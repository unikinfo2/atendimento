unit Agenda_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, ExtCtrls, Menus, Grids, DBGrids, StdCtrls, Buttons, Mask,
  DBCtrls, Db, DBTables, RxCalc;

type
  TAgenda_f = class(TDeriva_f)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBMemo1: TDBMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn3: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn2: TBitBtn;
    qryAgenda: TQuery;
    dsAgenda: TDataSource;
    SpeedButton2: TSpeedButton;
    qryAgendaCOD_CONTATO: TIntegerField;
    qryAgendaNOME_CONTATO: TStringField;
    qryAgendaEMPRESA_CONTATO: TStringField;
    qryAgendaEMAIL_CONTATO: TStringField;
    qryAgendaFONE1_CONTATO: TStringField;
    qryAgendaFONE2_CONTATO: TStringField;
    qryAgendaFONE3_CONTATO: TStringField;
    qryAgendaFONE4_CONTATO: TStringField;
    qryAgendaOBS_CONTATO: TStringField;
    qryAgenda2: TQuery;
    dsAgenda2: TDataSource;
    qryAgenda2COD_CONTATO: TIntegerField;
    qryAgenda2NOME_CONTATO: TStringField;
    qryAgenda2EMPRESA_CONTATO: TStringField;
    qryAgenda2EMAIL_CONTATO: TStringField;
    qryAgenda2FONE1_CONTATO: TStringField;
    qryAgenda2FONE2_CONTATO: TStringField;
    qryAgenda2FONE3_CONTATO: TStringField;
    qryAgenda2FONE4_CONTATO: TStringField;
    qryAgenda2OBS_CONTATO: TStringField;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryAgenda2AfterScroll(DataSet: TDataSet);
    procedure SpeedButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Agenda_f: TAgenda_f;

implementation
uses Principal, Atendimento_dm;
{$R *.DFM}

procedure TAgenda_f.BitBtn1Click(Sender: TObject);
begin
  inherited;
  if qryAgenda.State in [dsEdit,dsInsert] then
    qryAgenda.Post;
  dbEdit1.SetFocus;

  qryAgenda2.Close;
  qryAgenda2.Open;
end;

procedure TAgenda_f.BitBtn3Click(Sender: TObject);
begin
  inherited;
  qryAgenda.Insert;
  dbEdit1.SetFocus;
end;

procedure TAgenda_f.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if qryAgenda.State in [dsEdit,dsInsert] then
    qryAgenda.Cancel;
  dbEdit1.SetFocus;
end;

procedure TAgenda_f.BitBtn5Click(Sender: TObject);
begin
  inherited;
  if qryAgenda.State in [dsEdit,dsInsert] then
    qryAgenda.cancel;

  if messagedlg('Deseja realmente apagar este Contato ?',mtWarning,[mbYes,mbNo],0) = IDYes then
  begin
    qryAgenda.Delete;
  end;
  dbEdit1.SetFocus;
end;

procedure TAgenda_f.FormCreate(Sender: TObject);
begin
  inherited;
  qryAgenda.Close;
  qryAgenda.Open;

  qryAgenda2.Close;
  qryAgenda2.Open;
end;

procedure TAgenda_f.qryAgenda2AfterScroll(DataSet: TDataSet);
begin
  inherited;
  qryAgenda.Locate('cod_contato',qryAgenda2.FieldByName('Cod_Contato').AsInteger,[loCaseInsensitive]);
end;

procedure TAgenda_f.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  dmPesq.PesAgenda.Execute;
  if dmPesq.PesAgenda.ValoresRetorno[0] <> '' then
  begin
    qryAgenda2.Locate('cod_contato',StrToInt(dmPesq.PesAgenda.ValoresRetorno[0]),[loCaseInsensitive]);
    qryAgenda.Locate('cod_contato',StrToInt(dmPesq.PesAgenda.ValoresRetorno[0]),[loCaseInsensitive]);
  end;
end;

end.
