unit LerMemorando_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, RxCalc, Menus, StdCtrls, Buttons, ComCtrls, DBCtrls, Mask,
  ExtCtrls, Db, DBTables, RXCtrls;

type
  TLerMemorando_f = class(TDeriva_f)
    Panel1: TPanel;
    Label7: TLabel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit2: TDBEdit;
    Panel2: TPanel;
    texto: TDBRichEdit;
    Panel3: TPanel;
    btnMarca: TBitBtn;
    DBNavigator1: TDBNavigator;
    DBEdit3: TDBEdit;
    qryMemorando: TQuery;
    dsMemorando: TDataSource;
    DBEdit4: TDBEdit;
    edtEnviada: TDBEdit;
    Panel4: TPanel;
    Label2: TLabel;
    btnImp: TBitBtn;
    qryAux: TQuery;
    BitBtn1: TBitBtn;
    rgFiltro: TRadioGroup;
    edtAssunto: TDBEdit;
    Label3: TLabel;
    lblStatus: TRxLabel;
    RxLabel1: TRxLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnImpClick(Sender: TObject);
    procedure btnMarcaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure rgFiltroClick(Sender: TObject);
    procedure qryMemorandoAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LerMemorando_f: TLerMemorando_f;

implementation
uses principal, qrMemorando, CadMemorando_u, funcoes;
{$R *.DFM}

procedure TLerMemorando_f.FormCreate(Sender: TObject);
begin
  inherited;
  qryMemorando.close;
  qryMemorando.sql.Text := 'SELECT * FROM GC_MEMORANDO MEM '+
                           ' LEFT  JOIN GC_FUNCIONARIO FUNC   ON (MEM.COD_FUNC=FUNC.COD_FUNC) '+
                           ' INNER JOIN GC_MEMORANDO_FUNC FUN ON (MEM.COD_MEMO=FUN.COD_MEMO) '+
                           ' WHERE MEM.STATUS_MEMO = ''A'' AND FUN.STATUS_MEMO_FUNC = ''A'' '+
                           ' AND FUN.COD_FUNC = ' + inttostr(COD_FUNC) +
                           ' ORDER BY DT_MEMO DESC';
  qryMemorando.Open;
  btnMarca.Enabled := not qryMemorando.eof;
  btnImp.Enabled   := not qryMemorando.eof;
end;

procedure TLerMemorando_f.btnImpClick(Sender: TObject);
begin
  inherited;
  qrMemorando_f := TqrMemorando_f.Create(nil);
  qrMemorando_f.Query1.Close;
  qrMemorando_f.Query1.Sql.Text := 'SELECT * FROM GC_MEMORANDO MEM '+
                                   ' LEFT  JOIN GC_FUNCIONARIO FUNC   ON (MEM.COD_FUNC=FUNC.COD_FUNC) '+
                                   ' INNER JOIN GC_MEMORANDO_FUNC FUN ON (MEM.COD_MEMO=FUN.COD_MEMO)  '+
                                   ' WHERE MEM.COD_MEMO = ' + qryMemorando.FieldByName('Cod_Memo').AsString +
                                   ' AND FUN.COD_FUNC = ' + inttostr(COD_FUNC);
  qrMemorando_f.Query1.Open;
  qrMemorando_f.Preview;
  qrMemorando_f.free;
end;

procedure TLerMemorando_f.btnMarcaClick(Sender: TObject);
var x : Integer;
begin
  inherited;
  if messagedlg('Deseja marcar este memorando como lido ?',mtWarning,[mbYes,mbNo],0) = idYes then
  begin
    qryAux.close;
    qryAux.sql.text := 'SELECT * FROM GC_MEMORANDO_FUNC '+
                       ' WHERE COD_FUNC = '+ inttostr(cod_func) +
                       ' AND COD_MEMO = '+ dbEdit3.Text;
    qryAux.Open;
    if not qryAux.eof then
    begin
      qryAux.Edit;
      qryAux.FieldByName('STATUS_MEMO_FUNC').AsString := 'F';
      qryAux.FieldByName('DT_FECHA_MEMO').AsDateTime  := Now();
      qryAux.Post;
    end;

    qryMemorando.Next;
    x := qryMemorando.fieldbyname('cod_memo').AsInteger;
    qryMemorando.Close;
    qryMemorando.Open;

    btnMarca.Enabled := not qryMemorando.eof;
    btnImp.Enabled   := not qryMemorando.eof;

    if not qryMemorando.IsEmpty then
    begin
      qryMemorando.Locate('COD_MEMO',x,[loCaseInsensitive]);
    end;
  end;
end;

procedure TLerMemorando_f.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Mostra     := False;
  frmPrincipal.Timer1Timer(self);
  Mostra     := (uppercase(LerIni(caminho+'Atendimento.ini','Identificacao','Pendencia')) = 'SIM');
end;

procedure TLerMemorando_f.BitBtn1Click(Sender: TObject);
var cod_memo : Integer;
    x        : Integer;
    vStr     : String;
    vTodos   : Boolean;
begin
  inherited;
  vTodos := messagedlg('Deseja responder a todos ?',mtConfirmation,[mbYes,mbNo],0) = idYes;

  CadMemorando_f := TCadMemorando_f.Create(Self);
  CadMemorando_f.Show;
  with CadMemorando_f do
  begin

    vStr := #13#10 +
            'Mensagem original: ' + qryMemorando.FieldByName('COD_MEMO').AsString + #13#10 +
            'Enviada por: ' + edtEnviada.Text + #13#10 +
            'Data do Envio: ' + formatdatetime('dd/mm/yyyy hh:nn:ss',qryMemorando.FieldByName('DT_MEMO').AsDateTime) + #13#10 +
            'Assunto: ' + qryMemorando.FieldByName('ASSUNTO_MEMO').AsString + #13#10#13#10;


    btnNovo.Click;
    Cod_Memo                                     := Proximo('GC_MEMORANDO','COD_MEMO', '', true);
    qryMemo.FieldByName('Cod_Memo').AsInteger    := Cod_Memo;
    qryMemo.FieldByName('ASSUNTO_MEMO').AsString := 'Re: ' + qryMemorando.FieldByName('ASSUNTO_MEMO').AsString;
    qryMemo.FieldByName('RELATO_MEMO').AsString  := qryMemorando.FieldByName('RELATO_MEMO').AsString;
    TRichEdit(memoTexto).Lines.Insert(0, vStr);

    if vTodos then
    begin
      qryAux.close;
      qryAux.sql.text := 'SELECT * FROM GC_MEMORANDO_FUNC '+
                         ' WHERE COD_MEMO = ' + qryMemorando.FieldByName('COD_MEMO').AsString;
      qryAux.Open;
      while not qryAux.Eof do
      begin
        clbFunc.Checked[chamaitem( formatfloat('00000',qryAux.FieldByName('COD_FUNC').AsInteger), clbFunc.Items)] := True;
        qryAux.Next;
      end;

    end
    else
      for x := 0 to clbFunc.Items.Count -1 do
        if strtoint(copy(clbFunc.Items[x],1,5)) = qryMemorando.FieldByName('COD_FUNC').AsInteger then
          clbFunc.Checked[x] := True;

    memoTexto.SelStart := 0;
    memoTexto.SetFocus;
  end;
  
  qryAux.close;
  qryAux.sql.text := 'SELECT * FROM GC_MEMORANDO_FUNC '+
                     ' WHERE COD_FUNC = '+ inttostr(cod_func) +
                     ' AND COD_MEMO = '+ dbEdit3.Text;
  qryAux.Open;
  if not qryAux.eof then
  begin
    qryAux.Edit;
    qryAux.FieldByName('STATUS_MEMO_FUNC').AsString := 'F';
    qryAux.FieldByName('DT_FECHA_MEMO').AsDateTime  := Now();
    qryAux.Post;
  end;

end;

procedure TLerMemorando_f.rgFiltroClick(Sender: TObject);
begin
  inherited;
  if rgFiltro.ItemIndex = 0 then
  begin
    qryMemorando.close;
    qryMemorando.sql.Text := 'SELECT * FROM GC_MEMORANDO MEM '+
                             ' INNER JOIN GC_FUNCIONARIO FUNC   ON (MEM.COD_FUNC=FUNC.COD_FUNC) '+
                             ' INNER JOIN GC_MEMORANDO_FUNC FUN ON (MEM.COD_MEMO=FUN.COD_MEMO) '+
                             ' WHERE MEM.STATUS_MEMO = ''A'' AND FUN.STATUS_MEMO_FUNC = ''A'' '+
                             ' AND FUN.COD_FUNC = ' + inttostr(COD_FUNC) +
                             ' ORDER BY DT_MEMO DESC';
    qryMemorando.Open;
  end
  else if rgFiltro.ItemIndex = 1 then
  begin
    qryMemorando.close;
    qryMemorando.sql.Text := 'SELECT * FROM GC_MEMORANDO MEM '+
                             ' INNER JOIN GC_FUNCIONARIO FUNC   ON (MEM.COD_FUNC=FUNC.COD_FUNC) '+
                             ' INNER JOIN GC_MEMORANDO_FUNC FUN ON (MEM.COD_MEMO=FUN.COD_MEMO) '+
                             ' WHERE FUN.STATUS_MEMO_FUNC = ''F'' '+
                             '   AND FUN.COD_FUNC = ' + inttostr(COD_FUNC) +
                             ' ORDER BY DT_MEMO DESC';
    qryMemorando.Open;
  end
  else
  begin
    qryMemorando.close;
    qryMemorando.sql.Text := 'SELECT * FROM GC_MEMORANDO MEM '+
                             ' INNER JOIN GC_FUNCIONARIO FUNC   ON (MEM.COD_FUNC=FUNC.COD_FUNC) '+
                             ' INNER JOIN GC_MEMORANDO_FUNC FUN ON (MEM.COD_MEMO=FUN.COD_MEMO) '+
                             ' WHERE FUN.COD_FUNC = ' + inttostr(COD_FUNC) +
                             ' ORDER BY DT_MEMO DESC';
    qryMemorando.Open;
  end;
  btnMarca.Enabled := not qryMemorando.eof;
  btnImp.Enabled   := not qryMemorando.eof;
end;

procedure TLerMemorando_f.qryMemorandoAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if qryMemorando.FieldByName('STATUS_MEMO_FUNC').AsString = 'F' then lblStatus.Caption := 'Lido'
  else if qryMemorando.FieldByName('STATUS_MEMO_FUNC').AsString = 'A' then lblStatus.Caption := 'Não Lido';
end;

end.
