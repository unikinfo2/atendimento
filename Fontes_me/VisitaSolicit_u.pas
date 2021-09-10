unit VisitaSolicit_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, Menus, ExtCtrls, Grids, DBGrids, StdCtrls, Buttons, Db,
  DBTables, DBCtrls, shellapi, RxCalc, RxCombos, funcoes;

type
  TVisitaSolicit_f = class(TDeriva_f)
    Panel2: TPanel;
    Panel3: TPanel;
    DBGrid1: TDBGrid;
    BitBtn1: TBitBtn;
    qryVisita: TQuery;
    dsVisita: TDataSource;
    Label1: TLabel;
    memoObs: TMemo;
    BitBtn2: TBitBtn;
    qryVisita2: TQuery;
    AgendamentodeLigao1: TMenuItem;
    Agendamento1: TMenuItem;
    Visita1: TMenuItem;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BitBtn3: TBitBtn;
    Label6: TLabel;
    BitBtn4: TBitBtn;
    qryVisitaCOD_VISITA: TIntegerField;
    qryVisitaCOD_FUNC: TIntegerField;
    qryVisitaDT_VISITA: TDateTimeField;
    qryVisitaDT_PREV_RET: TDateTimeField;
    qryVisitaMOTIVO_VISITA: TMemoField;
    qryVisitaOBS_VISITA: TStringField;
    qryVisitaCONTATO_VISITA: TStringField;
    qryVisitaSTATUS_VISITA: TStringField;
    qryVisitaCOD_FUNC_CAD_VIS: TIntegerField;
    qryVisitaCOD_CLIENTE: TIntegerField;
    qryVisitaCOD_CLIENTE_1: TIntegerField;
    qryVisitaCOD_CLIENTE_ALT: TIntegerField;
    qryVisitaCNPJCPF_CLI: TStringField;
    qryVisitaTIPO_CLI: TStringField;
    qryVisitaNOME_CLI: TStringField;
    qryVisitaFANTASIA_CLI: TStringField;
    qryVisitaENDERECO_CLI: TStringField;
    qryVisitaEND_COB_CLI: TStringField;
    qryVisitaCOMPLEMENTO_CLI: TStringField;
    qryVisitaBAIRRO_CLI: TStringField;
    qryVisitaCIDADE_CLI: TStringField;
    qryVisitaUF_CLI: TStringField;
    qryVisitaFONE1_CLI: TStringField;
    qryVisitaFONE2_CLI: TStringField;
    qryVisitaFONE3_CLI: TStringField;
    qryVisitaEMAIL_CLI: TStringField;
    qryVisitaCONTATO_CLI: TStringField;
    qryVisitaATIVO_CLI: TStringField;
    qryVisitaSTATUS_CLI: TStringField;
    qryVisitaVALOR_MENSAL: TFloatField;
    qryVisitaDIA_VENCTO: TSmallintField;
    qryVisitaNOME_FUNC: TStringField;
    qryVisitaDESC_DEPTO: TStringField;
    qryVisitaCEP_CLI: TStringField;
    qryVisitaTIPO_COMPROMISSO: TStringField;
    qryVisitaDETALHE_VISTA: TMemoField;
    qryVisitaTipo: TStringField;
    procedure FormShow(Sender: TObject);
    procedure qryVisitaAfterScroll(DataSet: TDataSet);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure AgendamentodeLigao1Click(Sender: TObject);
    procedure Visita1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure qryVisitaCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  VisitaSolicit_f: TVisitaSolicit_f;

implementation
uses Principal,
     CadLigacao_u,
     CadVisita_u;

{$R *.DFM}

procedure TVisitaSolicit_f.FormShow(Sender: TObject);
begin
  inherited;
  qryVisita.close;
  qryVisita.Open;
end;

procedure TVisitaSolicit_f.qryVisitaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  memoObs.Text := qryVisita.fieldByName('Obs_Visita').AsString;
end;

procedure TVisitaSolicit_f.BitBtn1Click(Sender: TObject);
begin
  inherited;
  qryVisita2.Close;
  qryVisita2.ParamByName('Cod_Visita').AsInteger := qryVisita.FieldByName('Cod_Visita').AsInteger;
  qryVisita2.Open;
  qryVisita2.Edit;
  qryVisita2.FieldByName('Status_Visita').AsString   := 'F';
  qryVisita2.FieldByName('Obs_Visita').AsString      := memoObs.Text;
  qryVisita2.Post;
  qryVisita.Close;
  qryVisita.Open;
end;

procedure TVisitaSolicit_f.BitBtn2Click(Sender: TObject);
begin
  inherited;
  if qryVisita.FieldByName('Status_Visita').AsString = 'F' then
  begin
    messagedlg('Visita já foi Fechada, não pode ser adiada.',mtInformation,[mbOk],0);
    exit;
  end;
  qryVisita2.Close;
  qryVisita2.ParamByName('Cod_Visita').AsInteger := qryVisita.FieldByName('Cod_Visita').AsInteger;
  qryVisita2.Open;
  qryVisita2.Edit;
  qryVisita2.FieldByName('Status_Visita').AsString          := 'D';
  qryVisita2.FieldByName('Obs_Visita').AsString             := memoObs.Text;
  qryVisita2.Post;
  qryVisita.Close;
  qryVisita.Open;
  qryVisita.Locate('Cod_Visita',qryVisita2.FieldByName('Cod_Visita').AsInteger,[]);
end;

procedure TVisitaSolicit_f.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if qryVisita.FieldByName('Status_Visita').AsString = 'D' then { aDiada}
  begin
    if cor then
      Dbgrid1.Canvas.Brush.Color := $00D7D9F7;
    Dbgrid1.Canvas.Font.Color  := clRed;
  end;
  if qryVisita.FieldByName('Status_Visita').AsString = 'F' then { Fechada}
  begin
    if cor then
      Dbgrid1.Canvas.Brush.Color := $00FFC6C6;
    Dbgrid1.Canvas.Font.Color  := clBlue;
  end;
  if qryVisita.FieldByName('Status_Visita').AsString = 'C' then { Cancelada}
  begin
    if cor then
      Dbgrid1.Canvas.Brush.Color := $00EEDDFF;
    Dbgrid1.Canvas.Font.Color  := clPurple;
  end;

  if qryVisita.FieldByName('Status_Visita').AsString = 'A' then { Aberta}
  begin
    if cor then
      Dbgrid1.Canvas.Brush.Color := $00F4FAFF;
    Dbgrid1.Canvas.Font.Color  := clBlack;
  end;
  Dbgrid1.DefaultDrawDataCell(Rect, dbgrid1.columns[datacol].field, State);
end;

procedure TVisitaSolicit_f.AgendamentodeLigao1Click(Sender: TObject);
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

procedure TVisitaSolicit_f.Visita1Click(Sender: TObject);
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

procedure TVisitaSolicit_f.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if qryVisita.FieldByName('Status_Visita').AsString = 'F' then
  begin
    messagedlg('Visita já foi Fechada, não pode ser Cancelada.',mtInformation,[mbOk],0);
    exit;
  end;
  qryVisita2.Close;
  qryVisita2.ParamByName('Cod_Visita').AsInteger := qryVisita.FieldByName('Cod_Visita').AsInteger;
  qryVisita2.Open;
  qryVisita2.Edit;
  qryVisita2.FieldByName('Status_Visita').AsString          := 'C';
  qryVisita2.FieldByName('Obs_Visita').AsString             := memoObs.Text;
  qryVisita2.Post;
  qryVisita.Close;
  qryVisita.Open;
  qryVisita.Locate('Cod_Visita',qryVisita2.FieldByName('Cod_Visita').AsInteger,[]);
end;

procedure TVisitaSolicit_f.BitBtn4Click(Sender: TObject);
var ArqTmp  : TextFile;
    NomeArq : String;
begin
  inherited;
  NomeArq := ExtractFileDir(application.ExeName) + '\TMP_Visita.html';
  assignfile(ArqTmp,NomeArq);
  ReWrite(ArqTmp);
  try
    writeln(arqTmp,'<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"> ');
    writeln(arqTmp,'<HTML><HEAD> ');
    writeln(arqTmp,'<META http-equiv=Content-Type content="text/html; charset=windows-1252"> ');
    writeln(arqTmp,'<META content="MSHTML 6.00.2600.0" name=GENERATOR></HEAD> ');
    writeln(arqTmp,'<BODY bgColor=#ffffff leftMargin=0 topMargin=0 marginheight="0" marginwidth="0"> ');
    writeln(arqTmp,'<TABLE borderColor=#00A8160B cellSpacing=0 borderColorDark=#ffffff cellPadding=0 ');
    writeln(arqTmp,'width="100%" align=center border=0> ');
    writeln(arqTmp,'  <TBODY> ');
    writeln(arqTmp,'  <TR> ');
    writeln(arqTmp,'    <TD> ');
    writeln(arqTmp,'      <TABLE borderColor=#000000 cellSpacing=0 cellPadding=1 width="100%" ');
    writeln(arqTmp,'      align=center border=1> ');
    writeln(arqTmp,'        <TBODY> ');
    writeln(arqTmp,'        <TR> ');
    writeln(arqTmp,'          <TD borderColor="#00A8160B" align=middle bgColor=#ffffff colSpan=3 height=30> ');
    writeln(arqTmp,'            <DIV align=left><IMG height=80 ');
    writeln(arqTmp,'            src="imagens/LOGO_PEQUENO.GIF" width=100></DIV></TD></TR> ');
    writeln(arqTmp,'        <TR> ');
    writeln(arqTmp,'          <TD borderColor=#006600 align=middle bgColor="#006699" colSpan=3 ');
    writeln(arqTmp,'          height=30><FONT face="Arial, Helvetica, sans-serif" color=#ffffff ');
    writeln(arqTmp,'            size=4><B>Ficha de Compromisso</B></FONT></TD></TR> ');
    writeln(arqTmp,'        <TR bgColor=#ffffff> ');
    writeln(arqTmp,'          <TD colSpan=3><B><FONT face="Arial, Helvetica, sans-serif" ');
    writeln(arqTmp,'            size=2><BR><FONT color="#006699">Funcionário:&nbsp;'+qryVisita.FieldByName('nome_func').AsString + ' &nbsp;&nbsp;&nbsp; Deptº:&nbsp;'+qryVisita.FieldByName('desc_depto').AsString + ' &nbsp;&nbsp;&nbsp; Tipo do Compromisso :&nbsp;'+qryVisita.FieldByName('Tipo').AsString + '</FONT><FONT ');

    writeln(arqTmp,'            color=#006600><BR></FONT></FONT></B></TD></TR> ');
    writeln(arqTmp,'        <TR> ');
    writeln(arqTmp,'          <TD colSpan=3> ');
    writeln(arqTmp,'            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0> ');
    writeln(arqTmp,'              <TBODY> ');
    writeln(arqTmp,'              <TR> ');
    writeln(arqTmp,'                <TD><B><FONT face="Arial, Helvetica, sans-serif" ');
    writeln(arqTmp,'                  size=2>Código:&nbsp;'+FormatFloat('000000000',qryVisita.FieldByName('cod_cliente').AsFloat)+'</FONT></B></TD></TR> ');
    writeln(arqTmp,'              <TR> ');
    writeln(arqTmp,'                <TD><B><FONT face="Arial, Helvetica, sans-serif" ');
    writeln(arqTmp,'                  size=2>Cliente:&nbsp;'+qryVisita.FieldByName('nome_cli').AsString);
    writeln(arqTmp,'                  </FONT></B></TD></TR> ');
    writeln(arqTmp,'              <TR> ');
    writeln(arqTmp,'                <TD><B><FONT face="Arial, Helvetica, sans-serif" ');
    writeln(arqTmp,'                  size=2>Endereço:&nbsp;'+qryVisita.FieldByName('endereco_cli').AsString + '&nbsp;Compl.: '+qryVisita.FieldByName('complemento_cli').AsString);
    writeln(arqTmp,'              </FONT></B></TD></TR></TBODY></TABLE> ');
    writeln(arqTmp,'            <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0> ');
    writeln(arqTmp,'              <TBODY> ');
    writeln(arqTmp,'              <TR> ');
    writeln(arqTmp,'                <TD><B><FONT face="Arial, Helvetica, sans-serif" ');
    writeln(arqTmp,'                  size=2>Cidade:&nbsp;'+qryVisita.FieldByName('cidade_cli').AsString+'</FONT></B></TD> ');
    writeln(arqTmp,'                <TD><B><FONT face="Arial, Helvetica, sans-serif" ');
    writeln(arqTmp,'                  size=2>CEP:&nbsp;' + qryVisita.FieldByName('cep_cli').AsString + '</FONT></B></TD></TR> ');
    writeln(arqTmp,'              <TR> ');
    writeln(arqTmp,'                <TD><B><FONT face="Arial, Helvetica, sans-serif" ');
    writeln(arqTmp,'                  size=2>Contato:&nbsp;'+qryVisita.FieldByName('Contato_Visita').AsString+'</FONT></B></TD> ');
    writeln(arqTmp,'                <TD><B><FONT face="Arial, Helvetica, sans-serif" ');
    writeln(arqTmp,'                  size=2></FONT></B></TD></TR> ');
    writeln(arqTmp,'         </TBODY></TABLE> ');
    writeln(arqTmp,'        <TR> ');
    writeln(arqTmp,'          <TD colSpan=3><B><FONT face="Arial, Helvetica, sans-serif" ');
    writeln(arqTmp,'            size=2>Data e Horário da Visita:&nbsp;'+formatdatetime('dd/mm/yyyy hh:nn',qryVisita.FieldByName('dt_visita').AsDateTime) + ' às ');
    if not qryVisita.FieldByName('dt_prev_ret').IsNull then
      writeln(arqTmp, formatdatetime('dd/mm/yyyy hh:nn',qryVisita.FieldByName('dt_prev_ret').AsDateTime));
    writeln(arqTmp,'            </B></FONT></TD></TR> ');
    writeln(arqTmp,'        <FORM name=frmvisita method=post> ');
    writeln(arqTmp,'        <TR> ');
    writeln(arqTmp,'          <TD colSpan=3> ');
    writeln(arqTmp,'            <DIV align=center> ');
    writeln(arqTmp,'            <P align=left><BR><B><FONT face="Arial, Helvetica, sans-serif" ');
    writeln(arqTmp,'            color="#006699" size=2>Motivo: ' + qryVisita.FieldByName('Motivo_Visita').AsString + '<br>' + qryVisita.FieldByName('Detalhe_Vista').AsString +' </FONT></B><BR><FONT ');
    writeln(arqTmp,'            face="Arial, Helvetica, sans-serif" color=#006600 ');
    writeln(arqTmp,'            size=2><B></B></FONT></P></DIV></TD></TR> ');
    writeln(arqTmp,'        <TR> ');
    writeln(arqTmp,'          <TD bgColor="#006699" colSpan=3 height=24> ');
    writeln(arqTmp,'            <DIV align=center><FONT face="Arial, Helvetica, sans-serif" ');
    writeln(arqTmp,'            color=#ffffff size=4><B>Descrição dos Serviços ');
    writeln(arqTmp,'            Efetuados</B></FONT></DIV></TD></TR> ');
    writeln(arqTmp,'        <TR> ');
    writeln(arqTmp,'          <TD colSpan=3> ');
    writeln(arqTmp,'            <P align=center><BR> ');
    writeln(arqTmp,'            <TABLE borderColor=#000000 cellSpacing=0 borderColorDark=#ffffff ');
    writeln(arqTmp,'            cellPadding=0 width="95%" align=center border=1> ');
    writeln(arqTmp,'              <TBODY> ');
    writeln(arqTmp,'              <TR> ');
    writeln(arqTmp,'                <TD>&nbsp;</TD></TR> ');
    writeln(arqTmp,'              <TR> ');
    writeln(arqTmp,'                <TD>&nbsp;</TD></TR> ');
    writeln(arqTmp,'              <TR> ');
    writeln(arqTmp,'                <TD>&nbsp;</TD></TR> ');
    writeln(arqTmp,'              <TR> ');
    writeln(arqTmp,'                <TD>&nbsp;</TD></TR> ');
    writeln(arqTmp,'              <TR> ');
    writeln(arqTmp,'                <TD>&nbsp;</TD></TR> ');
    writeln(arqTmp,'              <TR> ');
    writeln(arqTmp,'                <TD>&nbsp;</TD></TR> ');
    writeln(arqTmp,'              <TR> ');
    writeln(arqTmp,'                <TD>&nbsp;</TD></TR> ');
    writeln(arqTmp,'              <TR> ');
    writeln(arqTmp,'                <TD>&nbsp;</TD></TR> ');
    writeln(arqTmp,'              <TR> ');
    writeln(arqTmp,'                <TD>&nbsp;</TD></TR> ');
    writeln(arqTmp,'              <TR> ');
    writeln(arqTmp,'                <TD>&nbsp;</TD></TR></TBODY></TABLE></P> ');
    writeln(arqTmp,'            <P align=center><B><FONT face="Arial, Helvetica, sans-serif" ');
    writeln(arqTmp,'            size=2><BR>');
    writeln(arqTmp,'            </P></FONT></B></TD></TR> ');
    writeln(arqTmp,'        <TR> ');
    writeln(arqTmp,'          <TD bgColor="#006699" colSpan=3 height=24> ');
    writeln(arqTmp,'            <DIV align=center><FONT face="Arial, Helvetica, sans-serif" ');
    writeln(arqTmp,'            color=#ffffff size=4><B>Horários</B></FONT></DIV> ');
    writeln(arqTmp,'        <TR> ');
    writeln(arqTmp,'          <TD colSpan=3> ');
    writeln(arqTmp,'            <DIV align=center> ');
    writeln(arqTmp,'            <P align=center></P></DIV> ');
    writeln(arqTmp,'        <TR align=middle bgColor=#ffffff> ');
    writeln(arqTmp,'          <TD height=30> ');
    writeln(arqTmp,'            <DIV align=left><FONT face="Arial, Helvetica, sans-serif" ');
    writeln(arqTmp,'            color=#000000 size=2><B>Saída:</B></FONT></DIV> ');
    writeln(arqTmp,'          <TD colSpan=2 height=30> ');
    writeln(arqTmp,'            <DIV align=left><FONT face="Arial, Helvetica, sans-serif" ');
    writeln(arqTmp,'            color=#000000 size=2><B>Retorno: ');
    writeln(arqTmp,'            </B></FONT></FONT></FONT></FONT></DIV> ');
    writeln(arqTmp,'        <TR align=middle bgColor=#ffffff> ');
    writeln(arqTmp,'          <TD height=30> ');
    writeln(arqTmp,'            <DIV align=left><FONT color=#000000><FONT ');
    writeln(arqTmp,'            face="Arial, Helvetica, sans-serif"><FONT ');
    writeln(arqTmp,'            face="Arial, Helvetica, sans-serif"><FONT size=2><B>Chegada Cliente: ');
    writeln(arqTmp,'            </B></FONT></FONT></FONT></FONT></DIV> ');
    writeln(arqTmp,'          <TD colSpan=2 height=30> ');
    writeln(arqTmp,'            <DIV align=left><FONT color=#ccffcc><B><FONT color=#000000><FONT ');
    writeln(arqTmp,'            face="Arial, Helvetica, sans-serif"><FONT ');
    writeln(arqTmp,'            face="Arial, Helvetica, sans-serif"><FONT size=2>Saída Cliente: ');
    writeln(arqTmp,'            </FONT></FONT></FONT></FONT></B></FONT></DIV></TD></TR> ');
    writeln(arqTmp,'        <P align=center>&nbsp; ');
    writeln(arqTmp,'        <P></P> ');
    writeln(arqTmp,'        <P></P> ');
    writeln(arqTmp,'        <P></P> ');
    writeln(arqTmp,'        <P></P> ');
    writeln(arqTmp,'        <P></P></P></TBODY></TABLE> ');
    writeln(arqTmp,'      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0> ');
    writeln(arqTmp,'        <TBODY> ');
    writeln(arqTmp,'        <TR vAlign=top> ');
    writeln(arqTmp,'          <TD> ');
    writeln(arqTmp,'            <P><BR><B><FONT face="Arial, Helvetica, sans-serif" size=2>'+LerIni(caminho+'Atendimento.ini','CIDADE','CIDADE'));
    writeln(arqTmp,'            ' + FormatDateTime('dd/mm/yyyy hh:nn',now()) + '.</FONT></P><B><FONT face="Arial, Helvetica, sans-serif" ');
    writeln(arqTmp,'            size=2> ');
    writeln(arqTmp,'            <P>&nbsp;Visto,</P></FONT> ');
    writeln(arqTmp,'            <P>&nbsp;</P> ');
    writeln(arqTmp,'            <P align=center>_______________________________________<BR><B><FONT ');
    writeln(arqTmp,'            face="Arial, Helvetica, sans-serif" size=2><B>Técnico ');
    writeln(arqTmp,'            </B></FONT></P></B></B></B></TD> ');
    writeln(arqTmp,'          <TD> ');
    writeln(arqTmp,'            <P>&nbsp;</P> ');
    writeln(arqTmp,'            <P><BR><B><FONT face="Arial, Helvetica, sans-serif" ');
    writeln(arqTmp,'            size=2>Ciente,</P> ');
    writeln(arqTmp,'            <P>&nbsp;</P> ');
    writeln(arqTmp,'            <P ');
    writeln(arqTmp,'            align=center>_______________________________________<BR><B>Cliente ');
    writeln(arqTmp,'            </B></P></FONT></B></TD></TR></TBODY></TABLE> ');
    writeln(arqTmp,'      <P align=center><BR><BR></P> ');
    writeln(arqTmp,'      <HR> ');
    writeln(arqTmp,'      <P align=center></P><BR></FORM> ');
    writeln(arqTmp,'	  </TD> ');
    writeln(arqTmp,'	  </TR> ');
    writeln(arqTmp,'	  </TBODY> ');
    writeln(arqTmp,'	  </TABLE> ');
    writeln(arqTmp,'	  </TD> ');
    writeln(arqTmp,'	  </TR> ');
    writeln(arqTmp,'	  </TBODY> ');
    writeln(arqTmp,'	  </TABLE> ');
    writeln(arqTmp,'	  </BODY></HTML> ');
  finally
    CloseFile(ArqTmp);
  end;
  shellexecute(Self.Handle,'open', pChar(NomeArq),'','',SW_SHOW);
end;

procedure TVisitaSolicit_f.qryVisitaCalcFields(DataSet: TDataSet);
begin
  inherited;
  if qryVisita.FieldByName('TIPO_COMPROMISSO').AsString = 'V' then
    qryVisita.FieldByName('TIPO').AsString := 'Visita'
  else if qryVisita.FieldByName('TIPO_COMPROMISSO').AsString = 'H' then
    qryVisita.FieldByName('TIPO').AsString := 'Homologação'
  else if qryVisita.FieldByName('TIPO_COMPROMISSO').AsString = 'F' then
    qryVisita.FieldByName('TIPO').AsString := 'Fiscalização';
end;

end.
