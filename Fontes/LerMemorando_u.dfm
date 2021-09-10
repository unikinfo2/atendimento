inherited LerMemorando_f: TLerMemorando_f
  Left = 276
  Top = 117
  Width = 713
  Height = 489
  Caption = 'Leitura de Memorando'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 705
    Height = 85
    Align = alTop
    TabOrder = 0
    object Label7: TLabel
      Left = 9
      Top = 6
      Width = 78
      Height = 13
      Caption = 'Cod.Memorando'
    end
    object Label1: TLabel
      Left = 90
      Top = 6
      Width = 82
      Height = 13
      Caption = 'Data Memorando'
    end
    object Label4: TLabel
      Left = 213
      Top = 6
      Width = 60
      Height = 13
      Caption = 'Enviado por:'
    end
    object Label5: TLabel
      Left = 277
      Top = 6
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object Label3: TLabel
      Left = 9
      Top = 43
      Width = 112
      Height = 13
      Caption = 'Assunto do Memorando'
    end
    object DBEdit2: TDBEdit
      Left = 90
      Top = 20
      Width = 119
      Height = 21
      DataField = 'DT_MEMO'
      DataSource = dsMemorando
      Enabled = False
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 9
      Top = 20
      Width = 76
      Height = 21
      DataField = 'COD_MEMO'
      DataSource = dsMemorando
      Enabled = False
      TabOrder = 0
    end
    object DBEdit4: TDBEdit
      Left = 213
      Top = 20
      Width = 61
      Height = 21
      DataField = 'COD_FUNC'
      DataSource = dsMemorando
      Enabled = False
      TabOrder = 2
    end
    object edtEnviada: TDBEdit
      Left = 278
      Top = 20
      Width = 315
      Height = 21
      DataField = 'NOME_FUNC'
      DataSource = dsMemorando
      Enabled = False
      TabOrder = 3
    end
    object rgFiltro: TRadioGroup
      Left = 600
      Top = 1
      Width = 104
      Height = 83
      Align = alRight
      Caption = ' Filtrar Memorandos '
      ItemIndex = 0
      Items.Strings = (
        'N'#227'o Lidos'
        'Lidos'
        'Todos')
      TabOrder = 4
      OnClick = rgFiltroClick
    end
    object edtAssunto: TDBEdit
      Left = 9
      Top = 57
      Width = 583
      Height = 21
      DataField = 'ASSUNTO_MEMO'
      DataSource = dsMemorando
      TabOrder = 5
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 85
    Width = 705
    Height = 317
    Align = alClient
    TabOrder = 1
    object texto: TDBRichEdit
      Left = 1
      Top = 21
      Width = 703
      Height = 295
      Align = alClient
      DataField = 'RELATO_MEMO'
      DataSource = dsMemorando
      ScrollBars = ssBoth
      TabOrder = 0
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 703
      Height = 20
      Align = alTop
      TabOrder = 1
      object Label2: TLabel
        Left = 6
        Top = 3
        Width = 27
        Height = 13
        Caption = 'Texto'
      end
      object lblStatus: TRxLabel
        Left = 500
        Top = 3
        Width = 52
        Height = 13
        Caption = 'lblStatus'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMaroon
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ShadowColor = clMoneyGreen
        ShadowSize = 3
      end
      object RxLabel1: TRxLabel
        Left = 369
        Top = 3
        Width = 130
        Height = 13
        Caption = 'Status do Memorando:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 402
    Width = 705
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnMarca: TBitBtn
      Left = 7
      Top = 6
      Width = 118
      Height = 29
      Caption = 'Marcar como Lido'
      TabOrder = 0
      OnClick = btnMarcaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555550
        00555555555FFF57775F55555500050BBB0555FFF57775777775500050EEE000
        777057775777777775F709990777777770F0777775FFFFFFF7F7099990000000
        F0F07F5557777777F7F70FFFFFFFFFF0F0F07F5555555557F7F70FFFFFFFFFF0
        F0F07F5555555557F7F70FFFFFFFFFF0F0F07F5FF5FF5F57F7F70F77F77F7FF0
        F0F07F7757757557F7F70FFFFFFFFFF0F0F07F5FF5FFF557F7F70F77F777FFF0
        F0F07F7757775557F7F70FFFFFFFFFF0F0F07FF5F5F5F5F7F7F700F0F0F0F0F0
        F00577F7F7F7F7F7F77F0070707070700005777777777777777F707070707070
        55055757575757575F7555050505050500555575757575757755}
      NumGlyphs = 2
    end
    object DBNavigator1: TDBNavigator
      Left = 292
      Top = 6
      Width = 224
      Height = 29
      DataSource = dsMemorando
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      Flat = True
      Hints.Strings = (
        'Primeiro'
        'Anterior'
        'Pr'#243'ximo'
        #218'ltimo')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
    end
    object btnImp: TBitBtn
      Left = 579
      Top = 6
      Width = 118
      Height = 29
      Caption = 'Imprime'
      TabOrder = 3
      OnClick = btnImpClick
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
    object BitBtn1: TBitBtn
      Left = 129
      Top = 6
      Width = 96
      Height = 29
      Caption = 'Responder'
      TabOrder = 1
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB0333333777F3333773333330B7FFF
        FFB0333333777F3333773333330B7FFFFFB03FFFFF777FFFFF77000000000077
        007077777777777777770FFFFFFFF00077B07F33333337FFFF770FFFFFFFF000
        7BB07F3FF3FFF77FF7770F00F000F00090077F77377737777F770FFFFFFFF039
        99337F3FFFF3F7F777FF0F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
    end
  end
  object qryMemorando: TQuery
    AfterScroll = qryMemorandoAfterScroll
    DatabaseName = 'db'
    SQL.Strings = (
      'SELECT * FROM GC_MEMORANDO MEM'
      'LEFT JOIN GC_FUNCIONARIO FUN ON (MEM.COD_FUNC=FUN.COD_FUNC)')
    Left = 600
    Top = 69
  end
  object dsMemorando: TDataSource
    DataSet = qryMemorando
    Left = 636
    Top = 69
  end
  object qryAux: TQuery
    DatabaseName = 'db'
    RequestLive = True
    Left = 601
    Top = 106
  end
end
