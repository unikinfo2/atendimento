<%@ Language=VBScript %>
<!-- #Include file="Funcoes.ASP" -->
<%
  'response.write "teste"
  'response.end
  '***** Declaração das Variáveis. *****
  Dim rsDocto, cr, TipoPro
  cr = chr(13) & chr(10)
  OpenCon()
%>
<script language="JavaScript">
<!--
function seleciona(form, nome) {
  for(var x=0;x<=form.coddocto.length-1;x++) {
    if(form.coddocto[x].checked){
	  opener.frmatendimento.edtdocto.value = nome;
	  opener.frmatendimento.edtcoddocto.value = form.coddocto[x].value;
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
<form name="frmpesdocto">
        <div align="center"><center>
<body background="Imagens/fundo.gif" bgcolor="#FFFFFF">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>	
    <td  align="center"><b>Indique o Documento desejado</b></td>
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
              <th align="left" BgColor="#8080FF">Documento</th>
            </tr>
            <%
            set rsDocto = OpenRSet("select * from gc_documento where cod_depto="&request("depto")&" order by desc_docto" ,false)
            do while ( NOT rsDocto.EOF )
              response.write "<tr>" & cr
              response.write "  <td align='left'><input onclick=" & chr(34) & "javascript:seleciona(frmpesdocto,'" & rsDocto.Fields("desc_docto") & "')" & chr(34) &" type='radio' name='coddocto' value='" & rsDocto.Fields("cod_docto") & "'</td>" & cr
              response.write "  <td align='left'><font size='-1'> " & rsDocto.Fields("desc_docto") & "</font></td>" & cr
              response.write "</tr>" & cr
              rsDocto.MoveNext
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
