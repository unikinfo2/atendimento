<%@ Language=VBScript %>
<%
  Option Explicit
  Session("DefaultErro") = 0
%>
<script language="JavaScript">
<!--
function chamacliente(form) { //v2.0
  window.open("pescliente.asp",'Clientes','scrollbars=yes,width=400,height=350');
}
//-->
</script>
<html>

<head>
<meta http-equiv="Content-Type"
content="text/html; charset=iso-8859-1">
<meta name="GENERATOR" content="Microsoft FrontPage Express 2.0">
<title>Controle de Atendimento</title>
</head>

<body  background="imagens/fundo.gif" bgproperties="fixed" onload = "document.frmidentificacao.edtsenha.focus()">
<script language="JavaScript">
<!--
	// Verifica se campos obrigatórios do formulário foram
	// preenchidos.
	function submit_page(form) {
		// Verifica se campos obrigatorios foram prenchidos
	    if(CampoBranco(form.edtusuario) == true) {
	    	alert("Você esqueceu de preencher o campo usuário.");
   		form.edtsenha.focus();
	    	return false;
		}
		if(CampoBranco(form.edtsenha) == true) {
	    	alert("Você esqueceu de preencher o campo senha.");
   		form.edtsenha.focus();
	    	return false;
		}
		return true;
	} // fim da função submit_page()

	// Verifica se campo preenchido
	function CampoBranco(campo) {
		if(campo.value == "")
			return true;
		else
			return false;
	}

	function chamaform(form) {
	  if(frmidentificacao.tipo[0].checked)
	    frmidentificacao.action = "atendimento.asp";
	  else
	    frmidentificacao.action = "andamento.asp";
	  if(frmidentificacao.edt.value == frmidentificacao.edtsenha.value) {
  	    if(submit_page(form))
	      frmidentificacao.submit();
	  } else {
	    alert('Senha incorreta tente novamente.');
	  }
	  
	}
	
--></script><div align="center"><center>
<table  width="100%">
  <tr>
    <td>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>	
    <td  align="center"><img border="0" src="imagens/Atendimento.gif" width="505" height="100"></td>
  </tr>
  <tr>
    <td>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
    <tr>
        <td><p align="center"><font size="6">Controle de Atendimento</font></p></td>
    </tr>
    <tr>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td align="center"><form action="atendimento.asp"
        method="POST" name="frmidentificacao"
        onsubmit="return submit_page(this);">
            <div align="center"><center><table border="0">
                <tr>
                    <td><p align="left"><strong>Cliente:</strong></p>
                    </td>
                    <input type="hidden" name="edt" value="">
                    <td><p align="left"><input type="text"
                    size="40" name="edtusuario" disabled>
			        <img src="imagens/find.gif" onclick="javascript:chamacliente(frmidentificacao)"
			        name="cmdPesquisa"  style="cursor:hand">
					</p>
                    </td>
                </tr>
                <tr>
                    <td><p align="left"><strong>Senha:</strong></p>
                    </td>
                    <td><p align="left"><input type="password"
                    size="20" name="edtsenha"></p>
                    </td>
                </tr>
                <tr>
                    <td><p align="left"><strong>Nº Processo:</strong></p>
                    </td>
                    <td><p align="left"><input type="text"
                    size="10" name="edtprocesso"></p>
                    </td>
                </tr>
				<tr>
				  <td><input type="radio" name="tipo" value="1" checked>Solicitação</td>
				  <td><input type="radio" name="tipo" value="2">Andamento de Processo</td>
				</tr>
            </table>
            </center></div><p align="center">
			<img src="imagens/bot_enviar.gif" onclick="javascript:chamaform(frmidentificacao)"
			name="cmdConectar"  style="cursor:hand">
        </form>
        </td>
    </tr>
</table>
    </td>
  </tr>
  <tr>	
    <td  align="center"><img border="0" src="imagens/Logo_grande.gif" width="60" height="40"></td>
  </tr>
  <tr>	
	<td  align="center"><font color='#765149' size=1><a href='mailto:uni-k@simplescontabil.com.br'>Uni-K Informática</a></td>
  </tr>
</table>
    </td>
  </tr>
</table>
</script>
</body>
</html>
