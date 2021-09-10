unit LogOn_u;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Deriva_u, StdCtrls, Buttons, Menus, Db, DBTables, RxCalc, Registry, funcoes;

type
  TLogOn_f = class(TDeriva_f)
    btnOk: TBitBtn;
    edtNome: TEdit;
    edtSenha: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    qryAux: TQuery;
    procedure btnOkClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    log : Boolean;
  end;

var
  LogOn_f : TLogOn_f;
  Mostra  : Boolean;
implementation
uses principal, qrDocAssoc;

{$R *.DFM}

procedure TLogOn_f.btnOkClick(Sender: TObject);
var sSql : String;
begin
  inherited;
  Nivel    := 0;
  Cod_Func := 0;
  with qryAux do
  begin
    close;
    sql.clear;
    sql.add('SELECT * FROM GC_FUNCIONARIO WHERE ATIVO_FUNC <> ''N'' AND APELIDO_FUNC = ' + #39 + edtNome.Text + #39 );
    open;
    if eof then
    begin
      messagedlg('Usuário não cadastrado, tente outro nome',mtWarning,[mbOk],0);
      edtNome.SetFocus;
      exit;
    end;
    if edtSenha.Text <> FieldByName('senha_func').AsString then
    begin
      messagedlg('Senha não confere.',mtWarning,[mbOk],0);
      edtSenha.SetFocus;
      exit;
    end;
    Nivel      := FieldByName('nivel_func').AsInteger;
    Cod_Func   := FieldByName('cod_func').AsInteger;
    Cod_Depto  := FieldByName('cod_depto').AsInteger;
    EMail_Func := FieldByName('email_func').AsString;
    frmPrincipal.StatusBar1.Panels[2].Text := 'Usuário: ' + FieldByName('nome_func').AsString;
    Mostra     := False;
    frmPrincipal.Timer1Timer(self);

    Mostra     := (uppercase(LerIni(caminho+'Atendimento.ini','Identificacao','Pendencia')) = 'SIM');
    if (uppercase(LerIni(caminho+'Atendimento.ini','Identificacao','Aniversario')) <> 'NAO') then
    begin
      frmPrincipal.Aniversarios;
    end;

    if formatdatetime('dd/mm',FieldByName('dt_Nascimento').AsDateTime) = formatdatetime('dd/mm',date()) then
    begin
      frmPrincipal.MDIWallpaper1.Transparent := True;
      try
        frmPrincipal.MDIWallpaper1.Bitmap.LoadFromFile(caminho+'imagens\AberturaAniver.bmp');
      except
        try
          frmPrincipal.MDIWallpaper1.Bitmap.LoadFromFile(caminho+'AberturaAniver.bmp');
        except
        end;
      end;
      frmPrincipal.MDIWallpaper1.Transparent := False;
    end
    else
    begin
      frmPrincipal.MDIWallpaper1.Transparent := True;
      try
        if sistema = 'FINANCEIRO' THEN
          frmPrincipal.MDIWallpaper1.Bitmap.LoadFromFile(caminho+'imagens\AberturaFinan.bmp')
        else
          frmPrincipal.MDIWallpaper1.Bitmap.LoadFromFile(caminho+'imagens\AberturaAtendimento.bmp');
      except
        try
          if sistema = 'FINANCEIRO' THEN
            frmPrincipal.MDIWallpaper1.Bitmap.LoadFromFile(caminho+'AberturaFinan.bmp')
          else
            frmPrincipal.MDIWallpaper1.Bitmap.LoadFromFile(caminho+'AberturaAtendimento.bmp');
        except
        end;
      end;
      frmPrincipal.MDIWallpaper1.Transparent := False;
    end;
  end;
  if (obrigacao) and (sistema = 'ATENDIMENTO') then
  begin
    qrDocAssoc_f := TqrDocAssoc_f.Create(nil);
    sSql := 'SELECT * FROM EMISSAO_DOCTO  EMI '+
            ' LEFT  JOIN GC_CLIENTE       CLI ON (EMI.COD_CLIENTE = CLI.COD_CLIENTE) '+
            ' LEFT  JOIN GC_DOCUMENTO     DOC ON (EMI.COD_DOCTO   = DOC.COD_DOCTO)   '+
            ' INNER JOIN GC_DEPARTAMENTO  DEP ON (DOC.COD_DEPTO   = DEP.COD_DEPTO)   '+
            ' LEFT  JOIN gc_obrigacoes    OBR ON (OBR.COD_DOCTO   = EMI.cod_docto AND OBR.COD_CLIENTE = EMI.COD_CLIENTE) ';
    sSql := sSql + ' WHERE EMI.COD_CLIENTE >= 0';
    sSql := sSql + ' AND EMI.COD_DOCTO >= 0'+
    {sSql := sSql + ' AND OBR.DT_VENCTO >= ' + DataSql(date)+}
                   ' AND OBR.DT_VENCTO <= ' + DataSql(date+4);
    sSql := sSql + ' AND OBR.DT_ENVIO IS NULL ';
    sSql := sSql + ' ORDER BY CLI.NOME_CLI, EMI.COD_CLIENTE, OBR.DT_VENCTO, DEP.DESC_DEPTO, DOC.COD_DOCTO';
    qrDocAssoc_f.Query1.Close;
    qrDocAssoc_f.Query1.sql.Text := sSql;
    qrDocAssoc_f.Query1.Open;
    if not qrDocAssoc_f.Query1.eof then
      qrDocAssoc_f.Preview;
    qrDocAssoc_f.Query1.close;
    qrDocAssoc_f.Free;
  end;
  Log := True;
  frmPrincipal.MainMenu1.Items.Enabled       := Log;
  if Sistema = 'ATENDIMENTO' then
  begin
    frmPrincipal.Timer1.Enabled    := False;
    try
      frmPrincipal.Timer1.Interval := StrToInt(LerIni(caminho+'Atendimento.ini','Identificacao','Mensagem'))*1000;
    except
      frmPrincipal.Timer1.Interval := 60000;
    end;
    frmPrincipal.Timer1.Enabled    := True;
    frmPrincipal.Timer2.Enabled    := False;
    try
      frmPrincipal.Timer2.Interval := StrToInt(LerIni(caminho+'Atendimento.ini','Identificacao','Agenda'))*1000;
    except
      frmPrincipal.Timer2.Interval := 60000;
    end;
    frmPrincipal.Timer2.Enabled    := True;
  end;
  Close;
end;

procedure TLogOn_f.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if (not log) then
  begin
    Application.Terminate;
    exit;
  end;
  frmPrincipal.Timer1.Enabled := True;
  frmPrincipal.Timer2.Enabled := True;
end;

procedure TLogOn_f.FormShow(Sender: TObject);
var Data, vCnpj, vSenha  : String;
    vData : TDateTime;
    x     : Integer;
begin
  inherited;

  qryAux.close;
  qryAux.sql.Text := 'SELECT * FROM CON_CONFIGURA';
  qryAux.open;
  vCnpj := fString(qryAux.FieldByName('cpfcnpj_con').AsString, 14, '0', true);

(*  qryAux.close;
  qryAux.sql.Text := 'SELECT * FROM SEG_LIBERA';
  qryAux.open;

  if (formatdatetime('yyyymm',ExeDateTime) > copy(qryAux.fieldbyname('libera').asString, 7, 6)) or
     (copy(qryAux.fieldbyname('libera').asString, 1, 6) <> Senha_Mensal(strtodatetime('01/'+AnoMesToMesAno(copy(qryAux.fieldbyname('libera').asString, 7, 6),true)), vCnpj) ) then
  begin
    qryAux.close;
    qryAux.sql.Text := 'update SEG_LIBERA set status = ''*'' ';
    qryAux.ExecSQL;
  end;

  qryAux.close;
  qryAux.sql.Text := 'SELECT * FROM SEG_LIBERA';
  qryAux.open;
  {+Senha_Mensal(fDate(), vCnpj)}
  if (qryAux.fieldbyname('status').asString <> #255) or (formatdatetime('yyyymm',fDate()) > copy(qryAux.fieldbyname('libera').asString, 7, 6)) then
  begin
    vSenha := InputBox('Pedido de Senha Mes '+formatdatetime('mm/yyyy',fDate()), 'Senha: ', '');
    if vsenha = 'uniksistemas' then
    begin
      qryAux.close;
      qryAux.sql.Text := 'SELECT * FROM CON_CONFIGURA';
      qryAux.open;
      vCnpj := fString(qryAux.FieldByName('cpfcnpj_con').AsString, 14, '0', true);
      messagedlg('Senha do mes: ' + Senha_Mensal(fDate(), vCnpj)+#13#10+'Cnpj: '+vCnpj,mtInformation,[mbOk],0);
    end;

    if uppercase(vSenha) = Senha_Mensal(fDate(), vCnpj) then
    begin
      qryAux.close;
      qryAux.sql.Text := 'update SEG_LIBERA set libera = '+StringSql(Senha_Mensal(fDate(), vCnpj)+formatdatetime('yyyymm',fDate()))+
                         ', status = '''+#255+''' ';
      qryAux.ExecSQL;
      {frmPrincipal.IBTransaction1.CommitRetaining;}
    end
    else
    begin
      qryAux.close;
      qryAux.sql.Text := 'update SEG_LIBERA set status = ''*'' ';
      qryAux.ExecSQL;
      {frmPrincipal.IBTransaction1.CommitRetaining;}
      messagedlg('Senha do mes inválida entre em contato com a Uni-K Sistemas pelo '+#13+'E-Mail unikinfo@terra.com.br',mtInformation,[mbOk],0);
      application.Terminate;
      exit;
    end;
  end; *)

  qryAux.close;
  qryAux.sql.Text := 'SELECT * FROM SEG_LIBERA';
  qryAux.open;

  Libera := copy(qryAux.fieldbyname('libera').asString, 7, 6);
  
  if (formatdatetime('yyyymm',ExeDateTime) > copy(qryAux.fieldbyname('libera').asString, 7, 6)) or
     (copy(qryAux.fieldbyname('libera').asString, 1, 6) <> Senha_Mensal(strtodatetime('01/'+AnoMesToMesAno(copy(qryAux.fieldbyname('libera').asString, 7, 6),true)), vCnpj) ) then
  begin
    qryAux.close;
    qryAux.sql.Text := 'update SEG_LIBERA set status = ''*'' ';
    qryAux.ExecSQL;
  end;

  qryAux.close;
  qryAux.sql.Text := 'SELECT * FROM SEG_LIBERA';
  qryAux.open;
  {+Senha_Mensal(fDate(), vCnpj)}
  if (qryAux.fieldbyname('status').asString <> #255) or (formatdatetime('yyyymm',fDate()) > copy(qryAux.fieldbyname('libera').asString, 7, 6)) then
  begin
    vSenha := InputBox('Pedido de Senha Mes '+formatdatetime('mm/yyyy',fDate()), 'Senha: ', '');
    if trim(vSenha) = '' then
    begin
      application.Terminate;
      exit;
    end;
    if vsenha = 'uniksistemas' then
    begin
      qryAux.close;
      qryAux.sql.Text := 'SELECT * FROM CON_CONFIGURA';
      qryAux.open;
      vCnpj := fString(qryAux.FieldByName('cpfcnpj_con').AsString, 14, '0', true);
      messagedlg('Senha do mes: ' + Senha_Mensal(fDate(), vCnpj)+#13#10+'Cnpj: '+vCnpj,mtInformation,[mbOk],0);
      application.Terminate;
      exit;
    end;
    if length(trim(vSenha)) > 6 then
    begin
      try
        ultimodia(StrToDateTime('01/'+anomestomesano(copy(vSenha,1,6),true)));
      except
        application.Terminate;
        exit;
      end;
    end;

    if (uppercase(vSenha) = Senha_Mensal(fDate(), vCnpj)) and (length(vSenha)=6) then
    begin
      qryAux.close;
      qryAux.sql.Text := 'update SEG_LIBERA set libera = '+StringSql(Senha_Mensal(fDate(), vCnpj)+formatdatetime('yyyymm',fDate()))+
                         ', status = '''+#255+''' ';
      qryAux.ExecSQL;
      {frmPrincipal.IBTransaction1.CommitRetaining;}
    end
    else if (uppercase(vSenha) = Senha_Mensal(StrToDateTime('31/12/9999'), vCnpj)) then
    begin
      qryAux.close;
      qryAux.sql.Text := 'update SEG_LIBERA set libera = '+StringSql(Senha_Mensal(StrToDateTime('31/12/9999'), vCnpj)+'999912')+
                         ', status = '''+#255+''' ';
      qryAux.ExecSQL;
      //frmPrincipal.IBTransaction1.CommitRetaining;
    end
    else if (uppercase(copy(vSenha,7,6)) = Senha_Mensal(ultimodia(StrToDateTime('01/'+anomestomesano(copy(vSenha,1,6),true))), vCnpj)) then
    begin
      qryAux.close;
      qryAux.sql.Text := 'update SEG_LIBERA set libera = '+StringSql(Senha_Mensal(ultimoDia(StrToDateTime('01/'+anomestomesano(copy(vSenha,1,6),true))), vCnpj)+copy(vSenha,1,6))+
                         ', status = '''+#255+''' ';
      qryAux.ExecSQL;
      {frmPrincipal.IBTransaction1.CommitRetaining;}
    end
    else
    begin
      qryAux.close;
      qryAux.sql.Text := 'update SEG_LIBERA set status = ''*'' ';
      qryAux.ExecSQL;
      //frmPrincipal.IBTransaction1.CommitRetaining;
      messagedlg('Senha do mes inválida entre em contato com a Uni-K Sistemas pelo '+#13+'E-Mail unikinfo@terra.com.br',mtInformation,[mbOk],0);
      application.Terminate;
      exit;
    end;
  end;

  if (libera = '999912') then
    for x := 0 to frmPrincipal.ComponentCount-1 do
      if (frmPrincipal.Components[x] is TMenuItem) and (TMenuItem(frmPrincipal.Components[x]).Tag = 1) then
          TMenuItem(frmPrincipal.Components[x]).Enabled := False;

  Cor  := UpperCase(LerIni(caminho+'Atendimento.ini', 'Identificacao','Cor')) = 'SIM';

  if (paramStr(0) <> '') and (paramStr(1) <> '') then
  begin
    edtNome.Text  := paramStr(1);
    edtSenha.Text := paramStr(2);
    btnOk.Click;
  end;

end;

procedure TLogOn_f.FormCreate(Sender: TObject);
begin
  inherited;
  {MudaFont(Self);}
  frmPrincipal.Timer1.Enabled := False;
  frmPrincipal.Timer2.Enabled := False;
end;

end.
