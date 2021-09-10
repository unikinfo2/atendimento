unit GeraVencimento_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, StdCtrls, Buttons, Mask, ExtCtrls, Menus, DBCtrls, Db, DBTables,
  RxCalc, ComCtrls, Grids, DBGrids, ToolEdit, RXDBCtrl, Variants, RpDefine,
  RpBase, RpSystem, RpMemo;

type
  TGeraVencimento_f = class(TDeriva_f)
    Panel1: TPanel;
    Panel2: TPanel;
    medCliente: TMaskEdit;
    sbPesq: TSpeedButton;
    edtNomeCli: TEdit;
    Label2: TLabel;
    Label1: TLabel;
    qryAux: TQuery;
    qryDocs: TQuery;
    Panel3: TPanel;
    qryObriga: TQuery;
    dbg: TDBGrid;
    medAno: TMaskEdit;
    Label3: TLabel;
    dsObriga: TDataSource;
    qryObrigaCOD_OBR: TIntegerField;
    qryObrigaANOMES_OBR: TStringField;
    qryObrigaCOD_CLIENTE: TIntegerField;
    qryObrigaCOD_DOCTO: TIntegerField;
    qryObrigaDT_VENCTO: TDateTimeField;
    qryObrigaDT_ENVIO: TDateTimeField;
    qryObrigaMEIO_ENVIO: TStringField;
    qryObrigaVALOR_DOCTO: TFloatField;
    qryObrigaCOD_DOCTO_1: TIntegerField;
    qryObrigaCOD_DEPTO: TIntegerField;
    qryObrigaDESC_DOCTO: TStringField;
    qryObrigaCOMPETENCIA_DOCTO: TStringField;
    qryObrigaDIAS_DOCTO: TIntegerField;
    qryObrigaSTATUS_DIAS_DOCTO: TStringField;
    qryObrigaCOD_SERV: TIntegerField;
    qryObrigaCOD_PLCONTA: TIntegerField;
    qryObrigaCOD_BANCO: TIntegerField;
    qryObrigaDATA_VENCTO_DOCTO: TDateTimeField;
    qryObrigaTIPO_VENCTO: TStringField;
    Label4: TLabel;
    dtEnvio: TDateEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    RvSystem1: TRvSystem;
    chkDoc: TCheckBox;
    qryClientes: TQuery;
    rgEnvio: TRadioGroup;
    memoObs: TMemo;
    BitBtn6: TBitBtn;
    qryObrigaOBS_OBRIGACAO: TMemoField;
    qryObrigaGERA_AGENDA: TStringField;
    procedure medClienteExit(Sender: TObject);
    procedure sbPesqClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure medAnoExit(Sender: TObject);
    procedure qryObrigaAfterScroll(DataSet: TDataSet);
    procedure RvSystem1NewPage(Sender: TObject);
    procedure RvSystem1Print(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure dbgCellClick(Column: TColumn);
  private
    vTodos : Boolean;
    vPag   : Integer;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  GeraVencimento_f: TGeraVencimento_f;

implementation

uses Atendimento_dm, principal, funcoes;

{$R *.DFM}

procedure TGeraVencimento_f.medClienteExit(Sender: TObject);
begin
  inherited;
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
  end
  else
  begin
    medCliente.Clear;
    edtNomeCli.Clear;
    sbPesqClick(Sender);
    exit;
  end;
end;

procedure TGeraVencimento_f.sbPesqClick(Sender: TObject);
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

procedure TGeraVencimento_f.BitBtn1Click(Sender: TObject);
var vMes, x, y : Integer;
    vMesAno : String;
    vSql    : String;
    vVencto : TDateTime;
    vApaga  : Boolean;
begin
  inherited;
  if esc then
  begin
    esc := False;
    exit;
  end;
  if medAno.Text = '' then
  begin
    messagedlg('É necessário informar o ano de Referência.',mtWarning,[mbOk],0);
    medAno.SetFocus;
    exit;
  end;
  vApaga := messagedlg('Deseja apagar itens com data de envio ?',mtConfirmation,[mbYes, mbNo],0) = idYes;

  qryClientes.Close;
  {if messagedlg('Deseja gerar todas as empresas ativas ?',mtConfirmation,[mbYes, mbNo],0) = idYes then
    qryClientes.SQL.Text := 'SELECT * FROM GC_CLIENTE WHERE ATIVO_CLI = ''A'' '
  else}
    qryClientes.SQL.Text := 'SELECT * FROM GC_CLIENTE WHERE COD_CLIENTE = ' + medCliente.Text;


  vSql := 'INSERT INTO GC_OBRIGACOES ( '+
          ' COD_OBR, '+
          ' ANOMES_OBR, '+
          ' COD_CLIENTE, '+
          ' COD_DOCTO, '+
          ' DT_VENCTO '+
          ' ) VALUES ( '+
          ' :COD_OBR, '+
          ' :ANOMES_OBR, '+
          ' :COD_CLIENTE, '+
          ' :COD_DOCTO, '+
          ' :DT_VENCTO '+
          ' )';

  qryClientes.Open;
  while not qryClientes.Eof do
  begin
    qryDocs.Close;
    qryDocs.ParamByName('Cod_Cliente').AsString := qryClientes.fieldbyname('cod_cliente').AsString;
    qryDocs.Open;

    for vMes := 1 to 12 do
    begin
      frmPrincipal.Database1.StartTransaction;
      vMesAno := formatfloat('00',vMes)+'/'+medAno.Text;
      qryAux.close;
      if vApaga then
        qryAux.Sql.Text := 'DELETE FROM GC_OBRIGACOES WHERE COD_CLIENTE = :COD_CLIENTE '+
                           ' AND ANOMES_OBR = :ANOMES_OBR'
      else
        qryAux.Sql.Text := 'DELETE FROM GC_OBRIGACOES WHERE COD_CLIENTE = :COD_CLIENTE '+
                           ' AND ANOMES_OBR = :ANOMES_OBR AND DT_ENVIO IS NULL';

      qryAux.ParamByName('anomes_obr').AsString  := medAno.Text+formatfloat('00',vMes);
      qryAux.ParamByName('Cod_Cliente').AsString := qryClientes.fieldbyname('cod_cliente').AsString;
      qryAux.ExecSQL;

      qryDocs.First;
      while not qryDocs.eof do
      begin
        qryAux.Close;
        qryAux.Sql.Text := 'SELECT * FROM GC_OBRIGACOES WHERE COD_CLIENTE = :COD_CLIENTE '+
                           ' AND ANOMES_OBR = :ANOMES_OBR AND COD_DOCTO = :COD_DOCTO';
        qryAux.ParamByName('anomes_obr').AsString  := medAno.Text+formatfloat('00',vMes);
        qryAux.ParamByName('Cod_Cliente').AsString := qryClientes.fieldbyname('cod_cliente').AsString;
        qryAux.ParamByName('Cod_Docto').AsInteger  := qryDocs.FieldByName('Cod_Docto').AsInteger;
        qryAux.open;
        if not qryAux.eof then
        begin
          qryDocs.next;
          continue;
        end;

        if qryDocs.FieldByName('Competencia_Docto').AsString = 'S' then {Apuração Semanal}
        begin
          for x := 1 to Round(StrToInt(formatdatetime('dd',UltimoDia(StrToDateTime('01/'+vMesAno))))/7) do
          begin
            vVencto := StrToDateTime('01/'+vMesAno) + (x*7);
            if (DayOfWeek(StrToDateTime('01/'+vMesAno) + (x*7)) = 7) and (formatdatetime('mm',StrToDateTime('01/'+vMesAno) + (x*7)) = formatfloat('00',vMes)) then
            begin
              if qryDocs.FieldByName('Status_dias_Docto').AsString = 'C' then
                vVencto := vVencto + qryDocs.FieldByName('Dias_Docto').AsInteger
              else
                vVencto := DiasUteis(qryDocs.FieldByName('Dias_Docto').AsInteger, vVencto);
            end;

            if ((not DiaUtil(vVencto)) or (dayofweek(vVencto) = 7)) and (qryDocs.FieldByName('Tipo_Vencto').AsString <> 'F') then
            begin
              for y := 0 to 20 do
              begin
                if qryDocs.FieldByName('Tipo_Vencto').AsString = 'A' then
                  vVencto := vVencto - 1;
                if qryDocs.FieldByName('Tipo_Vencto').AsString = 'P' then
                  vVencto := vVencto + 1;
                if DiaUtil(vVencto) then
                  break;
              end;
            end;
            qryAux.Close;
            qryAux.SQL.Text := vSql;
            qryAux.ParamByName('Cod_Obr').AsInteger     := Proximo('GC_OBRIGACOES','COD_OBR', 'COD_CLIENTE='+qryClientes.fieldbyname('cod_cliente').AsString+' and anomes_obr='+StringSql(medAno.Text+formatfloat('00',vMes)), true);
            qryAux.ParamByName('AnoMes_Obr').AsString   := medAno.Text+formatfloat('00',vMes);
            qryAux.ParamByName('Cod_Cliente').AsInteger := qryClientes.fieldbyname('cod_cliente').AsInteger;
            qryAux.ParamByName('Cod_Docto').AsInteger   := qryDocs.FieldByName('Cod_Docto').AsInteger;
            qryAux.ParamByName('Dt_Vencto').AsDateTime  := vVencto;
            qryAux.ExecSQL;
          end;
        end;

        if qryDocs.FieldByName('Competencia_Docto').AsString = 'Q' then {Apuração Quinzenal}
        begin
          for x := 1 to 2 do
          begin
            if x = 1 then
              vVencto := StrToDateTime('15/'+vMesAno)
            else
              vVencto := UltimoDia(StrToDateTime('01/'+vMesAno));

            if qryDocs.FieldByName('Status_dias_Docto').AsString = 'C' then
              vVencto := vVencto + qryDocs.FieldByName('Dias_Docto').AsInteger
            else
              vVencto := DiasUteis(qryDocs.FieldByName('Dias_Docto').AsInteger, vVencto);

            if ((not DiaUtil(vVencto)) or (dayofweek(vVencto) = 7)) and (qryDocs.FieldByName('Tipo_Vencto').AsString <> 'F') then
            begin
              for y := 0 to 20 do
              begin
                if qryDocs.FieldByName('Tipo_Vencto').AsString = 'A' then
                  vVencto := vVencto - 1;
                if qryDocs.FieldByName('Tipo_Vencto').AsString = 'P' then
                  vVencto := vVencto + 1;
                if DiaUtil(vVencto) then
                  break;
              end;
            end;
            qryAux.Close;
            qryAux.SQL.Text := vSql;
            qryAux.ParamByName('Cod_Obr').AsInteger     := Proximo('GC_OBRIGACOES','COD_OBR', 'COD_CLIENTE='+qryClientes.fieldbyname('cod_cliente').AsString+' and anomes_obr='+StringSql(medAno.Text+formatfloat('00',vMes)), true);
            qryAux.ParamByName('AnoMes_Obr').AsString   := medAno.Text+formatfloat('00',vMes);
            qryAux.ParamByName('Cod_Cliente').AsInteger := qryClientes.fieldbyname('cod_cliente').AsInteger;
            qryAux.ParamByName('Cod_Docto').AsInteger   := qryDocs.FieldByName('Cod_Docto').AsInteger;
            qryAux.ParamByName('Dt_Vencto').AsDateTime  := vVencto;
            qryAux.ExecSQL;
          end;
        end;

        if qryDocs.FieldByName('Competencia_Docto').AsString = 'D' then {Apuração Decendial}
        begin
          for x := 1 to 3 do
          begin
            vVencto := StrToDateTime('10/'+vMesAno);
            if x = 1 then
              vVencto := StrToDateTime('10/'+vMesAno)
            else if x = 2 then
              vVencto := StrToDateTime('20/'+vMesAno)
            else if x = 3 then
              vVencto := UltimoDia(StrToDateTime('01/'+vMesAno));

            if qryDocs.FieldByName('Status_dias_Docto').AsString = 'C' then
              vVencto := vVencto + qryDocs.FieldByName('Dias_Docto').AsInteger
            else
              vVencto := DiasUteis(qryDocs.FieldByName('Dias_Docto').AsInteger, vVencto);

            if ((not DiaUtil(vVencto)) or (dayofweek(vVencto) = 7)) and (qryDocs.FieldByName('Tipo_Vencto').AsString <> 'F') then
            begin
              for y := 0 to 20 do
              begin
                if qryDocs.FieldByName('Tipo_Vencto').AsString = 'A' then
                  vVencto := vVencto - 1;
                if qryDocs.FieldByName('Tipo_Vencto').AsString = 'P' then
                  vVencto := vVencto + 1;
                if DiaUtil(vVencto) then
                  break;
              end;
            end;
            qryAux.Close;
            qryAux.SQL.Text := vSql;
            qryAux.ParamByName('Cod_Obr').AsInteger     := Proximo('GC_OBRIGACOES','COD_OBR', 'COD_CLIENTE='+qryClientes.fieldbyname('cod_cliente').AsString+' and anomes_obr='+StringSql(medAno.Text+formatfloat('00',vMes)), true);
            qryAux.ParamByName('AnoMes_Obr').AsString   := medAno.Text+formatfloat('00',vMes);
            qryAux.ParamByName('Cod_Cliente').AsInteger := qryClientes.fieldbyname('cod_cliente').AsInteger;
            qryAux.ParamByName('Cod_Docto').AsInteger   := qryDocs.FieldByName('Cod_Docto').AsInteger;
            qryAux.ParamByName('Dt_Vencto').AsDateTime  := vVencto;
            qryAux.ExecSQL;
          end;
        end;

        if qryDocs.FieldByName('Competencia_Docto').AsString = 'M' then {Apuração Mensal}
        begin
          vVencto := UltimoDia(StrToDateTime('01/'+vMesAno));

          if qryDocs.FieldByName('Status_dias_Docto').AsString = 'C' then
            vVencto := vVencto + qryDocs.FieldByName('Dias_Docto').AsInteger
          else
            vVencto := DiasUteis(qryDocs.FieldByName('Dias_Docto').AsInteger, vVencto);

          if ((not DiaUtil(vVencto)) or (dayofweek(vVencto) = 7)) and (qryDocs.FieldByName('Tipo_Vencto').AsString <> 'F') then
          begin
            for y := 0 to 20 do
            begin
              if qryDocs.FieldByName('Tipo_Vencto').AsString = 'A' then
                vVencto := vVencto - 1;
              if qryDocs.FieldByName('Tipo_Vencto').AsString = 'P' then
                vVencto := vVencto + 1;
              if DiaUtil(vVencto) then
                break;
            end;
          end;
          qryAux.Close;
          qryAux.SQL.Text := vSql;
          qryAux.ParamByName('Cod_Obr').AsInteger     := Proximo('GC_OBRIGACOES','COD_OBR', 'COD_CLIENTE='+qryClientes.fieldbyname('cod_cliente').AsString+' and anomes_obr='+StringSql(medAno.Text+formatfloat('00',vMes)), true);
          qryAux.ParamByName('AnoMes_Obr').AsString   := medAno.Text+formatfloat('00',vMes);
          qryAux.ParamByName('Cod_Cliente').AsInteger := qryClientes.fieldbyname('cod_cliente').AsInteger;
          qryAux.ParamByName('Cod_Docto').AsInteger   := qryDocs.FieldByName('Cod_Docto').AsInteger;
          qryAux.ParamByName('Dt_Vencto').AsDateTime  := vVencto;
          qryAux.ExecSQL;
        end;

        if (qryDocs.FieldByName('Competencia_Docto').AsString = 'T') and
          ((vMes = 3) or (vMes = 6) or (vMes = 9) or (vMes = 12))  then {Apuração Trimestral}
        begin
          vVencto := UltimoDia(StrToDateTime('01/'+vMesAno));

          if qryDocs.FieldByName('Status_dias_Docto').AsString = 'C' then
            vVencto := vVencto + qryDocs.FieldByName('Dias_Docto').AsInteger
          else
            vVencto := DiasUteis(qryDocs.FieldByName('Dias_Docto').AsInteger, vVencto);

          if ((not DiaUtil(vVencto)) or (dayofweek(vVencto) = 7)) and (qryDocs.FieldByName('Tipo_Vencto').AsString <> 'F') then
          begin
            for y := 0 to 20 do
            begin
              if qryDocs.FieldByName('Tipo_Vencto').AsString = 'A' then
                vVencto := vVencto - 1;
              if qryDocs.FieldByName('Tipo_Vencto').AsString = 'P' then
                vVencto := vVencto + 1;
              if DiaUtil(vVencto) then
                break;
            end;
          end;
          qryAux.Close;
          qryAux.SQL.Text := vSql;
          qryAux.ParamByName('Cod_Obr').AsInteger     := Proximo('GC_OBRIGACOES','COD_OBR', 'COD_CLIENTE='+qryClientes.fieldbyname('cod_cliente').AsString+' and anomes_obr='+StringSql(medAno.Text+formatfloat('00',vMes)), true);
          qryAux.ParamByName('AnoMes_Obr').AsString   := medAno.Text+formatfloat('00',vMes);
          qryAux.ParamByName('Cod_Cliente').AsInteger := qryClientes.fieldbyname('cod_cliente').AsInteger;
          qryAux.ParamByName('Cod_Docto').AsInteger   := qryDocs.FieldByName('Cod_Docto').AsInteger;
          qryAux.ParamByName('Dt_Vencto').AsDateTime  := vVencto;
          qryAux.ExecSQL;
        end;

        if (qryDocs.FieldByName('Competencia_Docto').AsString = 'L') and
          ((vMes = 6) or (vMes = 12))                              then {Apuração Semestral}
        begin
          vVencto := UltimoDia(StrToDateTime('01/'+vMesAno));

          if qryDocs.FieldByName('Status_dias_Docto').AsString = 'C' then
            vVencto := vVencto + qryDocs.FieldByName('Dias_Docto').AsInteger
          else
            vVencto := DiasUteis(qryDocs.FieldByName('Dias_Docto').AsInteger, vVencto);

          if ((not DiaUtil(vVencto)) or (dayofweek(vVencto) = 7)) and (qryDocs.FieldByName('Tipo_Vencto').AsString <> 'F') then
          begin
            for y := 0 to 20 do
            begin
              if qryDocs.FieldByName('Tipo_Vencto').AsString = 'A' then
                vVencto := vVencto - 1;
              if qryDocs.FieldByName('Tipo_Vencto').AsString = 'P' then
                vVencto := vVencto + 1;
              if DiaUtil(vVencto) then
                break;
            end;
          end;
          qryAux.Close;
          qryAux.SQL.Text := vSql;
          qryAux.ParamByName('Cod_Obr').AsInteger     := Proximo('GC_OBRIGACOES','COD_OBR', 'COD_CLIENTE='+qryClientes.fieldbyname('cod_cliente').AsString+' and anomes_obr='+StringSql(medAno.Text+formatfloat('00',vMes)), true);
          qryAux.ParamByName('AnoMes_Obr').AsString   := medAno.Text+formatfloat('00',vMes);
          qryAux.ParamByName('Cod_Cliente').AsInteger := qryClientes.fieldbyname('cod_cliente').AsInteger;
          qryAux.ParamByName('Cod_Docto').AsInteger   := qryDocs.FieldByName('Cod_Docto').AsInteger;
          qryAux.ParamByName('Dt_Vencto').AsDateTime  := vVencto;
          qryAux.ExecSQL;
        end;
        qryDocs.Next;
      end;
      frmPrincipal.Database1.Commit;
    end;
    qryClientes.Next;
  end;
  medAnoExit(Sender);

end;

procedure TGeraVencimento_f.FormCreate(Sender: TObject);
begin
  inherited;
  medAno.Text := formatdatetime('yyyy',date);
end;

procedure TGeraVencimento_f.medAnoExit(Sender: TObject);
var vIni, vFim : String;
begin
  inherited;
  if esc then
  begin
    esc := False;
    exit;
  end;
  if medAno.Text <> '' then
  begin
    vIni := medAno.Text + '01';
    vFim := medAno.Text + '12';
    qryObriga.Close;
    qryObriga.ParamByName('Cod_Cliente').AsInteger := StrToInt(medCliente.text);
    qryObriga.ParamByName('INI').AsString          := vIni;
    qryObriga.ParamByName('FIM').AsString          := vFim;
    qryObriga.Open;
  end;
end;

procedure TGeraVencimento_f.qryObrigaAfterScroll(DataSet: TDataSet);
begin
  inherited;
  if qryObriga.Active then
    dtEnvio.Date := qryObriga.FieldByName('dt_envio').AsDateTime;
end;

procedure TGeraVencimento_f.RvSystem1NewPage(Sender: TObject);
begin
  inherited;
  inc(vPag);
  with Sender as TBaseReport do
  begin
    SectionTop := 0.0;
    SetFont('Arial',8);
    Underline := false;
    Home;
    YPos := 0.3;
    FontRotation := 0;
    SetFont('Arial',14);
    Bold := True;
    PrintCenter('Listagem das Obrigações por cliente',PageWidth / 2);
    SomaLinha(Sender as TBaseReport);
    SetFont('Arial',8);

    PrintLeft('Emissão: '+formatdatetime('dd/mm/yyyy hh:nn',now()), 0.3); {,PageWidth / 2}
    SetFont('Arial',10);
    Bold := False;
    PrintRight('Pagina: '+formatfloat('00000',vPag),PageWidth - 0.3); {,PageWidth / 2}
    SomaLinha(Sender as TBaseReport);
    SomaLinha(Sender as TBaseReport);

    ClearTabs;
    SetPen(clBlack,psClear,1,pmCopy);
    SetTab(0.4,pjLeft, 2.0,2,BOXLINEALL,0);
    SetTab(NA,pjCenter, 1.0,2,BOXLINEALL,0);
    SetTab(NA,pjCenter, 1.0,2,BOXLINEALL,0);
    SetTab(NA,pjLeft, 1.0,2,BOXLINEALL,0);
    PrintTab('Documento');
    PrintTab('Dt.Vencimento');
    PrintTab('Dt.Envio');
    PrintTab('Meio de Envio');

    SomaLinha(Sender as TBaseReport);
    fLinha(Sender as TBaseReport, 3);
    SomaLinha(Sender as TBaseReport);

    Bold := False;
  end;
end;

procedure TGeraVencimento_f.RvSystem1Print(Sender: TObject);
var Cod_Cliente : Integer;
    anomes      : String;
    vSql        : String;
    MemoBuf     : TMemoBuf;
begin
  inherited;
  qryAux.close;
  if vTodos then
    vSql := 'SELECT * FROM gc_obrigacoes obr '+
                       ' Left Join gc_cliente cli on (obr.cod_cliente = cli.cod_cliente) '+
                       ' Left Join gc_documento doc on (obr.cod_docto = doc.cod_docto) '+
                       ' WHERE obr.dt_vencto <= :dt_Vencto and anomes_obr >= :anomes_obr '
  else
    vSql := 'SELECT * FROM gc_obrigacoes obr '+
                       ' Left Join gc_cliente cli on (obr.cod_cliente = cli.cod_cliente) '+
                       ' Left Join gc_documento doc on (obr.cod_docto = doc.cod_docto) '+
                       ' WHERE obr.dt_vencto <= :dt_Vencto and anomes_obr >= :anomes_obr '+
                       '   and obr.cod_cliente = ' + medCliente.Text;


  if chkDoc.Checked then
    vSql := vSQl + ' and obr.dt_envio is not null ';
  vSql := vSQl + ' order by obr.cod_cliente, obr.dt_vencto, doc.desc_docto';

  qryAux.SQL.Text := vSql;
  qryAux.ParamByName('dt_vencto').AsDateTime := date + 5;
  qryAux.ParamByName('anomes_obr').AsString  := medAno.Text; {formatdatetime('yyyy',date)+'01';}
  qryAux.open;

  cod_cliente := 0;
  while not qryAux.Eof do
  begin
    anomes := qryAux.FieldByName('anomes_obr').AsString;
    with Sender as TBaseReport do
    begin
      if cod_cliente <> qryAux.FieldByName('cod_cliente').AsInteger then
      begin
        Cod_Cliente := qryAux.FieldByName('cod_cliente').AsInteger;
        printleft('Cliente: ' + formatfloat('00000',qryAux.FieldByName('cod_cliente').AsInteger)+'-'+qryAux.FieldByName('nome_cli').AsString,0.3);
        SomaLinha(Sender as TBaseReport);
        fLinha(Sender as TBaseReport);
        SomaLinha(Sender as TBaseReport);
      end;
      Bold      := False;
      Underline := False;
      FontSize  := 8;
      ClearTabs;
      SetPen(clBlack,psClear,1,pmCopy);
      SetTab(0.4,pjLeft,  2.0,2,BOXLINEALL,0);
      SetTab(NA,pjCenter, 1.0,2,BOXLINEALL,0);
      SetTab(NA,pjCenter, 1.0,2,BOXLINEALL,0);
      SetTab(NA,pjLeft,   1.0,2,BOXLINEALL,0);

      printTab(formatfloat('00000',qryAux.FieldByName('cod_docto').AsInteger)+'-'+qryAux.FieldByName('desc_docto').AsString);
      printTab(formatdatetime('dd/mm/yyyy',qryAux.FieldByName('dt_vencto').AsDateTime));
      if not qryAux.FieldByName('dt_envio').IsNull then
        printtab( formatdatetime('dd/mm/yyyy',qryAux.FieldByName('dt_envio').AsDateTime))
      else
        printtab(''); 
      if qryAux.FieldByName('meio_envio').AsString <> '' then
        printTab(rgEnvio.Items[ChamaItem( qryAux.FieldByName('meio_envio').AsString, rgEnvio.Items)])
      else
        printTab('');

      MemoBuf            := TMemoBuf.Create;
      MemoBuf.PrintStart := 5.50;
      MemoBuf.PrintEnd   := 7.80;
      MemoBuf.BaseReport := (sender as TBaseReport);
      MemoBuf.Text       := qryAux.FieldByName('obs_obrigacao').AsString;
      MemoBuf.PrintLines(0,true);
      ClearColumns;
      MemoBuf.Free;

      {SomaLinha(Sender as TBaseReport);}
      qryAux.Next;
      if anomes <> qryAux.FieldByName('anomes_obr').AsString then
      begin
        fLinha(Sender as TBaseReport,2);
        SomaLinha(Sender as TBaseReport);
      end;
      if cod_cliente <> qryAux.FieldByName('cod_cliente').AsInteger then
        NewPage;
    end;
  end;
end;

procedure TGeraVencimento_f.BitBtn2Click(Sender: TObject);
begin
  inherited;
  vPag := 0;
  vTodos := not (messagedlg('Deseja imprimir apenas o cliente selecionado ?',mtConfirmation,[mbYes,mbNo],0) = idYes);
  rvSystem1.Execute;
end;

procedure TGeraVencimento_f.BitBtn6Click(Sender: TObject);
var vSql, vAnoMes : String;
    vCod          : Integer;
begin
  inherited;
  if esc then
  begin
    esc := False;
    exit;
  end;
  if rgEnvio.ItemIndex = -1 then
  begin
    messagedlg('É necessário informa o meio de envio.',mtWarning,[mbOk],0);
    exit;
  end;

  if dtEnvio.Text <> '  /  /    ' then
  begin
    vSql := 'UPDATE GC_OBRIGACOES SET DT_ENVIO = :DT_ENVIO, OBS_OBRIGACAO = :OBS_OBRIGACAO, MEIO_ENVIO = :MEIO_ENVIO WHERE cod_obr = :cod_obr and AnoMes_Obr = :AnoMes_Obr '+
            ' and cod_cliente = :Cod_Cliente';
    vCod    := qryObriga.fieldByName('COD_OBR').AsInteger;
    vAnoMes := qryObriga.fieldByName('ANOMES_OBR').AsString;
    qryAux.Close;
    qryAux.SQL.Text := vSql;
    qryAux.ParamByName('Cod_Obr').AsInteger      := qryObriga.fieldByName('COD_OBR').AsInteger;
    qryAux.ParamByName('AnoMes_Obr').AsString    := qryObriga.fieldByName('ANOMES_OBR').AsString;
    qryAux.ParamByName('Cod_Cliente').AsInteger  := qryObriga.fieldByName('COD_CLIENTE').AsInteger;
    qryAux.ParamByName('Dt_Envio').AsDateTime    := dtEnvio.Date;
    qryAux.ParamByName('Obs_Obrigacao').AsString := memoObs.Text;
    qryAux.ParamByName('meio_envio').AsString    := copy(rgEnvio.Items[rgEnvio.ItemIndex] ,1,1);
    qryAux.ExecSQL;
    medAnoExit(Sender);
    qryObriga.Locate('cod_obr;AnoMes_Obr',VarArrayOf([vCod,vAnoMes]),[loCaseInsensitive]);
    dbg.SetFocus;
  end
  else
  begin
    vSql := 'UPDATE GC_OBRIGACOES SET DT_ENVIO = :DT_ENVIO, OBS_OBRIGACAO = :OBS_OBRIGACAO, MEIO_ENVIO = :MEIO_ENVIO WHERE cod_obr = :cod_obr and AnoMes_Obr = :AnoMes_Obr '+
            ' and cod_cliente = :Cod_Cliente';
    vCod    := qryObriga.fieldByName('COD_OBR').AsInteger;
    vAnoMes := qryObriga.fieldByName('ANOMES_OBR').AsString;
    qryAux.Close;
    qryAux.SQL.Text := vSql;
    qryAux.ParamByName('Cod_Obr').AsInteger      := qryObriga.fieldByName('COD_OBR').AsInteger;
    qryAux.ParamByName('AnoMes_Obr').AsString    := qryObriga.fieldByName('ANOMES_OBR').AsString;
    qryAux.ParamByName('Cod_Cliente').AsInteger  := qryObriga.fieldByName('COD_CLIENTE').AsInteger;
    qryAux.ParamByName('Dt_Envio').DataType      := ftDateTime;
    qryAux.ParamByName('Dt_Envio').Value         := null;
    qryAux.ParamByName('Obs_Obrigacao').AsString := memoObs.Text;
    qryAux.ParamByName('meio_envio').AsString    := copy(rgEnvio.Items[rgEnvio.ItemIndex] ,1,1);
    qryAux.ExecSQL;
    medAnoExit(Sender);
    qryObriga.Locate('cod_obr;AnoMes_Obr',VarArrayOf([vCod,vAnoMes]),[loCaseInsensitive]);
    dbg.SetFocus;
  end;

end;

procedure TGeraVencimento_f.dbgCellClick(Column: TColumn);
begin
  inherited;

  if not qryObriga.FieldByName('dt_envio').IsNull then
    dtEnvio.Date := qryObriga.FieldByName('dt_envio').AsDateTime
  else
    dtEnvio.Clear;
  rgEnvio.ItemIndex := ChamaItem( qryObriga.FieldByName('meio_envio').AsString, rgEnvio.Items);
  memoObs.Text      := qryObriga.FieldByName('obs_obrigacao').AsString;
end;

end.
