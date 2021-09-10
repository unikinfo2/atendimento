unit CopiaProtocolo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, RxCalc, Menus, StdCtrls, Buttons, ExtCtrls, Db, DBTables,
  CheckLst, shellapi, RpDefine, RpBase, RpSystem, rpMemo;

type
  TCopiaProtocolo_f = class(TDeriva_f)
    Panel3: TPanel;
    BitBtn1: TBitBtn;
    Panel2: TPanel;
    Label3: TLabel;
    memoProto: TMemo;
    Label1: TLabel;
    qryAux: TQuery;
    qryProtocolo: TQuery;
    qryDoc_Emi: TQuery;
    lblCliente: TCheckListBox;
    BitBtn10: TBitBtn;
    RvSystem3: TRvSystem;
    qryImpPro: TQuery;
    qryLinhas: TQuery;
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure RvSystem3BeforePrint(Sender: TObject);
    procedure RvSystem3NewPage(Sender: TObject);
    procedure RvSystem3Print(Sender: TObject);
  private
    { Private declarations }
  public
    cod_protocolo : Integer;
    { Public declarations }
  end;

var
  CopiaProtocolo_f: TCopiaProtocolo_f;

implementation
uses principal, DocEmitido_u, qrProtocolo, qrProtocolo2, qrProtocolo3, funcoes;
{$R *.DFM}

procedure TCopiaProtocolo_f.FormCreate(Sender: TObject);
begin
  inherited;
  {Docs Livres}
  qryAux.Close;
  qryAux.SQL.Text := 'select * from gc_cliente order by nome_cli';
  qryAux.Open;
  lblCliente.Items.Clear;
  while not qryAux.Eof do
  begin
    lblCliente.Items.add(formatfloat('00000',qryAux.FieldByName('Cod_Cliente').AsInteger) + ' - ' + qryAux.FieldByName('Nome_cli').AsString);
    qryAux.Next;
  end;
end;

procedure TCopiaProtocolo_f.BitBtn1Click(Sender: TObject);
var x, vProto:integer;
    Protocolos : String;
begin
  inherited;
  if DocEmitido_f.edtProtocolo.Text = '' then
  begin
    messagedlg('É necessário informar o Codigo do protocolo principal.',mtWarning,[mbOk],0);
    close;
    exit;
  end;

  x := 0;
  Protocolos := DocEmitido_f.edtProtocolo.Text;
  qryProtocolo.Open;
  qryDoc_Emi.Open;
  while (x < lblCliente.Items.Count) do
  begin
    if lblCliente.Checked[x] then
    begin
      qryProtocolo.Insert;
      vProto := Proximo('GC_PROTOCOLO','COD_PROTOCOLO','', true);
      qryProtocolo.fieldbyname('Cod_Protocolo').AsInteger     := vProto;
      qryProtocolo.fieldbyname('Cod_Cliente').AsString        := copy(lblCliente.Items[x],1,5);
      qryProtocolo.fieldbyname('Cod_Func').Value              := DocEmitido_f.qryProtocolo.FieldByName('Cod_Func').Value;
      qryProtocolo.fieldbyname('Cod_Func_Cad').Value          := DocEmitido_f.qryProtocolo.FieldByName('Cod_Func_Cad').Value;
      qryProtocolo.FieldByName('Status_Entrega').AsString     := 'M';
      qryProtocolo.FieldByName('Dt_Emissao_Proto').AsDateTime := DocEmitido_f.qryProtocolo.FieldByName('Dt_Emissao_Proto').AsDateTime;
      qryProtocolo.FieldByName('Dt_Entrega_Prev').AsDateTime  := DocEmitido_f.qryProtocolo.FieldByName('Dt_Entrega_Prev').AsDateTime;
      qryProtocolo.FieldByName('OBS_Protocolo').AsString      := DocEmitido_f.qryProtocolo.FieldByName('Obs_Protocolo').AsString;
      qryProtocolo.Post;

      DocEmitido_f.qryDoctoEmitido.First;
      while not (DocEmitido_f.qryDoctoEmitido.eof) do
      begin
        qryDoc_Emi.Insert;
        qryDoc_Emi.FieldByName('Cod_Protocolo').AsInteger  := vProto;
        qryDoc_Emi.FieldByName('Cod_Docto_Emi').AsInteger  := DocEmitido_f.qryDoctoEmitido.FieldByName('Cod_Docto_Emi').AsInteger;
        qryDoc_Emi.FieldByName('Cod_Docto').AsInteger      := DocEmitido_f.qryDoctoEmitido.FieldByName('Cod_Docto').AsInteger;
        qryDoc_Emi.FieldByName('Obs_Docto_Emi').AsString   := DocEmitido_f.qryDoctoEmitido.FieldByName('Obs_Docto_Emi').AsString;
        qryDoc_Emi.FieldByName('Dt_Vencimento').AsDateTime := DocEmitido_f.qryDoctoEmitido.FieldByName('dt_vencimento').AsDateTime;
        qryDoc_Emi.Post;
        DocEmitido_f.qryDoctoEmitido.next;
      end;
      protocolos := protocolos + ', ' + IntToStr(vProto);
    end;
    inc(x);
  end;
  memoProto.Lines.Text := Protocolos;
end;

procedure TCopiaProtocolo_f.BitBtn10Click(Sender: TObject);
begin
  inherited;
  if (DocEmitido_f.edtProtocolo.Text = '') and (memoProto.Lines.Text = '') then
  begin
    messagedlg('Informe o número do Protocolo.',mtWarning,[mbOk],0);
    exit;
  end;
  if copy(memoProto.Lines.Text,length(memoProto.Lines.Text),1) = ',' then
  begin
    memoProto.Lines.Text := copy(memoProto.Lines.Text,1,length(memoProto.Lines.Text)-1);
  end;

  if (memoProto.Lines.Text = '') then
  begin
    memoProto.Lines.Text := DocEmitido_f.edtProtocolo.Text;
  end;

  if lerini(caminho+'Atendimento.ini','Identificacao','Protocolo') = '2' then
  begin
    qrProtocolo2_f := TQrProtocolo2_f.Create(self);
    with qrProtocolo2_f do
    begin
      qryImpPro.Close;
      qryImpPro.SQL.Text := 'SELECT * FROM GC_PROTOCOLO PRO '+
                            ' LEFT JOIN GC_CLIENTE           CLI ON (PRO.COD_CLIENTE=CLI.COD_CLIENTE) '+
                            ' LEFT JOIN GC_FUNCIONARIO       FUN ON (PRO.COD_FUNC_CAD=FUN.COD_FUNC) '+
                            ' LEFT JOIN GC_DEPARTAMENTO      DEP ON (FUN.COD_DEPTO=DEP.COD_DEPTO) '+
                            ' LEFT JOIN GC_DOCUMENTO_EMITIDO EMI ON (PRO.COD_PROTOCOLO = EMI.COD_PROTOCOLO) '+
                            ' LEFT JOIN GC_DOCUMENTO         DOC ON (EMI.COD_DOCTO     = DOC.COD_DOCTO) '+
                            ' WHERE PRO.COD_PROTOCOLO IN (' + memoProto.Lines.Text + ')' +
                            ' ORDER BY PRO.COD_PROTOCOLO, EMI.COD_PROTOCOLO';
      qryImpPro.Open;
      Preview;
      Free;
    end;
  end
  else if lerini(caminho+'Atendimento.ini','Identificacao','Protocolo') = '3' then
  begin
    qryImpPro.Close;
    qryImpPro.SQL.Text := 'SELECT * FROM GC_PROTOCOLO PRO '+
                          ' LEFT JOIN GC_CLIENTE CLI ON (PRO.COD_CLIENTE=CLI.COD_CLIENTE) '+
                          ' LEFT JOIN GC_FUNCIONARIO FUN ON (PRO.COD_FUNC_CAD=FUN.COD_FUNC) '+
                          ' LEFT JOIN GC_DEPARTAMENTO DEP ON (FUN.COD_DEPTO=DEP.COD_DEPTO) '+
                          ' LEFT JOIN GC_SETOR SETOR ON (CLI.COD_SETOR=SETOR.COD_SETOR)     '+
                          ' WHERE COD_PROTOCOLO IN (' + memoProto.Lines.Text + ')';
    qryImpPro.Open;
    rvSystem3.Execute;
    {qrProtocolo3_f := TQrProtocolo3_f.Create(self);
    with qrProtocolo3_f do
    begin
      qryImpPro.Close;
      qryImpPro.SQL.Text := 'SELECT * FROM GC_PROTOCOLO PRO '+
                            ' LEFT JOIN GC_CLIENTE CLI ON (PRO.COD_CLIENTE=CLI.COD_CLIENTE) '+
                            ' LEFT JOIN GC_FUNCIONARIO FUN ON (PRO.COD_FUNC_CAD=FUN.COD_FUNC) '+
                            ' LEFT JOIN GC_DEPARTAMENTO DEP ON (FUN.COD_DEPTO=DEP.COD_DEPTO) '+
                            ' WHERE COD_PROTOCOLO IN (' + memoProto.Lines.Text + ')';
      qryImpPro.Open;
      Preview;
      Free;
    end;}
  end
  else
  begin
    qrProtocolo_f := TQrProtocolo_f.Create(self);
    with qrProtocolo_f do
    begin

      qryImpPro.Close;
      qryImpPro.SQL.Text := 'SELECT * FROM GC_PROTOCOLO PRO '+
                            ' LEFT JOIN GC_CLIENTE CLI ON (PRO.COD_CLIENTE=CLI.COD_CLIENTE) '+
                            ' LEFT JOIN GC_FUNCIONARIO FUN ON (PRO.COD_FUNC_CAD=FUN.COD_FUNC) '+
                            ' LEFT JOIN GC_DEPARTAMENTO DEP ON (FUN.COD_DEPTO=DEP.COD_DEPTO) '+
                            ' WHERE COD_PROTOCOLO IN (' + memoProto.Lines.Text + ')';
      qryImpPro.Open;
      Preview;
      Free;
    end;
  end;
end;

procedure TCopiaProtocolo_f.RvSystem3BeforePrint(Sender: TObject);
begin
  inherited;
  with Sender as TBaseReport do
  begin
    SelectPaper('A4');
  end;

end;

procedure TCopiaProtocolo_f.RvSystem3NewPage(Sender: TObject);
begin
  inherited;
  with Sender as TBaseReport do
  begin
    SectionTop := 0.0;
    SetFont('Arial',8);
    Underline := false;
    Home;
    YPos := 0.3;
    FontRotation := 0;
  end;

end;

procedure TCopiaProtocolo_f.RvSystem3Print(Sender: TObject);
var Pos1c, Pos2c : Double;
    Pos1, Pos2 : Double;
    PosIni, PosObs, PosImg, vPosItem : Double;
    y, x : Integer;
    MemoBuf : TMemoBuf;
    Bitmap  : TBitmap;
    vAssinatura : TMemoryStream;
    vNumPro : Integer;
begin
  inherited;
  with Sender as TBaseReport do
  begin
    qryImpPro.First;
    {Corpo do Protocolo}
    while not qryImpPro.Eof do
    begin
      for vNumPro := 1 to 2 do
      begin
        SetFont('Arial',8);
        Underline  := false;
        Pos1c      := PageWidth/4;
        PosIni     := 0.55;
        if vNumPro = 2 then
        begin
          PosIni  := (PageHeight/2) + 0.1;
        end;
        Pos1  := 0.30;

        Bitmap := TBitmap.Create;
        if fileexists('imagens\protocolo3.bmp') then
        begin
          Bitmap.LoadFromFile('imagens\protocolo3.bmp');
          PrintBitmapRect(pos1,    posIni, PageWidth-0.3, posIni+5.0, BitMap );
          Rectangle (pos1, posIni, PageWidth-0.30, posIni+5.0);
        end;

        gotoxy(0.0, PosIni);
        SomaLinha(Sender as TBaseReport);
        SomaLinha(Sender as TBaseReport);
        SetFont('Arial',10);
        bold := true;
        if vNumPro = 1 then
          printLeft('VIA EMPRESA DEVOLVER ASSINADA',pos1 + 4.5)
        else
          printLeft('VIA CLIENTE',pos1 + 5.5);
        bold := False;
        SetFont('Arial',8);
        SomaLinha(Sender as TBaseReport);
        SomaLinha(Sender as TBaseReport);
        Bold := True;
        printLeft('Entregar  até', pos1 + 4.5);
        printLeft('Número',       pos1 + 7.0);
        Bold := False;
        SomaLinha(Sender as TBaseReport);
        SomaLinha(Sender as TBaseReport);
        gotoxy(0.0, PosIni+0.73);
        printLeft(formatdatetime('dd/mm/yyyy',qryImpPro.FieldByName('dt_entrega_prev').AsDateTime), pos1 + 4.5);
        Bold := True;
        printLeft(formatfloat('000000000',qryImpPro.FieldByName('cod_protocolo').AsInteger),        pos1 + 7.0);
        Bold := False;
        SomaLinha(Sender as TBaseReport);
        Bold := False;

        gotoxy(0.0, PosIni);
        SomaLinha(Sender as TBaseReport);
        SetFont('Arial',10);
        Bold := True;
        printCenter(lerIni(caminho+'Atendimento.ini','CIDADE','CLIENTE'), pos1c);
        SomaLinha(Sender as TBaseReport);
        printCenter(lerIni(caminho+'Atendimento.ini','CIDADE','ENDERECO'), pos1c);
        SomaLinha(Sender as TBaseReport);
        printCenter('FONE: ' + lerIni(caminho+'Atendimento.ini','CIDADE','TELEFONE') + ' FAX: ' + lerIni(caminho+'Atendimento.ini','CIDADE','FAX'), pos1c);
        SomaLinha(Sender as TBaseReport);
        SomaLinha(Sender as TBaseReport);
        printLeft('Protocolo  ' + qryImpPro.FieldByName('desc_depto').AsString, pos1+0.1);
        Bold := False;
        SetFont('Arial',8);

        SomaLinha(Sender as TBaseReport);
        SomaLinha(Sender as TBaseReport);
        printLeft(formatfloat('0000',qryImpPro.FieldByName('cod_cliente').AsFloat), pos1+0.1);
        printLeft(qryImpPro.FieldByName('nome_cli').AsString, pos1+1.2);

        SomaLinha(Sender as TBaseReport);

        if qryImpPro.FieldByName('correspondencia_cli').AsString = '2' then
        begin
          SomaLinha(Sender as TBaseReport);
          Bold := True;
          printLeft('Endereço ', pos1+0.1);
          Bold := False;
          printLeft(qryImpPro.FieldByName('end_cob_cli').AsString, Pos1+1.2);
          printLeft(qryImpPro.FieldByName('bairro_cob_cli').AsString , Pos1+4.63);
          printLeft(qryImpPro.FieldByName('cidade_cob_cli').AsString + ' - ' + qryImpPro.FieldByName('uf_cob_cli').AsString, Pos1+6.25);
        end
        else
        begin
          SomaLinha(Sender as TBaseReport);
          Bold := True;
          printLeft('Endereço ', pos1+0.1);
          Bold := False;
          printLeft(qryImpPro.FieldByName('endereco_cli').AsString + ' ' + qryImpPro.FieldByName('complemento_cli').AsString, pos1+1.2);
          printLeft(qryImpPro.FieldByName('bairro_cli').AsString, pos1+4.63);
          printLeft(qryImpPro.FieldByName('cidade_cli').AsString + ' - ' + qryImpPro.FieldByName('uf_cli').AsString, pos1+6.25);
        end;
        SomaLinha(Sender as TBaseReport);
        SomaLinha(Sender as TBaseReport);

        Bold := True;
        printLeft('A/C DO SR.(A): ', pos1+0.1);
        Bold := False;
        printLeft(qryImpPro.FieldByName('RESPONSAVEL_PROTO').AsString, pos1+1.2);
        SomaLinha(Sender as TBaseReport);
        SomaLinha(Sender as TBaseReport);

        Bold := True;
        printLeft('PREZADO(A) CLIENTE:', pos1+1);
        Bold := False;
        SomaLinha(Sender as TBaseReport);
        printLeft('ESTAMOS ENCAMINHANDO OS DOCUMENTOS ABAIXO RELACIONADOS PARA SUAS PROVIDÊNCIAS:', pos1+0.5);
        SomaLinha(Sender as TBaseReport);
        SomaLinha(Sender as TBaseReport);
        SomaLinha(Sender as TBaseReport);


        Bold := True;
        printLeft('DOCUMENTOS', pos1+2.32);
        printLeft('VENCTOS.', pos1+6.13);
        printLeft('VALOR R$', pos1+6.88);
        SomaLinha(Sender as TBaseReport);
        SomaLinha(Sender as TBaseReport);
        vPosItem := LineMiddle;
        printLeft('DATA', pos1+0.25);
        Bold := False;
        SomaLinha(Sender as TBaseReport);
        SomaLinha(Sender as TBaseReport);
        printLeft(formatdatetime('dd/mm/yyyy',qryImpPro.FieldByName('DT_EMISSAO_PROTO').AsDateTime), pos1+0.25);

        SomaLinha(Sender as TBaseReport);
        SomaLinha(Sender as TBaseReport);
        Bold := True;
        printLeft('HORÁRIO', pos1+0.25);
        Bold := False;
        SomaLinha(Sender as TBaseReport);
        SomaLinha(Sender as TBaseReport);
        printLeft(formatdatetime('hh:nn',qryImpPro.FieldByName('DT_EMISSAO_PROTO').AsDateTime), pos1+0.25);
        SomaLinha(Sender as TBaseReport);

        SomaLinha(Sender as TBaseReport);
        SomaLinha(Sender as TBaseReport);
        SomaLinha(Sender as TBaseReport);
        printLeft('Funcionário: '+qryImpPro.FieldByName('apelido_func').AsString, pos1+0.2);
        SomaLinha(Sender as TBaseReport);
        SomaLinha(Sender as TBaseReport);

        qryLinhas.Close;
        qryLinhas.SQL.Text := 'SELECT EMI.*, DOC.DESC_DOCTO FROM GC_DOCUMENTO_EMITIDO EMI '+
                              ' LEFT JOIN GC_DOCUMENTO DOC ON (EMI.COD_DOCTO=DOC.COD_DOCTO) '+
                              ' WHERE COD_PROTOCOLO='+ qryImpPro.FieldByName('Cod_Protocolo').AsString;
        qryLinhas.Open;

        y := 1;
        while not qryLinhas.Eof do
        begin
          {Tabulação dos Detalhes}
          GotoXY(0.0, vPosItem);
          SetFont('Arial',6);
          printLeft(qryLinhas.FieldByName('Desc_Docto').AsString + ' ' + qryLinhas.FieldByName('Obs_Docto_Emi').AsString, pos1+2.32);
          if formatdatetime('dd/mm/yyyy',qryLinhas.FieldByName('Dt_Vencimento').AsDateTime) <> '30/12/1899' then
            printLeft(formatdatetime('dd/mm/yyyy', qryLinhas.FieldByName('Dt_Vencimento').AsDateTime), pos1+6.13);
          if qryLinhas.FieldByName('VALOR_DOCTO_EMI').AsFloat > 0 then
            printRight(formatFloat(',0.00', qryLinhas.FieldByName('VALOR_DOCTO_EMI').AsFloat), pos1+7.50);

          vPosItem := vPosItem + 0.25;
          qryLinhas.Next;
          inc(y);
          if y > 7 then
            break;
        end;

        Bitmap.FreeImage;
      end;
      qryImpPro.Next;
      if not qryImpPro.eof then
        NewPage;
    end;
  end;
end;

end.
