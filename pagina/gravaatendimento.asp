<%@ Language=VBScript %>
<!-- #Include file="Funcoes.ASP" -->
<%
  '***** Declaração das Variáveis. *****
  Dim rsAtend, cr
  cr = chr(13) & chr(10)
  OpenCon()
  set rsAtend = OpenRSet("select * from gc_atendimento where 1=0" ,true)
  rsAtend.AddNew
	rsAtend.fields("cod_cliente")       = request.form("codcli")
	rsAtend.fields("descricao_atend")   = request.form("descricao_atend")
	rsAtend.fields("status_atend") 		= "A"
	rsAtend.fields("prioridade_atend")  = "A"
	rsAtend.fields("dt_atend") 			= now()
	rsAtend.fields("tipo_atend") 			= request.form("tipo_atend")
	if request.form("edtcompetini") <> "" then
	  rsAtend.fields("dt_compet_ini") 		= request.form("edtcompetini")
	end if
	if request.form("edtcompetfin") <> "" then
	  rsAtend.fields("dt_compet_fin") 		= request.form("edtcompetfin")
	end if
	if request.form("edtvencto") <> "" then
	  rsAtend.fields("dt_vencto") 				= request.form("edtvencto")
	end if
	if request.form("valor") <> "" then
  	rsAtend.fields("valor_docto") 			= request.form("valor")
	end if
	if request.form("edtcoddocto") <> "" then
	  rsAtend.fields("cod_docto") 				= request.form("edtcoddocto")
	end if
	rsAtend.fields("cod_depto") 				= request.form("depto")
	rsAtend.fields("nome_clifunc") 		= request.form("edtSolic")
	rsAtend.fields("cod_func") 				= request.form("edtcodfunc")
	rsAtend.Update 
	'response.redirect("default.asp")
%>
<html>
<head>
<meta http-equiv="Content-Language" content="pt-br">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
<title>Gravação da Solicitação de Serviços</title>
</head>
<form name="frmgrava" action="default.asp" method="post">
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
    <td width="100%" height="19">
	        <h3><center>A sua solicitação foi gravada com sucesso, aguarde que estaremos providenciando o seu pedido.</center></h3>
            <p align="center">
			<input type="Image" src="imagens/bot_fechar.gif" name="cmdConectar" style="cursor:hand">
	</td>
  </tr>
</table>
</body>
</form>
</html>

