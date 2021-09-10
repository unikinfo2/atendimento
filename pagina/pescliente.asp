<%@ Language=VBScript %>
<!-- #Include file="Funcoes.ASP" -->
<%
  'response.write "teste"
  'response.end
  '***** Declaração das Variáveis. *****
  Dim rsCliente, cr, TipoPro
  cr = chr(13) & chr(10)
  OpenCon()
%>
<script language="JavaScript">
<!--
function seleciona(form, nome) {
  for(var x=0;x<=form.codcliente.length-1;x++) {
    if(form.codcliente[x].checked){
	  opener.frmidentificacao.edtusuario.value = nome;
	  opener.frmidentificacao.edt.value 	   = form.codcliente[x].value;
	  opener.frmidentificacao.edtsenha.focus();
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
<title>Selecione a Empresa desejada</title>
</head>
<form name="frmpescliente">
        <div align="center"><center>
<body background="Imagens/fundo.gif" bgcolor="#FFFFFF">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>	
    <td  align="center"><b>Selecione o nome de sua empresa</b></td>
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
              <th align="left" BgColor="#8080FF">Empresa</th>
            </tr>
            <%
            set rsCliente = OpenRSet("select * from gc_cliente order by nome_cli" ,false)
            do while ( NOT rsCliente.EOF )
              response.write "<tr>" & cr
              response.write "  <td align='left'><input onclick=" & chr(34) & "javascript:seleciona(frmpescliente,'" & rsCliente.Fields("nome_cli") & "')" & chr(34) & " type='radio' name='codcliente' value='" & rsCliente.Fields("cod_cliente") & "'</td>" & cr
              response.write "  <td align='left'><font size='-1'> " & rsCliente.Fields("nome_cli") & "</font></td>" & cr
              response.write "</tr>" & cr
              rsCliente.MoveNext
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
