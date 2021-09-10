inherited EmiteRelatorios_f: TEmiteRelatorios_f
  Left = 213
  Top = 135
  Width = 558
  Height = 301
  Caption = 'Atendimentos efetuados'
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
    Left = 80
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
  object Label22: TLabel [3]
    Left = 363
    Top = 82
    Width = 98
    Height = 13
    Caption = 'Tipo de Atendimento'
  end
  object Label3: TLabel [4]
    Left = 5
    Top = 122
    Width = 53
    Height = 13
    Caption = 'Per'#237'odo de'
  end
  object Label4: TLabel [5]
    Left = 108
    Top = 142
    Width = 15
    Height = 13
    Caption = 'at'#233
  end
  object Label6: TLabel [6]
    Left = 4
    Top = 43
    Width = 63
    Height = 13
    Caption = 'C'#243'digo Func.'
  end
  object SpeedButton1: TSpeedButton [7]
    Left = 80
    Top = 56
    Width = 24
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
    OnClick = SpeedButton1Click
  end
  object Label5: TLabel [8]
    Left = 107
    Top = 43
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object Label15: TLabel [9]
    Left = 4
    Top = 82
    Width = 67
    Height = 13
    Caption = 'Departamento'
  end
  object Label7: TLabel [10]
    Left = 5
    Top = 166
    Width = 74
    Height = 13
    Caption = 'Atendimento de'
  end
  object Label8: TLabel [11]
    Left = 75
    Top = 188
    Width = 15
    Height = 13
    Caption = 'at'#233
  end
  object BitBtn1: TBitBtn [12]
    Left = 226
    Top = 221
    Width = 98
    Height = 30
    Caption = '&Visualizar'
    TabOrder = 12
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
  object medCliente: TMaskEdit [13]
    Left = 4
    Top = 18
    Width = 73
    Height = 21
    EditMask = '#########;0; '
    MaxLength = 9
    TabOrder = 0
    OnExit = medClienteExit
  end
  object edtNomeCli: TEdit [14]
    Left = 107
    Top = 18
    Width = 386
    Height = 21
    Color = clMenu
    Enabled = False
    TabOrder = 1
  end
  object cbTipo: TComboBox [15]
    Left = 363
    Top = 96
    Width = 177
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 5
    Items.Strings = (
      'Solicita'#231#227'o'
      'Reenvio'
      'Recalculo'
      'Reclama'#231#227'o'
      'Observa'#231#227'o'
      'Atendimento ao Cliente'
      'Todos')
  end
  object rgSituacao: TRadioGroup [16]
    Left = 366
    Top = 123
    Width = 174
    Height = 80
    Caption = ' Situa'#231#227'o Atendimento '
    Columns = 2
    ItemIndex = 4
    Items.Strings = (
      'Em Aberto'
      'Fechados'
      'Cancelados'
      'Em Espera'
      'Todos')
    TabOrder = 9
  end
  object dtAte: TDateEdit [17]
    Left = 128
    Top = 138
    Width = 101
    Height = 21
    CheckOnExit = True
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 7
  end
  object dtDe: TDateEdit [18]
    Left = 5
    Top = 138
    Width = 101
    Height = 21
    CheckOnExit = True
    NumGlyphs = 2
    YearDigits = dyFour
    TabOrder = 6
  end
  object edtCodigo: TEdit [19]
    Left = 4
    Top = 57
    Width = 72
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
    OnExit = edtCodigoExit
  end
  object edtFunc: TEdit [20]
    Left = 107
    Top = 57
    Width = 387
    Height = 21
    Color = clMenu
    Enabled = False
    TabOrder = 3
  end
  object cbDepto: TDBLookupComboBox [21]
    Left = 4
    Top = 96
    Width = 237
    Height = 21
    KeyField = 'COD_DEPTO'
    ListField = 'DESC_DEPTO'
    ListSource = DataSource1
    TabOrder = 4
  end
  object medAtend1: TMaskEdit [22]
    Left = 4
    Top = 182
    Width = 65
    Height = 21
    EditMask = '999999999;0; '
    MaxLength = 9
    TabOrder = 10
  end
  object medAtend2: TMaskEdit [23]
    Left = 95
    Top = 182
    Width = 65
    Height = 21
    EditMask = '999999999;0; '
    MaxLength = 9
    TabOrder = 11
  end
  object rgOrdem: TRadioGroup [24]
    Left = 233
    Top = 124
    Width = 129
    Height = 80
    Caption = ' Ordem de Impress'#227'o '
    ItemIndex = 0
    Items.Strings = (
      'C'#243'd.Cliente'
      'Nome Cliente'
      'Data + Nome Cliente')
    TabOrder = 8
  end
  inherited submenu: TMainMenu
    Left = 292
    Top = 20
  end
  inherited Calculator1: TRxCalculator
    Left = 324
    Top = 20
  end
  object qryAux: TQuery
    DatabaseName = 'db'
    Left = 356
    Top = 29
  end
  object Query1: TQuery
    DatabaseName = 'db'
    SQL.Strings = (
      'SELECT * FROM GC_DEPARTAMENTO')
    Left = 392
    Top = 32
  end
  object DataSource1: TDataSource
    DataSet = Query1
    Left = 424
    Top = 32
  end
  object RvSystem1: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemSetups = [ssAllowCopies, ssAllowCollate, ssAllowDuplex, ssAllowDestPreview, ssAllowDestPrinter, ssAllowDestFile, ssAllowPrinterSetup, ssAllowPreviewSetup]
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.FormState = wsMaximized
    SystemPreview.ZoomFactor = 120.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    OnPrint = RvSystem1Print
    OnNewPage = RvSystem1NewPage
    Left = 228
    Top = 40
  end
  object qryOcorrencia: TQuery
    DatabaseName = 'db'
    SQL.Strings = (
      
        'SELECT * FROM GC_OCORRENCIA WHERE COD_ATENDIMENTO = :COD_ATENDIM' +
        'ENTO'
      'AND COD_CLIENTE = :COD_CLIENTE')
    Left = 228
    Top = 9
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_ATENDIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'COD_CLIENTE'
        ParamType = ptUnknown
      end>
  end
end
