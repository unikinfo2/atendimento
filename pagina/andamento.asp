<%@ Language=VBScript %>
<!-- #Include file="Funcoes.ASP" -->
<%

  '***** Declaração das Variáveis. *****
  Dim rsFicha ,rsAndamento, cr, TipoPro
  cr = chr(13) & chr(10)
  OpenCon()
%>
<script language="JavaScript">
function MM_openBrWindow(theURL,winName,features) 
{
  window.open(theURL,winName,features);
 }
</script>
<html>

<head>
<meta http-equiv="Content-Type"
content="text/html; charset=iso-8859-1">
<meta name="GENERATOR" content="Microsoft FrontPage Express 2.0">
<title>Cadastro de Contratos de Serviço</title>
</head>
<form name="frmandamento">
        <div align="center"><center>
<body background="Imagens/fundo.gif" bgcolor="#FFFFFF">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>	
    <td  align="center"><img border="0" src="imagens/Atendimento.gif" width="505" height="100"></td>
  </tr>
  <tr>
    <td>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td>&nbsp;</td>
    </tr>
    <%
    set rsFicha = OpenRSet("select * from gc_ficha where cod_ficha=" & request.form("edtprocesso") ,false)
    If ( not rsFicha.EOF ) Then
	  TipoPro = ""
	  if rsFicha("Tipo_Processo") = "A" then TipoPro = "Abertura"
	  if rsFicha("Tipo_Processo") = "T" then TipoPro = "Alteração"
	  if rsFicha("Tipo_Processo") = "R" then TipoPro = "Regularização"
	  if rsFicha("Tipo_Processo") = "C" then TipoPro = "Cancelamento"
	  if rsFicha("Tipo_Processo") = "O" then TipoPro = "Certidão/Outros"
      response.write "<tr>"
      response.write "  <td align='center'>Tipo de Processo: <b>" & TipoPro & "</b></td>"
      response.write "</tr>"
	end if%>
    <tr>
      <td align="center">
        <%
		set rsAndamento = OpenRSet("select * from gc_ficha_and where cod_ficha=" & request.form("edtprocesso") ,false)
        If ( rsAndamento.EOF ) Then %>
          <p><strong>Ainda não foram registrados andamentos para este processo</strong></p>
        <%else%>
          <table border="1" BgColor="Silver">
          <Caption  Align="Top" ><b> <font size=+2>Andamento do Processo nº <%=rsAndamento.Fields("cod_ficha")%></font> </font></b></Caption>
            <tr VAlign="Middle">
              <th align="center" BgColor="#8080FF">Dt.Cadastro</th>
              <th align="center" BgColor="#8080FF">Dt.Previsão</th>
              <th align="center" BgColor="#8080FF">Dt.Fechamento</th>
              <th align="center" BgColor="#8080FF">Descrição</th>
            </tr>
            <%
            do while ( NOT rsAndamento.EOF )
              response.write "<tr>"
              response.write "  <td align='center'> " & day(rsAndamento.Fields("dt_andamento")) & "/" & month(rsAndamento.Fields("dt_andamento")) & "/" & year(rsAndamento.Fields("dt_andamento")) & "</td>"
			  if rsAndamento.Fields("dt_prev_ret") <> "" then
                response.write "  <td align='center'> " & day(rsAndamento.Fields("dt_prev_ret")) & "/" & month(rsAndamento.Fields("dt_prev_ret")) & "/" & year(rsAndamento.Fields("dt_prev_ret")) & "</td>"
			  else
                response.write "  <td align='center'>&nbsp;</td>"
			  end if
			  if rsAndamento.Fields("dt_fecha") = "" then
                response.write "  <td align='center'> " & day(rsAndamento.Fields("dt_fecha")) & "/" & month(rsAndamento.Fields("dt_fecha")) & "/" & year(rsAndamento.Fields("dt_fecha")) & "</td>"
			  else
                response.write "  <td align='center'>&nbsp;</td>"
			  end if

              response.write "  <td align='left'> " & rsAndamento.Fields("desc_andamento") & "</td>"
              response.write "  </tr>"
              rsAndamento.MoveNext
            loop
        End If %>
        </table>
	</tr>
</table>
    </td>
  </tr>
</table>
</body>
</form>
</html>
<%CloseCon()%>