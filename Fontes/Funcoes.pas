unit Funcoes;

interface
uses inifiles, sysutils, IBQuery, classes, messages, dialogs, Mask, dbTables, rpBase, Graphics;

Function LerIni(vArquivoIni,vSecao,vChave: String): String;
Procedure GravarIni(vArquivoIni,vSecao,vChave,vValor: String);
Function Proximo(Tabela,Campo:String; Condicao:String=''; pBDE:Boolean=False): Integer;
function Proximobde(Tabela, Campo : String; Condicao : String='') : Integer;
function AnoBisexto (Ano: Word): boolean;
function UltimoDia (Data: TDateTime): TDateTime;
function CalculaCnpjCpf(Num : String) : Boolean;
function DataSql(pData: TDateTime) : String;
function StringSql(pStr: String ) : String;
function NumeroSql(pNumero: Double; pcasas : Integer = 2  ) : String;
function fString(pStr:String; tam:integer; pCaracter:String=' '; Direita:Boolean=False):String;
function TrataGrupo(const S: String): String;
function ValorExtenso( pValor : Double; TipoTexto: Integer) : String;
procedure DiaHora_dif(var ResDia, ResHora: String; DiaHoraIn, DiaHoraFin: TDateTime);
function DiasUteis(pDias:integer; pData:TDateTime): TDateTime;
function DiaUtil(pData:TDateTime): Boolean;
Function ConsisteInscEst(const InscEst: ShortString): Boolean;
Function truncar(pValor:Double;pCasas:Integer):Double;
Function arredonda(pValor:Double;pCasas:Integer):Double;
procedure StrToChar(pStr:String; var pConteudo:array of char);
function DataExtenso(pDat:TDateTime):String;
function AnoMesExtenso(pDat:String):String;
function GetFileDate(Arquivo: String): String;
function ExeDateTime: TDateTime;
function Descriptografa(vString : String) : String;
function Criptografa(vString : String) : String;
procedure SomaLinha(Rel: TBaseReport);
Procedure fLinha(Rel: TBaseReport; Tipo:SmallInt=1);
function ChamaItem(pChave:String; pItens:TStrings; pTudo : Boolean = False):Integer;
function tirafim(pStr : String) : String;
function iif(pCondicao:Boolean;pVerdadeiro, pFalso : String ): String;  overload;
function iif(pCondicao:Boolean;pVerdadeiro, pFalso : Integer ): Integer ; overload;
function iif(pCondicao:Boolean;pVerdadeiro, pFalso : Double ): Double; overload;
{function iif(pCondicao:Boolean;pVerdadeiro, pFalso : TDateTime ): TDateTime; overload;}
function MesAnoToAnoMes(pMesAno: String): String;
function AnoMesToMesAno(pAnoMes: String; pRetComBarra: Boolean = False): String;
function SomaMes(pAnoMes:String;pSoma:SmallInt=1): String;
function senha_mensal(datt : TDateTime; codisys: String) : String;
function fDate(): TDateTime;
function fNow(): TDateTime;
function DigitosCnpj(Num : String) : String;


var
Nivel          : Integer;
Cod_Func       : Integer;
Cod_Depto      : Integer;
EMail_Func     : String;
Libera         : String;
esc            : Boolean;
const cr : string = #13#10;

implementation
uses principal;

Function LerIni(vArquivoIni,vSecao,vChave: String): String;
var
  iniFile : TIniFile;
begin
  vArquivoIni := vArquivoIni;
  iniFile := TIniFile.Create(vArquivoIni);
  Result  := iniFile.ReadString(vSecao,vChave,'');
  iniFile.Free;
end;

Procedure GravarIni(vArquivoIni,vSecao,vChave,vValor: String);
var
  iniFile : TIniFile;
begin
  vArquivoIni := vArquivoIni;
  iniFile := TIniFile.Create(vArquivoIni);
  iniFile.WriteString(vSecao,vChave,vValor);
  iniFile.Free;
end;

function Proximo(Tabela, Campo: String; Condicao:String=''; pBDE:Boolean=False): Integer;
var vStr : String;
begin
  if not pBDE then
  begin
    with TIBQuery.Create(Nil) do
    begin
      Database := frmPrincipal.db;
      vStr := '';
      if condicao <> '' then
        vStr := ' WHERE ' + condicao;
      Sql.Text := 'SELECT MAX(' + CAMPO + ') AS CODIGO FROM '+ TABELA +
                  vStr;
      Open;
      if FieldByName('Codigo').AsString = '' then
        result := 1
      else
        result := FieldByName('Codigo').AsInteger + 1;
    end;
  end
  else
  begin
    with TQuery.Create(Nil) do
    begin
      DatabaseName := 'db';
      vStr := '';
      if condicao <> '' then
        vStr := ' WHERE ' + condicao;
      Sql.Text := 'SELECT MAX(' + CAMPO + ') AS CODIGO FROM '+ TABELA +
                  vStr;
      Open;
      if FieldByName('Codigo').AsString = '' then
        result := 1
      else
        result := FieldByName('Codigo').AsInteger + 1;
    end;
  end;
end;

function Proximobde(Tabela, Campo : String; Condicao : String='') : Integer;
var vStr : String;
begin
  with TQuery.Create(Nil) do
  begin
    DatabaseName := 'db';
    vStr := '';
    if condicao <> '' then
      vStr := ' WHERE ' + condicao;
    Close;
    Sql.Text := 'SELECT MAX(' + CAMPO + ') AS CODIGO FROM '+ TABELA +
                vStr;
    Open;
    if FieldByName('Codigo').AsString = '' then
      result := 1
    else
      result := FieldByName('Codigo').AsInteger + 1;
  end;
end;

function AnoBisexto (Ano: Word): boolean;
begin
  Result := ((Ano mod 4 = 0) and (Ano mod 100 <> 0)) or (Ano mod 400 = 0);
end;

function UltimoDia (Data: TDateTime): TDateTime;
var a,m,d:word;
begin

  decodedate( Data, a, m, d);

  d := 31;

  if (m = 4) or (m = 6) or (m = 9) or (m = 11) then
    d := 30;

  if (m = 2) then
    if (AnoBisexto (a))
      then d := 29
      else d := 28;
  result := enCodeDate(a,m,d);
end;

function CalculaCnpjCpf(Num : String) : Boolean;
var
  CNPJ : Boolean;
  n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12: integer;
  d1,d2: integer;
  digitado, calculado: string;
begin
  Result := False;
  case Length(Num) of
    11 : CNPJ := False;
    14 : CNPJ := True;
  else
    Exit;
  end;
  if CNPJ then
  begin
    n1  := StrToInt(num[1]);
    n2  := StrToInt(num[2]);
    n3  := StrToInt(num[3]);
    n4  := StrToInt(num[4]);
    n5  := StrToInt(num[5]);
    n6  := StrToInt(num[6]);
    n7  := StrToInt(num[7]);
    n8  := StrToInt(num[8]);
    n9  := StrToInt(num[9]);
    n10 := StrToInt(num[10]);
    n11 := StrToInt(num[11]);
    n12 := StrToInt(num[12]);
    d1  := n12*2+n11*3+n10*4+n9*5+n8*6+n7*7+n6*8+n5*9+n4*2+n3*3+n2*4+n1*5;
    d1  := 11-(d1 mod 11);
    if d1 >= 10 then d1 := 0;
    d2  := d1*2+n12*3+n11*4+n10*5+n9*6+n8*7+n7*8+n6*9+n5*2+n4*3+n3*4+n2*5+n1*6;
    d2  := 11-(d2 mod 11);
    if d2 >= 10 then d2 := 0;
    calculado := inttostr(d1)+inttostr(d2);
    digitado  := num[13]+num[14];
    if calculado = digitado then
      Result := true
    else
      Result := false;
  end
  else
  begin
    n1 := StrToInt(num[1]);
    n2 := StrToInt(num[2]);
    n3 := StrToInt(num[3]);
    n4 := StrToInt(num[4]);
    n5 := StrToInt(num[5]);
    n6 := StrToInt(num[6]);
    n7 := StrToInt(num[7]);
    n8 := StrToInt(num[8]);
    n9 := StrToInt(num[9]);
    d1 := n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
    d1 := 11-(d1 mod 11);
    if d1 >= 10 then d1 := 0;
    d2 := d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
    d2 := 11-(d2 mod 11);
    if d2 >= 10 then d2 := 0;
    calculado := inttostr(d1)+inttostr(d2);
    digitado  := num[10]+num[11];
    if calculado = digitado then
      result := true
    else
      result := false;
  end;
end;

function DataSql(pData: TDateTime) : String;
begin
  result := #39 + formatdatetime('yyyy-mm-dd', pData) + #39;
end;

function StringSql(pStr: String ) : String;
begin
  result := #39 + trim(pStr) + #39;
end;

function NumeroSql(pNumero: Double; pcasas : Integer = 2 ) : String;
var x : Integer;
    vMasc : String;
    vCasas: Integer;
begin
  vCasas := pCasas;
  if pCasas < 1 then vCasas := 2;
  vMasc := '0.0';
  for x := 1 to pCasas - 1 do vMasc := vMasc + '0';

  if pNumero > 0 then
    result := floattostr(trunc(pNumero))+'.'+copy(formatfloat(vMasc, frac(pNumero)),3,vCasas)
  else
    result := 'null';

end;

function fString(pStr:String; tam:integer; pCaracter:String=' '; Direita:Boolean=False):String;
var x:Integer;
   vStr:String;
begin
  {insere dados na linha}
  vStr := pStr;
  if direita then
    for x := 1 to tam - length(vStr) do vStr := pCaracter + vStr
  else
    for x := 1 to tam - length(vStr) do vStr := vStr + pCaracter;

  result := copy(vStr,1,tam);
end;

{ Valor por Extenso }
function ValorExtenso( pValor : Double; TipoTexto: Integer) : String;
var
  Lst: TStringList;
  I,J: Integer;
  Aux: String;
  Grupo: String;
  MoedaPlural   : String;
  MoedaSingular : String;
  IndGrupo: Integer;
  Truncado: Longint;
begin
  Lst := nil;
  Result := '';
  MoedaPlural   := 'Reais';
  MoedaSingular := 'Real';
  try
    if pValor = 0.0 then
    begin
      Result := 'ZERO ' + MoedaPlural;
      Exit;
    end;
    Lst := TStringList.Create;
    Grupo := '';
    Aux := FormatFloat('#,##0.00', pValor);

    // separa em grupos
    for I := 1 to Length(Aux) do
      if (Aux[I] = '.') or (Aux[I] = ',') then
      begin
        Lst.Add(Grupo);
        Grupo := '';
      end
      else
        Grupo := Grupo + Aux[I];
    Lst.Add(Grupo); // inclui o ultimo grupo

    // trata os bilhoes
    I := 0;
    if Lst.Count > 4 then
    begin
      Result := TrataGrupo(Lst[I]);
      if StrToInt(Lst[I]) = 1 then
        Result := Result + ' BILHÃO'
      else
        Result := Result + ' BILHÕES';
      Inc(I);
    end;

    // trata os milhoes
    if (Lst.Count > 3) then
    begin
      if StrToInt(Lst[I]) <> 0 then
      begin
        if Length(Result) > 0 then
          Result := Result + ', ';
        Result := Result + TrataGrupo(Lst[I]);
        if StrToInt(Lst[I]) = 1 then
          Result := Result + ' MILHÃO'
        else
          Result := Result + ' MILHÕES';
      end;
      Inc(I);
    end;

    // trata os milhares
    if Lst.Count > 2 then
    begin
      if StrToInt(Lst[I]) <> 0 then
      begin
        if Length(Result) > 0 then
          Result := Result + ', ';
        Result := Result + TrataGrupo(Lst[I]);
        Result := Result + ' MIL';
      end;
      Inc(I);
    end;

    // trata as unidades
    if StrToInt(Lst[I]) > 0 then
    begin
      if Length(Result) > 0 then
        Result := Result + ' E ';
      Result := Result + TrataGrupo(Lst[I]);
    end;
    Truncado := Trunc(pValor);
    if Truncado = 1 then
      Result := Result + ' ' + MoedaSingular
    else if (Truncado = 1000000) or
            (Truncado = 10000000) or
            (Truncado = 100000000) or
            (Truncado = 1000000000) then
      Result := Result + ' DE ' + MoedaPlural
    else if Truncado <> 0 then
      Result := Result + ' ' + MoedaPlural;
    Inc(I);

    // trata os centavos
    if StrToInt(Lst[I]) = 0 then
      Exit;
    if Truncado > 0 then
      Result := Result + ' E ';
    Result := Result + TrataGrupo(Lst[I]);
    if StrToInt(Lst[I]) = 1 then
      Result := Result + ' ' + 'CENTAVO'
    else
      Result := Result + ' ' + 'CENTAVOS';
    if Truncado = 0 then
      Result := Result + ' DE ' + MoedaSingular;

  finally
    // trata tipo texto
    if TipoTexto = 0 then
      Result := AnsiUpperCase(Result)
    else
    If TipoTexto = 1 Then
      Result := AnsiLowerCase(Result)
    Else
      Begin
        J   := 1;
        Aux := AnsiLowerCase(Result);
        Result := '';
        For I := 1 To Length( Aux ) Do
          If Aux[I] = ' ' Then
            If ( I - J > 1 ) Or ( J = 1 ) Then
              Begin
                Result := Result + AnsiUpperCase( Copy( Aux, J, 1 ) );
                Inc( J );
                Result := Result + Copy( Aux, J, ( I + 1 ) - J );
                J := I + 1;
              End
            Else
              Begin
                Result := Result + Copy( Aux, J, ( I + 1 ) - J );
                J := I + 1;
              End    ;
        If ( ( J < Length( Aux ) ) And ( I - J > 1 ) ) Or ( J = 1 ) Then
          Begin
            Result := Result + AnsiUpperCase( Copy( Aux, J, 1 ) );
            Inc( J );
            Result := Result + Copy( Aux, J, ( I + 1 ) - J );
          End
      End;
    if Lst <> nil then
      Lst.Free;
  end;
end;

function TrataGrupo(const S: String): String;
const
  Num1a19: array [1..19] of String = (
    'UM', 'DOIS', 'TRÊS', 'QUATRO', 'CINCO',
    'SEIS', 'SETE', 'OITO', 'NOVE', 'DEZ',
    'ONZE', 'DOZE', 'TREZE', 'CATORZE', 'QUINZE',
    'DEZESSEIS', 'DEZESSETE', 'DEZOITO', 'DEZENOVE');

  Num10a90: array [1..9] of String = (
    'DEZ', 'VINTE', 'TRINTA', 'QUARENTA', 'CINQUENTA',
    'SESSENTA', 'SETENTA', 'OITENTA', 'NOVENTA');

  Num100a900: array [1..9] of String = (
    'CENTO', 'DUZENTOS', 'TREZENTOS', 'QUATROCENTOS', 'QUINHENTOS',
    'SEISCENTOS', 'SETECENTOS', 'OITOCENTOS', 'NOVECENTOS');
var
  N: Integer;
  Tam: Integer;
  Aux: String;

  function Trata0a99(const S: String; N: Integer): String;
  begin
    case N of
      0:
        Result := '';
      1..19:
        Result := Num1a19[N];
      20..99:
      begin
        Result := Num10a90[Ord(S[1]) - Ord('0')];
        if S[2] <> '0' then
          Result := Result + ' E ' + Num1a19[Ord(S[2]) - Ord('0')];
      end;
    end;
  end;

  function Trata101a999(const S: String; N: Integer): String;
  var
    Aux: String[3];
  begin
    Result := Num100a900[Ord(S[1]) - Ord('0')];
    if (S[2] <> '0') or (S[3] <> '0') then
    begin
      Aux := Copy(S, 2, 2);
      Result := Result + ' E ' + Trata0a99(Aux, StrToInt(Aux));
    end;
  end;

begin
  N := StrToInt(S);
  case N of
    0..99: Result := Trata0a99(IntToStr(N), N);
    100: Result := 'CEM';
    101..999: Result := Trata101a999(S, N);
  end;
end;

procedure DiaHora_dif(var ResDia, ResHora: String; DiaHoraIn, DiaHoraFin: TDateTime);
var
  DHI, DHF: String;
  DiaI, DiaF, HoraI, HoraF: String;
begin
  DHI := formatdatetime('dd/mm/yyyy hh:nn:ss',DiaHoraIn);
  DHF := formatdatetime('dd/mm/yyyy hh:nn:ss',DiaHoraFin);
  DiaI := Copy(DHI, 1,10);
  DiaF := Copy(DHF, 1,10);
  HoraI := Copy(DHI, 12,5);
  HoraF := Copy(DHF, 12,5);
  if (DiaHoraIn <= DiaHoraFin) then
  begin
    if (StrToTime(HoraI) <= StrToTime(HoraF)) then
    begin
      ResDia  := FloatToStr(StrToDateTime(DiaF) - StrToDateTime(DiaI));
      ResHora := formatdatetime('hh:nn:ss', StrToTime(HoraF) - StrToTime(HoraI));
    end
    else
    begin
      ResDia  := FloatToStr(StrToDateTime(DiaF) - StrToDateTime(DiaI) -1);
      ResHora := formatdatetime('hh:nn:ss', StrToTime(HoraF) - StrToTime(HoraI)+ 24);
    end;
  end
  else
  begin
    ResDia    := '';
    ResHora   := '';
  end;
end;

function DiasUteis(pDias:integer; pData:TDateTime): TDateTime;
var x, y : integer;
begin
  with TQuery.Create(Nil) do
  begin
    DatabaseName := 'db';
    x := 0;
    y := 0;
    while true do
    begin
      if dayofweek(pData+y) > 1 then
      begin
        close;
        Sql.Text := 'SELECT DT_FERIADO FROM GC_FERIADO WHERE DT_FERIADO = '+DataSql(pData+y);
        open;
        if eof then
        begin
          inc(x);
        end;
      end;
      if x > pDias then
      begin
        result := pData+y;
        break;
      end;
      inc(y);
    end;
  end;
end;

function DiaUtil(pData:TDateTime): Boolean;
var x, y : integer;
begin
  with TQuery.Create(Nil) do
  begin
    DatabaseName := 'db';
    x := 0;
    y := 0;
    result := True;
    if dayofweek(pData) > 1 then
    begin
      close;
      Sql.Text := 'SELECT DT_FERIADO FROM GC_FERIADO WHERE DT_FERIADO = '+DataSql(pData);
      open;
      if eof then
        result := True
      else
        result := False;
    end
    else
    begin
      result := False;
    end;
  end;
end;

Function ConsisteInscEst(const InscEst: ShortString): Boolean;
var
  tmpInsc: ShortString;
  tmpSoma: ShortString;
  Calculo, Resto: Integer;
  i, m, n: Byte;
  DV1, DV2: Byte;
begin
  Result := True;
  if InscEst = '' then Exit;

  // Cálculo do primeiro dígito verificador
  tmpInsc := Copy(InscEst, 1, 3) + '0' + Copy(InscEst, 4, 8);
  n := Length(tmpInsc);
  m := 1;
  tmpSoma := '';
  for i := 1 to n do begin
    tmpSoma := tmpSoma + IntToStr(StrToInt(tmpInsc[i]) * m);
    Inc(m);
    if m > 2 then m := 1;
  end;
  Calculo := 0;
  for i := 1 to Length(tmpSoma) do
    Calculo := Calculo + StrToInt(tmpSoma[i]);
  m := ((Calculo div 10) + 1) * 10;
  DV1 := m - Calculo;

  // Cálculo do primeiro dígito verificador
  tmpInsc := Copy(InscEst, 1, 3) + Copy(InscEst, 4, 8) + IntToStr(DV1);
  n := Length(tmpInsc);
  m := 2;
  Calculo := 0;
  for i := n downto 1 do begin
    Calculo := Calculo + (StrToInt(tmpInsc[i]) * m);
    Inc(m);
    if m > 11 then m := 2;
  end;
  Resto := Calculo mod 11;
  if (Resto = 0) or (Resto = 1) then
    DV2 := 0
  else
    DV2 := 11 - Resto;

  // compara os dígitos
  Result := (StrToInt(InscEst[12]) = DV1) and (StrToInt(InscEst[13]) = DV2);
  {if not Result then
    messageDlg('A Inscrição Estadual "' +
      FormatMaskText('999\.999\.999\/9999;0; ', InscEst) + '" é inválida.',mtWarning,[mbOk],0);}

end;

Function truncar(pValor:Double;pCasas:Integer):Double;
begin
  result := trunc(pValor)+strtofloat(copy(formatfloat('0.000000000000',frac(pValor)),1,pCasas+2));
end;

Function arredonda(pValor:Double;pCasas:Integer):Double;
begin
  result := trunc(pValor)+
            strtofloat( formatfloat(copy('0.000000000000',1,pCasas+2) ,frac(pValor)));
end;

procedure StrToChar(pStr:String; var pConteudo:array of char);
var x:integer;
begin
  for x := 1 to length(pConteudo) do
  begin
    pConteudo[x-1] := pStr[x];
  end;
end;

function DataExtenso(pDat:TDateTime):String;
begin
  result := '';
  case strtoint(formatdatetime('mm',pDat)) of
    1 : result := formatdatetime('dd',pDat)+' de Janeiro de '+formatdatetime('yyyy',pDat);
    2 : result := formatdatetime('dd',pDat)+' de Fevereiro de '+formatdatetime('yyyy',pDat);
    3 : result := formatdatetime('dd',pDat)+' de Março de '+formatdatetime('yyyy',pDat);
    4 : result := formatdatetime('dd',pDat)+' de Abril de '+formatdatetime('yyyy',pDat);
    5 : result := formatdatetime('dd',pDat)+' de Maio de '+formatdatetime('yyyy',pDat);
    6 : result := formatdatetime('dd',pDat)+' de Junho de '+formatdatetime('yyyy',pDat);
    7 : result := formatdatetime('dd',pDat)+' de Julho de '+formatdatetime('yyyy',pDat);
    8 : result := formatdatetime('dd',pDat)+' de Agosto de '+formatdatetime('yyyy',pDat);
    9 : result := formatdatetime('dd',pDat)+' de Setembro de '+formatdatetime('yyyy',pDat);
    10 : result := formatdatetime('dd',pDat)+' de Outubro de '+formatdatetime('yyyy',pDat);
    11 : result := formatdatetime('dd',pDat)+' de Novembro de '+formatdatetime('yyyy',pDat);
    12 : result := formatdatetime('dd',pDat)+' de Dezembro de '+formatdatetime('yyyy',pDat);
  end;
end;

function AnoMesExtenso(pDat:String):String;
begin
  result := '';
  case strtoint(copy(pDat,5,2)) of
    1 : result  := 'Jan/'+copy(pDat,1,4);
    2 : result  := 'Fev/'+copy(pDat,1,4);
    3 : result  := 'Mar/'+copy(pDat,1,4);
    4 : result  := 'Abr/'+copy(pDat,1,4);
    5 : result  := 'Mai/'+copy(pDat,1,4);
    6 : result  := 'Jun/'+copy(pDat,1,4);
    7 : result  := 'Jul/'+copy(pDat,1,4);
    8 : result  := 'Ago/'+copy(pDat,1,4);
    9 : result  := 'Set/'+copy(pDat,1,4);
    10 : result := 'Out/'+copy(pDat,1,4);
    11 : result := 'Nov/'+copy(pDat,1,4);
    12 : result := 'Dez/'+copy(pDat,1,4);
  end;
end;

function GetFileDate(Arquivo: String): String;
var FHandle: integer;
begin
  FHandle := FileOpen(Arquivo, fmShareCompat);
  try
    Result := DateTimeToStr(FileDateToDateTime(FileGetDate(FHandle)));
  finally
    FileClose(FHandle);
  end;
end;

function ExeDateTime: TDateTime;
begin
  Result := FileDateToDateTime(FileAge(ParamStr(0)));
end;

function Criptografa(vString : String) : String;
var I,C : Integer;
begin
  vString := Trim(vString);
  Result  := '';
  c       := 48;
  for I := 1 to Length(vString) do
  begin
    if ( ord(vString[I]) + I  > 255 ) Then
      Result := Result + formatfloat('000',ord( vString[I])) + Chr(C)
    else
      Result := Result + Formatfloat('000',ord(vString[I])+ I) + Chr(C);
    inc(c);
    if c > 57 then
      c  := 48;
  end;
end;

function Descriptografa(vString : String) : String;
var I,C : Integer;
begin
  vString := Trim(vString);
  Result  := '';
  C       := 1;
  I       := 1;
  while I <= Length(vString) do
  begin
    Result := Result + Chr( StrToInt(copy(vString,I,3)) - C );
    inc(c);
    I := I + 4;
  end;
  Descriptografa := Result;
end;

procedure SomaLinha(Rel: TBaseReport);
begin
  with rel do
  begin
    CrLf;
    if (PageHeight) <= LineMiddle+0.3 then
      NewPage;
  end;
end;

Procedure fLinha(Rel: TBaseReport; Tipo:SmallInt=1);
begin
  With Rel do
  begin
    SaveTabs(999);
    ClearTabs;
    case tipo of
      1 : SetPen(clBlack,psSolid,1,pmCopy);
      2 : SetPen(clBlack,psDash,1,pmCopy);
      3 : SetPen(clBlack,psDot,1,pmCopy);
      4 : SetPen(clBlack,psDashDot,1,pmCopy);
      5 : SetPen(clBlack,psDashDotDot,1,pmCopy);
    else
      SetPen(clBlack,psSolid,1,pmCopy);
    end;
    MoveTo( 0.01, LineMiddle );
    LineTo( PageWidth-0.01, LineMiddle );
    RestoreTabs(999);
  end;
end;

function ChamaItem(pChave:String; pItens:TStrings; pTudo : Boolean = False):Integer;
var x : integer;
begin
  result := -1;
  if trim(uppercase(pChave)) = '' then
    exit;
  for x := 0 to pItens.Count-1 do
  begin
    if pTudo then
    begin
      if trim(uppercase(pChave)) = trim(uppercase(pItens[x])) then
        result := x;
    end
    else
    begin
      if trim(uppercase(pChave)) = trim(uppercase(copy(pItens[x],1,length(pChave)))) then
        result := x;
    end;
  end;
end;

function tirafim(pStr : String) : String;
begin
  result := pStr;
  while pos(#13, result) > 0 do
    delete(result, pos(#13, result), 1);
  while pos(#10, result) > 0 do
    delete(result, pos(#10, result), 1);
end;

function iif(pCondicao:Boolean;pVerdadeiro, pFalso : String ): String;
begin
  if pCondicao then
    Result := pVerdadeiro
  else
    Result := pFalso;
end;

function iif(pCondicao:Boolean;pVerdadeiro, pFalso : Integer ): Integer;
begin
  if pCondicao then
    Result := pVerdadeiro
  else
    Result := pFalso;
end;

function iif(pCondicao:Boolean;pVerdadeiro, pFalso : Double ): Double;
begin
  if pCondicao then
    Result := pVerdadeiro
  else
    Result := pFalso;
end;

function SomaMes(pAnoMes:String;pSoma:SmallInt=1): String;
var vAno, vMes : String;
    vCont      : Integer;
    vAte       : Integer;
begin
  vAno := copy(pAnoMes,1,4);
  vMes := copy(pAnoMes,5,2);

  vAte := pSoma;
  if pSoma < 0 then
  begin
    vAte := pSoma * -1;
  end;

  for vCont := 1 to vAte do
  begin
    if pSoma < 0 then
    begin
      if vMes = '01' then
      begin
        vMes := '12';
        vAno := formatfloat('0000',StrToInt(vAno)-1);
      end
      else
      begin
        vMes := formatfloat('00',StrToInt(vMes)-1);
        vAno := formatfloat('0000',StrToInt(vAno));
      end;
    end
    else
    begin
      if vMes = '12' then
      begin
        vMes := '01';
        vAno := formatfloat('0000',StrToInt(vAno)+1);
      end
      else
      begin
        vMes := formatfloat('00',StrToInt(vMes)+1);
        vAno := formatfloat('0000',StrToInt(vAno));
      end;
    end;
  end;
  result := vAno+vMes;
end;

function AnoMesToMesAno(pAnoMes: String; pRetComBarra: Boolean = False): String;
begin
  result := copy(pAnoMes,5,2)+copy(pAnoMes,1,4);
  if pRetComBarra then
    result := copy(pAnoMes,5,2)+'/'+copy(pAnoMes,1,4);
end;

function MesAnoToAnoMes(pMesAno: String): String;
begin
  result := copy(pMesAno,3,4) + copy(pMesAno,1,2);
end;

function senha_mensal(datt : TDateTime; codisys: String) : String;
var v_codcli, v_pass   : Double;
    v_mes, v_ano       : Integer;
    x                          : String;
    dig01, dig02, dig03, dig04, dig05, dig06 : String;
    vdig01, vdig02, vdig03, vdig04, vdig05, vdig06 : Integer;
begin
  v_codcli := StrToFloat(codisys);
  v_mes    := StrToInt(formatdatetime('mm',datt));
  v_ano    := StrToInt(formatdatetime('yyyy',datt));

  v_pass   := (v_codcli * v_mes) / v_ano;
  v_pass   := v_pass - trunc(v_pass);
  v_pass   := v_pass * 10000;
  v_pass   := Trunc(v_pass);
  x        := formatfloat('000000', v_pass);

  dig01    := copy(x,1,1);
  dig02    := copy(x,2,1);
  dig03    := copy(x,3,1);
  dig04    := copy(x,4,1);
  dig05    := copy(x,5,1);
  dig06    := copy(x,6,1);

  vdig01   := StrToInt(copy(x,1,1));
  vdig02   := StrToInt(copy(x,2,1));
  vdig03   := StrToInt(copy(x,3,1));
  vdig04   := StrToInt(copy(x,4,1));
  vdig05   := StrToInt(copy(x,5,1));
  vdig06   := StrToInt(copy(x,6,1));

  if trunc(v_mes/2) = (v_mes/2) then
      result := dig01+chr(70+vdig02)+dig03+chr(75+vdig04)+dig05+chr(80+vdig06)
  else
      result := chr(70+vdig01)+dig02+chr(75+vdig03)+dig04+dig05+chr(80+vdig06);
end;

function fNow(): TDateTime;
begin
  try
    with TIBQuery.Create(Nil) do
    begin
      Database := frmPrincipal.db;
      close;
      Sql.Text := 'SELECT current_timestamp AS PDATA FROM RDB$DATABASE';
      open;
      result := fieldbyname('pData').AsDateTime;
    end;
  except
    with TQuery.Create(Nil) do
    begin
      DataBaseName := 'db';
      close;
      Sql.Text := 'SELECT current_timestamp AS PDATA FROM RDB$DATABASE';
      open;
      result := fieldbyname('pData').AsDateTime;
    end;
  end;
end;

function fDate(): TDateTime;
begin
  try
    with TIBQuery.Create(Nil) do
    begin
      Database := frmPrincipal.db;
      close;
      Sql.Text := 'SELECT current_TimeStamp as PDATA FROM RDB$DATABASE';
      open;
      result := trunc(fieldbyname('pData').AsDateTime);
    end;
  except
    with TQuery.Create(Nil) do
    begin
      DataBaseName := 'db';
      close;
      Sql.Text := 'SELECT current_TimeStamp AS PDATA FROM RDB$DATABASE';
      open;
      result := trunc(fieldbyname('pData').AsDateTime);
    end;
  end;
end;

function DigitosCnpj(Num : String) : String;
var
  n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12: integer;
  d1,d2: integer;
  calculado: string;
begin
    if Length(num) <> 12 then Exit;

    n1  := StrToInt(num[1]);
    n2  := StrToInt(num[2]);
    n3  := StrToInt(num[3]);
    n4  := StrToInt(num[4]);
    n5  := StrToInt(num[5]);
    n6  := StrToInt(num[6]);
    n7  := StrToInt(num[7]);
    n8  := StrToInt(num[8]);
    n9  := StrToInt(num[9]);
    n10 := StrToInt(num[10]);
    n11 := StrToInt(num[11]);
    n12 := StrToInt(num[12]);
    d1  := n12*2+n11*3+n10*4+n9*5+n8*6+n7*7+n6*8+n5*9+n4*2+n3*3+n2*4+n1*5;
    d1  := 11-(d1 mod 11);
    if d1 >= 10 then d1 := 0;
    d2  := d1*2+n12*3+n11*4+n10*5+n9*6+n8*7+n7*8+n6*9+n5*2+n4*3+n3*4+n2*5+n1*6;
    d2  := 11-(d2 mod 11);
    if d2 >= 10 then d2 := 0;
    calculado := inttostr(d1)+inttostr(d2);
    Result := calculado;
end;

{function iif(pCondicao:Boolean;pVerdadeiro, pFalso : TDateTime ): TDateTime;
begin
  if pCondicao then
    Result := pVerdadeiro
  else
    Result := pFalso;
end;}

end.
