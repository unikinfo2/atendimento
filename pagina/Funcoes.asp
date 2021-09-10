<!-- #Include file="adovbs.inc" -->
<%
response.expires = -1
Dim Con

function RetornaData(pDia,pMes,pAno)
dim xMes,vMes
  xMes = trim(pMes)
  if len(trim(pMes)) = 1 then
    xMes = "0" & pMes
  end if
  select case trim(xMes)
    case "01"
      vMes = "JAN"
    case "02"
      vMes = "FEB"
    case "03"
      vMes = "MAR"
    case "04"
      vMes = "APR"
    case "05"
      vMes = "MAY"
    case "06"
      vMes = "JUN"
    case "07"
      vMes = "JUL"
    case "08"
      vMes = "AUG"
    case "09"
      vMes = "SEP"
    case "10"
      vMes = "OCT"
    case "11"
      vMes = "NOV"
    case "12"
      vMes = "DEC"
  end select
  RetornaData = pDia & "-" & vMes & "-" & pAno
end function
'Testa se o usuario está no arquivo Saut.INI
function fUsuario(pUsuario)
dim objtexto,arquivotexto
  Set objtexto = Server.CreateObject("Scripting.FileSystemObject")
  Set arquivotexto = objtexto.OpenTextFile(Server.MapPath("Saut.ini"))
  fUsuario = false
  while not arquivotexto.AtEndOfLine
    vUsuario = arquivotexto.readline
    if vUsuario = pUsuario then
      fUsuario = true
    end if
  wend
  arquivotexto.close
end function

function ProximoCodigo(pCampo,pTabela)
  set conntemp=server.createobject("adodb.connection")
  conntemp.open application("alias"),application("usuario"),application("senha")
  vSql = "SELECT MAX(" & uCase(pCampo) & ") AS CODIGO FROM "&uCase(pTabela)
  set rsProximoItem = conntemp.execute(vSql)
  if isnull(rsProximoItem("CODIGO").value) then
    ProximoCodigo = 1
  else
    ProximoCodigo = rsProximoItem("CODIGO").value + 1
  end if
end function

function StrZero(pValor,pLen)
dim vValor, vLen
  vValor  = trim(cStr(pValor))
  vLen    = len(vValor)
  if vLen > pLen then
    StrZero = vValor
  else
    StrZero = String(pLen-vLen,"0") & vValor
  end if
end function

function Criptografa(vString)
dim I,C,result
  vString = Trim(vString)
  Result  = ""
  c       = 48
  for I = 1 to Len(vString)
    if ( asc(mid(vString,I,1) & I ) > 255 ) Then
      Result = Result & StrZero(asc( mid(vString,I,1) ),3) & Chr(C)
    else
      Result = Result & StrZero(asc( mid(vString,I,1) ) + I,3) & Chr(C)
    end if
    c    = c + 1
    if c > 57 then
      c  = 48
    end if
  next
  criptografa = Result
end function

function Descriptografa(vString)
dim I,C,result
  vString = Trim(vString)
  Result  = ""
  C = 1
  I = 1
  do while I <= Len(vString)
    Result = Result + Chr( cInt(mid(vString,I,3)) -C )
    c = c + 1
    I = I + 4
  loop
  Descriptografa = Result
end function

function CheckCGC(Numero)
  msgbox Numero
  dim I, vNumeroLimpo, Soma, Divisao, Multiplica, Resto, Digito1, Digito2, vMult

  Numero = Trim(Numero)
  vNumeroLimpo = ""
  for I = 1 to len(Numero)
    if (mid(Numero,I,1) <> ".") and (mid(Numero,I,1) <> "/") and (mid(Numero,I,1) <> "-") then
      vNumeroLimpo = vNumeroLimpo & Copy(Numero,I,1)
    end if
  next

  if len(vNumeroLimpo) <> 14 then
    msgbox "CNPJ inválido. Deve ter 14 dígitos (sem os separadores)."
    CheckCGC = False
    return
  end if
  Soma       = 0
  vMult      = 5
  Divisao    = 0
  Multiplica = 0
  Resto      = 0
  Digito1    = 0

  for I = 1 to 12
    Soma  = Soma + ( cInt( mid(vNumeroLimpo,I,1) ) * vMult )
    vMult = vMult -1
    if vMult = 1 then
      vMult  = 9
    end if
  next

  Divisao     = Soma / 11
  Multiplica  = Int(Divisao) * 11
  Resto       = Soma - Multiplica

  if ( Resto = 0 ) or ( Resto = 1 ) then
    Digito1 = 0
  else
    Digito1 = 11 - Resto
  end if

  Soma       = 0
  vMult      = 6
  Divisao    = 0
  Multiplica = 0
  Resto      = 0

  for I = 1 to 12
    Soma  = Soma + ( cInt( mid(vNumeroLimpo,I,1) ) * vMult )
    vMult = vMult -1
    if vMult = 1 then
      vMult  = 9
    end if
  next

  Soma = Soma + ( Digito1 * 2 )
  Divisao    = Soma / 11
  Multiplica = Int(Divisao) * 11
  Resto      = Soma - Multiplica

  if ( Resto = 0 ) Or ( Resto = 1 ) then
    Digito2 = 0
  else
    Digito2 = 11 - Resto
  end if

  if ( cStr(Digito1) + cStr(Digito2) ) <> mid( vNumeroLimpo, 13, 2 ) then
    msgbox "CNPJ inválido."
    CheckCGC = False
  else
    CheckCGC = True
  end if
end function

'Abre uma conexão com o banco de dados
Public Sub OpenCon ()
  Set Con = Server.CreateObject("ADODB.Connection")
  Con.Open "dbatendimento","sysdba","masterkey"
End Sub

'Fecha uma conexção com o banco de dados
Public Sub CloseCon ()
  Con.Close
  Set Con = Nothing
End Sub

'Abre um RecordSet
Public Function OpenRSet (CmdStr, OpenWithLock)
  Set OpenRSet = Server.CreateObject ("ADODB.Recordset")
  On Error Resume next
  If OpenWithLock Then
    OpenRSet.Open CmdStr, Con, adOpenKeyset, adLockOptimistic, adCmdText
  Else
    OpenRSet.Open CmdStr, Con, adOpenForwardOnly, adLockReadOnly, adCmdText
  End If
  if Err.Number <> 0 then response.write CmdStr
End Function

'Executa um comando SQL
Public Function ExecSQL(CmdStr)
  Dim RecordsAffected
  On Error Resume next
     Con.Execute CmdStr, RecordsAffected, adExecuteNoRecords
  if Err.Number <> 0 then response.write CmdStr
  ExecSQL = RecordsAffected
End Function
%>
