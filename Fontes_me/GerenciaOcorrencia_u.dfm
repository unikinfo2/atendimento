inherited GerenciaOcorrencia_f: TGerenciaOcorrencia_f
  Left = 204
  Top = 121
  Width = 750
  Height = 550
  Caption = 'Gerenciamento das Informa'#231#245'es do Atendimento'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object pc: TPageControl [0]
    Left = 0
    Top = 0
    Width = 742
    Height = 504
    ActivePage = TabSheet1
    Align = alClient
    HotTrack = True
    MultiLine = True
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Dados para Filtro das Informa'#231#245'es'
      object Label1: TLabel
        Left = 108
        Top = 224
        Width = 104
        Height = 13
        Caption = 'Per'#237'odo p/ An'#225'lise de'
      end
      object Label2: TLabel
        Left = 236
        Top = 224
        Width = 16
        Height = 13
        Caption = 'At'#233
      end
      object Label3: TLabel
        Left = 108
        Top = 104
        Width = 32
        Height = 13
        Caption = 'Cliente'
      end
      object sbPesq: TSpeedButton
        Left = 185
        Top = 120
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
      object Label4: TLabel
        Left = 211
        Top = 104
        Width = 96
        Height = 13
        Caption = 'Nome/Raz'#227'o Social'
      end
      object Label6: TLabel
        Left = 108
        Top = 142
        Width = 63
        Height = 13
        Caption = 'C'#243'digo Func.'
      end
      object SpeedButton1: TSpeedButton
        Left = 185
        Top = 155
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
      object Label5: TLabel
        Left = 211
        Top = 142
        Width = 28
        Height = 13
        Caption = 'Nome'
      end
      object Label7: TLabel
        Left = 108
        Top = 180
        Width = 68
        Height = 13
        Caption = 'C'#243'digo Depto.'
      end
      object SpeedButton2: TSpeedButton
        Left = 185
        Top = 195
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
      object Label8: TLabel
        Left = 211
        Top = 180
        Width = 95
        Height = 13
        Caption = 'Descri'#231#227'o do Depto'
      end
      object dtDe: TDateEdit
        Left = 108
        Top = 240
        Width = 120
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 6
      end
      object dtAte: TDateEdit
        Left = 236
        Top = 240
        Width = 120
        Height = 21
        NumGlyphs = 2
        YearDigits = dyFour
        TabOrder = 7
      end
      object medCliente: TMaskEdit
        Left = 108
        Top = 120
        Width = 73
        Height = 21
        EditMask = '#########;0; '
        MaxLength = 9
        TabOrder = 0
        OnExit = medClienteExit
      end
      object edtNomeCli: TEdit
        Left = 211
        Top = 120
        Width = 394
        Height = 21
        Color = clMenu
        Enabled = False
        TabOrder = 1
      end
      object edtCodigo: TEdit
        Left = 108
        Top = 156
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 2
        OnExit = edtCodigoExit
      end
      object edtFunc: TEdit
        Left = 211
        Top = 156
        Width = 394
        Height = 21
        Color = clMenu
        Enabled = False
        TabOrder = 3
      end
      object edtDepto: TEdit
        Left = 108
        Top = 195
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 4
        OnExit = edtDeptoExit
      end
      object edtDesc: TEdit
        Left = 211
        Top = 195
        Width = 394
        Height = 21
        Color = clMenu
        Enabled = False
        TabOrder = 5
      end
      object BitBtn1: TBitBtn
        Left = 288
        Top = 336
        Width = 129
        Height = 33
        Caption = '&Consultar'
        TabOrder = 9
        OnClick = BitBtn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333300000000
          0000333377777777777733330FFFFFFFFFF033337F3FFF3F3FF733330F000F0F
          00F033337F777373773733330FFFFFFFFFF033337F3FF3FF3FF733330F00F00F
          00F033337F773773773733330FFFFFFFFFF033337FF3333FF3F7333300FFFF00
          F0F03333773FF377F7373330FB00F0F0FFF0333733773737F3F7330FB0BF0FB0
          F0F0337337337337373730FBFBF0FB0FFFF037F333373373333730BFBF0FB0FF
          FFF037F3337337333FF700FBFBFB0FFF000077F333337FF37777E0BFBFB000FF
          0FF077FF3337773F7F37EE0BFB0BFB0F0F03777FF3733F737F73EEE0BFBF00FF
          00337777FFFF77FF7733EEEE0000000003337777777777777333}
        NumGlyphs = 2
      end
      object rgApu: TRadioGroup
        Left = 420
        Top = 219
        Width = 185
        Height = 64
        Caption = ' Apura'#231#227'o de Informa'#231#245'es '
        ItemIndex = 0
        Items.Strings = (
          'Por Clientes'
          'Por Funcion'#225'rios'
          'Por Departamentos')
        TabOrder = 8
      end
    end
    object tsCli: TTabSheet
      Caption = 'Informa'#231#245'es por Clientes'
      ImageIndex = 1
      object Label9: TLabel
        Left = 499
        Top = 63
        Width = 97
        Height = 13
        Caption = 'Liga'#231#245'es Solicitadas'
      end
      object Label10: TLabel
        Left = 499
        Top = 87
        Width = 97
        Height = 13
        Caption = 'Liga'#231#245'es Recebidas'
      end
      object Label11: TLabel
        Left = 499
        Top = 111
        Width = 52
        Height = 13
        Caption = 'Liga'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 499
        Top = 162
        Width = 114
        Height = 13
        Caption = 'Atendimentos Fechados'
      end
      object Label13: TLabel
        Left = 499
        Top = 186
        Width = 116
        Height = 13
        Caption = 'Atendimentos Em Aberto'
      end
      object Label14: TLabel
        Left = 499
        Top = 210
        Width = 118
        Height = 13
        Caption = 'Atendimentos Em Espera'
      end
      object Label15: TLabel
        Left = 499
        Top = 234
        Width = 77
        Height = 13
        Caption = 'Atendimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RxLabel1: TRxLabel
        Left = 529
        Top = 0
        Width = 204
        Height = 49
        AutoSize = False
        Caption = 'Dados apurados a partir das informa'#231#245'es fornecidas no filtro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ShadowColor = clAqua
        WordWrap = True
      end
      object Label16: TLabel
        Left = 499
        Top = 283
        Width = 111
        Height = 13
        Caption = 'Documentos Entregues'
      end
      object Label17: TLabel
        Left = 499
        Top = 331
        Width = 219
        Height = 13
        Caption = 'Em m'#233'dia '#233' gasto para fechar um atendimento'
      end
      object Label18: TLabel
        Left = 541
        Top = 349
        Width = 21
        Height = 13
        Caption = 'Dias'
      end
      object Label19: TLabel
        Left = 585
        Top = 349
        Width = 28
        Height = 13
        Caption = 'Horas'
      end
      object Label20: TLabel
        Left = 633
        Top = 349
        Width = 37
        Height = 13
        Caption = 'Minutos'
      end
      object SpeedButton3: TSpeedButton
        Left = 497
        Top = 2
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
        OnClick = SpeedButton3Click
      end
      object tvCli: TTreeView
        Left = 0
        Top = 0
        Width = 493
        Height = 476
        Align = alLeft
        Indent = 19
        TabOrder = 0
      end
      object vlrSol: TRxCalcEdit
        Left = 624
        Top = 59
        Width = 105
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 1
      end
      object vlrRec: TRxCalcEdit
        Left = 624
        Top = 83
        Width = 105
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 2
      end
      object vlrLig: TRxCalcEdit
        Left = 624
        Top = 107
        Width = 105
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 3
      end
      object VlrFec: TRxCalcEdit
        Left = 624
        Top = 158
        Width = 105
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 4
      end
      object vlrAbe: TRxCalcEdit
        Left = 624
        Top = 182
        Width = 105
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 5
      end
      object vlrEsp: TRxCalcEdit
        Left = 624
        Top = 206
        Width = 105
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 6
      end
      object vlrAtend: TRxCalcEdit
        Left = 624
        Top = 230
        Width = 105
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 7
      end
      object vlrDoc: TRxCalcEdit
        Left = 624
        Top = 279
        Width = 105
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 8
      end
      object medDia: TMaskEdit
        Left = 541
        Top = 363
        Width = 38
        Height = 21
        TabStop = False
        EditMask = '999;0; '
        MaxLength = 3
        ReadOnly = True
        TabOrder = 9
      end
      object medHora: TMaskEdit
        Left = 585
        Top = 363
        Width = 40
        Height = 21
        TabStop = False
        EditMask = '99;0; '
        MaxLength = 2
        ReadOnly = True
        TabOrder = 10
      end
      object medMin: TMaskEdit
        Left = 633
        Top = 363
        Width = 40
        Height = 21
        TabStop = False
        EditMask = '99;0; '
        MaxLength = 2
        ReadOnly = True
        TabOrder = 11
      end
    end
    object tsFun: TTabSheet
      Caption = 'Informa'#231#245'es por Funcion'#225'rios'
      ImageIndex = 2
      object Label21: TLabel
        Left = 499
        Top = 63
        Width = 97
        Height = 13
        Caption = 'Liga'#231#245'es Solicitadas'
      end
      object Label22: TLabel
        Left = 499
        Top = 87
        Width = 97
        Height = 13
        Caption = 'Liga'#231#245'es Recebidas'
      end
      object Label23: TLabel
        Left = 499
        Top = 111
        Width = 52
        Height = 13
        Caption = 'Liga'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label24: TLabel
        Left = 499
        Top = 222
        Width = 114
        Height = 13
        Caption = 'Atendimentos Fechados'
      end
      object Label25: TLabel
        Left = 499
        Top = 246
        Width = 116
        Height = 13
        Caption = 'Atendimentos Em Aberto'
      end
      object Label26: TLabel
        Left = 499
        Top = 270
        Width = 118
        Height = 13
        Caption = 'Atendimentos Em Espera'
      end
      object Label27: TLabel
        Left = 499
        Top = 294
        Width = 77
        Height = 13
        Caption = 'Atendimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RxLabel2: TRxLabel
        Left = 525
        Top = 0
        Width = 204
        Height = 49
        AutoSize = False
        Caption = 'Dados apurados a partir das informa'#231#245'es fornecidas no filtro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ShadowColor = clAqua
        WordWrap = True
      end
      object Label28: TLabel
        Left = 499
        Top = 343
        Width = 111
        Height = 13
        Caption = 'Documentos Entregues'
      end
      object Label29: TLabel
        Left = 499
        Top = 369
        Width = 219
        Height = 13
        Caption = 'Em m'#233'dia '#233' gasto para fechar um atendimento'
      end
      object Label30: TLabel
        Left = 541
        Top = 387
        Width = 21
        Height = 13
        Caption = 'Dias'
      end
      object Label31: TLabel
        Left = 585
        Top = 387
        Width = 28
        Height = 13
        Caption = 'Horas'
      end
      object Label32: TLabel
        Left = 633
        Top = 387
        Width = 37
        Height = 13
        Caption = 'Minutos'
      end
      object SpeedButton4: TSpeedButton
        Left = 497
        Top = 2
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
        OnClick = SpeedButton4Click
      end
      object Label33: TLabel
        Left = 499
        Top = 135
        Width = 80
        Height = 13
        Caption = 'Origem Particular'
      end
      object Label47: TLabel
        Left = 499
        Top = 159
        Width = 91
        Height = 13
        Caption = 'Origem Funcionario'
      end
      object Label48: TLabel
        Left = 499
        Top = 183
        Width = 68
        Height = 13
        Caption = 'Origem Cliente'
      end
      object tvFun: TTreeView
        Left = 0
        Top = 0
        Width = 493
        Height = 476
        Align = alLeft
        Indent = 19
        TabOrder = 0
      end
      object vlrSol2: TRxCalcEdit
        Left = 624
        Top = 59
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 1
      end
      object vlrRec2: TRxCalcEdit
        Left = 624
        Top = 83
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 2
      end
      object vlrLig2: TRxCalcEdit
        Left = 624
        Top = 107
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 3
      end
      object vlrFec2: TRxCalcEdit
        Left = 624
        Top = 218
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 7
      end
      object vlrAbe2: TRxCalcEdit
        Left = 624
        Top = 242
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 8
      end
      object vlrEsp2: TRxCalcEdit
        Left = 624
        Top = 266
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 9
      end
      object vlrAtend2: TRxCalcEdit
        Left = 624
        Top = 290
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 10
      end
      object vlrDoc2: TRxCalcEdit
        Left = 624
        Top = 339
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 11
      end
      object medDia2: TMaskEdit
        Left = 541
        Top = 401
        Width = 36
        Height = 21
        TabStop = False
        EditMask = '999;0; '
        MaxLength = 3
        ReadOnly = True
        TabOrder = 12
      end
      object medHora2: TMaskEdit
        Left = 585
        Top = 401
        Width = 39
        Height = 21
        TabStop = False
        EditMask = '99;0; '
        MaxLength = 2
        ReadOnly = True
        TabOrder = 13
      end
      object medMin2: TMaskEdit
        Left = 633
        Top = 401
        Width = 40
        Height = 21
        TabStop = False
        EditMask = '99;0; '
        MaxLength = 2
        ReadOnly = True
        TabOrder = 14
      end
      object vlrParticular: TRxCalcEdit
        Left = 624
        Top = 131
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 4
      end
      object vlrFuncionario: TRxCalcEdit
        Left = 624
        Top = 155
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 5
      end
      object vlrCliente: TRxCalcEdit
        Left = 624
        Top = 179
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 6
      end
    end
    object tsDepto: TTabSheet
      Caption = 'Informa'#231#245'es por Departamentos'
      ImageIndex = 3
      object Label34: TLabel
        Left = 499
        Top = 63
        Width = 97
        Height = 13
        Caption = 'Liga'#231#245'es Solicitadas'
      end
      object Label35: TLabel
        Left = 499
        Top = 87
        Width = 97
        Height = 13
        Caption = 'Liga'#231#245'es Recebidas'
      end
      object Label36: TLabel
        Left = 499
        Top = 111
        Width = 52
        Height = 13
        Caption = 'Liga'#231#245'es'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label37: TLabel
        Left = 499
        Top = 222
        Width = 114
        Height = 13
        Caption = 'Atendimentos Fechados'
      end
      object Label38: TLabel
        Left = 499
        Top = 246
        Width = 116
        Height = 13
        Caption = 'Atendimentos Em Aberto'
      end
      object Label39: TLabel
        Left = 499
        Top = 270
        Width = 118
        Height = 13
        Caption = 'Atendimentos Em Espera'
      end
      object Label40: TLabel
        Left = 499
        Top = 294
        Width = 77
        Height = 13
        Caption = 'Atendimentos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RxLabel3: TRxLabel
        Left = 525
        Top = 0
        Width = 203
        Height = 49
        AutoSize = False
        Caption = 'Dados apurados a partir das informa'#231#245'es fornecidas no filtro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ShadowColor = clAqua
        WordWrap = True
      end
      object Label41: TLabel
        Left = 499
        Top = 343
        Width = 111
        Height = 13
        Caption = 'Documentos Entregues'
      end
      object Label42: TLabel
        Left = 499
        Top = 391
        Width = 219
        Height = 13
        Caption = 'Em m'#233'dia '#233' gasto para fechar um atendimento'
      end
      object Label43: TLabel
        Left = 541
        Top = 409
        Width = 21
        Height = 13
        Caption = 'Dias'
      end
      object Label44: TLabel
        Left = 585
        Top = 409
        Width = 28
        Height = 13
        Caption = 'Horas'
      end
      object Label45: TLabel
        Left = 633
        Top = 409
        Width = 37
        Height = 13
        Caption = 'Minutos'
      end
      object SpeedButton5: TSpeedButton
        Left = 497
        Top = 2
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
        OnClick = SpeedButton5Click
      end
      object Label49: TLabel
        Left = 499
        Top = 135
        Width = 80
        Height = 13
        Caption = 'Origem Particular'
      end
      object Label50: TLabel
        Left = 499
        Top = 159
        Width = 91
        Height = 13
        Caption = 'Origem Funcionario'
      end
      object Label51: TLabel
        Left = 499
        Top = 183
        Width = 68
        Height = 13
        Caption = 'Origem Cliente'
      end
      object tvDepto: TTreeView
        Left = 0
        Top = 0
        Width = 493
        Height = 476
        Align = alLeft
        Indent = 19
        TabOrder = 0
      end
      object vlrSol3: TRxCalcEdit
        Left = 624
        Top = 59
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 1
      end
      object vlrRec3: TRxCalcEdit
        Left = 624
        Top = 83
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 2
      end
      object vlrLig3: TRxCalcEdit
        Left = 624
        Top = 107
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 3
      end
      object vlrFec3: TRxCalcEdit
        Left = 624
        Top = 218
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 4
      end
      object vlrAbe3: TRxCalcEdit
        Left = 624
        Top = 242
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 5
      end
      object vlrEsp3: TRxCalcEdit
        Left = 624
        Top = 266
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 6
      end
      object vlrAtend3: TRxCalcEdit
        Left = 624
        Top = 290
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 7
      end
      object vlrDoc3: TRxCalcEdit
        Left = 624
        Top = 339
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 8
      end
      object medDia3: TMaskEdit
        Left = 541
        Top = 423
        Width = 36
        Height = 21
        TabStop = False
        EditMask = '999;0; '
        MaxLength = 3
        ReadOnly = True
        TabOrder = 9
      end
      object medHora3: TMaskEdit
        Left = 585
        Top = 423
        Width = 39
        Height = 21
        TabStop = False
        EditMask = '99;0; '
        MaxLength = 2
        ReadOnly = True
        TabOrder = 10
      end
      object medMin3: TMaskEdit
        Left = 633
        Top = 423
        Width = 40
        Height = 21
        TabStop = False
        EditMask = '99;0; '
        MaxLength = 2
        ReadOnly = True
        TabOrder = 11
      end
      object vlrParticular2: TRxCalcEdit
        Left = 624
        Top = 131
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 12
      end
      object vlrFuncionario2: TRxCalcEdit
        Left = 624
        Top = 155
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 13
      end
      object vlrCliente2: TRxCalcEdit
        Left = 624
        Top = 179
        Width = 102
        Height = 21
        TabStop = False
        AutoSize = False
        ButtonWidth = 0
        NumGlyphs = 2
        ReadOnly = True
        TabOrder = 14
      end
    end
  end
  inherited submenu: TMainMenu
    Left = 464
    Top = 136
  end
  inherited Calculator1: TRxCalculator
    Left = 464
    Top = 168
  end
  object qryAux: TQuery
    DatabaseName = 'db'
    Left = 404
    Top = 55
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
    Left = 436
    Top = 56
  end
  object qryAux2: TQuery
    DatabaseName = 'db'
    Left = 408
    Top = 91
  end
  object qryDocto: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_DOCUMENTO WHERE COD_DOCTO = :COD_DOCTO')
    Left = 412
    Top = 134
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_DOCTO'
        ParamType = ptUnknown
      end>
  end
  object qryDepto: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_DEPARTAMENTO WHERE COD_DEPTO = :COD_DEPTO')
    Left = 412
    Top = 170
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_DEPTO'
        ParamType = ptUnknown
      end>
  end
end
