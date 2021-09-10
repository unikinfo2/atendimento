object dmPesq: TdmPesq
  OldCreateOrder = False
  Left = 299
  Top = 107
  Height = 375
  Width = 544
  object PesCliente: TPesquisaBDE
    DataBase = frmPrincipal.Database1
    StringSql.Strings = (
      'SELECT * FROM GC_CLIENTE'
      'ORDER BY NOME_CLI')
    Campos.Strings = (
      'COD_CLIENTE'
      'CNPJCPF_CLI'
      'TIPO_CLI'
      'NOME_CLI')
    Titulos.Strings = (
      'C'#243'digo'
      'CNPJ/CPF'
      'Tipo'
      'Nome')
    Caption = 'CadCliente_f'
    Opcoes = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    CampoPesquisa = 'NOME_CLI'
    CamposRetorno.Strings = (
      'COD_CLIENTE'
      'CNPJCPF_CLI'
      'NOME_CLI')
    MsgVazio = 'Tabela de Clientes vazia !'
    FormInsere = False
    Height = 444
    Width = 469
    Left = 24
    Top = 16
  end
  object PesDocto: TPesquisaBDE
    DataBase = frmPrincipal.Database1
    StringSql.Strings = (
      'SELECT * FROM GC_DOCUMENTO'
      'ORDER BY DESC_DOCTO')
    Campos.Strings = (
      'Desc_Docto'
      'Cod_Docto')
    Titulos.Strings = (
      'Descri'#231#227'o'
      'Codigo')
    Caption = 'Pesquisa Documentos'
    Opcoes = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    CampoPesquisa = 'Desc_Docto'
    CamposRetorno.Strings = (
      'Desc_Docto'
      'Cod_Docto')
    MsgVazio = 'N'#227'o existe Documentos cadastrados'
    FormInsere = False
    Height = 444
    Width = 439
    Left = 29
    Top = 128
  end
  object pesDepto: TPesquisaBDE
    DataBase = frmPrincipal.Database1
    Campos.Strings = (
      'cod_depto'
      'desc_depto')
    Titulos.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o')
    Caption = 'Pesquisa Departamentos'
    Opcoes = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    CampoPesquisa = 'Desc_Depto'
    CamposRetorno.Strings = (
      'cod_depto'
      'desc_depto')
    MsgVazio = 'N'#227'o Existe Departamentos cadastrados'
    FormInsere = False
    Height = 444
    Width = 439
    Left = 28
    Top = 68
  end
  object pesFunc: TPesquisaBDE
    DataBase = frmPrincipal.Database1
    StringSql.Strings = (
      'SELECT * FROM GC_FUNCIONARIO'
      'ORDER BY NOME_FUNC')
    Campos.Strings = (
      'Cod_Func'
      'Nome_Func')
    Titulos.Strings = (
      'C'#243'digo'
      'Nome Func.')
    Caption = 'Pesquisa Funcion'#225'rios'
    Opcoes = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    CampoPesquisa = 'Nome_Func'
    CamposRetorno.Strings = (
      'Cod_Func'
      'Nome_Func')
    FormInsere = False
    Height = 444
    Width = 439
    Left = 28
    Top = 188
  end
  object PesLig: TPesquisaBDE
    DataBase = frmPrincipal.Database1
    Campos.Strings = (
      'dt_pedido_lig'
      'nome_cli'
      'status_lig'
      'contato'
      'nome_func'
      'desc_depto')
    Titulos.Strings = (
      'Data/Hora'
      'Cliente'
      'Status'
      'Contato'
      'Funcionario'
      'Depto.')
    Caption = 'Pesquisa Liga'#231#245'es'
    Opcoes = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    CampoPesquisa = 'NOME_CLI'
    CamposRetorno.Strings = (
      'cod_ligacao')
    MsgVazio = 'N'#227'o existe Liga'#231#245'es Cadastradas'
    FormInsere = True
    Height = 444
    Width = 550
    Left = 24
    Top = 244
  end
  object pesVis: TPesquisaBDE
    DataBase = frmPrincipal.Database1
    Campos.Strings = (
      'dt_visita'
      'nome_cli'
      'status_visita'
      'contato_visita'
      'nome_func'
      'desc_depto')
    Titulos.Strings = (
      'Data Visita'
      'Cliente'
      'Status'
      'Contato'
      'Funcionario'
      'Depto.')
    Caption = 'Pesquisa Itens de Notas Fiscais'
    Opcoes = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    CampoPesquisa = 'NOME_CLI'
    CamposRetorno.Strings = (
      'cod_visita')
    FormInsere = True
    Height = 444
    Width = 550
    Left = 104
    Top = 16
  end
  object pesAtendimento: TPesquisaBDE
    DataBase = frmPrincipal.Database1
    StringSql.Strings = (
      'SELECT ATEND.*, CLI.NOME_CLI'
      'FROM GC_ATENDIMENTO ATEND'
      'LEFT JOIN GC_CLIENTE CLI ON (ATEND.COD_CLIENTE=CLI.COD_CLIENTE)'
      'ORDER BY ATEND.DT_ATEND DESC')
    Campos.Strings = (
      'COD_ATENDIMENTO'
      'DT_ATEND'
      'STATUS_ATEND'
      'NOME_CLI'
      'DESCRICAO_ATEND2')
    Titulos.Strings = (
      'Cod.Atendimento'
      'Dt.Atendimento'
      'Status'
      'Cliente'
      'Descricao')
    Caption = 'Pesquisa Atendimentos'
    Opcoes = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    CampoPesquisa = 'DT_ATEND'
    CamposRetorno.Strings = (
      'COD_ATENDIMENTO'
      'COD_CLIENTE')
    FormInsere = False
    Height = 444
    Width = 700
    Left = 108
    Top = 76
  end
  object pesOcorrencia: TPesquisaBDE
    DataBase = frmPrincipal.Database1
    Campos.Strings = (
      'COD_ATENDIMENTO'
      'COD_OCORRENCIA'
      'DESCRICAO_OCORR2'
      'DT_OCORRENCIA'
      'DT_FECHAMENTO_OCORR'
      'STATUS_OCORR'
      'NOME_FUNC'
      'DESC_DEPTO'
      'NOME_FUNC_1'
      'DESC_DEPTO_1')
    Titulos.Strings = (
      'Atendimento'
      'Ocorrencia'
      'Descri'#231#227'o'
      'Dt.Ocorr'#234'ncia'
      'Dt.Fechamento'
      'Status'
      'Funcionario'
      'Depto.'
      'Func.Transf.'
      'Depto.Transf.')
    Caption = 'Pesquisa Ocorr'#234'ncia'
    Opcoes = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    CampoPesquisa = 'DT_OCORRENCIA'
    CamposRetorno.Strings = (
      'COD_OCORRENCIA')
    FormInsere = False
    Height = 444
    Width = 700
    Left = 112
    Top = 128
  end
  object pesDoctoEmi: TPesquisaBDE
    DataBase = frmPrincipal.Database1
    StringSql.Strings = (
      'SELECT PRO.*, DOC.*, EMI.*, CLI.NOME_CLI'
      'FROM GC_PROTOCOLO PRO'
      
        'LEFT JOIN GC_DOCUMENTO_EMITIDO  EMI ON (PRO.COD_PROTOCOLO   = EM' +
        'I.COD_PROTOCOLO)'
      
        'LEFT JOIN GC_DOCUMENTO DOC          ON (DOC.COD_DOCTO       = EM' +
        'I.COD_DOCTO)'
      
        'LEFT JOIN GC_CLIENTE CLI            ON (CLI.COD_CLIENTE     = PR' +
        'O.COD_CLIENTE)'
      'ORDER BY PRO.COD_PROTOCOLO DESC')
    Campos.Strings = (
      'COD_PROTOCOLO'
      'NOME_CLI'
      'DESC_DOCTO'
      'STATUS_ENTREGA'
      'DT_EMISSAO_PROTO'
      'DT_ENTREGA_PREV'
      'DT_ENTREGA_PROTO')
    Titulos.Strings = (
      'Protocolo'
      'Cliente'
      'Documento'
      'Status'
      'Emiss'#227'o'
      'Previs'#227'o'
      'Entrega')
    Caption = 'Pesquisa Doctos. Emitidos'
    Opcoes = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    CampoPesquisa = 'COD_PROTOCOLO'
    CamposRetorno.Strings = (
      'COD_PROTOCOLO'
      'COD_CLIENTE')
    FormInsere = False
    Height = 444
    Width = 720
    Left = 116
    Top = 180
  end
  object pesEMail: TPesquisaBDE
    DataBase = frmPrincipal.Database1
    StringSql.Strings = (
      'SELECT * FROM GC_EMAIL'
      'ORDER BY DT_EMAIL DESC')
    Campos.Strings = (
      'COD_EMAIL'
      'DT_EMAIL'
      'ASSUNTO_EMAIL'
      'CC_EMAIL')
    Titulos.Strings = (
      'E-Mail'
      'Enviado em'
      'Assunto'
      'Com copia para')
    Caption = 'Pesquisa Doctos. Emitidos'
    Opcoes = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    CampoPesquisa = 'DT_EMAIL'
    CamposRetorno.Strings = (
      'COD_EMAIL'
      'DT_EMAIL'
      'ASSUNTO_EMAIL'
      'CC_EMAIL')
    FormInsere = False
    Height = 444
    Width = 600
    Left = 116
    Top = 236
  end
  object pesAgenda: TPesquisaBDE
    DataBase = frmPrincipal.Database1
    StringSql.Strings = (
      'SELECT * FROM GC_AGENDA'
      'ORDER BY NOME_CONTATO')
    Campos.Strings = (
      'NOME_CONTATO'
      'EMPRESA_CONTATO'
      'EMAIL_CONTATO')
    Titulos.Strings = (
      'Nome'
      'Empresa'
      'E-Mail')
    Caption = 'Pesquisa Contatos Telef'#244'nicos'
    Opcoes = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    CampoPesquisa = 'nome_contato'
    CamposRetorno.Strings = (
      'COD_CONTATO'
      'NOME_CONTATO')
    FormInsere = False
    Height = 444
    Width = 700
    Left = 196
    Top = 20
  end
  object pesClienteFunc: TPesquisaBDE
    DataBase = frmPrincipal.Database1
    StringSql.Strings = (
      'SELECT * FROM GC_CLIENTE_FUNC'
      'ORDER BY NOME_CLI_FUNC')
    Campos.Strings = (
      'Nome_Cli_Func')
    Titulos.Strings = (
      'Nome Func.')
    Caption = 'Pesquisa Funcion'#225'rios do Cliente'
    Opcoes = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    CampoPesquisa = 'Nome_Cli_Func'
    CamposRetorno.Strings = (
      'Cod_Cli_Func'
      'Nome_Cli_Func')
    FormInsere = False
    Height = 444
    Width = 439
    Left = 200
    Top = 72
  end
  object pesFicha: TPesquisaBDE
    DataBase = frmPrincipal.Database1
    StringSql.Strings = (
      'SELECT * FROM GC_FICHA FIC'
      'LEFT JOIN GC_CLIENTE CLI ON (FIC.COD_CLIENTE=CLI.COD_CLIENTE)'
      'ORDER BY CLI.NOME_CLI, FIC.COD_FICHA')
    Campos.Strings = (
      'COD_FICHA'
      'NOME_CLI'
      'CONTATO'
      'FONE1'
      'FONE2'
      'RAZAO1'
      'RAZAO2'
      'RAZAO3')
    Titulos.Strings = (
      'Cod.Ficha'
      'Cliente'
      'Contato'
      'Fone 1'
      'Fone 2'
      'Raz'#227'o 1'
      'Raz'#227'o 2'
      'Raz'#227'o 3')
    Caption = 'Ficha cadastral (Legal)'
    Opcoes = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    CampoPesquisa = 'NOME_CLI'
    CamposRetorno.Strings = (
      'COD_FICHA')
    FormInsere = False
    Height = 444
    Width = 439
    Left = 200
    Top = 124
  end
  object PesMemo: TPesquisaBDE
    DataBase = frmPrincipal.Database1
    StringSql.Strings = (
      'SELECT * FROM GC_MEMORANDO MEM'
      'INNER JOIN GC_FUNCIONARIO FUN ON (MEM.COD_FUNC=FUN.COD_FUNC)')
    Campos.Strings = (
      'dt_memo'
      'status_memo'
      'nome_func'
      'assunto_memo')
    Titulos.Strings = (
      'Data'
      'Status'
      'Funcion'#225'rio'
      'Assunto')
    Caption = 'Pesquisa Memorandos internos'
    Opcoes = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    CampoPesquisa = 'ASSUNTO_MEMO'
    CamposRetorno.Strings = (
      'cod_memo')
    FormInsere = True
    Height = 444
    Width = 750
    Left = 200
    Top = 180
  end
  object pesFunc2: TPesquisaBDE
    DataBase = frmPrincipal.Database1
    StringSql.Strings = (
      'SELECT * FROM GC_FUNCIONARIO  WHERE ATIVO_FUNC <> '#39'N'#39
      'ORDER BY NOME_FUNC')
    Campos.Strings = (
      'Cod_Func'
      'Nome_Func')
    Titulos.Strings = (
      'C'#243'digo'
      'Nome Func.')
    Caption = 'Pesquisa Funcion'#225'rios'
    Opcoes = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    CampoPesquisa = 'Nome_Func'
    CamposRetorno.Strings = (
      'Cod_Func'
      'Nome_Func')
    FormInsere = False
    Height = 444
    Width = 439
    Left = 196
    Top = 234
  end
  object pesFeriado: TPesquisaBDE
    DataBase = frmPrincipal.Database1
    StringSql.Strings = (
      'SELECT * FROM GC_FERIADO'
      ' ORDER BY DT_FERIADO DESC, DESC_FERIADO')
    Campos.Strings = (
      'dt_feriado'
      'desc_feriado')
    Titulos.Strings = (
      'Data'
      'Descri'#231#227'o')
    Caption = 'Pesquisa Feriados'
    Opcoes = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    CampoPesquisa = 'Desc_Feriado'
    CamposRetorno.Strings = (
      'dt_feriado'
      'desc_feriado')
    MsgVazio = 'N'#227'o Existe Feriados cadastrados'
    FormInsere = False
    Height = 444
    Width = 439
    Left = 284
    Top = 28
  end
  object PesLivro: TPesquisaBDE
    DataBase = frmPrincipal.Database1
    StringSql.Strings = (
      'SELECT * FROM GC_LIVRO'
      'ORDER BY DESC_LIVRO')
    Campos.Strings = (
      'cod_livro'
      'desc_livro')
    Titulos.Strings = (
      'C'#243'digo'
      'Descri'#231#227'o')
    Caption = 'Pesquisa Livros'
    Opcoes = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    CampoPesquisa = 'Desc_Livro'
    CamposRetorno.Strings = (
      'cod_livro'
      'desc_livro')
    MsgVazio = 'N'#227'o Existe Livros cadastrados'
    FormInsere = False
    Height = 444
    Width = 439
    Left = 292
    Top = 88
  end
  object pesAssunto: TPesquisaBDE
    DataBase = frmPrincipal.Database1
    StringSql.Strings = (
      'SELECT * FROM GC_ASSUNTO'
      'ORDER BY DESC_ASSUNTO')
    Campos.Strings = (
      'Classific_Assunto'
      'Desc_Assunto'
      'Cod_Depto'
      'Cod_Assunto')
    Titulos.Strings = (
      'Classifica'#231#227'o'
      'Descri'#231#227'o'
      'Cod.Depto.'
      'Cod.Assunto')
    Caption = 'Pesquisa Documentos'
    Opcoes = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    CampoPesquisa = 'Desc_Assunto'
    CamposRetorno.Strings = (
      'Desc_Assunto'
      'Cod_Assunto'
      'Cod_Depto'
      'Classific_Assunto')
    MsgVazio = 'N'#227'o existe Documentos cadastrados'
    FormInsere = False
    Height = 444
    Width = 600
    Left = 297
    Top = 160
  end
end
