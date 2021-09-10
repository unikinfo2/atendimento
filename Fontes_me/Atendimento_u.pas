unit Atendimento_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, Menus, ExtCtrls, StdCtrls, Buttons, Mask, DBCtrls, ComCtrls,
  ImgList, Grids, DBGrids, Db, DBTables, ToolEdit, CurrEdit, RxCalc,
  RxDBComb, RXDBCtrl;

type
  TAtendimento_f = class(TDeriva_f)
    Panel1: TPanel;
    medCliente: TMaskEdit;
    Label1: TLabel;
    sbPesq: TSpeedButton;
    edtNomeCli: TEdit;
    Label2: TLabel;
    Panel2: TPanel;
    medData: TMaskEdit;
    Label3: TLabel;
    rgAtendimento: TDBRadioGroup;
    DBRadioGroup2: TDBRadioGroup;
    Label4: TLabel;
    PageControl1: TPageControl;
    Panel3: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    ImageList1: TImageList;
    BitBtn1: TBitBtn;
    btnOcorr: TBitBtn;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    DBGrid2: TDBGrid;
    Label5: TLabel;
    medAtendimento: TMaskEdit;
    SpeedButton1: TSpeedButton;
    qryLigacao: TQuery;
    qryLigacaoCOD_LIGACAO: TIntegerField;
    qryLigacaoCOD_CLIENTE: TIntegerField;
    qryLigacaoCOD_FUNC: TIntegerField;
    qryLigacaoCOD_DEPTO: TIntegerField;
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
    qryLigacaoQUEMFALA: TStringField;
    dsLigacao: TDataSource;
    Panel4: TPanel;
    DBGrid3: TDBGrid;
    Panel5: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    dsVisita: TDataSource;
    qryVisita: TQuery;
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
    qryAux: TQuery;
    qryAtendimento: TQuery;
    Panel6: TPanel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    dsAtendimento: TDataSource;
    BitBtn6: TBitBtn;
    qryOcorrencia: TQuery;
    dsOcorrencia: TDataSource;
    qryOcorrenciaCOD_OCORRENCIA: TIntegerField;
    qryOcorrenciaCOD_ATENDIMENTO: TIntegerField;
    qryOcorrenciaCOD_CLIENTE: TIntegerField;
    qryOcorrenciaCOD_FUNC: TIntegerField;
    qryOcorrenciaDT_OCORRENCIA: TDateTimeField;
    qryOcorrenciaSTATUS_OCORR: TStringField;
    qryOcorrenciaCOD_FUNC_TRANS: TIntegerField;
    qryOcorrenciaNOME_FUNC: TStringField;
    qryOcorrenciaDESC_DEPTO: TStringField;
    qryOcorrenciaNOME_FUNC_1: TStringField;
    qryOcorrenciaDESC_DEPTO_1: TStringField;
    qryDocto: TQuery;
    dsDocto: TDataSource;
    TabSheet4: TTabSheet;
    DBGrid4: TDBGrid;
    qryOcorrenciaDESCRICAO_OCORR2: TStringField;
    qryOcorrenciaDT_FECHAMENTO_OCORR: TDateTimeField;
    chkAtendimento: TCheckBox;
    sbFunc: TSpeedButton;
    edtFunc: TEdit;
    Label14: TLabel;
    cbTipo: TComboBox;
    Label22: TLabel;
    gbtipo: TGroupBox;
    edtCodDocto: TMaskEdit;
    Label17: TLabel;
    SpeedButton3: TSpeedButton;
    edtDescDocto: TEdit;
    Label18: TLabel;
    chkMeuDepto: TCheckBox;
    qryDocto2: TQuery;
    qryCliFunc: TQuery;
    qryDoctoCOD_PROTOCOLO: TIntegerField;
    qryDoctoCOD_DOCTO_EMI: TIntegerField;
    qryDoctoCOD_DOCTO: TIntegerField;
    qryDoctoOBS_DOCTO_EMI: TStringField;
    qryDoctoCOD_DOCTO_1: TIntegerField;
    qryDoctoCOD_DEPTO: TIntegerField;
    qryDoctoDESC_DOCTO: TStringField;
    qryDoctoCOMPETENCIA_DOCTO: TStringField;
    qryDoctoDIAS_DOCTO: TIntegerField;
    qryDoctoSTATUS_DIAS_DOCTO: TStringField;
    qryDoctoCOD_CLIENTE: TIntegerField;
    qryDoctoOBS_PROTOCOLO: TStringField;
    qryDoctoDT_EMISSAO_PROTO: TDateTimeField;
    qryDoctoDT_ENTREGA_PREV: TDateTimeField;
    qryDoctoDT_ENTREGA_PROTO: TDateTimeField;
    qryDoctoSTATUS_ENTREGA: TStringField;
    qryDoctoCOD_FUNC: TIntegerField;
    qryDoctoCOD_PROTOCOLO_1: TIntegerField;
    qryDoctoNOME_FUNC: TStringField;
    Cadastro1: TMenuItem;
    Documentos1: TMenuItem;
    Pendncias1: TMenuItem;
    Label15: TLabel;
    cbDepto: TDBLookupComboBox;
    qryDepto: TQuery;
    dsDepto: TDataSource;
    qryDeptoCOD_DEPTO: TIntegerField;
    qryDeptoDESC_DEPTO: TStringField;
    Ligaes1: TMenuItem;
    Visitas1: TMenuItem;
    DBMemo1: TDBMemo;
    Impresso1: TMenuItem;
    AtendimentosEfetuados1: TMenuItem;
    RxDBComboBox1: TRxDBComboBox;
    Label23: TLabel;
    edtCodigo: TEdit;
    Label24: TLabel;
    SpeedButton2: TSpeedButton;
    edtNomeFunc: TEdit;
    Label25: TLabel;
    qryFunc: TQuery;
    qryFuncCOD_FUNC: TIntegerField;
    qryFuncCOD_DEPTO: TIntegerField;
    qryFuncNOME_FUNC: TStringField;
    qryFuncFONE1: TStringField;
    qryFuncFONE2: TStringField;
    qryFuncRESPONSAVEL: TStringField;
    qryFuncEMAIL_FUNC: TStringField;
    qryFuncAPELIDO_FUNC: TStringField;
    qryFuncSENHA_FUNC: TStringField;
    qryFuncNIVEL_FUNC: TStringField;
    qryLigacaoCOD_CONTATO: TIntegerField;
    qryLigacaoDESC_LIG: TMemoField;
    qryLigacaoOBS_LIG: TMemoField;
    qryLigacaoTIPO_LIGACAO: TStringField;
    qryLigacaoINFORMADO_LIG: TStringField;
    qryLigacaoDESC_LIG2: TStringField;
    qryLigacaoOBS_LIG2: TStringField;
    edtClass: TEdit;
    Label16: TLabel;
    SpeedButton4: TSpeedButton;
    AssuntosPrDefinidos1: TMenuItem;
    procedure medAtendimentoExit(Sender: TObject);
    procedure medClienteExit(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid3DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure DBGrid2DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnOcorrClick(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbPesqClick(Sender: TObject);
    procedure chkAtendimentoClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure edtCodDoctoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbTipoChange(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure edtFuncChange(Sender: TObject);
    procedure edtFuncExit(Sender: TObject);
    procedure sbFuncClick(Sender: TObject);
    procedure Documentos1Click(Sender: TObject);
    procedure Pendncias1Click(Sender: TObject);
    procedure Ligaes1Click(Sender: TObject);
    procedure Visitas1Click(Sender: TObject);
    procedure AtendimentosEfetuados1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure CarregaAtendimento(pCod_Atendimento : Integer; pCod_Cliente : Integer=0);
    procedure SpeedButton4Click(Sender: TObject);
    procedure edtClassExit(Sender: TObject);
    procedure AssuntosPrDefinidos1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Atendimento_f: TAtendimento_f;

implementation
uses principal,
     CadOcorrencia_u,
     Atendimento_dm, CadDocumento_u, Pendencia_u, CadLigacao_u, CadVisita_u,
  EmiteRelatorios_u, MostraOcorrencia_u, funcoes, CadAssunto_u;
{$R *.DFM}

procedure TAtendimento_f.medAtendimentoExit(Sender: TObject);
begin
  inherited;
  qryDepto.locate('cod_depto',cod_depto,[loCaseInsensitive]);
  if medAtendimento.Text = '' then
  begin
    exit;
  end;
  if (medAtendimento.Text <> '') and (medCliente.Text <> '') then
  begin
    CarregaAtendimento(StrToInt(medAtendimento.Text), strtoint(medCliente.Text));
  end;
  if (medAtendimento.Text <> '') and (medCliente.Text = '') then
  begin
    CarregaAtendimento(StrToInt(medAtendimento.Text));
  end;
(*  with qryAtendimento do
  begin
    close;
    sql.text := 'SELECT * FROM GC_ATENDIMENTO '+
                ' WHERE COD_ATENDIMENTO = :COD_ATENDIMENTO ';
    if chkMeuDepto.Checked then
      sql.text := sql.text + ' AND COD_DEPTO = ' + IntToStr(COD_DEPTO);

    ParamByName('Cod_Atendimento').AsString := medAtendimento.Text;
    open;
    if eof then
    begin
      messagedlg('Codigo de Atendimento não Cadastrado ou pertence a outro Depto.',mtInformation,[mbOk],0);
      medAtendimento.SetFocus;
      exit;
    end
    else
    begin
      if nivel < 1 then
        if (fieldbyName('STATUS_ATEND').AsString <> 'C') and (fieldbyName('STATUS_ATEND').AsString <> 'F') then
          edit;
      {(fieldbyName('STATUS_ATEND').AsString <> 'A')}
{      memo1.Lines.Text := qryAtendimento.Fieldbyname('desc_atend').AsString;}

      cbDepto.Enabled := False;
      medCliente.Enabled := True;
      medCliente.Text    := fieldbyName('Cod_Cliente').AsString;
      medClienteExit(sender);
      edtFunc.Text       := fieldbyName('NOME_CLIFUNC').AsString;
      edtCodigo.Text     := fieldbyName('COD_FUNC').AsString;
      edtCodigoExit(Sender);
      if fieldbyName('TIPO_ATEND').AsString <> '' then
        cbTipo.ItemIndex   := fieldbyName('TIPO_ATEND').AsInteger
      else
        cbTipo.ItemIndex   := 0;

      edtCodDocto.Text   := fieldbyName('Cod_Docto').AsString;
      {dtIni.Text         := formatDateTime('dd/mm/yyyy',fieldbyName('DT_COMPET_INI').AsDateTime);
      dtFin.Text         := formatDateTime('dd/mm/yyyy',fieldbyName('DT_COMPET_FIN').AsDateTime);
      dtVencto.Text      := formatDateTime('dd/mm/yyyy',fieldbyName('DT_VENCTO').AsDateTime);
      edtValor.Value     := fieldbyName('Valor_Docto').AsFloat;}
      medData.Text       := formatdatetime('dd/mm/yyyy hh:nn',fieldbyName('dt_atend').AsDateTime);
      if edtCodDocto.Text <> '' then
        edtCodDoctoExit(Sender);
    end;
  end;

  {(qryAtendimento.State = dsEdit) and}
  btnOcorr.Enabled := ( ((qryAtendimento.FieldByName('Status_Atend').AsString <> 'F') and
                        (qryAtendimento.FieldByName('Status_Atend').AsString <> 'C')) );
  bitbtn6.Enabled := ((qryAtendimento.State = dsEdit) and
                       ((qryAtendimento.FieldByName('Status_Atend').AsString <> 'F') and
                        (qryAtendimento.FieldByName('Status_Atend').AsString <> 'C')) ); *)
end;

procedure TAtendimento_f.medClienteExit(Sender: TObject);
var vSql : String;
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
  if medCliente.Text <> '' then
  begin
{    if qryAtendimento.State = dsInsert then
      medData.Text := formatdatetime('dd/mm/yyyy hh:nn',now());}
    qryAux.Close;
    qryAux.SQL.Text := 'SELECT * FROM GC_CLIENTE WHERE COD_CLIENTE='+medCliente.Text;
    qryAux.Open;
    medCliente.Text  := qryAux.FieldByName('Cod_Cliente').AsString;
    edtNomeCli.Text  := qryAux.FieldByName('Nome_cli').AsString;
    if not qryAux.Eof then
    begin
      if chkAtendimento.Checked then
      begin
        if medAtendimento.Text <> '' then
        begin
          qryOcorrencia.Close;
          qryOcorrencia.SQL.Text := 'SELECT OCO.*, FUN1.NOME_FUNC, DEP1.DESC_DEPTO, ' +
                                    ' FUN2.NOME_FUNC, DEP2.DESC_DEPTO, DESCRICAO_OCORR DESCRICAO_OCORR2 '+
                                    ' FROM GC_OCORRENCIA OCO '+
                                    ' LEFT JOIN GC_FUNCIONARIO FUN1 ON (OCO.COD_FUNC=FUN1.COD_FUNC) '+
                                    ' LEFT JOIN GC_DEPARTAMENTO DEP1 ON (FUN1.COD_DEPTO=DEP1.COD_DEPTO) '+
                                    ' LEFT JOIN GC_FUNCIONARIO FUN2 ON (OCO.COD_FUNC_TRANS=FUN2.COD_FUNC) '+
                                    ' LEFT JOIN GC_DEPARTAMENTO DEP2 ON (FUN2.COD_DEPTO=DEP2.COD_DEPTO) '+
                                    ' WHERE OCO.COD_CLIENTE = :COD_CLIENTE AND OCO.COD_ATENDIMENTO = :COD_ATENDIMENTO '+
                                    ' AND OCO.DT_OCORRENCIA >=  :DT_OCORRENCIA ';
          if chkMeuDepto.Checked then
            qryOcorrencia.SQL.Text := qryOcorrencia.SQL.Text + ' AND DEP1.COD_DEPTO = ' + inttostr(cod_depto);

          qryOcorrencia.SQL.Text := qryOcorrencia.SQL.Text + ' ORDER BY OCO.DT_OCORRENCIA DESC ';

          qryOcorrencia.ParamByName('Dt_Ocorrencia').AsDateTime  := now()-StrToInt(LerIni(caminho+'Atendimento.ini','Identificacao','Historico'));
          qryOcorrencia.ParamByName('Cod_Cliente').AsInteger     := qryAux.FieldByName('Cod_Cliente').AsInteger;
          qryOcorrencia.ParamByName('Cod_Atendimento').AsString  := medAtendimento.Text;
          qryOcorrencia.Open;
        end;
      end
      else
      begin
        qryOcorrencia.Close;
        qryOcorrencia.SQL.Text := 'SELECT OCO.*, FUN1.NOME_FUNC, DEP1.DESC_DEPTO, ' +
                                  ' FUN2.NOME_FUNC, DEP2.DESC_DEPTO, DESCRICAO_OCORR AS DESCRICAO_OCORR2 '+
                                  ' FROM GC_OCORRENCIA OCO '+
                                  ' LEFT JOIN GC_FUNCIONARIO FUN1 ON (OCO.COD_FUNC=FUN1.COD_FUNC) '+
                                  ' LEFT JOIN GC_DEPARTAMENTO DEP1 ON (FUN1.COD_DEPTO=DEP1.COD_DEPTO) '+
                                  ' LEFT JOIN GC_FUNCIONARIO FUN2 ON (OCO.COD_FUNC_TRANS=FUN2.COD_FUNC) '+
                                  ' LEFT JOIN GC_DEPARTAMENTO DEP2 ON (FUN2.COD_DEPTO=DEP2.COD_DEPTO) '+
                                  ' WHERE OCO.COD_CLIENTE = :COD_CLIENTE '+
                                  ' AND OCO.DT_OCORRENCIA >=  :DT_OCORRENCIA ';
        if chkMeuDepto.Checked then
          qryOcorrencia.SQL.Text := qryOcorrencia.SQL.Text + ' AND DEP1.COD_DEPTO = ' + inttostr(cod_depto);

        qryOcorrencia.SQL.Text := qryOcorrencia.SQL.Text + ' ORDER BY OCO.DT_OCORRENCIA DESC ';

        qryOcorrencia.ParamByName('Dt_Ocorrencia').AsDateTime  := now()-StrToInt(LerIni(caminho+'Atendimento.ini','Identificacao','Historico'));
        qryOcorrencia.ParamByName('Cod_Cliente').AsInteger := qryAux.FieldByName('Cod_Cliente').AsInteger;
        qryOcorrencia.Open;
      end;
      qryVisita.Close;
      qryVisita.ParamByName('Cod_Cliente').AsInteger  := qryAux.FieldByName('Cod_Cliente').AsInteger;
      qryVisita.Open;

      qryLigacao.Close;
      qryDocto.Close;
      if chkMeuDepto.Checked then
      begin
        vSql := 'SELECT LIG.*, CLI.NOME_CLI, FUN.NOME_FUNC, DEP.DESC_DEPTO, '+
                '  CAST(LIG.DESC_LIG AS VARCHAR(250)) DESC_LIG2, '+
                '  CAST(LIG.OBS_LIG AS VARCHAR(250)) OBS_LIG2 '+
                'FROM GC_LIGACAO LIG '+
                'LEFT JOIN GC_CLIENTE CLI ON (LIG.COD_CLIENTE=CLI.COD_CLIENTE) '+
                'LEFT JOIN GC_FUNCIONARIO FUN ON (LIG.COD_FUNC=FUN.COD_FUNC) '+
                'LEFT JOIN GC_DEPARTAMENTO DEP ON (LIG.COD_DEPTO=DEP.COD_DEPTO) '+
                'WHERE LIG.STATUS_LIG IN (''A'',''E'',''F'') AND '+
                'LIG.COD_CLIENTE = :COD_CLIENTE AND LIG.COD_DEPTO = :COD_DEPTO '+
                'ORDER BY LIG.DT_PEDIDO_LIG DESC ';
        qryLigacao.SQl.Text := vSql;
        qryLigacao.ParamByName('Cod_Cliente').AsInteger := qryAtendimento.FieldByName('Cod_Cliente').AsInteger;
        qryLigacao.ParamByName('Cod_DEPTO').AsInteger   := qryAtendimento.fieldbyname('cod_depto').AsInteger;
        qryLigacao.Open;

        vSql := 'SELECT EMI.*, DOC.*, PRO.*, FUN.NOME_FUNC '+
                'FROM GC_PROTOCOLO PRO '+
                'INNER JOIN GC_DOCUMENTO_EMITIDO EMI ON (PRO.COD_PROTOCOLO = EMI.COD_PROTOCOLO) '+
                'INNER JOIN GC_DOCUMENTO         DOC ON (DOC.COD_DOCTO=EMI.COD_DOCTO) '+
                'LEFT  JOIN GC_FUNCIONARIO       FUN ON (PRO.COD_FUNC=FUN.COD_FUNC) '+
                'WHERE PRO.COD_CLIENTE = :COD_CLIENTE AND DOC.COD_DEPTO = :COD_DEPTO '+
                'ORDER BY PRO.DT_EMISSAO_PROTO, PRO.DT_ENTREGA_PROTO DESC ';
        qryDocto.SQl.Text := vSql;
        qryDocto.ParamByName('Cod_Cliente').AsInteger := qryAtendimento.FieldByName('Cod_Cliente').AsInteger;
        qryDocto.ParamByName('Cod_Depto').AsInteger   := qryAtendimento.fieldbyname('cod_depto').AsInteger;
        qryDocto.Open;
      end
      else
      begin
        vSql := 'SELECT LIG.*, CLI.NOME_CLI, FUN.NOME_FUNC, DEP.DESC_DEPTO, '+
                '  CAST(LIG.DESC_LIG AS VARCHAR(250)) DESC_LIG2, '+
                '  CAST(LIG.OBS_LIG AS VARCHAR(250)) OBS_LIG2 '+
                'FROM GC_LIGACAO LIG '+
                'LEFT JOIN GC_CLIENTE CLI ON (LIG.COD_CLIENTE=CLI.COD_CLIENTE) '+
                'LEFT JOIN GC_FUNCIONARIO FUN ON (LIG.COD_FUNC=FUN.COD_FUNC) '+
                'LEFT JOIN GC_DEPARTAMENTO DEP ON (LIG.COD_DEPTO=DEP.COD_DEPTO) '+
                'WHERE LIG.STATUS_LIG IN (''A'',''E'',''F'') AND '+
                'LIG.COD_CLIENTE = :COD_CLIENTE '+
                'ORDER BY LIG.DT_PEDIDO_LIG DESC ';
        qryLigacao.SQl.Text := vSql;
        qryLigacao.ParamByName('Cod_Cliente').AsInteger := qryAtendimento.FieldByName('Cod_Cliente').AsInteger;
        qryLigacao.Open;

        vSql := 'SELECT EMI.*, DOC.*, PRO.*, FUN.NOME_FUNC '+
                'FROM GC_PROTOCOLO PRO '+
                'INNER JOIN GC_DOCUMENTO_EMITIDO EMI ON (PRO.COD_PROTOCOLO = EMI.COD_PROTOCOLO) '+
                'INNER JOIN GC_DOCUMENTO         DOC ON (DOC.COD_DOCTO=EMI.COD_DOCTO) '+
                'LEFT  JOIN GC_FUNCIONARIO       FUN ON (PRO.COD_FUNC=FUN.COD_FUNC) '+
                'WHERE PRO.COD_CLIENTE = :COD_CLIENTE '+
                'ORDER BY PRO.DT_EMISSAO_PROTO, PRO.DT_ENTREGA_PROTO DESC ';
        qryDocto.SQl.Text := vSql;
        qryDocto.ParamByName('Cod_Cliente').AsInteger := qryAtendimento.FieldByName('Cod_Cliente').AsInteger;
        qryDocto.Open;
      end;
      qryCliFunc.Close;
      qryCliFunc.ParamByName('Cod_Cliente').AsInteger := qryAux.FieldByName('Cod_Cliente').AsInteger;
      qryCliFunc.Open;
    end;
  end
  else
  begin
    medCliente.SetFocus;
  end;
end;

procedure TAtendimento_f.BitBtn1Click(Sender: TObject);
begin
  inherited;
  cbDepto.Enabled := True;
  edtCodDocto.Clear;
  edtDescDocto.Clear;
  edtClass.Clear;
  {dtIni.Clear;
  dtFin.Clear;
  dtVencto.Clear;
  edtValor.Clear;}
  edtFunc.Clear;
  qryAtendimento.Close;
  qryAtendimento.Open;
  qryOcorrencia.Close;
  qryDocto.Close;
  qryLigacao.Close;
  qryVisita.Close;
  medCliente.Clear;
  edtNomeCli.Clear;
  medAtendimento.Clear;
  {chkAtendimento.Checked := False;}
  qryAtendimento.Insert;
  qryAtendimento.FieldByName('Cobra_Atend').AsString      := 'S';
  qryAtendimento.FieldByName('Status_Atend').AsString     := 'A';
  qryAtendimento.FieldByName('Prioridade_Atend').AsString := 'B';
  qryAtendimento.FieldByName('Cod_Func').AsInteger        := Cod_Func;
  qryAtendimento.Fieldbyname('Cod_Depto').AsInteger       := Cod_Depto;
  medData.Text       := formatdatetime('dd/mm/yyyy hh:nn',now());
  medCliente.Enabled := True;
  BitBtn6.Enabled    := True;
  edtCodigo.Text     := inttostr(Cod_Func);
  edtCodigoExit(Sender);
  medCliente.SetFocus;
end;

procedure TAtendimento_f.DBGrid3DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if qryVisita.FieldByName('Status_Visita').AsString = 'D' then { aDiada}
    Dbgrid3.Canvas.Font.Color:= clRed;
  if qryVisita.FieldByName('Status_Visita').AsString = 'F' then { Fechada}
    Dbgrid3.Canvas.Font.Color:= clBlue;
  if qryVisita.FieldByName('Status_Visita').AsString = 'C' then { Cancelada}
    Dbgrid3.Canvas.Font.Color:= clPurple;

  Dbgrid3.DefaultDrawDataCell(Rect, dbgrid3.columns[datacol].field, State);
end;

procedure TAtendimento_f.DBGrid2DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  inherited;
  if qryLigacao.FieldByName('Status_lig').AsString = 'E' then // condição
    Dbgrid2.Canvas.Font.Color:= clRed; // coloque aqui a cor desejada
  Dbgrid2.DefaultDrawDataCell(Rect, dbgrid2.columns[datacol].field, State);
end;

procedure TAtendimento_f.btnOcorrClick(Sender: TObject);
begin
  inherited;
  dbMemo1.SetFocus;
  if assigned(CadOcorrencia_f) then
    CadOcorrencia_f := nil;

  CadOcorrencia_f := TCadOcorrencia_f.Create(Self);
  try
    CadOcorrencia_f.edtCodigo.Text  := IntToStr(cod_func);
    CadOcorrencia_f.edtCodigoExit(sender);
    CadOcorrencia_f.Cod_Atendimento := StrToInt(medAtendimento.Text);
    CadOcorrencia_f.Cod_Cliente     := StrToInt(medCliente.Text);
    CadOcorrencia_f.BitBtn3.Click;
    CadOcorrencia_f.Show;
  except
    CadOcorrencia_f := TCadOcorrencia_f.Create(Self);
    CadOcorrencia_f.Show;
  end;
end;

procedure TAtendimento_f.BitBtn6Click(Sender: TObject);
var vAtend, CodAssunto:Integer;
begin
  inherited;

  if qryAtendimento.State in [dsEdit,dsInsert] then
  begin
    qryAtendimento.fieldbyName('TIPO_ATEND').AsInteger   := cbTipo.ItemIndex;
    qryAtendimento.fieldbyName('Cod_Docto').AsString     := edtCodDocto.Text;
    qryAtendimento.fieldbyName('NOME_CLIFUNC').AsString  := edtFunc.Text;
    qryAtendimento.fieldbyName('COD_FUNC').AsString      := edtCodigo.Text;

    if qryAtendimento.State = dsEdit then
      qryAtendimento.Post;

    if qryAtendimento.State = dsInsert then
    begin
      vAtend := Proximo('GC_ATENDIMENTO','COD_ATENDIMENTO','', true);
      qryAtendimento.Fieldbyname('Cod_Atendimento').AsInteger := vAtend;
      qryAtendimento.Fieldbyname('dt_atend').AsDateTime       := StrToDateTime(medData.Text);
      qryAtendimento.Fieldbyname('Cod_Cliente').AsInteger     := StrToInt(medCliente.Text);
      qryAtendimento.fieldbyName('email_atend').AsString      := 'N';
      qryAtendimento.fieldbyName('COD_FUNC').AsString         := edtCodigo.Text;
      qryAtendimento.Post;
      messagedlg('Atendimento Nº ' + formatfloat('00000000',vAtend)+ ' foi gerado com sucesso.',mtInformation,[mbOk],0);
      medatendimento.Text := IntToStr(vAtend);
    end;
  end;

  edtCodDocto.Clear;
  edtDescDocto.Clear;
  {edtValor.Clear;}
  edtFunc.Clear;
  edtCodigo.Clear;
  edtNomeFunc.Clear;
  edtClass.Clear;

  qryAtendimento.Close;
  qryOcorrencia.Close;
  qryDocto.Close;
  qryLigacao.Close;
  qryVisita.Close;
  medCliente.Clear;
  edtNomeCli.Clear;
  {medAtendimento.Clear;}
  {chkAtendimento.Checked := False;}
  medData.Clear;
  edtnomecli.Clear;
  medcliente.Clear;
  medAtendimento.SetFocus;
end;

procedure TAtendimento_f.BitBtn3Click(Sender: TObject);
begin
  inherited;
  if Nivel <= 1 then
  begin
    if messagedlg('Deseja realmente apagar este Atendimento ?',mtWarning,[mbYes,mbNo],0) = idYes then
    begin
      if (qryAtendimento.active) and (not qryAtendimento.eof) then
      begin
        if qryAtendimento.FieldByName('Status_Atend').AsString <> 'F' then
        begin
          qryAtendimento.Cancel;
          try
            qryAux.Close;
            qryAux.Sql.Text := 'DELETE FROM GC_OCORRENCIA WHERE COD_ATENDIMENTO = :COD_ATENDIMENTO';
            qryAux.ParamByName('Cod_Atendimento').AsInteger := qryAtendimento.FieldByName('Cod_Atendimento').AsInteger;
            qryAux.ExecSQL;
            qryAtendimento.Delete;

            edtClass.Clear;
            edtCodDocto.Clear;
            edtDescDocto.Clear;
            edtCodigo.Clear;
            edtNomeFunc.Clear;
            edtCodDocto.Clear;
            edtDescDocto.Clear;
            {edtValor.Clear;}
            edtFunc.Clear;
            edtCodigo.Clear;
            edtNomeFunc.Clear;

            qryAtendimento.Close;
            qryOcorrencia.Close;
            qryDocto.Close;
            qryLigacao.Close;
            qryVisita.Close;
            medCliente.Clear;
            edtNomeCli.Clear;
            {medAtendimento.Clear;}
            {chkAtendimento.Checked := False;}
            medData.Clear;
            edtnomecli.Clear;
            medcliente.Clear;
            medAtendimento.SetFocus;

          except
            messagedlg('Não foi possível apagar este atendimento, verifique se existem ocorrências.',mtWarning,[mbOk],0);
          end;
          {btnOcorrClick(Sender);}
        end
        else
        begin
          messagedlg('Não é possivel apagar Atendimentos fechados.',mtWarning,[mbOk],0);
          exit;
        end;
      end
      else
      begin
        messagedlg('Não foi possível apagar este atendimento, tente mais tarde.',mtWarning,[mbOk],0);
        exit;
      end;
    end;
  end
  else
  begin
    messagedlg('Não é possível apagar atendimento com este Nível de senha.',mtWarning,[mbOk],0);
    exit;
  end;
end;

procedure TAtendimento_f.SpeedButton1Click(Sender: TObject);
var sSql:String;
begin
  inherited;
  sSql := 'SELECT ATEND.*, CLI.NOME_CLI, ATEND.DESCRICAO_ATEND AS DESCRICAO_ATEND2 ' +
          ' FROM GC_ATENDIMENTO ATEND   ' +
          ' LEFT JOIN GC_CLIENTE CLI ON (ATEND.COD_CLIENTE=CLI.COD_CLIENTE) ';
  if chkMeuDepto.Checked then
   sSQl := sSQl + ' WHERE ATEND.COD_DEPTO = ' + IntToStr(COD_DEPTO);

  sSQl := sSQl + ' ORDER BY ATEND.DT_ATEND DESC';

  dmPesq.pesAtendimento.StringSql.Text := sSql;
  dmPesq.pesAtendimento.Execute;

  if dmPesq.pesAtendimento.ValoresRetorno[0] <> '' then
  begin
    medAtendimento.Clear;
    medAtendimento.Text := dmPesq.PesAtendimento.ValoresRetorno[0];
    medCliente.Text     := dmPesq.PesAtendimento.ValoresRetorno[1];
    medAtendimentoExit(sender);
    dbMemo1.SetFocus;
  end;

end;

procedure TAtendimento_f.sbPesqClick(Sender: TObject);
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
end;

procedure TAtendimento_f.chkAtendimentoClick(Sender: TObject);
begin
  inherited;
  if not qryAux.active then
    exit;
  if chkAtendimento.Checked then
  begin
    if medAtendimento.Text <> '' then
    begin
      qryOcorrencia.Close;
      qryOcorrencia.SQL.Text := 'SELECT OCO.*, FUN1.NOME_FUNC, DEP1.DESC_DEPTO, ' +
                                ' FUN2.NOME_FUNC, DEP2.DESC_DEPTO, DESCRICAO_OCORR AS DESCRICAO_OCORR2 '+
                                ' FROM GC_OCORRENCIA OCO '+
                                ' LEFT JOIN GC_FUNCIONARIO FUN1 ON (OCO.COD_FUNC=FUN1.COD_FUNC) '+
                                ' LEFT JOIN GC_DEPARTAMENTO DEP1 ON (FUN1.COD_DEPTO=DEP1.COD_DEPTO) '+
                                ' LEFT JOIN GC_FUNCIONARIO FUN2 ON (OCO.COD_FUNC_TRANS=FUN2.COD_FUNC) '+
                                ' LEFT JOIN GC_DEPARTAMENTO DEP2 ON (FUN2.COD_DEPTO=DEP2.COD_DEPTO) '+
                                ' WHERE OCO.COD_CLIENTE = :COD_CLIENTE AND OCO.COD_ATENDIMENTO = :COD_ATENDIMENTO '+
                                ' ORDER BY OCO.DT_OCORRENCIA DESC ';

      qryOcorrencia.ParamByName('Cod_Cliente').AsInteger     := qryAux.FieldByName('Cod_Cliente').AsInteger;
      qryOcorrencia.ParamByName('Cod_Atendimento').AsString  := medAtendimento.Text;
      qryOcorrencia.Open;
    end;
  end
  else
  begin
    qryOcorrencia.Close;
    qryOcorrencia.SQL.Text := 'SELECT OCO.*, FUN1.NOME_FUNC, DEP1.DESC_DEPTO, ' +
                              ' FUN2.NOME_FUNC, DEP2.DESC_DEPTO, DESCRICAO_OCORR AS DESCRICAO_OCORR2 '+
                              ' FROM GC_OCORRENCIA OCO '+
                              ' LEFT JOIN GC_FUNCIONARIO FUN1 ON (OCO.COD_FUNC=FUN1.COD_FUNC) '+
                              ' LEFT JOIN GC_DEPARTAMENTO DEP1 ON (FUN1.COD_DEPTO=DEP1.COD_DEPTO) '+
                              ' LEFT JOIN GC_FUNCIONARIO FUN2 ON (OCO.COD_FUNC_TRANS=FUN2.COD_FUNC) '+
                              ' LEFT JOIN GC_DEPARTAMENTO DEP2 ON (FUN2.COD_DEPTO=DEP2.COD_DEPTO) '+
                              ' WHERE OCO.COD_CLIENTE = :COD_CLIENTE '+
                              ' ORDER BY OCO.DT_OCORRENCIA DESC ';
    qryOcorrencia.ParamByName('Cod_Cliente').AsInteger := qryAux.FieldByName('Cod_Cliente').AsInteger;
    qryOcorrencia.Open;
  end;
end;

procedure TAtendimento_f.SpeedButton3Click(Sender: TObject);
begin
  inherited;
  dmPesq.PesDocto.StringSql.Clear;
  if uppercase(LerIni(caminho+'Atendimento.ini','Identificacao','Todos_Doctos')) = 'NAO' then
    dmPesq.PesDocto.StringSql.Text := 'SELECT * FROM GC_DOCUMENTO WHERE COD_DEPTO = ' + qryDepto.FieldByName('Cod_Depto').AsString +
                                      ' ORDER BY DESC_DOCTO '
  else
    dmPesq.PesDocto.StringSql.Text := 'SELECT * FROM GC_DOCUMENTO ORDER BY DESC_DOCTO ';


  dmPesq.PesDocto.Execute;
  edtCodDocto.Text  := dmPesq.PesDocto.ValoresRetorno[1];
  edtDescDocto.Text := dmPesq.PesDocto.ValoresRetorno[0];
  if edtCodDocto.Text = '' then
  begin
    edtCodDocto.SetFocus;
    exit;
  end;
  qryDocto2.Close;
  qryDocto2.ParamByName('Cod_Docto').AsString := edtCodDocto.Text;
  qryDocto2.Open;
end;

procedure TAtendimento_f.edtCodDoctoExit(Sender: TObject);
begin
  inherited;
  if edtCodDocto.Text <> '' then
  begin
    qryDocto2.Close;
    if uppercase(LerIni(caminho+'Atendimento.ini','Identificacao','Todos_Doctos')) = 'NAO' then
      qryDocto2.SQL.Text := 'SELECT * FROM GC_DOCUMENTO WHERE COD_DEPTO = ' + qryDepto.FieldByName('Cod_Depto').AsString +
                            ' AND COD_DOCTO = :COD_DOCTO ' +
                            ' ORDER BY DESC_DOCTO '
    else
      qryDocto2.SQL.Text := 'SELECT * FROM GC_DOCUMENTO WHERE COD_DOCTO = :COD_DOCTO '+
                            ' ORDER BY DESC_DOCTO ';

    qryDocto2.ParamByName('Cod_Docto').AsString := edtCodDocto.Text;
    qryDocto2.Open;
    if qryDocto2.eof then
    begin
      messagedlg('Documento não cadastrado, cadastre e tente novamente.',mtInformation,[mbOk],0);
      edtCodDocto.SetFocus;
    end
    else
      edtDescDocto.Text := qryDocto2.FieldByName('Desc_Docto').AsString;
  end
  else
  begin
    edtDescDocto.Clear;
  end;
end;

procedure TAtendimento_f.FormShow(Sender: TObject);
begin
  inherited;
  cbTipo.ItemIndex := 0;
  gbtipo.Enabled   := (cbTipo.ItemIndex=0) or (cbTipo.ItemIndex=1);
  qryDepto.Close;
  qryDepto.Open;
  qryDepto.locate('cod_depto',cod_depto,[loCaseInsensitive]);
end;

procedure TAtendimento_f.cbTipoChange(Sender: TObject);
begin
  inherited;
  gbtipo.Enabled   := (cbTipo.ItemIndex >= 0) and (cbTipo.ItemIndex <= 2);
  if ( cbTipo.ItemIndex > 1 ) then
  begin
    edtCodDocto.Clear;
    edtDescDocto.Clear;
  end;
end;

procedure TAtendimento_f.DBGrid1DblClick(Sender: TObject);
begin
  inherited;
  if assigned(MostraOcorrencia_f) then
    MostraOcorrencia_f := nil;

  MostraOcorrencia_f := TMostraOcorrencia_f.Create(Self);
  try
    MostraOcorrencia_f.edtCodigo.Text        := IntToStr(qryOcorrencia.fieldbyname('Cod_Func').AsInteger);
    MostraOcorrencia_f.medOcorrencia.Text    := IntToStr(qryOcorrencia.fieldbyname('Cod_Ocorrencia').AsInteger);
    MostraOcorrencia_f.Cod_Atendimento       := qryOcorrencia.fieldbyname('Cod_Atendimento').AsInteger;
    MostraOcorrencia_f.Cod_Cliente           := qryOcorrencia.fieldbyname('Cod_Cliente').AsInteger;
    MostraOcorrencia_f.SpeedButton3.Enabled  := False;
    MostraOcorrencia_f.SpeedButton2.Enabled  := False;
    MostraOcorrencia_f.medOcorrencia.Enabled := False;
    MostraOcorrencia_f.edtCodTrans.Enabled   := False;
    MostraOcorrencia_f.DBMemo1.ReadOnly      := True;
    MostraOcorrencia_f.DBMemo2.ReadOnly      := True;
    MostraOcorrencia_f.rgOcorrencia.ReadOnly := True;
    MostraOcorrencia_f.medOcorrenciaExit(Sender);
    MostraOcorrencia_f.edtCodigoExit(sender);
    MostraOcorrencia_f.Show;
  except
    MostraOcorrencia_f := TMostraOcorrencia_f.Create(Self);
    MostraOcorrencia_f.Show;
  end;
end;

procedure TAtendimento_f.edtFuncChange(Sender: TObject);
var s:String;
begin
  inherited;
  if not qryCliFunc.active then
  begin
    qryCliFunc.parambyname('Cod_cliente').AsInteger := 0;
    qryCliFunc.Open;
  end;
  if qryCliFunc.Locate('nome_cli_func',edtFunc.Text,[loPartialKey]) then
  begin
    s                 := edtFunc.text;
    edtFunc.Text      := qryCliFunc.FieldByName('Nome_Cli_Func').AsString;
    edtFunc.SelStart  := Length(s);
    edtFunc.SelLength := Length(qryCliFunc.FieldByName('Nome_Cli_Func').AsString) - Length(s)
  end;
end;

procedure TAtendimento_f.edtFuncExit(Sender: TObject);
var Cod:Integer;
begin
  inherited;
  if edtFunc.Text <> '' then
  begin
    if not qryCliFunc.Locate('nome_cli_func',edtFunc.Text,[loCaseInsensitive]) then
    begin
      Cod := Proximo('GC_CLIENTE_FUNC','COD_CLI_FUNC','', true);
      qryCliFunc.Insert;
      qryCliFunc.FieldByName('Cod_Cli_Func').AsInteger := Cod;
      qryCliFunc.FieldByName('Cod_Cliente').AsString   := medCliente.Text;
      qryCliFunc.FieldByName('Nome_Cli_Func').AsString := edtFunc.Text;
      qryCliFunc.Post;
    end;
  end;

end;

procedure TAtendimento_f.sbFuncClick(Sender: TObject);
begin
  inherited;
  if medCliente.Text <> '' then
  begin
    dmPesq.PesClienteFunc.StringSql.Clear;
    dmPesq.PesClienteFunc.StringSql.Add('SELECT * FROM GC_CLIENTE_FUNC WHERE COD_CLIENTE = '+medCliente.Text);
    dmPesq.PesClienteFunc.StringSql.Add(' ORDER BY NOME_CLI_FUNC');
    dmPesq.PesClienteFunc.Execute;
    if dmPesq.PesClienteFunc.ValoresRetorno[0] <> '' then
    begin
      edtFunc.Text := dmPesq.PesClienteFunc.ValoresRetorno[1];
    end;
  end;
end;
{
0-Solicitação
1-Reenvio
2-Recalculo
3-Reclamação
4-Observação
}
procedure TAtendimento_f.Documentos1Click(Sender: TObject);
begin
  inherited;
  if assigned(CadDocumento_f) then
    CadDocumento_f := nil;

  CadDocumento_f := TCadDocumento_f.Create(Self);
  try
    CadDocumento_f.Show;
  except
    CadDocumento_f := TCadDocumento_f.Create(Self);
    CadDocumento_f.Show;
  end;
end;

procedure TAtendimento_f.Pendncias1Click(Sender: TObject);
begin
  inherited;
  if assigned(Pendencia_f) then
    Pendencia_f := nil;

  Pendencia_f := TPendencia_f.Create(Self);
  try
    Pendencia_f.Width    := frmPrincipal.Width  - 20;
    Pendencia_f.Height   := frmPrincipal.Height - 80;
    Pendencia_f.Position := poDesigned;
    Pendencia_f.Top      := 3;
    Pendencia_f.Left     := 3;
  except
    Pendencia_f          := TPendencia_f.Create(Self);
    Pendencia_f.Width    := frmPrincipal.Width  - 10;
    Pendencia_f.Height   := frmPrincipal.Height - 10;
    Pendencia_f.Show;
  end;
end;

procedure TAtendimento_f.Ligaes1Click(Sender: TObject);
begin
  inherited;
  if assigned(CadLigacao_f) then
    CadLigacao_f := nil;

  CadLigacao_f := TCadLigacao_f.Create(Self);
  try
    CadLigacao_f.Height := CadLigacao_f.Height - 15;
    CadLigacao_f.Show;
  except
    CadLigacao_f := TCadLigacao_f.Create(Self);
    CadLigacao_f.Height := CadLigacao_f.Height - 15;
    CadLigacao_f.Show;
  end;
end;

procedure TAtendimento_f.Visitas1Click(Sender: TObject);
begin
  inherited;
  if assigned(CadVisita_f) then
    CadVisita_f := nil;

  CadVisita_f := TCadVisita_f.Create(Self);
  try
    CadVisita_f.Height := CadVisita_f.Height - 15;
    CadVisita_f.Show;
  except
    CadVisita_f := TCadVisita_f.Create(Self);
    CadVisita_f.Height := CadVisita_f.Height - 15;
    CadVisita_f.Show;
  end;
end;

procedure TAtendimento_f.AtendimentosEfetuados1Click(Sender: TObject);
begin
  inherited;
  if assigned(EmiteRelatorios_f) then
    EmiteRelatorios_f := nil;

  EmiteRelatorios_f := TEmiteRelatorios_f.Create(Self);
  try
    EmiteRelatorios_f.Show;
  except
    EmiteRelatorios_f := TEmiteRelatorios_f.Create(Self);
    EmiteRelatorios_f.Show;
  end;
end;

procedure TAtendimento_f.SpeedButton2Click(Sender: TObject);
begin
  inherited;
  dmPesq.PesFunc2.Execute;
  edtCodigo.Text := dmPesq.PesFunc2.ValoresRetorno[0];
  if edtCodigo.Text = '' then
  begin
    edtCodigo.SetFocus;
    exit;
  end;
  qryFunc.Close;
  qryFunc.ParamByName('Cod_Func').AsString := edtCodigo.Text;
  qryFunc.Open;
  edtNomeFunc.Text := qryFunc.FieldByName('Nome_Func').AsString;
end;

procedure TAtendimento_f.edtCodigoExit(Sender: TObject);
var vSql : String;
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
  if edtCodigo.Text <> '' then
  begin
    vSql := qryAux.SQL.Text;
    qryAux.Close;
    qryAux.SQL.Text := 'SELECT * FROM GC_FUNCIONARIO WHERE ATIVO_FUNC <> ''N'' AND COD_FUNC='+edtCodigo.Text;
    qryAux.Open;
    edtCodigo.Text   := qryAux.FieldByName('Cod_Func').AsString;
    edtNomeFunc.Text := qryAux.FieldByName('Nome_Func').AsString;
    if trim(vSql) <> '' then
    begin
      qryAux.Close;
      qryAux.SQL.text := vSql;
      qryAux.Open;
    end;
  end
  else
  begin
    edtCodigo.Clear;
    edtNomeFunc.Clear;
  end;
end;

procedure TAtendimento_f.CarregaAtendimento(pCod_Atendimento : Integer; pCod_Cliente : Integer=0);
begin
  with qryAtendimento do
  begin
    close;
    sql.text := 'SELECT * FROM GC_ATENDIMENTO '+
                ' WHERE COD_ATENDIMENTO = :COD_ATENDIMENTO ';
    if chkMeuDepto.Checked then
      sql.text := sql.text + ' AND COD_DEPTO = ' + IntToStr(COD_DEPTO);
    if pCod_Cliente > 0 then
      sql.text := sql.text + ' AND COD_CLIENTE = ' + IntToStr(pCod_Cliente);

    ParamByName('Cod_Atendimento').AsString := medAtendimento.Text;
    open;
    if eof then
    begin
      messagedlg('Codigo de Atendimento não Cadastrado ou pertence a outro Depto.',mtInformation,[mbOk],0);
      medAtendimento.SetFocus;
      exit;
    end
    else
    begin
      if nivel < 1 then
        if (fieldbyName('STATUS_ATEND').AsString <> 'C') and (fieldbyName('STATUS_ATEND').AsString <> 'F') then
          edit;
      {(fieldbyName('STATUS_ATEND').AsString <> 'A')}
{      memo1.Lines.Text := qryAtendimento.Fieldbyname('desc_atend').AsString;}

      cbDepto.Enabled := False;
      medCliente.Enabled := True;
      medCliente.Text    := fieldbyName('Cod_Cliente').AsString;
      medClienteExit(nil);
      edtFunc.Text       := fieldbyName('NOME_CLIFUNC').AsString;
      edtCodigo.Text     := fieldbyName('COD_FUNC').AsString;
      edtCodigoExit(nil);
      if fieldbyName('TIPO_ATEND').AsString <> '' then
        cbTipo.ItemIndex   := fieldbyName('TIPO_ATEND').AsInteger
      else
        cbTipo.ItemIndex   := 0;

      if fieldByName('cod_assunto').AsInteger > 0 then
      begin
        qryAux.Close;
        qryAux.sql.Text := 'SELECT * FROM GC_ASSUNTO WHERE COD_ASSUNTO = ' + fieldByName('cod_assunto').AsString;
        qryAux.Open;
        edtClass.Text   := qryAux.fieldbyname('classific_assunto').AsString;
      end;

      edtCodDocto.Text   := fieldbyName('Cod_Docto').AsString;
      {dtIni.Text         := formatDateTime('dd/mm/yyyy',fieldbyName('DT_COMPET_INI').AsDateTime);
      dtFin.Text         := formatDateTime('dd/mm/yyyy',fieldbyName('DT_COMPET_FIN').AsDateTime);
      dtVencto.Text      := formatDateTime('dd/mm/yyyy',fieldbyName('DT_VENCTO').AsDateTime);
      edtValor.Value     := fieldbyName('Valor_Docto').AsFloat;}
      medData.Text       := formatdatetime('dd/mm/yyyy hh:nn',fieldbyName('dt_atend').AsDateTime);
      if edtCodDocto.Text <> '' then
        edtCodDoctoExit(nil);
    end;
  end;

  {(qryAtendimento.State = dsEdit) and}
  btnOcorr.Enabled := ( ((qryAtendimento.FieldByName('Status_Atend').AsString <> 'F') and
                        (qryAtendimento.FieldByName('Status_Atend').AsString <> 'C')) );
  bitbtn6.Enabled := ((qryAtendimento.State = dsEdit) and
                       ((qryAtendimento.FieldByName('Status_Atend').AsString <> 'F') and
                        (qryAtendimento.FieldByName('Status_Atend').AsString <> 'C')) );
end;

procedure TAtendimento_f.SpeedButton4Click(Sender: TObject);
begin
  inherited;
  dmPesq.PesAssunto.Execute;
  if qryAtendimento.State in [dsInsert, dsEdit] then
  begin
    if dmPesq.PesAssunto.ValoresRetorno[1] <> '' then
    begin
      if qryAtendimento.FieldByName('Cod_Depto').AsString <> dmPesq.PesAssunto.ValoresRetorno[2] then
      begin
        if messagedlg('Assunto diferente do Depto. do Funcionário, continua ?',mtConfirmation,[mbYes, mbNo],0) = idNo then
        begin
          exit;
        end;
      end;
      qryAtendimento.FieldByName('COD_ASSUNTO').AsString := dmPesq.PesAssunto.ValoresRetorno[1];
      edtClass.Text                                      := dmPesq.PesAssunto.ValoresRetorno[3];
    end;
  end;
end;

procedure TAtendimento_f.edtClassExit(Sender: TObject);
begin
  inherited;
  if esc then
  begin
    esc := false;
    exit;
  end;
  if qryAtendimento.State in [dsInsert, dsEdit] then
  begin
    if edtClass.Text <> '' then
    begin
      qryAux.Close;
      qryAux.sql.Text := 'SELECT * FROM GC_ASSUNTO WHERE CLASSIFIC_ASSUNTO = ' + StringSql(edtClass.Text);
      qryAux.Open;
      if not qryAux.eof then
      begin
        qryAtendimento.FieldByName('COD_ASSUNTO').AsInteger := qryAux.FieldByName('cod_assunto').AsInteger;
        {if dbMemo1.Text = '' then
          dbMemo1.Text   := qryAux.FieldByName('desc_assunto').AsString
        else
        begin
          if messagedlg('Deseja alterar o assunto ?',mtConfirmation,[mbYes, mbNo],0) = idYes then
          begin
            dbMemo1.Text   := qryAux.FieldByName('desc_assunto').AsString
          end;
        end;}
      end
      else
      begin
        messagedlg('Codigo do Assunto não cadastrado.',mtWarning,[mbOk],0);
        edtClass.Clear;
        edtClass.SetFocus;
        exit;
      end;
    end;
  end;
end;

procedure TAtendimento_f.AssuntosPrDefinidos1Click(Sender: TObject);
begin
  inherited;
  if assigned(CadAssunto_f) then
    CadAssunto_f := nil;
  CadAssunto_f := TCadAssunto_f.Create(Self);
  try
    CadAssunto_f.Show;
  except
    CadAssunto_f := TCadAssunto_f.Create(Self);
    CadAssunto_f.Show;
  end;
end;

end.
