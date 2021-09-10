object dmController: TdmController
  OldCreateOrder = False
  Left = 106
  Top = 110
  Height = 480
  Width = 696
  object pesEmpresa: TPesquisa
    DataBase = frmPrincipal.Database1
    StringSql.Strings = (
      'SELECT * FROM CON_EMPRESA')
    Campos.Strings = (
      'COD_EMPRESA'
      'RAZAO_EMP'
      'FILIAL_EMP'
      'CPFCNPJ_EMP')
    Titulos.Strings = (
      'Codigo'
      'Razão Social'
      'Filial ?'
      'CPF/CNPJ')
    Caption = 'Pesquisa Empresas'
    Opcoes = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
    CampoPesquisa = 'RAZAO_EMP'
    CamposRetorno.Strings = (
      'COD_EMPRESA'
      'RAZAO_EMP'
      'FILIAL_EMP'
      'CPFCNPJ_EMP'
      'TIPO_PESSOA_EMP')
    FormInsere = True
    Height = 444
    Width = 650
    Left = 24
    Top = 20
  end
end
