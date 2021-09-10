inherited CadOcorrencia_f: TCadOcorrencia_f
  Left = 198
  Top = 137
  Width = 565
  Height = 342
  Caption = 'Cadastro de Ocorrencias'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 255
    Width = 557
    Height = 41
    Align = alBottom
    TabOrder = 1
    object BitBtn3: TBitBtn
      Left = 90
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Nova'
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
      Left = 177
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
    object btnCancel: TBitBtn
      Left = 263
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 2
      OnClick = btnCancelClick
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
    object BitBtn5: TBitBtn
      Left = 350
      Top = 8
      Width = 75
      Height = 25
      Caption = '&Apagar'
      TabOrder = 3
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
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 0
    Width = 557
    Height = 255
    Align = alClient
    TabOrder = 0
    object Label6: TLabel
      Left = 7
      Top = 42
      Width = 63
      Height = 13
      Caption = 'C'#243'digo Func.'
    end
    object SpeedButton1: TSpeedButton
      Left = 83
      Top = 55
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
    end
    object Label5: TLabel
      Left = 111
      Top = 42
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object Label3: TLabel
      Left = 7
      Top = 81
      Width = 109
      Height = 13
      Caption = 'Dat. Hora Abert. Ocorr.'
    end
    object Label4: TLabel
      Left = 119
      Top = 81
      Width = 102
      Height = 13
      Caption = 'Dat. Hora Fec. Ocorr.'
    end
    object Label9: TLabel
      Left = 7
      Top = 136
      Width = 48
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label10: TLabel
      Left = 7
      Top = 3
      Width = 52
      Height = 13
      Caption = 'Ocorr'#234'ncia'
    end
    object SpeedButton3: TSpeedButton
      Left = 83
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
      OnClick = SpeedButton3Click
    end
    object edtCodigo: TEdit
      Left = 7
      Top = 56
      Width = 73
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 1
      OnExit = edtCodigoExit
    end
    object edtFunc: TEdit
      Left = 111
      Top = 56
      Width = 310
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 2
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 199
      Width = 555
      Height = 55
      Align = alBottom
      Caption = ' Transferir este Atendimento para Funcion'#225'rio '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      object Label7: TLabel
        Left = 6
        Top = 16
        Width = 63
        Height = 13
        Caption = 'C'#243'digo Func.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object SpeedButton2: TSpeedButton
        Left = 82
        Top = 29
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
        OnClick = SpeedButton2Click
      end
      object Label8: TLabel
        Left = 110
        Top = 16
        Width = 28
        Height = 13
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edtCodTrans: TEdit
        Left = 6
        Top = 30
        Width = 73
        Height = 21
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        OnExit = edtCodTransExit
      end
      object edtFuncTrans: TEdit
        Left = 110
        Top = 30
        Width = 379
        Height = 21
        Color = clMenu
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object rgOcorrencia: TDBRadioGroup
      Left = 247
      Top = 79
      Width = 300
      Height = 67
      Caption = ' Status da Ocorr'#234'ncia '
      Columns = 2
      DataField = 'STATUS_OCORR'
      DataSource = dsOcorrencia
      Items.Strings = (
        'Aberto'
        'Fechado'
        'Cancelado'
        'Transferido'
        'Espera')
      TabOrder = 5
      Values.Strings = (
        'A'
        'F'
        'C'
        'T')
    end
    object DBMemo1: TDBMemo
      Left = 7
      Top = 150
      Width = 538
      Height = 49
      DataField = 'DESCRICAO_OCORR'
      DataSource = dsOcorrencia
      TabOrder = 6
    end
    object medOcorrencia: TMaskEdit
      Left = 7
      Top = 19
      Width = 73
      Height = 21
      EditMask = '#########;0; '
      MaxLength = 9
      TabOrder = 0
      OnExit = medOcorrenciaExit
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 96
      Width = 105
      Height = 21
      DataField = 'DT_OCORRENCIA'
      DataSource = dsOcorrencia
      Enabled = False
      TabOrder = 3
    end
    object DBEdit2: TDBEdit
      Left = 121
      Top = 96
      Width = 105
      Height = 21
      DataField = 'DT_FECHAMENTO_OCORR'
      DataSource = dsOcorrencia
      Enabled = False
      TabOrder = 4
    end
    object edtDep: TEdit
      Left = 423
      Top = 56
      Width = 125
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 8
    end
  end
  inherited submenu: TMainMenu
    Left = 304
    Top = 12
  end
  object dsOcorrencia: TDataSource [3]
    AutoEdit = False
    DataSet = qryOcorrencia
    Left = 192
    Top = 12
  end
  object qryOcorrencia: TQuery [4]
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_OCORRENCIA '
      'WHERE COD_OCORRENCIA = :COD_OCORRENCIA AND'
      'COD_ATENDIMENTO = :COD_ATENDIMENTO AND'
      'COD_CLIENTE = :COD_CLIENTE')
    Left = 224
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_OCORRENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'COD_ATENDIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptUnknown
      end>
    object qryOcorrenciaCOD_OCORRENCIA: TIntegerField
      FieldName = 'COD_OCORRENCIA'
      Origin = 'DB.GC_OCORRENCIA.COD_OCORRENCIA'
    end
    object qryOcorrenciaCOD_ATENDIMENTO: TIntegerField
      FieldName = 'COD_ATENDIMENTO'
      Origin = 'DB.GC_OCORRENCIA.COD_ATENDIMENTO'
    end
    object qryOcorrenciaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'DB.GC_OCORRENCIA.COD_CLIENTE'
    end
    object qryOcorrenciaCOD_FUNC: TIntegerField
      FieldName = 'COD_FUNC'
      Origin = 'DB.GC_OCORRENCIA.COD_FUNC'
    end
    object qryOcorrenciaDT_OCORRENCIA: TDateTimeField
      FieldName = 'DT_OCORRENCIA'
      Origin = 'DB.GC_OCORRENCIA.DT_OCORRENCIA'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
      EditMask = '99/99/9999 99:99;1; '
    end
    object qryOcorrenciaSTATUS_OCORR: TStringField
      FieldName = 'STATUS_OCORR'
      Origin = 'DB.GC_OCORRENCIA.STATUS_OCORR'
      Size = 1
    end
    object qryOcorrenciaCOD_FUNC_TRANS: TIntegerField
      FieldName = 'COD_FUNC_TRANS'
      Origin = 'DB.GC_OCORRENCIA.COD_FUNC_TRANS'
    end
    object qryOcorrenciaDT_FECHAMENTO_OCORR: TDateTimeField
      FieldName = 'DT_FECHAMENTO_OCORR'
      Origin = 'DB.GC_OCORRENCIA.DT_FECHAMENTO_OCORR'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
      EditMask = '99/99/9999 99:99;1; '
    end
    object qryOcorrenciaDESCRICAO_OCORR: TStringField
      FieldName = 'DESCRICAO_OCORR'
      Origin = 'DB.GC_OCORRENCIA.DESCRICAO_OCORR'
      Size = 255
    end
  end
  object qryAux: TQuery [5]
    DatabaseName = 'db'
    Left = 336
    Top = 12
  end
  object qryFunc: TQuery [6]
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT * FROM GC_FUNCIONARIO WHERE ATIVO_FUNC <> '#39'N'#39' AND COD_FUN' +
        'C = :COD_FUNC')
    Left = 392
    Top = 16
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_FUNC'
        ParamType = ptUnknown
      end>
    object qryFuncCOD_FUNC: TIntegerField
      FieldName = 'COD_FUNC'
      Origin = 'DB.GC_FUNCIONARIO.COD_FUNC'
    end
    object qryFuncCOD_DEPTO: TIntegerField
      FieldName = 'COD_DEPTO'
      Origin = 'DB.GC_FUNCIONARIO.COD_DEPTO'
    end
    object qryFuncNOME_FUNC: TStringField
      FieldName = 'NOME_FUNC'
      Origin = 'DB.GC_FUNCIONARIO.NOME_FUNC'
      Size = 50
    end
    object qryFuncFONE1: TStringField
      FieldName = 'FONE1'
      Origin = 'DB.GC_FUNCIONARIO.FONE1'
      EditMask = '(####)####-####;1; '
      Size = 15
    end
    object qryFuncFONE2: TStringField
      FieldName = 'FONE2'
      Origin = 'DB.GC_FUNCIONARIO.FONE2'
      EditMask = '(####)####-####;1; '
      Size = 15
    end
    object qryFuncRESPONSAVEL: TStringField
      FieldName = 'RESPONSAVEL'
      Origin = 'DB.GC_FUNCIONARIO.RESPONSAVEL'
    end
    object qryFuncEMAIL_FUNC: TStringField
      FieldName = 'EMAIL_FUNC'
      Origin = 'DB.GC_FUNCIONARIO.EMAIL_FUNC'
      Size = 50
    end
    object qryFuncAPELIDO_FUNC: TStringField
      FieldName = 'APELIDO_FUNC'
      Origin = 'DB.GC_FUNCIONARIO.APELIDO_FUNC'
      Size = 50
    end
    object qryFuncSENHA_FUNC: TStringField
      FieldName = 'SENHA_FUNC'
      Origin = 'DB.GC_FUNCIONARIO.SENHA_FUNC'
      Size = 50
    end
    object qryFuncNIVEL_FUNC: TStringField
      FieldName = 'NIVEL_FUNC'
      Origin = 'DB.GC_FUNCIONARIO.NIVEL_FUNC'
      Size = 1
    end
  end
  object SakMsg1: TSakMsg
    Left = 76
    Top = 152
  end
  object SakSMTP1: TSakSMTP
    Port = '25'
    EncodeProgressStep = 10
    SendProgressStep = 10
    Left = 76
    Top = 120
  end
  object qryAux2: TQuery
    DatabaseName = 'db'
    Left = 336
    Top = 55
  end
end
