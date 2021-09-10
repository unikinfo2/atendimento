inherited EmiteContato_f: TEmiteContato_f
  Left = 283
  Top = 166
  Width = 314
  Height = 206
  Caption = 'Listagem de Contatos (Agenda)'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn [0]
    Left = 99
    Top = 111
    Width = 98
    Height = 30
    Caption = '&Visualizar'
    TabOrder = 1
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
  object rgCliente: TRadioGroup [1]
    Left = 8
    Top = 1
    Width = 281
    Height = 49
    Caption = ' Somente Contatos  '
    Columns = 3
    ItemIndex = 0
    Items.Strings = (
      'Todos'
      'Com E-Mail'
      'Sem E-Mail')
    TabOrder = 0
  end
  object rgOrdem: TRadioGroup [2]
    Left = 8
    Top = 53
    Width = 281
    Height = 49
    Caption = ' Ordem da Listagem  '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Contato'
      'Empresa do Contato')
    TabOrder = 2
  end
  inherited submenu: TMainMenu
    Left = 252
    Top = 32
  end
end
