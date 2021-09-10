inherited Agenda_f: TAgenda_f
  Left = 245
  Top = 149
  Width = 747
  Height = 459
  Caption = 'Agenda Telef'#244'nica'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 739
    Height = 145
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 1
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object Label2: TLabel
      Left = 4
      Top = 37
      Width = 41
      Height = 13
      Caption = 'Empresa'
    end
    object Label3: TLabel
      Left = 4
      Top = 72
      Width = 29
      Height = 13
      Caption = 'E-Mail'
    end
    object Label4: TLabel
      Left = 4
      Top = 108
      Width = 33
      Height = 13
      Caption = 'Fone 1'
    end
    object Label5: TLabel
      Left = 329
      Top = 1
      Width = 58
      Height = 13
      Caption = 'Observa'#231#227'o'
    end
    object SpeedButton2: TSpeedButton
      Left = 302
      Top = 15
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
    object Label6: TLabel
      Left = 136
      Top = 108
      Width = 33
      Height = 13
      Caption = 'Fone 2'
    end
    object Label7: TLabel
      Left = 268
      Top = 108
      Width = 33
      Height = 13
      Caption = 'Fone 3'
    end
    object Label8: TLabel
      Left = 401
      Top = 108
      Width = 17
      Height = 13
      Caption = 'Fax'
    end
    object DBEdit1: TDBEdit
      Left = 4
      Top = 15
      Width = 294
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOME_CONTATO'
      DataSource = dsAgenda
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 4
      Top = 50
      Width = 321
      Height = 21
      CharCase = ecUpperCase
      DataField = 'EMPRESA_CONTATO'
      DataSource = dsAgenda
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 4
      Top = 86
      Width = 321
      Height = 21
      CharCase = ecLowerCase
      DataField = 'EMAIL_CONTATO'
      DataSource = dsAgenda
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 4
      Top = 121
      Width = 129
      Height = 21
      DataField = 'FONE1_CONTATO'
      DataSource = dsAgenda
      TabOrder = 3
    end
    object DBEdit5: TDBEdit
      Left = 136
      Top = 121
      Width = 129
      Height = 21
      DataField = 'FONE2_CONTATO'
      DataSource = dsAgenda
      TabOrder = 4
    end
    object DBEdit6: TDBEdit
      Left = 401
      Top = 121
      Width = 129
      Height = 21
      DataField = 'FONE4_CONTATO'
      DataSource = dsAgenda
      TabOrder = 6
    end
    object DBEdit7: TDBEdit
      Left = 268
      Top = 121
      Width = 129
      Height = 21
      DataField = 'FONE3_CONTATO'
      DataSource = dsAgenda
      TabOrder = 5
    end
    object DBMemo1: TDBMemo
      Left = 329
      Top = 15
      Width = 321
      Height = 94
      DataField = 'OBS_CONTATO'
      DataSource = dsAgenda
      TabOrder = 7
    end
    object BitBtn3: TBitBtn
      Left = 659
      Top = 19
      Width = 70
      Height = 25
      Caption = 'Novo'
      TabOrder = 8
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
      Left = 659
      Top = 51
      Width = 70
      Height = 25
      Caption = 'Grava'
      TabOrder = 9
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
    object BitBtn5: TBitBtn
      Left = 659
      Top = 115
      Width = 70
      Height = 25
      Caption = '&Apagar'
      TabOrder = 11
      OnClick = BitBtn5Click
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
    object BitBtn2: TBitBtn
      Left = 659
      Top = 83
      Width = 70
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 10
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
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 145
    Width = 739
    Height = 260
    Align = alClient
    TabOrder = 1
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 737
      Height = 258
      Align = alClient
      DataSource = dsAgenda2
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME_CONTATO'
          Title.Caption = 'Nome'
          Width = 174
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMPRESA_CONTATO'
          Title.Caption = 'Empresa'
          Width = 214
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FONE1_CONTATO'
          Title.Caption = 'Fone 1'
          Width = 112
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FONE2_CONTATO'
          Title.Caption = 'Fone 2'
          Width = 113
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EMAIL_CONTATO'
          Title.Caption = 'E-Mail'
          Width = 200
          Visible = True
        end>
    end
  end
  inherited submenu: TMainMenu
    Left = 16
    Top = 320
  end
  object qryAgenda: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_AGENDA')
    Left = 384
    Top = 41
    object qryAgendaCOD_CONTATO: TIntegerField
      FieldName = 'COD_CONTATO'
      Origin = 'DB.GC_AGENDA.COD_CONTATO'
    end
    object qryAgendaNOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Origin = 'DB.GC_AGENDA.NOME_CONTATO'
      Size = 40
    end
    object qryAgendaEMPRESA_CONTATO: TStringField
      FieldName = 'EMPRESA_CONTATO'
      Origin = 'DB.GC_AGENDA.EMPRESA_CONTATO'
      Size = 40
    end
    object qryAgendaEMAIL_CONTATO: TStringField
      FieldName = 'EMAIL_CONTATO'
      Origin = 'DB.GC_AGENDA.EMAIL_CONTATO'
      Size = 50
    end
    object qryAgendaFONE1_CONTATO: TStringField
      FieldName = 'FONE1_CONTATO'
      Origin = 'DB.GC_AGENDA.FONE1_CONTATO'
      EditMask = '(####)9999-9999;1; '
      Size = 15
    end
    object qryAgendaFONE2_CONTATO: TStringField
      FieldName = 'FONE2_CONTATO'
      Origin = 'DB.GC_AGENDA.FONE2_CONTATO'
      EditMask = '(####)9999-9999;1; '
      Size = 15
    end
    object qryAgendaFONE3_CONTATO: TStringField
      FieldName = 'FONE3_CONTATO'
      Origin = 'DB.GC_AGENDA.FONE3_CONTATO'
      EditMask = '(####)9999-9999;1; '
      Size = 15
    end
    object qryAgendaFONE4_CONTATO: TStringField
      FieldName = 'FONE4_CONTATO'
      Origin = 'DB.GC_AGENDA.FONE4_CONTATO'
      EditMask = '(####)9999-9999;1; '
      Size = 15
    end
    object qryAgendaOBS_CONTATO: TStringField
      FieldName = 'OBS_CONTATO'
      Origin = 'DB.GC_AGENDA.OBS_CONTATO'
      Size = 255
    end
  end
  object dsAgenda: TDataSource
    DataSet = qryAgenda
    Left = 416
    Top = 41
  end
  object qryAgenda2: TQuery
    AfterScroll = qryAgenda2AfterScroll
    DatabaseName = 'db'
    SQL.Strings = (
      'SELECT * FROM GC_AGENDA'
      'ORDER BY NOME_CONTATO, EMPRESA_CONTATO')
    Left = 264
    Top = 217
    object qryAgenda2COD_CONTATO: TIntegerField
      FieldName = 'COD_CONTATO'
      Origin = 'DB.GC_AGENDA.COD_CONTATO'
    end
    object qryAgenda2NOME_CONTATO: TStringField
      FieldName = 'NOME_CONTATO'
      Origin = 'DB.GC_AGENDA.NOME_CONTATO'
      Size = 40
    end
    object qryAgenda2EMPRESA_CONTATO: TStringField
      FieldName = 'EMPRESA_CONTATO'
      Origin = 'DB.GC_AGENDA.EMPRESA_CONTATO'
      Size = 40
    end
    object qryAgenda2EMAIL_CONTATO: TStringField
      FieldName = 'EMAIL_CONTATO'
      Origin = 'DB.GC_AGENDA.EMAIL_CONTATO'
      Size = 50
    end
    object qryAgenda2FONE1_CONTATO: TStringField
      FieldName = 'FONE1_CONTATO'
      Origin = 'DB.GC_AGENDA.FONE1_CONTATO'
      EditMask = '(####)9999-9999;1; '
      Size = 15
    end
    object qryAgenda2FONE2_CONTATO: TStringField
      FieldName = 'FONE2_CONTATO'
      Origin = 'DB.GC_AGENDA.FONE2_CONTATO'
      EditMask = '(####)9999-9999;1; '
      Size = 15
    end
    object qryAgenda2FONE3_CONTATO: TStringField
      FieldName = 'FONE3_CONTATO'
      Origin = 'DB.GC_AGENDA.FONE3_CONTATO'
      EditMask = '(####)9999-9999;1; '
      Size = 15
    end
    object qryAgenda2FONE4_CONTATO: TStringField
      FieldName = 'FONE4_CONTATO'
      Origin = 'DB.GC_AGENDA.FONE4_CONTATO'
      EditMask = '(####)9999-9999;1; '
      Size = 15
    end
    object qryAgenda2OBS_CONTATO: TStringField
      FieldName = 'OBS_CONTATO'
      Origin = 'DB.GC_AGENDA.OBS_CONTATO'
      Size = 255
    end
  end
  object dsAgenda2: TDataSource
    DataSet = qryAgenda2
    Left = 304
    Top = 217
  end
end
