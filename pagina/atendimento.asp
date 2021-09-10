<%@ Language=VBScript %>
<!-- #Include file="Funcoes.ASP" -->
<%
  '***** Declaração das Variáveis. *****
  Dim rsAtend, rsCli, rsDepto, cr
  cr = chr(13) & chr(10)
  OpenCon()
%>
<script language="JavaScript">
<!--
function chamadocto(form) { //v2.0
  window.open("pesdocto.asp?depto="+form.depto.value,'Documentos','scrollbars=yes,width=400,height=350');
}
function chamafunc(form) { //v2.0
  window.open("pesfunc.asp?depto="+form.depto.value,'Documentos','scrollbars=yes,width=400,height=350');
}

function verificacampos(form) {
  var campos = "";
  if(form.edtsolic.value == "") campos = campos + "Solicitante\n";
  if(form.edtfunc.value == "")  campos = campos + "Funcionário\n";
  if(form.edtdocto.value == "" && form.tipo_atend.value <= 2 ) campos = campos + "Documento\n";
  if(form.descricao_atend.value == "" && form.tipo_atend.value > 2 ) campos = campos + "Ralato do Cliente\n";

  if(campos != ""){
    alert("É necessário informar os seguintes campos:" + "\n\n" + campos + "\n");
    return false;
  } else {
    return true;
  }
}
//-->
</script>

<html>

<head>
<meta http-equiv="Content-Language" content="pt-br">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Solicitação de Serviços on-line</title>
</head>
<form action="gravaatendimento.asp" method="POST" name="frmatendimento" onsubmit="return verificacampos(frmatendimento);">
<body bgproperties="fixed" background="imagens/Fundo.gif">

<table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber1" height="163">
  <tr>
    <td width="100%" height="13" align="center">
    <img border="0" src="imagens/Atendimento.gif" width="513" height="88"></td>
  </tr>
  <tr>
    <td width="100%" height="19">&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" height="19">As Informações cadastradas nesta página serão 
    incluidas automaticamente como pendência para o departamento informado, e um 
    de nossos funcionários estará providenciando a execução de seu pedido.</td>
  </tr>
  <tr>
    <td width="100%" height="19">&nbsp;</td>
  </tr>
  <tr>
    <td width="100%" height="19"><b><font size="4">Solicitação de Serviços on-line</font></b></td>
  </tr>
  <tr>
    <td width="100%" height="161">
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="102%" id="AutoNumber2" height="139">
      <tr>
        <td width="100%" colspan="4" height="19"><hr></td>
      </tr>
      <tr>
        <td width="17%" height="22">Cliente:</td>
        <td width="34%" height="22">
		<%
          set rsCli = OpenRSet("select * from gc_cliente where cod_cliente=" & request.form("edt") ,false)
		%>
          <input type="hidden" name="codcli" size="37" value="<%=rsCli("cod_cliente")%>">
          <input type="text" name="cliente" size="37" value="<%=rsCli("nome_cli")%>" disabled>
        </td>
        <td width="21%" height="22">Solicitante:</td>
        <td width="28%" height="22"><input type="text" name="edtsolic" size="24"></td>
      </tr>
      <tr>
        <td width="17%" height="19">Departamento </td>
        <td width="34%" height="19">
		<%
          set rsDepto = OpenRSet("select * from gc_departamento" ,false)
          response.write "<select size='1' name='depto'>" & cr
		  do while not rsDepto.eof
            response.write "<option value='" & rsDepto.fields("cod_depto") & "'>" & rsDepto.fields("desc_depto") & "</option>" & cr
			rsDepto.MoveNext
		  loop
          response.write "</select>" & cr
		%>
        </td>
        <td width="21%" height="19">Data:</td>
        <td width="28%" height="19"><input type="text" name="dt_atend" size="20" disabled value="<%=day(now())&"/"&month(now())&"/"&year(now())& " " & time()%>"></td>
      </tr>

      <tr>
        <td width="17%" height="19">Solicitar para (Funcionário):</td>
        <td width="34%" height="19">
            <input type="hidden" name="edtcodfunc" value="">
            <input type="text" name="edtfunc" size="33" disabled>
	        <img src="imagens/find.gif" onclick="javascript:chamafunc(frmatendimento)"
	        name="cmdPesqFunc"  style="cursor:hand">
        </td>
        <td width="21%" height="19">&nbsp;</td>
        <td width="28%" height="19">&nbsp;</td>
      </tr>

			
      <tr>
        <td width="17%" height="19">Tipo Atendimento</td>
        <td width="34%" height="19">
		      <select size="1" name="tipo_atend">
            <option value="0" selected>Solicitação</option>
            <option value="1">Reenvio</option>
            <option value="2">Recalculo</option>
            <option value="3">Reclamação</option>
            <option value="4">Observação</option>
            <option value="5">Informação</option>
          </select>
        </td>
        <td width="21%" height="19">&nbsp;</td>
        <td width="28%" height="19">&nbsp;</td>
      </tr>
      <tr>
        <td width="17%" height="19">Documento</td>
        <td width="34%" height="19">
            <input type="hidden" name="edtcoddocto" value="">
            <input type="text" name="edtdocto" size="33" disabled>
	        <img src="imagens/find.gif" onclick="javascript:chamadocto(frmatendimento)"
	        name="cmdPesquisa"  style="cursor:hand">
        </td>
        <td width="21%" height="19">&nbsp;</td>
        <td width="28%" height="19">&nbsp;</td>
      </tr>
      <tr>
        <td width="17%">Competencia Ini. (dd/mm/aaaa)</td>
        <td width="34%">
          <input type="text" name="edtcompetini" size="23"></p>
        </td>
        <td width="21%" height="19">Competencia Final (dd/mm/aaaa)</td>
        <td width="28%" height="19">
          <input type="text" name="edtcompetfin" size="20"></p>
        </td>
      </tr>
      <tr>
        <td width="17%" height="19">Vencimento (dd/mm/aaaa)</td>
        <td width="34%" height="19">
          <input type="text" name="edtvencto" size="23"></p>
        </td>
        <td width="21%" height="19">Valor</td>
        <td width="28%" height="19">
          <input type="text" name="valor" size="23"></p>
        </td>
      </tr>
      <tr>
        <td width="17%" height="2"></td>
        <td width="34%" height="2"></td>
        <td width="21%" height="2"></td>
        <td width="28%" height="2"></td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td width="100%" height="51">
    <table border="0" cellpadding="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber3" height="32">
      <tr>
        <td width="16%" height="32" valign="top">Relato do Cliente</td>
        <td width="91%" height="90%">
          <textarea rows="5" name="descricao_atend" cols="70"></textarea></p>
        </td>
      </tr>
    </table>
    </td>
  </tr>
  <tr>
    <td width="100%" height="1"></td>
  </tr>
  <tr>
    <td width="100%" height="1" align="center">
      <input type="submit" value="Enviar" name="B1">
	  <input type="reset"  value="Cancelar" name="B2"></p>
    <p>&nbsp;</td>
  </tr>
</table>
</body>
<script language="JavaScript">
<!--
  frmatendimento.edtsolic.focus();
-->
</script></form>
</html>
<%CloseCon()%>
