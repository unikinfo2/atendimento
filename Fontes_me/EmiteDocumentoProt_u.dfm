inherited EmiteDocumentoProt_f: TEmiteDocumentoProt_f
  Left = 207
  Top = 119
  Width = 529
  Height = 401
  Caption = 'Documentos Protocolos/Documentos Emitidos'
  OldCreateOrder = True
  OnShow = FormShow
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
    Caption = 'Nome/Razão Social'
  end
  object Label3: TLabel [3]
    Left = 4
    Top = 124
    Width = 95
    Height = 13
    Caption = 'Período Emissão de'
  end
  object Label4: TLabel [4]
    Left = 134
    Top = 144
    Width = 15
    Height = 13
    Caption = 'até'
  end
  object Label5: TLabel [5]
    Left = 4
    Top = 44
    Width = 68
    Height = 13
    Caption = 'Código Docto.'
  end
  object sbPesDocto: TSpeedButton [6]
    Left = 80
    Top = 58
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
  object Label6: TLabel [7]
    Left = 107
    Top = 44
    Width = 95
    Height = 13
    Caption = 'Descrição do Docto'
  end
  object Label15: TLabel [8]
    Left = 4
    Top = 85
    Width = 67
    Height = 13
    Caption = 'Departamento'
  end
  object BitBtn1: TBitBtn [9]
    Left = 219
    Top = 325
    Width = 98
    Height = 30
    Caption = '&Visualizar'
    TabOrder = 10
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
  object medCliente: TMaskEdit [10]
    Left = 4
    Top = 18
    Width = 73
    Height = 21
    EditMask = '#########;0; '
    MaxLength = 9
    TabOrder = 0
    OnExit = medClienteExit
  end
  object edtNomeCli: TEdit [11]
    Left = 107
    Top = 18
    Width = 406
    Height = 21
    Color = clMenu
    Enabled = False
    TabOrder = 1
  end
  object dtAte: TDateEdit [12]
    Left = 162
    Top = 140
    Width = 121
    Height = 21
    CheckOnExit = True
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 6
  end
  object dtDe: TDateEdit [13]
    Left = 4
    Top = 140
    Width = 121
    Height = 21
    CheckOnExit = True
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 5
  end
  object edtCodDocto: TEdit [14]
    Left = 4
    Top = 58
    Width = 73
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
    OnExit = edtCodDoctoExit
  end
  object edtDescDocto: TEdit [15]
    Left = 107
    Top = 58
    Width = 297
    Height = 21
    TabStop = False
    Color = clMenu
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 3
  end
  object rgOrdem: TRadioGroup [16]
    Left = 4
    Top = 271
    Width = 361
    Height = 49
    Caption = ' Por Ordem de '
    Columns = 3
    ItemIndex = 2
    Items.Strings = (
      'Protocolo'
      'Cliente'
      'Data de Emissão')
    TabOrder = 8
  end
  object chkOrdem: TCheckBox [17]
    Left = 376
    Top = 289
    Width = 129
    Height = 17
    Caption = 'Ordem Decrescente'
    Checked = True
    State = cbChecked
    TabOrder = 9
  end
  object rgFiltro: TRadioGroup [18]
    Left = 4
    Top = 166
    Width = 389
    Height = 101
    Caption = ' Filtrar por '
    Columns = 2
    ItemIndex = 0
    Items.Strings = (
      'Todos'
      'Emitido'
      'Expedido'
      'Retirado'
      'Entregue'
      'Devolvido'
      'Endereço Errado'
      'Entrega Cancelada'
      'Entregue com Retorno de Protocolo')
    TabOrder = 7
  end
  object cbDepto: TDBLookupComboBox [19]
    Left = 4
    Top = 99
    Width = 221
    Height = 21
    KeyField = 'COD_DEPTO'
    ListField = 'DESC_DEPTO'
    ListSource = DataSource1
    TabOrder = 4
  end
  inherited submenu: TMainMenu
    Left = 336
    Top = 73
  end
  inherited Calculator1: TRxCalculator
    Top = 305
  end
  object qryAux: TQuery
    DatabaseName = 'db'
    RequestLive = True
    Left = 300
    Top = 86
  end
  object Query1: TQuery
    DatabaseName = 'db'
    SQL.Strings = (
      'SELECT * FROM GC_DEPARTAMENTO')
    Left = 368
    Top = 128
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 400
    Top = 128
  end
end
