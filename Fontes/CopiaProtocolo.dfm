inherited CopiaProtocolo_f: TCopiaProtocolo_f
  Left = 182
  Top = 109
  Width = 599
  Height = 405
  Caption = 'Copia Protocolo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel [0]
    Left = 0
    Top = 318
    Width = 591
    Height = 41
    Align = alBottom
    TabOrder = 0
    object BitBtn1: TBitBtn
      Left = 218
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Gerar'
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555000000
        000055555F77777777775555000FFFFFFFF0555F777F5FFFF55755000F0F0000
        FFF05F777F7F77775557000F0F0FFFFFFFF0777F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFFFFF70F0F0F0F0000
        00F07F7F7F7F777777570F0F0F0FFFFFFFF07F7F7F7F5FFF55570F0F0F0F000F
        FFF07F7F7F7F77755FF70F0F0F0FFFFF00007F7F7F7F5FF577770F0F0F0F00FF
        0F057F7F7F7F77557F750F0F0F0FFFFF00557F7F7F7FFFFF77550F0F0F000000
        05557F7F7F77777775550F0F0000000555557F7F7777777555550F0000000555
        55557F7777777555555500000005555555557777777555555555}
      NumGlyphs = 2
    end
    object BitBtn10: TBitBtn
      Left = 298
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Imprime'
      TabOrder = 1
      OnClick = BitBtn10Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
        00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
        8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
        8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
        8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
        03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
        03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
        33333337FFFF7733333333300000033333333337777773333333}
      NumGlyphs = 2
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 591
    Height = 318
    Align = alClient
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 8
      Width = 321
      Height = 41
      AutoSize = False
      Caption = '&Marque os Clientes para quem Deseja Gerar Protocolo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object Label1: TLabel
      Left = 358
      Top = 3
      Width = 229
      Height = 48
      AutoSize = False
      Caption = 
        'Informe os Codigos dos Protocolos '#224' serem Impressos entre Virgul' +
        'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object memoProto: TMemo
      Left = 358
      Top = 53
      Width = 228
      Height = 260
      TabOrder = 1
    end
    object lblCliente: TCheckListBox
      Left = 8
      Top = 53
      Width = 346
      Height = 260
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object qryAux: TQuery
    DatabaseName = 'db'
    Left = 320
    Top = 72
  end
  object qryProtocolo: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_PROTOCOLO WHERE 1=0')
    Left = 144
    Top = 128
  end
  object qryDoc_Emi: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_DOCUMENTO_EMITIDO WHERE 1=0')
    Left = 144
    Top = 96
  end
  object RvSystem3: TRvSystem
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
    OnPrint = RvSystem3Print
    OnBeforePrint = RvSystem3BeforePrint
    OnNewPage = RvSystem3NewPage
    Left = 144
    Top = 180
  end
  object qryImpPro: TQuery
    DatabaseName = 'db'
    SQL.Strings = (
      'SELECT * FROM GC_PROTOCOLO PRO'
      '  LEFT JOIN GC_CLIENTE CLI ON (PRO.COD_CLIENTE=CLI.COD_CLIENTE)'
      
        '  LEFT JOIN GC_FUNCIONARIO FUN ON (PRO.COD_FUNC_CAD=FUN.COD_FUNC' +
        ')'
      '  LEFT JOIN GC_DEPARTAMENTO DEP ON (FUN.COD_DEPTO=DEP.COD_DEPTO)'
      '  LEFT JOIN GC_SETOR SETOR ON (CLI.COD_SETOR=SETOR.COD_SETOR)')
    Left = 318
    Top = 114
  end
  object qryLinhas: TQuery
    DatabaseName = 'db'
    Left = 324
    Top = 149
  end
end
