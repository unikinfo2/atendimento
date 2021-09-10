<%@ Language=VBScript %>
<!-- #Include file="Funcoes.ASP" -->
<%
  '***** Declaração das Variáveis. *****
  Dim rsFunc, cr, TipoPro
  cr = chr(13) & chr(10)
  OpenCon()
%>
<script language="JavaScript">
<!--
function seleciona(form, nome) {
  for(var x=0;x<=form.codfunc.length-1;x++) {
    if(form.codfunc[x].checked){
	    opener.frmatendimento.edtfunc.value    = nome;
	    opener.frmatendimento.edtcodfunc.value = form.codfunc[x].value;
	    self.close();
	  }
  }
}
//-->
</script>
<html>
<head>
<meta http-equiv="Content-Type"
content="text/html; charset=iso-8859-1">
<meta name="GENERATOR" content="Microsoft FrontPage Express 2.0">
<title>Selecione o Documento desejado</title>
</head>
<form name="frmpesfunc">
        <div align="center"><center>
<body background="Imagens/fundo.gif" bgcolor="#FFFFFF">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>	
    <td  align="center"><b>Indique o Funcionário desejado</b></td>
  </tr>
  <tr>
    <td>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
      <td align="center">
          <table border="1" BgColor="Silver">
            <tr VAlign="Middle">
              <th align="center" BgColor="#8080FF">&nbsp;</th>
              <th align="left" BgColor="#8080FF">Funcionário</th>
            </tr>
            <%
            set rsFunc = OpenRSet("select * from gc_funcionario where cod_depto="&request("depto")&" order by nome_func" ,false)
            do while ( NOT rsFunc.EOF )
              response.write "<tr>" & cr
              response.write "  <td align='left'><input onclick=" & chr(34) & "javascript:seleciona(frmpesfunc,'" & rsFunc.Fields("nome_func") & "')" & chr(34) &" type='radio' name='codfunc' value='" & rsFunc.Fields("cod_func") & "'</td>" & cr
              response.write "  <td align='left'><font size='-1'> " & rsFunc.Fields("nome_func") & "</font></td>" & cr
              response.write "</tr>" & cr
              rsFunc.MoveNext
            loop%>
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
