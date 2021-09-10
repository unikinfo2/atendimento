unit LicacaoSolicit_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, Menus, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Db,
  DBTables, DBCtrls;

type
  TLicacaoSolicit_f = class(TDeriva_f)
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    qryLigacao: TQuery;
    dsLigacao: TDataSource;
    Label1: TLabel;
    memoObs: TMemo;
    BitBtn2: TBitBtn;
    qryLigacaoCOD_LIGACAO: TIntegerField;
    qryLigacaoCOD_CLIENTE: TIntegerField;
    qryLigacaoCOD_FUNC: TIntegerField;
    qryLigacaoCOD_DEPTO: TIntegerField;
    qryLigacaoDESC_LIG: TStringField;
    qryLigacaoPRIORIDADE_LIG: TStringField;
    qryLigacaoSTATUS_LIG: TStringField;
    qryLigacaoDT_PEDIDO_LIG: TDateTimeField;
    qryLigacaoDT_FECHAMENTO_LIG: TDateTimeField;
    qryLigacaoFONE1: TStringField;
    qryLigacaoFONE2: TStringField;
    qryLigacaoFONE3: TStringField;
    qryLigacaoFONE4: TStringField;
    qryLigacaoCONTATO: TStringField;
    qryLigacaoRAMAL1: TStringField;
    qryLigacaoRAMAL2: TStringField;
    qryLigacaoRAMAL3: TStringField;
    qryLigacaoRAMAL4: TStringField;
    qryLigacaoCOD_FUNC_CAD: TIntegerField;
    qryLigacaoNOME_CLI: TStringField;
    qryLigacaoNOME_FUNC: TStringField;
    qryLigacaoDESC_DEPTO: TStringField;
    qryLigacao2: TQuery;
    qryLigacaoOBS_LIG: TStringField;
    AgendamentodeLigao1: TMenuItem;
    Panel1: TPanel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Agendamento1: TMenuItem;
    Visita1: TMenuItem;
    qryLigacaoQUEMFALA: TStringField;
    qryLigacaoEuRecep: TStringField;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure qryLigacaoAfterScroll(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure AgendamentodeLigao1Click(Sender: TObject);
    procedure Visita1Click(Sender: TObject);
    procedure qryLigacaoCalcFields(DataSet: TDataSet);
    procedure Timer1Timer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LicacaoSolicit_f: TLicacaoSolicit_f;

implementation
uses Principal, CadLigacao_u, CadVisita_u;

{$R *.DFM}

procedure TLicacaoSolicit_f.FormShow(Sender: TObject);
begin
  inherited;
  qryLigacao.close;
  qryLigacao.Open;
  timer1.Enabled := true;
end;

procedure TLicacaoSolicit_f.qryLigacaoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  memoObs.Text := qryLigacao.fieldByName('Obs_Lig').AsString;
end;

procedure TLicacaoSolicit_f.BitBtn1Click(Sender: TObject);
begin
  inherited;
  qryLigacao2.Close;
  qryLigacao2.ParamByName('Cod_Ligacao').AsInteger := qryLigacao.FieldByName('Cod_Ligacao').AsInteger;
  qryLigacao2.Open;
  qryLigacao2.Edit;
  qryLigacao2.FieldByName('Status_Lig').AsString          := 'F';
  qryLigacao2.FieldByName('Dt_Fechamento_lig').AsDateTime := Now();
  qryLigacao2.FieldByName('Obs_Lig').AsString             := memoObs.Text;
  qryLigacao2.Post;
  qryLigacao.Close;
  qryLigacao.Open;
end;

procedure TLicacaoSolicit_f.BitBtn2Click(Sender: TObject);
begin
  inherited;
  qryLigacao2.Close;
  qryLigacao2.ParamByName('Cod_Ligacao').AsInteger := qryLigacao.FieldByName('Cod_Ligacao').AsInteger;
  qryLigacao2.Open;
  qryLigacao2.Edit;
  qryLigacao2.FieldByName('Status_Lig').AsString          := 'E';
  qryLigacao2.FieldByName('Dt_Fechamento_lig').AsDateTime := Now();
  qryLigacao2.FieldByName('Obs_Lig').AsString             := memoObs.Text;
  qryLigacao2.Post;
  qryLigacao.Close;
  qryLigacao.Open;
  qryLigacao.Locate('Cod_Ligacao',qryLigacao2.FieldByName('Cod_Ligacao').AsInteger,[]);
end;

procedure TLicacaoSolicit_f.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if qryLigacao.FieldByName('Status_lig').AsString = 'E' then // condição
    Dbgrid1.Canvas.Font.Color:= clRed; // coloque aqui a cor desejada
  Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
end;

procedure TLicacaoSolicit_f.AgendamentodeLigao1Click(Sender: TObject);
begin
  inherited;
  if assigned(CadLigacao_f) then
    CadLigacao_f := nil;

  CadLigacao_f := TCadLigacao_f.Create(application.MainForm);
  try
    CadLigacao_f.WindowState := wsNormal;
    CadLigacao_f.Show;
  except
    CadLigacao_f := TCadLigacao_f.Create(application.MainForm);
    CadLigacao_f.Show;
  end;
end;

procedure TLicacaoSolicit_f.Visita1Click(Sender: TObject);
begin
  inherited;
  if assigned(CadVisita_f) then
    CadVisita_f := nil;

  CadVisita_f := TCadVisita_f.Create(application.MainForm);
  try
    CadVisita_f.WindowState := wsNormal;
    CadVisita_f.Show;
  except
    CadVisita_f := TCadVisita_f.Create(application.MainForm);
    CadVisita_f.Show;
  end;
end;

procedure TLicacaoSolicit_f.qryLigacaoCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qryLigacao.FieldByName('quemfala').AsString = 'E' then
    qryLigacao.FieldByName('EuRecep').AsString := 'Eu'
  else
    qryLigacao.FieldByName('EuRecep').AsString := 'Recepcionista';

end;

procedure TLicacaoSolicit_f.Timer1Timer(Sender: TObject);
begin
  inherited;
  qryLigacao.Close;
  qryLigacao.Open;
end;

procedure TLicacaoSolicit_f.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  timer1.Enabled := False;
end;

end.
