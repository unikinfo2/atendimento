object CadCliente_f: TCadCliente_f
  Left = 366
  Top = 113
  Width = 547
  Height = 504
  Caption = 'Cadastro de Clientes'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 0
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 109
    Top = 0
    Width = 96
    Height = 13
    Caption = 'Nome/Raz'#227'o Social'
  end
  object Label3: TLabel
    Left = 109
    Top = 40
    Width = 71
    Height = 13
    Caption = 'Nome Fantasia'
  end
  object Label4: TLabel
    Left = 109
    Top = 78
    Width = 52
    Height = 13
    Caption = 'CPF/CNPJ'
  end
  object sbPesq: TSpeedButton
    Left = 84
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
    OnClick = sbPesqClick
  end
  object Label16: TLabel
    Left = 8
    Top = 40
    Width = 86
    Height = 13
    Caption = 'Codigo Alternativo'
  end
  object Label15: TLabel
    Left = 109
    Top = 115
    Width = 64
    Height = 13
    Caption = 'Insc.Estadual'
  end
  object DBEdit2: TDBEdit
    Left = 109
    Top = 54
    Width = 401
    Height = 21
    CharCase = ecUpperCase
    DataField = 'FANTASIA_CLI'
    DataSource = dsClientes
    TabOrder = 3
  end
  object rgTipo: TDBRadioGroup
    Left = 8
    Top = 81
    Width = 97
    Height = 68
    Caption = ' Tipo de Pessoa '
    DataField = 'TIPO_CLI'
    DataSource = dsClientes
    Items.Strings = (
      'F'#237'sica'
      'Jur'#237'dica'
      'CEI')
    TabOrder = 4
    Values.Strings = (
      'F'
      'J'
      'C')
    OnExit = rgTipoClick
  end
  object dbeCnpjCpf: TDBEdit
    Left = 109
    Top = 91
    Width = 121
    Height = 21
    DataField = 'CNPJCPF_CLI'
    DataSource = dsClientes
    TabOrder = 5
    OnExit = dbeCnpjCpfExit
  end
  object medCodigo: TMaskEdit
    Left = 8
    Top = 15
    Width = 73
    Height = 21
    Constraints.MaxHeight = 67108864
    EditMask = '#########;0; '
    MaxLength = 9
    TabOrder = 0
    OnExit = medCodigoExit
  end
  object DBEdit1: TDBEdit
    Left = 109
    Top = 15
    Width = 401
    Height = 21
    CharCase = ecUpperCase
    DataField = 'NOME_CLI'
    DataSource = dsClientes
    TabOrder = 1
  end
  object rgSituacao: TDBRadioGroup
    Left = 256
    Top = 79
    Width = 102
    Height = 69
    Caption = ' Situa'#231#227'o '
    DataField = 'ATIVO_CLI'
    DataSource = dsClientes
    Items.Strings = (
      'Cliente Ativo'
      'Cliente Inativo'
      'Pr'#233' Cliente')
    TabOrder = 7
    Values.Strings = (
      'A'
      'I'
      'P')
  end
  object DBEdit16: TDBEdit
    Left = 8
    Top = 55
    Width = 89
    Height = 21
    DataField = 'COD_CLIENTE_ALT'
    DataSource = dsClientes
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 0
    Top = 414
    Width = 539
    Height = 36
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 10
    object BitBtn4: TBitBtn
      Left = 94
      Top = 6
      Width = 86
      Height = 26
      Caption = '&Novo'
      TabOrder = 3
      OnClick = BitBtn4Click
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
      Left = 181
      Top = 6
      Width = 86
      Height = 26
      Caption = 'Gravar'
      TabOrder = 0
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
    object BitBtn2: TBitBtn
      Left = 268
      Top = 6
      Width = 86
      Height = 26
      Caption = 'Cancelar'
      TabOrder = 1
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
    object BitBtn3: TBitBtn
      Left = 355
      Top = 6
      Width = 86
      Height = 26
      Caption = 'Apagar'
      TabOrder = 2
      OnClick = BitBtn3Click
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
  object pg: TPageControl
    Left = 0
    Top = 153
    Width = 539
    Height = 261
    ActivePage = TabSheet2
    Align = alBottom
    TabOrder = 9
    OnChanging = pgChanging
    object TabSheet2: TTabSheet
      Caption = 'Dados Pessoais'
      ImageIndex = 1
      object Label5: TLabel
        Left = 5
        Top = -1
        Width = 46
        Height = 13
        Caption = 'Endere'#231'o'
      end
      object Label6: TLabel
        Left = 5
        Top = 35
        Width = 64
        Height = 13
        Caption = 'Complemento'
      end
      object Label7: TLabel
        Left = 232
        Top = 35
        Width = 27
        Height = 13
        Caption = 'Bairro'
      end
      object Label8: TLabel
        Left = 5
        Top = 75
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object Label9: TLabel
        Left = 234
        Top = 75
        Width = 14
        Height = 13
        Caption = 'UF'
      end
      object Label10: TLabel
        Left = 5
        Top = 116
        Width = 79
        Height = 13
        Caption = 'Fone Contato (1)'
      end
      object Label11: TLabel
        Left = 176
        Top = 116
        Width = 79
        Height = 13
        Caption = 'Fone Contato (2)'
      end
      object Label12: TLabel
        Left = 341
        Top = 116
        Width = 20
        Height = 13
        Caption = 'FAX'
      end
      object Label13: TLabel
        Left = 5
        Top = 156
        Width = 29
        Height = 13
        Caption = 'E-Mail'
      end
      object Label14: TLabel
        Left = 341
        Top = 154
        Width = 37
        Height = 13
        Caption = 'Contato'
      end
      object Label19: TLabel
        Left = 286
        Top = 75
        Width = 21
        Height = 13
        Caption = 'CEP'
      end
      object Label30: TLabel
        Left = 384
        Top = 196
        Width = 23
        Height = 13
        Caption = 'CCM'
      end
      object Label32: TLabel
        Left = 175
        Top = 196
        Width = 92
        Height = 13
        Caption = 'Dt. Inicio Trabalhos'
      end
      object Label33: TLabel
        Left = 280
        Top = 196
        Width = 89
        Height = 13
        Caption = 'Dt. Final Trabalhos'
      end
      object DBEdit4: TDBEdit
        Left = 5
        Top = 14
        Width = 497
        Height = 21
        CharCase = ecUpperCase
        DataField = 'ENDERECO_CLI'
        DataSource = dsClientes
        TabOrder = 0
      end
      object DBEdit5: TDBEdit
        Left = 5
        Top = 50
        Width = 217
        Height = 21
        CharCase = ecUpperCase
        DataField = 'COMPLEMENTO_CLI'
        DataSource = dsClientes
        TabOrder = 1
      end
      object DBEdit6: TDBEdit
        Left = 229
        Top = 50
        Width = 217
        Height = 21
        CharCase = ecUpperCase
        DataField = 'BAIRRO_CLI'
        DataSource = dsClientes
        TabOrder = 2
      end
      object DBEdit7: TDBEdit
        Left = 5
        Top = 90
        Width = 217
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CIDADE_CLI'
        DataSource = dsClientes
        TabOrder = 3
      end
      object DBEdit8: TDBEdit
        Left = 231
        Top = 90
        Width = 47
        Height = 21
        CharCase = ecUpperCase
        DataField = 'UF_CLI'
        DataSource = dsClientes
        TabOrder = 4
      end
      object DBEdit9: TDBEdit
        Left = 5
        Top = 131
        Width = 160
        Height = 21
        DataField = 'FONE1_CLI'
        DataSource = dsClientes
        TabOrder = 6
      end
      object DBEdit10: TDBEdit
        Left = 173
        Top = 131
        Width = 160
        Height = 21
        DataField = 'FONE2_CLI'
        DataSource = dsClientes
        TabOrder = 7
      end
      object DBEdit11: TDBEdit
        Left = 341
        Top = 131
        Width = 160
        Height = 21
        DataField = 'FONE3_CLI'
        DataSource = dsClientes
        TabOrder = 8
      end
      object DBEdit12: TDBEdit
        Left = 5
        Top = 170
        Width = 329
        Height = 21
        DataField = 'EMAIL_CLI'
        DataSource = dsClientes
        TabOrder = 9
      end
      object DBEdit13: TDBEdit
        Left = 341
        Top = 169
        Width = 161
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CONTATO_CLI'
        DataSource = dsClientes
        TabOrder = 10
      end
      object DBEdit17: TDBEdit
        Left = 283
        Top = 90
        Width = 99
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CEP_CLI'
        DataSource = dsClientes
        TabOrder = 5
        OnExit = DBEdit17Exit
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 4
        Top = 192
        Width = 169
        Height = 41
        Caption = 'Correspond'#234'ncia para Endere'#231'o: '
        Columns = 2
        DataField = 'CORRESPONDENCIA_CLI'
        DataSource = dsClientes
        Items.Strings = (
          'Normal'
          'Cobran'#231'a')
        TabOrder = 11
        Values.Strings = (
          '1'
          '2')
      end
      object DBEdit23: TDBEdit
        Left = 384
        Top = 211
        Width = 128
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CCM_CLI'
        DataSource = dsClientes
        TabOrder = 14
      end
      object DBDateEdit1: TDBDateEdit
        Left = 175
        Top = 211
        Width = 101
        Height = 21
        DataField = 'DATA_INICIO_CLI'
        DataSource = dsClientes
        NumGlyphs = 2
        TabOrder = 12
        YearDigits = dyFour
      end
      object DBDateEdit2: TDBDateEdit
        Left = 280
        Top = 211
        Width = 101
        Height = 21
        DataField = 'DATA_FIM_CLI'
        DataSource = dsClientes
        NumGlyphs = 2
        TabOrder = 13
        YearDigits = dyFour
      end
    end
    object tsFinan: TTabSheet
      Caption = 'Dados Financeiros'
      ImageIndex = 1
      object Label17: TLabel
        Left = 8
        Top = 31
        Width = 71
        Height = 13
        Caption = 'Dia de Vencto.'
      end
      object Label18: TLabel
        Left = 90
        Top = 31
        Width = 87
        Height = 13
        Caption = 'Valor Mensalidade'
      end
      object Label20: TLabel
        Left = 235
        Top = 31
        Width = 62
        Height = 13
        Caption = 'Classifica'#231#227'o'
      end
      object Label21: TLabel
        Left = 8
        Top = 69
        Width = 53
        Height = 13
        Caption = 'Cod.Banco'
      end
      object Label22: TLabel
        Left = 8
        Top = 109
        Width = 85
        Height = 13
        Caption = 'Cod.Plano Contas'
      end
      object SpeedButton1: TSpeedButton
        Left = 84
        Top = 124
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
        OnClick = SpeedButton1Click
      end
      object Label23: TLabel
        Left = 109
        Top = 109
        Width = 129
        Height = 13
        Caption = 'Descri'#231#227'o Plano de Contas'
      end
      object Label24: TLabel
        Left = 109
        Top = 69
        Width = 97
        Height = 13
        Caption = 'Descri'#231#227'o do Banco'
      end
      object SpeedButton4: TSpeedButton
        Left = 84
        Top = 83
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
      object Label31: TLabel
        Left = 388
        Top = 30
        Width = 75
        Height = 13
        Caption = 'M'#234's Refer'#234'ncia'
      end
      object DBEdit14: TDBEdit
        Left = 8
        Top = 47
        Width = 33
        Height = 21
        DataField = 'DIA_VENCTO'
        DataSource = dsClientes
        TabOrder = 0
      end
      object DBEdit15: TDBEdit
        Left = 91
        Top = 47
        Width = 121
        Height = 21
        DataField = 'VALOR_MENSAL'
        DataSource = dsClientes
        TabOrder = 1
      end
      object cbNivel: TDBComboBox
        Left = 235
        Top = 46
        Width = 129
        Height = 22
        Style = csOwnerDrawVariable
        DataField = 'NIVEL_CLI'
        DataSource = dsClientes
        ItemHeight = 16
        Items.Strings = (
          '1 - Standard'
          '2 - VIP'
          '3 - Master'
          '4 - Senior')
        TabOrder = 2
      end
      object medConta: TMaskEdit
        Left = 8
        Top = 83
        Width = 73
        Height = 21
        TabOrder = 4
        OnExit = medContaExit
        OnKeyDown = medContaKeyDown
      end
      object medPlano: TMaskEdit
        Left = 8
        Top = 124
        Width = 73
        Height = 21
        TabOrder = 6
        OnExit = medPlanoExit
        OnKeyDown = medPlanoKeyDown
      end
      object Edit3: TEdit
        Left = 109
        Top = 124
        Width = 317
        Height = 21
        Color = clMenu
        Enabled = False
        TabOrder = 7
      end
      object Edit2: TEdit
        Left = 109
        Top = 83
        Width = 361
        Height = 21
        Color = clMenu
        Enabled = False
        TabOrder = 5
      end
      object DBCheckBox1: TDBCheckBox
        Left = 8
        Top = 161
        Width = 213
        Height = 17
        Caption = 'Emite Nota Fiscal para este cliente ?'
        DataField = 'EMITE_NF_CLI'
        DataSource = dsClientes
        TabOrder = 8
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object cbxRef: TDBComboBox
        Left = 388
        Top = 46
        Width = 97
        Height = 21
        Style = csDropDownList
        DataField = 'MES_REF_CLI'
        DataSource = dsClientes
        ItemHeight = 13
        Items.Strings = (
          'JAN'
          'FEV'
          'MAR'
          'ABR'
          'MAI'
          'JUN'
          'JUL'
          'AGO'
          'SET'
          'OUT'
          'NOV'
          'DEZ')
        TabOrder = 3
      end
      object DBCheckBox2: TDBCheckBox
        Left = 8
        Top = 189
        Width = 105
        Height = 17
        Caption = 'Reten'#231#227'o de Pis'
        DataField = 'RET_PIS'
        DataSource = dsClientes
        TabOrder = 9
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBox3: TDBCheckBox
        Left = 151
        Top = 189
        Width = 136
        Height = 17
        Caption = 'Reten'#231#227'o de COFINS'
        DataField = 'RET_COFINS'
        DataSource = dsClientes
        TabOrder = 10
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBox4: TDBCheckBox
        Left = 325
        Top = 189
        Width = 179
        Height = 17
        Caption = 'Reten'#231#227'o de Contribui'#231#227'o Social'
        DataField = 'RET_CSOCIAL'
        DataSource = dsClientes
        TabOrder = 11
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCheckBox5: TDBCheckBox
        Left = 8
        Top = 213
        Width = 137
        Height = 17
        Caption = 'Gera Taxa Banc'#225'ria ?'
        DataField = 'TAXA_BANCARIA_CLI'
        DataSource = dsClientes
        TabOrder = 12
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object Endere: TTabSheet
      Caption = 'Endere'#231'o de Cobran'#231'a'
      ImageIndex = 2
      object Label29: TLabel
        Left = 5
        Top = 42
        Width = 110
        Height = 13
        Caption = 'Endere'#231'o de Cobran'#231'a'
      end
      object Label25: TLabel
        Left = 5
        Top = 81
        Width = 27
        Height = 13
        Caption = 'Bairro'
      end
      object Label27: TLabel
        Left = 5
        Top = 120
        Width = 14
        Height = 13
        Caption = 'UF'
      end
      object Label28: TLabel
        Left = 68
        Top = 120
        Width = 21
        Height = 13
        Caption = 'CEP'
      end
      object Label26: TLabel
        Left = 226
        Top = 81
        Width = 33
        Height = 13
        Caption = 'Cidade'
      end
      object DBEdit22: TDBEdit
        Left = 5
        Top = 57
        Width = 497
        Height = 21
        CharCase = ecUpperCase
        DataField = 'END_COB_CLI'
        DataSource = dsClientes
        TabOrder = 0
      end
      object DBEdit18: TDBEdit
        Left = 5
        Top = 96
        Width = 217
        Height = 21
        CharCase = ecUpperCase
        DataField = 'BAIRRO_COB_CLI'
        DataSource = dsClientes
        TabOrder = 1
      end
      object DBEdit20: TDBEdit
        Left = 5
        Top = 135
        Width = 47
        Height = 21
        CharCase = ecUpperCase
        DataField = 'UF_COB_CLI'
        DataSource = dsClientes
        TabOrder = 3
      end
      object DBEdit21: TDBEdit
        Left = 68
        Top = 135
        Width = 99
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CEP_COB_CLI'
        DataSource = dsClientes
        TabOrder = 4
      end
      object DBEdit19: TDBEdit
        Left = 226
        Top = 96
        Width = 217
        Height = 21
        CharCase = ecUpperCase
        DataField = 'CIDADE_COB_CLI'
        DataSource = dsClientes
        TabOrder = 2
      end
    end
  end
  object DBRadioGroup1: TDBRadioGroup
    Left = 383
    Top = 79
    Width = 128
    Height = 69
    Caption = ' Tipo '
    DataField = 'TIPO_CLIFOR'
    DataSource = dsClientes
    Items.Strings = (
      'Cliente'
      'Fornecedor'
      'Cliente e Fornecedor')
    TabOrder = 8
    Values.Strings = (
      'C'
      'F'
      'R')
  end
  object DBEdit3: TDBEdit
    Left = 109
    Top = 128
    Width = 121
    Height = 21
    DataField = 'IEST_CLI'
    DataSource = dsClientes
    TabOrder = 6
    OnExit = dbeCnpjCpfExit
  end
  object qryClientes: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_CLIENTE WHERE COD_CLIENTE = :COD_CLIENTE')
    Left = 388
    Top = 161
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_CLIENTE'
        ParamType = ptUnknown
      end>
  end
  object MainMenu1: TMainMenu
    Left = 464
    Top = 168
    object Saida1: TMenuItem
      Caption = '&Saida'
      OnClick = Saida1Click
    end
    object AssociaDocumentosaClientes1: TMenuItem
      Caption = '&Associa Documentos a Clientes'
      OnClick = AssociaDocumentosaClientes1Click
    end
  end
  object dsClientes: TDataSource
    AutoEdit = False
    DataSet = qryClientes
    Left = 428
    Top = 169
  end
  object qryAux: TQuery
    DatabaseName = 'db'
    Left = 307
    Top = 19
  end
end
