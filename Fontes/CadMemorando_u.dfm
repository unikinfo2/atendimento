inherited CadMemorando_f: TCadMemorando_f
  Left = 200
  Top = 142
  Width = 712
  Height = 508
  Caption = 'Cadastro de Memorando Interno'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 704
    Height = 129
    Align = alTop
    TabOrder = 0
    object Label7: TLabel
      Left = 8
      Top = 3
      Width = 78
      Height = 13
      Caption = 'Cod.Memorando'
    end
    object SpeedButton2: TSpeedButton
      Left = 84
      Top = 19
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
      OnClick = SpeedButton2Click
    end
    object Label1: TLabel
      Left = 120
      Top = 3
      Width = 82
      Height = 13
      Caption = 'Data Memorando'
    end
    object Label4: TLabel
      Left = 372
      Top = 3
      Width = 57
      Height = 13
      Caption = 'Enviar para:'
    end
    object Label6: TLabel
      Left = 8
      Top = 89
      Width = 63
      Height = 13
      Caption = 'C'#243'digo Func.'
    end
    object SpeedButton1: TSpeedButton
      Left = 76
      Top = 104
      Width = 24
      Height = 22
      Enabled = False
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
    object Label5: TLabel
      Left = 103
      Top = 89
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object SpeedButton3: TSpeedButton
      Left = 372
      Top = 19
      Width = 58
      Height = 22
      Caption = 'Todos'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        555555555555555555555555555555555555555555FF55555555555559055555
        55555555577FF5555555555599905555555555557777F5555555555599905555
        555555557777FF5555555559999905555555555777777F555555559999990555
        5555557777777FF5555557990599905555555777757777F55555790555599055
        55557775555777FF5555555555599905555555555557777F5555555555559905
        555555555555777FF5555555555559905555555555555777FF55555555555579
        05555555555555777FF5555555555557905555555555555777FF555555555555
        5990555555555555577755555555555555555555555555555555}
      NumGlyphs = 2
      Spacing = 0
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 372
      Top = 43
      Width = 58
      Height = 22
      Caption = 'Todos'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
      Spacing = 0
      OnClick = SpeedButton4Click
    end
    object medMemo: TMaskEdit
      Left = 8
      Top = 19
      Width = 73
      Height = 21
      EditMask = '#########;0; '
      MaxLength = 9
      TabOrder = 0
      OnExit = medMemoExit
    end
    object clbFunc: TCheckListBox
      Left = 433
      Top = 3
      Width = 267
      Height = 123
      ItemHeight = 13
      TabOrder = 5
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 9
      Top = 43
      Width = 284
      Height = 43
      Caption = ' Status do Memorando '
      Columns = 3
      DataField = 'STATUS_MEMO'
      DataSource = dsMemo
      Items.Strings = (
        'Em Aberto'
        'Recebido'
        'Cancelado')
      ReadOnly = True
      TabOrder = 2
      Values.Strings = (
        'A'
        'R'
        'C')
    end
    object edtCodigo: TEdit
      Left = 8
      Top = 104
      Width = 65
      Height = 21
      CharCase = ecUpperCase
      Color = clMenu
      Enabled = False
      TabOrder = 3
      OnExit = edtCodigoExit
    end
    object edtFunc: TEdit
      Left = 102
      Top = 104
      Width = 311
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 4
    end
    object DBEdit2: TDBEdit
      Left = 120
      Top = 19
      Width = 145
      Height = 21
      DataField = 'DT_MEMO'
      DataSource = dsMemo
      Enabled = False
      TabOrder = 1
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 129
    Width = 704
    Height = 292
    Align = alClient
    TabOrder = 1
    object Label3: TLabel
      Left = 6
      Top = 3
      Width = 112
      Height = 13
      Caption = 'Assunto do Memorando'
    end
    object Label2: TLabel
      Left = 6
      Top = 43
      Width = 27
      Height = 13
      Caption = 'Texto'
    end
    object DBEdit1: TDBEdit
      Left = 6
      Top = 17
      Width = 549
      Height = 21
      DataField = 'ASSUNTO_MEMO'
      DataSource = dsMemo
      TabOrder = 0
    end
    object memoTexto: TDBRichEdit
      Left = 6
      Top = 56
      Width = 691
      Height = 234
      DataField = 'RELATO_MEMO'
      DataSource = dsMemo
      TabOrder = 1
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 421
    Width = 704
    Height = 41
    Align = alBottom
    TabOrder = 2
    object btnNovo: TBitBtn
      Left = 185
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Novo'
      TabOrder = 1
      OnClick = btnNovoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
        0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
        33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
    end
    object BitBtn1: TBitBtn
      Left = 272
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Grava'
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
        7700333333337777777733333333008088003333333377F73377333333330088
        88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
        000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
        FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
        99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
        99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
        99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
        93337FFFF7737777733300000033333333337777773333333333}
      NumGlyphs = 2
    end
    object BitBtn2: TBitBtn
      Left = 358
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = BitBtn2Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
    end
    object btnImp: TBitBtn
      Left = 444
      Top = 8
      Width = 75
      Height = 25
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
  end
  object qryAux: TQuery
    DatabaseName = 'db'
    Left = 296
    Top = 4
  end
  object dsMemo: TDataSource
    AutoEdit = False
    DataSet = qryMemo
    Left = 296
    Top = 36
  end
  object qryMemo: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_MEMORANDO WHERE COD_MEMO = 0')
    Left = 328
    Top = 36
  end
  object Query1: TQuery
    DatabaseName = 'db'
    SQL.Strings = (
      'SELECT * FROM GC_MEMORANDO')
    Left = 300
    Top = 72
  end
  object qryMemoFunc: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT * FROM GC_MEMORANDO_FUNC WHERE COD_MEMO = 0 AND COD_FUNC ' +
        '= 0')
    Left = 332
    Top = 72
  end
end
