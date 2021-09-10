inherited EmiteCliente_f: TEmiteCliente_f
  Left = 216
  Top = 171
  Width = 534
  Height = 248
  Caption = 'Listagem de Clientes'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn [0]
    Left = 212
    Top = 159
    Width = 98
    Height = 30
    Caption = '&Visualizar'
    TabOrder = 3
    OnClick = BitBtn1Click
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
      0003377777777777777308888888888888807F33333333333337088888888888
      88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
      8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
      8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
      03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
      03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
      33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
      33333337FFFF7733333333300000033333333337777773333333}
    NumGlyphs = 2
  end
  object rgOrdem: TRadioGroup [1]
    Left = 8
    Top = 5
    Width = 153
    Height = 49
    Caption = ' Por Ordem de '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Alfabetica'
      'Num'#233'rica')
    TabOrder = 0
  end
  object rgFiltro: TRadioGroup [2]
    Left = 164
    Top = 5
    Width = 353
    Height = 49
    Caption = ' Filtro por '
    Columns = 4
    ItemIndex = 0
    Items.Strings = (
      'Todos'
      'Clientes'
      'Pr'#233'-Clientes'
      'Inativos')
    TabOrder = 1
  end
  object rgCliente: TRadioGroup [3]
    Left = 8
    Top = 57
    Width = 245
    Height = 49
    Caption = ' Somente Clientes  '
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Todos'
      'Com E-Mail'
      'Sem E-Mail')
    TabOrder = 2
  end
  object rgTipo: TRadioGroup [4]
    Left = 256
    Top = 57
    Width = 261
    Height = 49
    Caption = ' Tipo de Listagem '
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'E-Mail'
      'Simplificado'
      'Completo')
    TabOrder = 4
  end
  object rgTipoList: TRadioGroup [5]
    Left = 100
    Top = 109
    Width = 321
    Height = 44
    Caption = ' Filtro de Listagem '
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Todos'
      'Clientes'
      'Fornecedores')
    TabOrder = 5
  end
  inherited submenu: TMainMenu
    Top = 96
  end
end
