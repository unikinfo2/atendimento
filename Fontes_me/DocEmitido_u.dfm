inherited DocEmitido_f: TDocEmitido_f
  Left = 218
  Top = 105
  Width = 539
  Height = 510
  Caption = 'Documentos Emitidos'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 531
    Height = 278
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 45
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object sbPesq: TSpeedButton
      Left = 82
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
      OnClick = sbPesqClick
    end
    object Label2: TLabel
      Left = 108
      Top = 45
      Width = 96
      Height = 13
      Caption = 'Nome/Raz'#227'o Social'
    end
    object Label8: TLabel
      Left = 8
      Top = 6
      Width = 81
      Height = 13
      Caption = 'C'#243'digo &Protocolo'
      FocusControl = edtProtocolo
    end
    object SpeedButton2: TSpeedButton
      Left = 83
      Top = 21
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
    object Label7: TLabel
      Left = 8
      Top = 80
      Width = 58
      Height = 13
      Caption = 'Observa'#231#227'o'
    end
    object Label5: TLabel
      Left = 371
      Top = 140
      Width = 65
      Height = 13
      Caption = 'Data Emiss'#227'o'
    end
    object Label6: TLabel
      Left = 7
      Top = 198
      Width = 104
      Height = 13
      Caption = 'Data Prevista Entrega'
    end
    object Label9: TLabel
      Left = 6
      Top = 238
      Width = 82
      Height = 13
      Caption = 'Cod.Func.Exped.'
    end
    object SpeedButton3: TSpeedButton
      Left = 79
      Top = 251
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
      OnClick = SpeedButton3Click
    end
    object Label10: TLabel
      Left = 106
      Top = 238
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object Label12: TLabel
      Left = 130
      Top = 198
      Width = 63
      Height = 13
      Caption = 'Data Entrega'
    end
    object lblSituacao: TLabel
      Left = 117
      Top = 21
      Width = 245
      Height = 20
      AutoSize = False
      Caption = 'lblSituacao'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 261
      Top = 197
      Width = 79
      Height = 13
      Caption = 'Aos cuidados de'
    end
    object medCliente: TMaskEdit
      Left = 8
      Top = 58
      Width = 73
      Height = 21
      Enabled = False
      EditMask = '#########;0; '
      MaxLength = 9
      TabOrder = 1
      OnExit = medClienteExit
    end
    object edtNomeCli: TEdit
      Left = 108
      Top = 58
      Width = 381
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
      TabOrder = 2
    end
    object edtProtocolo: TEdit
      Left = 8
      Top = 21
      Width = 73
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnExit = edtProtocoloExit
    end
    object DBMemo1: TDBMemo
      Left = 8
      Top = 94
      Width = 481
      Height = 39
      DataField = 'OBS_PROTOCOLO'
      DataSource = dsProtocolo
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 371
      Top = 155
      Width = 121
      Height = 21
      DataField = 'DT_EMISSAO_PROTO'
      DataSource = dsProtocolo
      Enabled = False
      TabOrder = 11
    end
    object edtCodigo: TEdit
      Left = 6
      Top = 252
      Width = 71
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 15
      OnExit = edtCodigoExit
    end
    object edtFunc: TEdit
      Left = 106
      Top = 252
      Width = 381
      Height = 21
      TabStop = False
      Color = clMenu
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 16
    end
    object DBDateEdit1: TDBDateEdit
      Left = 7
      Top = 213
      Width = 121
      Height = 21
      DataField = 'DT_ENTREGA_PREV'
      DataSource = dsProtocolo
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 12
      YearDigits = dyFour
    end
    object DBDateEdit2: TDBDateEdit
      Left = 130
      Top = 213
      Width = 121
      Height = 21
      DataField = 'DT_ENTREGA_PROTO'
      DataSource = dsProtocolo
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 13
      YearDigits = dyFour
      OnExit = DBDateEdit2Exit
    end
    object BitBtn2: TBitBtn
      Left = 10
      Top = 140
      Width = 85
      Height = 25
      Caption = '&Expedi'#231#227'o'
      Enabled = False
      TabOrder = 4
      OnClick = BitBtn2Click
    end
    object BitBtn4: TBitBtn
      Left = 99
      Top = 140
      Width = 75
      Height = 25
      Caption = 'En&tregue'
      Enabled = False
      TabOrder = 6
      OnClick = BitBtn4Click
    end
    object BitBtn5: TBitBtn
      Left = 99
      Top = 168
      Width = 75
      Height = 25
      Caption = '&Retirado'
      Enabled = False
      TabOrder = 7
      OnClick = BitBtn5Click
    end
    object BitBtn6: TBitBtn
      Left = 178
      Top = 168
      Width = 75
      Height = 25
      Caption = 'De&volvido'
      Enabled = False
      TabOrder = 9
      OnClick = BitBtn6Click
    end
    object BitBtn7: TBitBtn
      Left = 178
      Top = 140
      Width = 75
      Height = 25
      Caption = 'End.Errado'
      Enabled = False
      TabOrder = 8
      OnClick = BitBtn7Click
    end
    object BitBtn8: TBitBtn
      Left = 10
      Top = 168
      Width = 85
      Height = 25
      Caption = 'Entrega Canc.'
      Enabled = False
      TabOrder = 5
      OnClick = BitBtn8Click
    end
    object BitBtn9: TBitBtn
      Left = 260
      Top = 140
      Width = 86
      Height = 25
      Caption = 'Retorn.Protoc.'
      Enabled = False
      TabOrder = 10
      OnClick = BitBtn9Click
    end
    object DBEdit2: TDBEdit
      Left = 258
      Top = 212
      Width = 235
      Height = 21
      DataField = 'RESPONSAVEL_PROTO'
      DataSource = dsProtocolo
      TabOrder = 14
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 278
    Width = 531
    Height = 154
    Align = alClient
    TabOrder = 1
    object Label3: TLabel
      Left = 4
      Top = 4
      Width = 68
      Height = 13
      Caption = 'C'#243'digo Docto.'
    end
    object sbPesDocto: TSpeedButton
      Left = 80
      Top = 17
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
    object Label4: TLabel
      Left = 104
      Top = 4
      Width = 95
      Height = 13
      Caption = 'Descri'#231#227'o do Docto'
    end
    object Label11: TLabel
      Left = 227
      Top = 42
      Width = 64
      Height = 13
      Caption = 'Complemento'
    end
    object Label13: TLabel
      Left = 4
      Top = 42
      Width = 56
      Height = 13
      Caption = 'Vencimento'
    end
    object Label15: TLabel
      Left = 104
      Top = 42
      Width = 24
      Height = 13
      Caption = 'Valor'
    end
    object edtCodDocto: TEdit
      Left = 4
      Top = 18
      Width = 73
      Height = 21
      CharCase = ecUpperCase
      TabOrder = 0
      OnExit = edtCodDoctoExit
    end
    object edtDescDocto: TEdit
      Left = 104
      Top = 18
      Width = 297
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
      TabOrder = 1
    end
    object DBGrid1: TDBGrid
      Left = 1
      Top = 77
      Width = 529
      Height = 76
      Align = alBottom
      DataSource = dsDoctoEmitido
      TabOrder = 7
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DESC_DOCTO'
          Title.Caption = 'Descri'#231#227'o Docto.'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'OBS_DOCTO_EMI'
          Title.Caption = 'Complemento'
          Width = 175
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_VENCIMENTO'
          Title.Caption = 'Vencimento'
          Width = 91
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR_DOCTO_EMI'
          Title.Caption = 'Vlr.Docto'
          Width = 103
          Visible = True
        end>
    end
    object btnApaga: TBitBtn
      Left = 452
      Top = 29
      Width = 73
      Height = 25
      Caption = '&Apagar'
      TabOrder = 6
      TabStop = False
      OnClick = btnApagaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
        305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
        005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
        B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
        B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
        B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
        B0557777FF577777F7F500000E055550805577777F7555575755500000555555
        05555777775555557F5555000555555505555577755555557555}
      NumGlyphs = 2
    end
    object edtCompl: TEdit
      Left = 227
      Top = 56
      Width = 297
      Height = 21
      TabOrder = 4
    end
    object btnGrava: TBitBtn
      Left = 452
      Top = 2
      Width = 73
      Height = 25
      Caption = 'Grava'
      TabOrder = 5
      OnClick = btnGravaClick
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
    end
    object DateEdit1: TDateEdit
      Left = 4
      Top = 56
      Width = 99
      Height = 21
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 2
    end
    object edtValDocto: TRxCalcEdit
      Left = 105
      Top = 56
      Width = 121
      Height = 21
      AutoSize = False
      DisplayFormat = ',0.00'
      NumGlyphs = 2
      TabOrder = 3
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 432
    Width = 531
    Height = 32
    Align = alBottom
    TabOrder = 2
    object BitBtn3: TBitBtn
      Left = 5
      Top = 4
      Width = 109
      Height = 25
      Caption = '&Novo'
      TabOrder = 1
      OnClick = BitBtn3Click
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
      Left = 118
      Top = 4
      Width = 109
      Height = 25
      Caption = '&Grava'
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
    object BitBtn10: TBitBtn
      Left = 426
      Top = 3
      Width = 68
      Height = 25
      Caption = 'Imprime'
      TabOrder = 3
      Visible = False
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
    object BitBtn11: TBitBtn
      Left = 232
      Top = 4
      Width = 109
      Height = 25
      Caption = '&Copiar/Imprimir'
      TabOrder = 2
      OnClick = BitBtn11Click
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
  end
  inherited submenu: TMainMenu
    Left = 8
    Top = 380
    object Cadastros1: TMenuItem
      Caption = 'C&adastros'
      object Documentos1: TMenuItem
        Caption = '&Documentos'
        OnClick = Documentos1Click
      end
    end
  end
  object qryAux: TQuery [4]
    DatabaseName = 'db'
    RequestLive = True
    Left = 396
    Top = 88
  end
  object qryDocto: TQuery [5]
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_DOCUMENTO WHERE COD_DOCTO = :COD_DOCTO')
    Left = 412
    Top = 40
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_DOCTO'
        ParamType = ptUnknown
      end>
  end
  object qryProtocolo: TQuery [6]
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_PROTOCOLO '
      'WHERE COD_PROTOCOLO = :COD_PROTOCOLO')
    Left = 312
    Top = 76
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_PROTOCOLO'
        ParamType = ptUnknown
      end>
    object qryProtocoloCOD_PROTOCOLO: TIntegerField
      FieldName = 'COD_PROTOCOLO'
      Origin = 'DB.GC_PROTOCOLO.COD_PROTOCOLO'
    end
    object qryProtocoloCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'DB.GC_PROTOCOLO.COD_CLIENTE'
    end
    object qryProtocoloDT_EMISSAO_PROTO: TDateTimeField
      FieldName = 'DT_EMISSAO_PROTO'
      Origin = 'DB.GC_PROTOCOLO.DT_EMISSAO_PROTO'
      EditMask = '99/99/9999;1; '
    end
    object qryProtocoloDT_ENTREGA_PREV: TDateTimeField
      FieldName = 'DT_ENTREGA_PREV'
      Origin = 'DB.GC_PROTOCOLO.DT_ENTREGA_PREV'
      EditMask = '99/99/9999;1; '
    end
    object qryProtocoloDT_ENTREGA_PROTO: TDateTimeField
      FieldName = 'DT_ENTREGA_PROTO'
      Origin = 'DB.GC_PROTOCOLO.DT_ENTREGA_PROTO'
      EditMask = '99/99/9999;1; '
    end
    object qryProtocoloSTATUS_ENTREGA: TStringField
      FieldName = 'STATUS_ENTREGA'
      Origin = 'DB.GC_PROTOCOLO.STATUS_ENTREGA'
      Size = 1
    end
    object qryProtocoloCOD_FUNC: TIntegerField
      FieldName = 'COD_FUNC'
      Origin = 'DB.GC_PROTOCOLO.COD_FUNC'
    end
    object qryProtocoloCOD_FUNC_CAD: TIntegerField
      FieldName = 'COD_FUNC_CAD'
      Origin = 'DB.GC_PROTOCOLO.COD_FUNC_CAD'
    end
    object qryProtocoloRESPONSAVEL_PROTO: TStringField
      FieldName = 'RESPONSAVEL_PROTO'
      Origin = 'DB.GC_PROTOCOLO.RESPONSAVEL_PROTO'
      Size = 30
    end
    object qryProtocoloOBS_PROTOCOLO: TMemoField
      FieldName = 'OBS_PROTOCOLO'
      Origin = 'DB.GC_PROTOCOLO.OBS_PROTOCOLO'
      BlobType = ftMemo
      Size = 1000
    end
  end
  object dsProtocolo: TDataSource [7]
    AutoEdit = False
    DataSet = qryProtocolo
    Left = 280
    Top = 77
  end
  inherited Calculator1: TRxCalculator
    Left = 332
    Top = 20
  end
  object qryDocEmi: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT * FROM GC_DOCUMENTO_EMITIDO WHERE COD_PROTOCOLO = :COD_PR' +
        'OTOCOLO')
    Left = 392
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_PROTOCOLO'
        ParamType = ptUnknown
      end>
  end
  object dsDoctoEmitido: TDataSource
    AutoEdit = False
    DataSet = qryDoctoEmitido
    Left = 200
    Top = 409
  end
  object qryDoctoEmitido: TQuery
    DatabaseName = 'db'
    SQL.Strings = (
      
        'SELECT EMI.COD_DOCTO_EMI, EMI.OBS_DOCTO_EMI, EMI.COD_DOCTO, DOC.' +
        'DESC_DOCTO, EMI.DT_VENCIMENTO, EMI.VALOR_DOCTO_EMI '
      'FROM GC_DOCUMENTO_EMITIDO EMI'
      'LEFT JOIN GC_DOCUMENTO DOC ON (EMI.COD_DOCTO = DOC.COD_DOCTO)'
      'WHERE EMI.COD_PROTOCOLO = :COD_PROTOCOLO')
    Left = 168
    Top = 388
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_PROTOCOLO'
        ParamType = ptUnknown
      end>
    object qryDoctoEmitidoOBS_DOCTO_EMI: TStringField
      FieldName = 'OBS_DOCTO_EMI'
      Origin = 'DB.GC_DOCUMENTO_EMITIDO.OBS_DOCTO_EMI'
      Size = 30
    end
    object qryDoctoEmitidoCOD_DOCTO: TIntegerField
      FieldName = 'COD_DOCTO'
      Origin = 'DB.GC_DOCUMENTO_EMITIDO.COD_DOCTO'
    end
    object qryDoctoEmitidoDESC_DOCTO: TStringField
      FieldName = 'DESC_DOCTO'
      Origin = 'DB.GC_DOCUMENTO.DESC_DOCTO'
      Size = 50
    end
    object qryDoctoEmitidoCOD_DOCTO_EMI: TIntegerField
      FieldName = 'COD_DOCTO_EMI'
      Origin = 'DB.GC_DOCUMENTO_EMITIDO.COD_DOCTO_EMI'
    end
    object qryDoctoEmitidoDT_VENCIMENTO: TDateTimeField
      FieldName = 'DT_VENCIMENTO'
      Origin = 'DB.GC_DOCUMENTO_EMITIDO.DT_VENCIMENTO'
    end
    object qryDoctoEmitidoVALOR_DOCTO_EMI: TFloatField
      FieldName = 'VALOR_DOCTO_EMI'
      Origin = 'DB.GC_DOCUMENTO_EMITIDO.VALOR_DOCTO_EMI'
      DisplayFormat = ',0.00'
    end
  end
  object qryImpPro: TQuery
    DatabaseName = 'db'
    Left = 444
    Top = 96
  end
end
