unit GraficoAtendimento;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, Menus, ExtCtrls, TeeProcs, TeEngine, Chart, mxgraph, Series,
  StdCtrls, Buttons, Mask, Db, DBTables, ComCtrls, printers, RxCalc, Funcoes,
  JPeg, IDSMTP, IDMessage;

type
  TGraficoAtendimento_f = class(TDeriva_f)
    Panel1: TPanel;
    Panel2: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    medCliente: TMaskEdit;
    Label1: TLabel;
    sbPesq: TSpeedButton;
    edtNomeCli: TEdit;
    Label2: TLabel;
    qryAux: TQuery;
    de: TMaskEdit;
    ate: TMaskEdit;
    Label3: TLabel;
    Label4: TLabel;
    BitBtn3: TBitBtn;
    edtAssunto: TEdit;
    Label5: TLabel;
    memoTexto: TMemo;
    graf: TChart;
    Series1: TPieSeries;
    procedure sbPesqClick(Sender: TObject);
    procedure medClienteExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    email_cli:String;
  end;

var
  GraficoAtendimento_f: TGraficoAtendimento_f;

implementation

uses Atendimento_dm, Principal;

{$R *.DFM}

procedure TGraficoAtendimento_f.sbPesqClick(Sender: TObject);
begin
  inherited;
  dmPesq.PesCliente.StringSql.Clear;
  dmPesq.PesCliente.StringSql.Add('SELECT * FROM GC_CLIENTE ');
  dmPesq.PesCliente.StringSql.Add(' ORDER BY NOME_CLI');
  dmPesq.PesCliente.Execute;
  medCliente.Clear;
  edtNomeCli.Clear;
  medCliente.Text := dmPesq.PesCliente.ValoresRetorno[0];
  edtNomeCli.Text := dmPesq.PesCliente.ValoresRetorno[2];
  medClienteExit(Self);
end;

procedure TGraficoAtendimento_f.medClienteExit(Sender: TObject);
begin
  inherited;
  email_cli        := '';
  if medCliente.Text <> '' then
  begin
    qryAux.Close;
    qryAux.SQL.Text := 'SELECT * FROM GC_CLIENTE WHERE COD_CLIENTE='+medCliente.Text;
    qryAux.Open;
    if qryAux.eof then
    begin
      messagedlg('Codigo de Cliente não cadastrado.',mtWarning,[mbOk],0);
      medCliente.SetFocus;
      exit;
    end;
    medCliente.Text  := qryAux.FieldByName('Cod_Cliente').AsString;
    edtNomeCli.Text  := qryAux.FieldByName('Nome_cli').AsString;
    email_cli        := qryAux.FieldByName('Email_cli').AsString;
  end
  else
  begin
    medCliente.Clear;
    edtNomeCli.Clear;
    sbPesqClick(Sender);
  end;
end;

procedure TGraficoAtendimento_f.BitBtn1Click(Sender: TObject);
var vSql, dtIni, dtFin : String;
begin
  inherited;
  qryAux.Close;
  dtini  := '';
  dtFin  := '';
  vSql := 'select count(*) qtd from gc_documento_emitido emi left join gc_protocolo pro on (emi.cod_protocolo=pro.cod_protocolo) where pro.cod_cliente = ' + medCliente.Text;
  if (de.Text <> '  /  /    ') and (ate.Text <> '  /  /    ') then
  begin
    dtini  := formatDateTime('mm/dd/yyyy',StrToDateTime(de.Text))  + ' 00:00:00';
    dtFin  := formatDateTime('mm/dd/yyyy',StrToDateTime(ate.Text)) + ' 23:59:59';
    vSql := vSql +   ' and pro.dt_emissao_proto >= cast( '''+ dtIni + ''' as timestamp) ';
    vSql := vSql +   ' and pro.dt_emissao_proto <= cast( '''+ dtfin + ''' as timestamp) ';
  end;
  vSql := vSql +     ' union all ';
  vSql := vSql +     ' select count(*) qtd from gc_visita where cod_cliente = ' + medCliente.Text;
  if (de.Text <> '  /  /    ') and (ate.Text <> '  /  /    ') then
  begin
    vSql := vSql +     ' and dt_visita >= cast( '''+ dtIni + ''' as timestamp) ';
    vSql := vSql +     ' and dt_visita <= cast( '''+ dtFin + ''' as timestamp) ';
  end;
  vSql := vSql +     ' union all ';
  vSql := vSql +     ' select count(*) qtd from gc_atendimento where cod_cliente = ' + medCliente.Text;
  if (de.Text <> '  /  /    ') and (ate.Text <> '  /  /    ') then
  begin
    vSql := vSql +     ' and dt_atend >= cast( '''+ dtIni + ''' as timestamp) ';
    vSql := vSql +     ' and dt_atend <= cast( '''+ dtFin + ''' as timestamp) ';
  end;
  vSql := vSql +     ' union all ';
  vSql := vSql +     ' select count(*) qtd from gc_email_cli email_cli ';
  vSql := vSql +     ' inner join gc_email email on ( email.cod_email = email_cli.cod_email) ';
  vSql := vSql +     ' where email_cli.cod_cliente = ' + medCliente.Text;
  if (de.Text <> '  /  /    ') and (ate.Text <> '  /  /    ') then
  begin
    vSql := vSql +     ' and email.dt_email >= cast( '''+ dtIni + ''' as timestamp) ';
    vSql := vSql +     ' and email.dt_email <= cast( '''+ dtFin + ''' as timestamp) ';
  end;

  vSql := vSql +     ' union all ';
  vSql := vSql +     ' select count(*) qtd from gc_ligacao lig_cli ';
  vSql := vSql +     ' where lig_cli.tipo_ligacao = ''S'' AND lig_cli.cod_cliente = ' + medCliente.Text;
  if (de.Text <> '  /  /    ') and (ate.Text <> '  /  /    ') then
  begin
    vSql := vSql +     ' and lig_cli.dt_pedido_lig >= cast( '''+ dtIni + ''' as timestamp) ';
    vSql := vSql +     ' and lig_cli.dt_pedido_lig <= cast( '''+ dtFin + ''' as timestamp) ';
  end;

  vSql := vSql +     ' union all ';
  vSql := vSql +     ' select count(*) qtd from gc_ligacao lig_cli ';
  vSql := vSql +     ' where lig_cli.tipo_ligacao = ''R'' AND lig_cli.cod_cliente = ' + medCliente.Text;
  if (de.Text <> '  /  /    ') and (ate.Text <> '  /  /    ') then
  begin
    vSql := vSql +     ' and lig_cli.dt_pedido_lig >= cast( '''+ dtIni + ''' as timestamp) ';
    vSql := vSql +     ' and lig_cli.dt_pedido_lig <= cast( '''+ dtFin + ''' as timestamp) ';
  end;

  qryAux.SQL.Text := vSql;

  qryAux.Open;
  graf.SeriesList.Series[0].Clear;
  graf.SeriesList.Series[0].Add( qryAux.FieldByName('qtd').AsInteger,'Documentos Enviados',40400);
  qryAux.Next;
  graf.SeriesList.Series[0].Add( qryAux.FieldByName('qtd').AsInteger,'Visitas',2147483648);
  qryAux.Next;
  graf.SeriesList.Series[0].Add( qryAux.FieldByName('qtd').AsInteger,'Atendimentos',700);
  qryAux.Next;
  graf.SeriesList.Series[0].Add( qryAux.FieldByName('qtd').AsInteger,'E-MAil`s',1147480130);
  qryAux.Next;
  graf.SeriesList.Series[0].Add( qryAux.FieldByName('qtd').AsInteger,'Ligações Solicitadas',900);
  qryAux.Next;
  graf.SeriesList.Series[0].Add( qryAux.FieldByName('qtd').AsInteger,'Ligações Recebidas',46892);

  graf.Title.Text.Clear;
  graf.Title.Font.Size := 8;

  graf.Title.Text.Add('Gráfico de Atendimento');
  graf.Title.Text.Add(edtNomeCli.Text);
  graf.Title.Text.Add('Períoddo de ' + De.Text + ' até ' + Ate.Text);

  graf.Legend.Alignment:=TLegendAlignment(1);

  graf.Show;
end;

procedure TGraficoAtendimento_f.BitBtn2Click(Sender: TObject);
var h,w:longint;
begin
  Screen.Cursor := crHourGlass; { <-- nice detail }
  try
    Printer.BeginDoc;       { <-- start printer job }
    try
      { now print some text on printer.canvas }
      With Printer.Canvas do
      begin
        Font.Name:='Arial';
        Font.Size:=10;             { <-- set the font size }
        Font.Style:=[];
        {TextOut(0,0,'Gráfico de Atendimento'); }  { <-- print some text }
      end;

      h:=Printer.PageHeight; { <-- get page height }
      w:=Printer.PageWidth;  { <-- get page width }

      { And now print the chart component... }
(*      graf.PrintPartial(  Rect(    w div 10,          { <-- left margin }
                                   h div 3 ,          { <-- top margin }
                                   w - (w div 10),    { <-- right margin }
                                   h - (h div 10) )); { <-- bottom margin }
*)
      graf.PrintPartial(  Rect(    10,          { <-- left margin }
                                   10 ,          { <-- top margin }
                                   w - (w div 10) - 50,    { <-- right margin }
                                   h - (h div 10) - 50 )); { <-- bottom margin }

      { print more text.... }
      With Printer.Canvas do
      begin
        Font.Name:='Arial';
        Font.Size:=12;             { <-- set the font size }
        Font.Style:=[fsItalic];
        {TextOut(0,60,'Gráfico de Atendimento'+' ...'); }  { again <-- print some text }
      end;

      Printer.EndDoc; { <-- end job and print !! }
    except
      on Exception do  { just in case an error happens... }
      Begin
        Printer.Abort;
        Printer.EndDoc;
        Raise;       { <-- raise up the exception !!! }
      end;
    end;
  finally
    Screen.Cursor:=crDefault; { <-- restore cursor }
  end;
end;

procedure TGraficoAtendimento_f.BitBtn3Click(Sender: TObject);
var
  Bmp   : TBitmap;
  JPeg  : TJPegImage;
  vArq  : String;
  email : TIDSMTP;
  Mens  : TIDMessage;
begin
  inherited;
  if (edtAssunto.Text = '') or (memoTexto.Lines.Text = '') then
  begin
    messagedlg('É necessário informar o assunto e o texto para o corpo do e-mail.',mtWarning,[mbOk],0);
    exit;
  end;
  BitBtn3.Enabled := False;
  vArq := extractfilepath(application.ExeName)+'Grafico.gif';
  {graf.SaveToBitmapFile(vArq);}

  Bmp := TBitmap.Create;
  try
    {Bmp.LoadFromFile(vArq);}
    bmp.Assign(graf.TeeCreateBitmap(clBlue, graf.GetRectangle));
    JPeg := TJPegImage.Create;
    try
      JPeg.CompressionQuality := 100; { Qualidade: 100% }
      JPeg.Assign(Bmp);
      JPeg.SaveToFile(ChangeFileExt(vArq, '.jpg'));
    finally
      JPeg.Free;
    end;
  finally
    Bmp.Free;
  end;

  eMail := TIDSMTP.Create(nil);
  mens  := TIDMessage.Create(self);

  mens.from.Address := email_func;

  BitBtn3.Enabled := False;

  mens.Recipients.EMailAddresses := email_cli;
  mens.Subject   := edtAssunto.Text;
  mens.Body.Text := memoTexto.Lines.Text;

  //TIdAttachment.Create(Mens.MessageParts , extractfilepath(application.ExeName)+'Grafico.jpg');

  eMail.Host     := LerIni(caminho+'Atendimento.ini','EMAIL','SMTP');
  eMail.Port     := 25;
  eMail.Username := email_func;
  eMail.Password := '';
  eMail.Connect();
  if not eMail.Connected then
    raise Exception.Create('Erro de conexão');
  eMail.Send(mens);
  eMail.Disconnect;
  eMail.Free;
  BitBtn3.Enabled := True;
end;

end.
