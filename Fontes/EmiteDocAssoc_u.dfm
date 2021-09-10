inherited EmiteDocAssoc_f: TEmiteDocAssoc_f
  Left = 294
  Top = 173
  Width = 529
  Height = 245
  Caption = 'Emite Documentos/Obriga'#231#245'es por Cliente'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 4
    Top = 4
    Width = 32
    Height = 13
    Caption = 'Cliente'
  end
  object sbPesq: TSpeedButton [1]
    Left = 81
    Top = 18
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
      300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
      330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
      333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
      339977FF777777773377000BFB03333333337773FF733333333F333000333333
      3300333777333333337733333333333333003333333333333377333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
    OnClick = sbPesqClick
  end
  object Label2: TLabel [2]
    Left = 107
    Top = 4
    Width = 96
    Height = 13
    Caption = 'Nome/Raz'#227'o Social'
  end
  object Label3: TLabel [3]
    Left = 4
    Top = 44
    Width = 68
    Height = 13
    Caption = 'C'#243'digo Docto.'
  end
  object sbPesDocto: TSpeedButton [4]
    Left = 81
    Top = 57
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000130B0000130B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
      333333333333333333FF33333333333330003FF3FFFFF3333777003000003333
      300077F777773F333777E00BFBFB033333337773333F7F33333FE0BFBF000333
      330077F3337773F33377E0FBFBFBF033330077F3333FF7FFF377E0BFBF000000
      333377F3337777773F3FE0FBFBFBFBFB039977F33FFFFFFF7377E0BF00000000
      339977FF777777773377000BFB03333333337773FF733333333F333000333333
      3300333777333333337733333333333333003333333333333377333333333333
      333333333333333333FF33333333333330003333333333333777333333333333
      3000333333333333377733333333333333333333333333333333}
    NumGlyphs = 2
    OnClick = sbPesDoctoClick
  end
  object Label4: TLabel [5]
    Left = 107
    Top = 44
    Width = 95
    Height = 13
    Caption = 'Descri'#231#227'o do Docto'
  end
  object Label5: TLabel [6]
    Left = 138
    Top = 90
    Width = 53
    Height = 13
    Caption = 'Per'#237'odo de'
  end
  object Label6: TLabel [7]
    Left = 241
    Top = 90
    Width = 16
    Height = 13
    Caption = 'At'#233
  end
  object BitBtn1: TBitBtn [8]
    Left = 211
    Top = 162
    Width = 98
    Height = 30
    Caption = '&Visualizar'
    TabOrder = 8
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
  object medCliente: TMaskEdit [9]
    Left = 4
    Top = 18
    Width = 73
    Height = 21
    EditMask = '#########;0; '
    MaxLength = 9
    TabOrder = 0
    OnExit = medClienteExit
  end
  object edtNomeCli: TEdit [10]
    Left = 107
    Top = 18
    Width = 406
    Height = 21
    Color = clMenu
    Enabled = False
    TabOrder = 1
  end
  object edtCodDocto: TEdit [11]
    Left = 4
    Top = 58
    Width = 73
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
    OnExit = edtCodDoctoExit
  end
  object edtDescDocto: TEdit [12]
    Left = 107
    Top = 58
    Width = 406
    Height = 21
    TabStop = False
    Color = clMenu
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object dtDe: TDateEdit [13]
    Left = 136
    Top = 104
    Width = 101
    Height = 21
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 5
  end
  object dtAte: TDateEdit [14]
    Left = 241
    Top = 104
    Width = 101
    Height = 21
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 6
  end
  object rgFiltro: TRadioGroup [15]
    Left = 6
    Top = 84
    Width = 123
    Height = 69
    Caption = 'Tipo de Filtro '
    ItemIndex = 0
    Items.Strings = (
      'Por Vencimento'
      'Por Envio')
    TabOrder = 4
  end
  object rgMostra: TRadioGroup [16]
    Left = 351
    Top = 84
    Width = 161
    Height = 69
    Caption = ' Mostrar somente Documentos '
    ItemIndex = 0
    Items.Strings = (
      'Todos'
      'Somente Entregue'
      'N'#227'o Entrege')
    TabOrder = 7
  end
  object qryAux: TQuery
    DatabaseName = 'db'
    RequestLive = True
    Left = 364
    Top = 33
  end
  object qryDocto: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_DOCUMENTO WHERE COD_DOCTO = :COD_DOCTO')
    Left = 416
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_DOCTO'
        ParamType = ptUnknown
      end>
  end
end
