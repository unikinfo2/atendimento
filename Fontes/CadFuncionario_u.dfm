inherited CadFuncionario_f: TCadFuncionario_f
  Left = 439
  Top = 179
  Width = 557
  Height = 354
  Caption = 'Cadastro de Usu'#225'rios'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 10
    Top = 7
    Width = 72
    Height = 13
    Caption = 'C'#243'digo Usu'#225'rio'
  end
  object SpeedButton1: TSpeedButton [1]
    Left = 94
    Top = 24
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
  object Label2: TLabel [2]
    Left = 120
    Top = 7
    Width = 28
    Height = 13
    Caption = 'Nome'
  end
  object SpeedButton2: TSpeedButton [3]
    Left = 96
    Top = 201
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
  object Label3: TLabel [4]
    Left = 10
    Top = 184
    Width = 68
    Height = 13
    Caption = 'C'#243'digo Depto.'
  end
  object Label4: TLabel [5]
    Left = 124
    Top = 184
    Width = 95
    Height = 13
    Caption = 'Descri'#231#227'o do Depto'
  end
  object Label5: TLabel [6]
    Left = 10
    Top = 139
    Width = 29
    Height = 13
    Caption = 'E-Mail'
  end
  object Label6: TLabel [7]
    Left = 10
    Top = 51
    Width = 35
    Height = 13
    Caption = 'Apelido'
  end
  object Label7: TLabel [8]
    Left = 402
    Top = 51
    Width = 31
    Height = 13
    Caption = 'Senha'
  end
  object Label8: TLabel [9]
    Left = 10
    Top = 95
    Width = 51
    Height = 13
    Caption = 'Telefone 1'
  end
  object Label9: TLabel [10]
    Left = 146
    Top = 95
    Width = 51
    Height = 13
    Caption = 'Telefone 2'
  end
  object Label10: TLabel [11]
    Left = 262
    Top = 51
    Width = 105
    Height = 13
    Caption = 'Informe a Senha Atual'
  end
  object Label11: TLabel [12]
    Left = 274
    Top = 95
    Width = 97
    Height = 13
    Caption = 'Data de Nascimento'
  end
  object Label12: TLabel [13]
    Left = 430
    Top = 184
    Width = 30
    Height = 13
    Caption = 'Ramal'
  end
  object edtCodigo: TEdit [14]
    Left = 10
    Top = 24
    Width = 81
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    OnExit = edtCodigoExit
  end
  object DBEdit1: TDBEdit [15]
    Left = 120
    Top = 24
    Width = 419
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOME_FUNC'
    DataSource = dsFunc
    TabOrder = 1
  end
  object BitBtn1: TBitBtn [16]
    Left = 193
    Top = 276
    Width = 75
    Height = 25
    Caption = 'Grava'
    TabOrder = 14
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
  object BitBtn2: TBitBtn [17]
    Left = 280
    Top = 276
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 15
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
  object edtDepto: TEdit [18]
    Left = 10
    Top = 201
    Width = 81
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 10
    OnExit = edtDeptoExit
  end
  object DBEdit3: TDBEdit [19]
    Left = 10
    Top = 156
    Width = 416
    Height = 21
    DataField = 'EMAIL_FUNC'
    DataSource = dsFunc
    TabOrder = 9
  end
  object edtDesc: TEdit [20]
    Left = 124
    Top = 201
    Width = 305
    Height = 21
    Color = clMenu
    Enabled = False
    TabOrder = 11
  end
  object DBEdit2: TDBEdit [21]
    Left = 10
    Top = 68
    Width = 247
    Height = 21
    CharCase = ecUpperCase
    DataField = 'APELIDO_FUNC'
    DataSource = dsFunc
    TabOrder = 2
  end
  object Edit1: TEdit [22]
    Left = 402
    Top = 68
    Width = 135
    Height = 21
    Enabled = False
    PasswordChar = '#'
    TabOrder = 4
  end
  object DBEdit4: TDBEdit [23]
    Left = 10
    Top = 112
    Width = 121
    Height = 21
    DataField = 'FONE1'
    DataSource = dsFunc
    TabOrder = 5
  end
  object DBEdit5: TDBEdit [24]
    Left = 146
    Top = 112
    Width = 121
    Height = 21
    DataField = 'FONE2'
    DataSource = dsFunc
    TabOrder = 6
  end
  object DBCheckBox1: TDBCheckBox [25]
    Left = 413
    Top = 112
    Width = 114
    Height = 17
    Caption = 'Respons'#225'vel (S/N)'
    DataField = 'RESPONSAVEL'
    DataSource = dsFunc
    TabOrder = 8
    ValueChecked = 'S'
    ValueUnchecked = 'N'
  end
  object DBRadioGroup1: TDBRadioGroup [26]
    Left = 12
    Top = 228
    Width = 529
    Height = 34
    Caption = ' Tipo de Acesso '
    Columns = 6
    DataField = 'NIVEL_FUNC'
    DataSource = dsFunc
    Items.Strings = (
      'Supervisor'
      'Geral'
      'Cadastros'
      'Relatorios'
      'Atendente'
      'Expedi'#231#227'o')
    TabOrder = 13
    Values.Strings = (
      '0'
      '1'
      '2'
      '3'
      '4'
      '5')
  end
  object Edit2: TEdit [27]
    Left = 262
    Top = 68
    Width = 135
    Height = 21
    PasswordChar = '#'
    TabOrder = 3
    OnExit = Edit2Exit
  end
  object BitBtn3: TBitBtn [28]
    Left = 105
    Top = 276
    Width = 75
    Height = 25
    Caption = '&Novo'
    TabOrder = 16
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
  object BitBtn5: TBitBtn [29]
    Left = 364
    Top = 276
    Width = 75
    Height = 25
    Caption = '&Apagar'
    TabOrder = 17
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
  object DBDateEdit1: TDBDateEdit [30]
    Left = 273
    Top = 112
    Width = 121
    Height = 21
    DataField = 'DT_NASCIMENTO'
    DataSource = dsFunc
    NumGlyphs = 2
    TabOrder = 7
    YearDigits = dyFour
  end
  object DBEdit6: TDBEdit [31]
    Left = 430
    Top = 200
    Width = 107
    Height = 21
    DataField = 'RAMAL_FUNC'
    DataSource = dsFunc
    TabOrder = 12
  end
  inherited submenu: TMainMenu
    Left = 316
    Top = 148
  end
  inherited Calculator1: TRxCalculator
    Top = 272
  end
  object qryFunc: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT * FROM GC_FUNCIONARIO WHERE ATIVO_FUNC <> '#39'N'#39' AND COD_FUN' +
        'C = :COD_FUNC')
    Left = 344
    Top = 148
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
    object qryFuncATIVO_FUNC: TStringField
      FieldName = 'ATIVO_FUNC'
      Origin = 'DB.GC_FUNCIONARIO.ATIVO_FUNC'
      Size = 1
    end
    object qryFuncDT_NASCIMENTO: TDateTimeField
      FieldName = 'DT_NASCIMENTO'
      Origin = 'DB.GC_FUNCIONARIO.DT_NASCIMENTO'
    end
    object qryFuncRAMAL_FUNC: TStringField
      FieldName = 'RAMAL_FUNC'
      Size = 5
    end
  end
  object dsFunc: TDataSource
    AutoEdit = False
    DataSet = qryFunc
    Left = 260
    Top = 148
  end
  object qryDepto: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_DEPARTAMENTO WHERE COD_DEPTO = :COD_DEPTO')
    Left = 288
    Top = 152
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_DEPTO'
        ParamType = ptUnknown
      end>
  end
end
