unit CadMemorando_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, ExtCtrls, RxCalc, Menus, ToolEdit, RXDBCtrl, Mask, Buttons,
  StdCtrls, DBCtrls, ComCtrls, CheckLst, Db, DBTables;

type
  TCadMemorando_f = class(TDeriva_f)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label3: TLabel;
    medMemo: TMaskEdit;
    Label7: TLabel;
    SpeedButton2: TSpeedButton;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    memoTexto: TDBRichEdit;
    Label2: TLabel;
    Label4: TLabel;
    clbFunc: TCheckListBox;
    DBRadioGroup1: TDBRadioGroup;
    edtCodigo: TEdit;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    edtFunc: TEdit;
    Label5: TLabel;
    btnNovo: TBitBtn;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    qryAux: TQuery;
    dsMemo: TDataSource;
    qryMemo: TQuery;
    Query1: TQuery;
    DBEdit2: TDBEdit;
    qryMemoFunc: TQuery;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    btnImp: TBitBtn;
    procedure SpeedButton1Click(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure medMemoExit(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadMemorando_f: TCadMemorando_f;

implementation

uses Atendimento_dm, principal, qrMemorando, funcoes;

{$R *.DFM}

procedure TCadMemorando_f.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  dmPesq.PesFunc.Execute;
  if dmPesq.PesFunc.ValoresRetorno[0] <> '' then
  begin
    edtCodigo.Text := dmPesq.PesFunc.ValoresRetorno[0];
    if edtCodigo.Text = '' then
    begin
      edtCodigo.SetFocus;
      exit;
    end;
    qryAux.Close;
    qryAux.SQL.Text := 'SELECT * FROM GC_FUNCIONARIO WHERE COD_FUNC='+edtCodigo.Text;
    qryAux.Open;
    edtFunc.Text := qryAux.FieldByName('Nome_Func').AsString;
  end;
end;

procedure TCadMemorando_f.edtCodigoExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
  if edtCodigo.Text <> '' then
  begin
    qryAux.Close;
    qryAux.SQL.Text := 'SELECT * FROM GC_FUNCIONARIO WHERE COD_FUNC='+edtCodigo.Text;
    qryAux.Open;
    edtCodigo.Text  := qryAux.FieldByName('Cod_Func').AsString;
    edtFunc.Text    := qryAux.FieldByName('Nome_Func').AsString;
    {qryVisita.FieldByName('Cod_Depto').AsInteger := qryAux.FieldByName('Cod_Depto').AsInteger;}
  end
  else
  begin
    edtCodigo.SetFocus;
  end;
end;

procedure TCadMemorando_f.btnNovoClick(Sender: TObject);
begin
  inherited;

  btnImp.Enabled := False;

  qryMemo.Close;
  qryMemo.SQL.Clear;
  qryMemo.SQL.Add('SELECT * FROM GC_MEMORANDO WHERE COD_MEMO = 0');
  qryMemo.Open;

  qryMemo.Insert;
  qryMemo.FieldByName('Status_Memo').AsString := 'A';
  qryMemo.FieldByName('Cod_Func').AsInteger   := Cod_Func;
  qryMemo.FieldByName('dt_memo').AsDateTime   := now();
  edtCodigo.Text                              := inttostr(cod_func);
  edtCodigoExit(self);
  dbEdit1.SetFocus;
  with qryAux do
  begin
    close;
    sql.text := 'SELECT * FROM GC_FUNCIONARIO WHERE ATIVO_FUNC = ''S''';
    open;
    clbFunc.Clear;
    while not eof do
    begin
      clbFunc.Items.Add( formatfloat('00000', fieldbyname('cod_func').AsInteger) + ' - ' + fieldbyname('nome_func').AsString);
      next;
    end;
  end;
  medMemo.Clear;
end;

procedure TCadMemorando_f.BitBtn1Click(Sender: TObject);
var cod_memo : Integer;
    x        : Integer;
    marca    : Boolean;
begin
  inherited;
  if qryMemo.State = dsInsert then
  begin
    marca := False;
    for x := 0 to clbFunc.Items.Count -1 do
    begin
      if clbFunc.Checked[x] then marca := True;
    end;
    if dbEdit1.Text = '' then
    begin
      MessageDlg('É necessário informar o assunto, para que seu memorando não fique sem título.',mtWarning,[mbOk],0);
      dbEdit1.SetFocus;
      exit;
    end;

    if Marca then
    begin
      Cod_Memo := Proximo('GC_MEMORANDO','COD_MEMO','', true);
      qryMemo.FieldByName('Cod_Memo').AsInteger := Cod_Memo;
      qryMemo.Post;
      for x := 0 to clbFunc.Items.Count -1 do
      begin
        if clbFunc.Checked[x] then
        begin
          qryMemoFunc.Close;
          qryMemoFunc.SQL.Text := 'SELECT * FROM GC_MEMORANDO_FUNC WHERE COD_MEMO = 0 AND COD_FUNC = 0';
          qryMemoFunc.Open;
          qryMemoFunc.Insert;
          qryMemoFunc.FieldByName('Cod_Memo').AsInteger         := Cod_Memo;
          qryMemoFunc.FieldByName('Cod_Func').AsString          := copy(clbFunc.Items[x],1,5);
          qryMemoFunc.FieldByName('STATUS_MEMO_FUNC').AsString  := 'A';
          qryMemoFunc.Post;
        end;
      end;

      MessageDlg('O Memorando foi gerado com sucesso sob o número ' + formatfloat('000000000',Cod_Memo),mtInformation,[mbOk],0);
      qryMemo.Close;
      medMemo.Clear;
      medMemo.SetFocus;
      clbFunc.Clear;
      edtCodigo.Clear;
      edtFunc.Clear;
    end
    else
    begin
      MessageDlg('É necessário informar o destinatário do memorando. ',mtInformation,[mbOk],0);
      clbFunc.SetFocus;
    end;
  end
  else
  begin
    if nivel = 0 then
    begin
      qryAux.Close;
      qryAux.SQL.Text := 'DELETE FROM GC_MEMORANDO_FUNC WHERE COD_MEMO = '+medMemo.Text;
      qryAux.ExecSQL;
      for x := 0 to clbFunc.Items.Count -1 do
      begin
        if clbFunc.Checked[x] then
        begin
          qryMemoFunc.Close;
          qryMemoFunc.SQL.Text := 'SELECT * FROM GC_MEMORANDO_FUNC WHERE COD_MEMO = 0 AND COD_FUNC = 0';
          qryMemoFunc.Open;
          qryMemoFunc.Insert;
          qryMemoFunc.FieldByName('Cod_Memo').AsString          := medMemo.text;
          qryMemoFunc.FieldByName('Cod_Func').AsString          := copy(clbFunc.Items[x],1,5);
          qryMemoFunc.FieldByName('STATUS_MEMO_FUNC').AsString  := 'A';
          qryMemoFunc.Post;
        end;
      end;
      qryMemo.Edit;
      qryMemo.Post;
    end;
    qryMemo.Close;
    medMemo.Clear;
    medMemo.SetFocus;
    clbFunc.Clear;
    edtCodigo.Clear;
    edtFunc.Clear;
  end;
end;

procedure TCadMemorando_f.medMemoExit(Sender: TObject);
begin
  inherited;
  if medMemo.Text <> '' then
  begin
    qryMemo.Close;
    qryMemo.SQL.Text     := 'SELECT * FROM GC_MEMORANDO WHERE COD_MEMO = ' + medMemo.Text;
    qryMemo.Open;
    dsMemo.AutoEdit      := (nivel = 0) and (qryMemo.FieldByName('Status_Memo').AsString = 'A');
    clbFunc.Enabled      := (nivel = 0) and (qryMemo.FieldByName('Status_Memo').AsString = 'A');
    SpeedButton3.Enabled := (nivel = 0) and (qryMemo.FieldByName('Status_Memo').AsString = 'A');
    SpeedButton4.Enabled := (nivel = 0) and (qryMemo.FieldByName('Status_Memo').AsString = 'A');
    btnImp.Enabled := not qryMemo.Eof;

    if qryMemo.eof then
    begin
      MessageDlg('Codigo de memorando não existe.',mtInformation,[mbOk],0);
      medMemo.SetFocus;
      exit;
    end;
    edtCodigo.Text                           := qryMemo.FieldByName('Cod_Func').AsString;
    edtCodigoExit(self);
    with qryAux do
    begin
      close;
      sql.text := 'SELECT * FROM GC_FUNCIONARIO WHERE ATIVO_FUNC = ''S''';
      open;
      clbFunc.Clear;
      while not eof do
      begin
        clbFunc.Items.Add( formatfloat('00000', fieldbyname('cod_func').AsInteger) + ' - ' + fieldbyname('nome_func').AsString);
        qryMemoFunc.Close;
        qryMemoFunc.SQL.Text := 'SELECT * FROM GC_MEMORANDO_FUNC WHERE COD_MEMO = ' + medMemo.Text + ' AND COD_FUNC = '+fieldbyname('cod_func').AsString;
        qryMemoFunc.Open;
        if not qryMemoFunc.eof then clbFunc.Checked[clbFunc.Items.Count-1] := True;
        next;
      end;
    end;
  end;
end;

procedure TCadMemorando_f.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if qryMemo.Active then
  begin
    if nivel = 0 then
    begin
      if messagedlg('Deseja realmente cancelar este Memorando ?',mtWarning,[mbYes,mbNo],0) = idYes then
      begin
        if qryMemo.State = dsInsert then
          qryMemo.Cancel
        else
        begin
          qryMemo.Edit;
          qryMemo.FieldByName('Status_Memo').AsString := 'C';
          qryMemo.Post;
        end;
      end;
    end
    else
    begin
      messagedlg('Não é possível cancelar este memorando com este Nível de senha.',mtWarning,[mbOk],0);
      medMemo.SetFocus;
      exit;
    end;
    qryMemo.Close;
    medMemo.SetFocus;
    clbFunc.Clear;
    edtCodigo.Clear;
    edtFunc.Clear;
  end;
end;

procedure TCadMemorando_f.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Mostra     := False;
  frmPrincipal.Timer1Timer(self);
  Mostra     := (uppercase(LerIni(caminho+'Atendimento.ini','Identificacao','Pendencia')) = 'SIM');
end;

procedure TCadMemorando_f.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  dmPesq.PesMemo.Execute;
  if dmPesq.PesMemo.ValoresRetorno[0] <> '' then
  begin
    medMemo.Text := dmPesq.PesMemo.ValoresRetorno[0];
    if medMemo.Text = '' then
    begin
      medMemo.SetFocus;
      exit;
    end;
    medMemoExit(Self);
  end;
end;

procedure TCadMemorando_f.SpeedButton3Click(Sender: TObject);
var x:integer;
begin
  inherited;
  if clbFunc.Items.Count > 0 then
  begin
    for x := 0 to clbFunc.Items.Count - 1 do
    begin
      clbFunc.Checked[x] := True;
    end;
  end;
end;

procedure TCadMemorando_f.SpeedButton4Click(Sender: TObject);
var x:integer;
begin
  inherited;
  if clbFunc.Items.Count > 0 then
  begin
    for x := 0 to clbFunc.Items.Count - 1 do
    begin
      clbFunc.Checked[x] := False;
    end;
  end;
end;

procedure TCadMemorando_f.btnImpClick(Sender: TObject);
begin
  inherited;
  qrMemorando_f := TqrMemorando_f.Create(nil);
  qrMemorando_f.Query1.Close;
  qrMemorando_f.Query1.Sql.Text := 'SELECT * FROM GC_MEMORANDO MEM '+
                                   ' LEFT  JOIN GC_FUNCIONARIO FUNC   ON (MEM.COD_FUNC=FUNC.COD_FUNC) '+
                                   ' WHERE MEM.COD_MEMO = ' + medMemo.Text;
  qrMemorando_f.Query1.Open;
  qrMemorando_f.Preview;
  qrMemorando_f.free;
end;

end.
