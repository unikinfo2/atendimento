inherited ImportaCli_f: TImportaCli_f
  Left = 279
  Top = 170
  Width = 647
  Height = 383
  Caption = 'Importa'#231#227'o de Arquivo Texto'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 639
    Height = 41
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 6
      Top = 2
      Width = 189
      Height = 13
      Caption = 'Informe o Arquivo &Texto a ser Importado'
      FocusControl = edtArq
    end
    object edtArq: TFilenameEdit
      Left = 4
      Top = 16
      Width = 565
      Height = 21
      NumGlyphs = 1
      TabOrder = 0
      OnChange = edtArqChange
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 41
    Width = 639
    Height = 227
    Align = alClient
    TabOrder = 1
    object gridDados: TStringGrid
      Left = 1
      Top = 1
      Width = 637
      Height = 225
      Align = alClient
      ColCount = 1
      DefaultRowHeight = 20
      FixedCols = 0
      RowCount = 2
      Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSizing, goColSizing, goEditing, goTabs, goRowSelect]
      TabOrder = 0
      ColWidths = (
        108)
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 268
    Width = 639
    Height = 69
    Align = alBottom
    TabOrder = 2
    object btnImporta: TBitBtn
      Left = 523
      Top = 34
      Width = 105
      Height = 29
      Caption = '&Importar'
      TabOrder = 2
      OnClick = btnImportaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        33333333333FFFFFFFFF333333000000000033333377777777773333330FFFFF
        FFF03333337F333333373333330FFFFFFFF03333337F3FF3FFF73333330F00F0
        00F03333F37F773777373330330FFFFFFFF03337FF7F3F3FF3F73339030F0800
        F0F033377F7F737737373339900FFFFFFFF03FF7777F3FF3FFF70999990F00F0
        00007777777F7737777709999990FFF0FF0377777777FF37F3730999999908F0
        F033777777777337F73309999990FFF0033377777777FFF77333099999000000
        3333777777777777333333399033333333333337773333333333333903333333
        3333333773333333333333303333333333333337333333333333}
      NumGlyphs = 2
    end
    object chkDados: TCheckBox
      Left = 5
      Top = 32
      Width = 216
      Height = 17
      Caption = 'Sobrep'#245'e dados das empresa existentes'
      TabOrder = 0
    end
    object chkSeq: TCheckBox
      Left = 5
      Top = 48
      Width = 256
      Height = 17
      Caption = 'Gerar c'#243'digos sequencias para novas empresas'
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 637
      Height = 28
      Align = alTop
      TabOrder = 3
      object ga: TGauge
        Left = 1
        Top = 1
        Width = 635
        Height = 26
        Align = alClient
        ForeColor = clNavy
        Progress = 0
      end
    end
  end
  object qryAux: TQuery
    DatabaseName = 'db'
    Left = 39
    Top = 176
  end
  object qryAux2: TQuery
    DatabaseName = 'db'
    Left = 71
    Top = 176
  end
  object qryCli: TQuery
    DatabaseName = 'db'
    SQL.Strings = (
      'SELECT * FROM GC_CLIENTE WHERE 1=0')
    Left = 111
    Top = 180
  end
end
