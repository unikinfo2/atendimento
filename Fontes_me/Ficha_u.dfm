inherited Ficha_f: TFicha_f
  Left = 238
  Top = 134
  Width = 772
  Height = 545
  Caption = 'Ficha Cadastral (Abertura/Altera'#231#227'o)'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 764
    Height = 88
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 4
      Top = 8
      Width = 62
      Height = 13
      Caption = 'C'#243'digo Ficha'
    end
    object SpeedButton2: TSpeedButton
      Left = 71
      Top = 22
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
    object Label23: TLabel
      Left = 632
      Top = 8
      Width = 67
      Height = 13
      Caption = 'Departamento'
    end
    object Label41: TLabel
      Left = 5
      Top = 48
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object sbPesq: TSpeedButton
      Left = 71
      Top = 62
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
    object Label42: TLabel
      Left = 96
      Top = 48
      Width = 96
      Height = 13
      Caption = 'Nome/Raz'#227'o Social'
    end
    object medFicha: TMaskEdit
      Left = 3
      Top = 22
      Width = 65
      Height = 21
      TabOrder = 0
      OnExit = medFichaExit
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 106
      Top = 4
      Width = 191
      Height = 40
      Caption = ' Tipo de Processo '
      Columns = 2
      DataField = 'TIPO_PROCESSO'
      DataSource = dsFicha
      Items.Strings = (
        'Abertura'
        'Altera'#231#227'o')
      TabOrder = 1
      Values.Strings = (
        'A'
        'T')
    end
    object cbDepto: TDBLookupComboBox
      Left = 630
      Top = 24
      Width = 126
      Height = 21
      DataField = 'COD_DEPTO'
      DataSource = dsFicha
      KeyField = 'COD_DEPTO'
      ListField = 'DESC_DEPTO'
      ListSource = dsDepto
      TabOrder = 2
    end
    object medCliente: TMaskEdit
      Left = 3
      Top = 62
      Width = 65
      Height = 21
      EditMask = '#########;0; '
      MaxLength = 9
      TabOrder = 3
      OnExit = medClienteExit
    end
    object edtNomeCli: TEdit
      Left = 96
      Top = 62
      Width = 369
      Height = 21
      TabStop = False
      Color = clMenu
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 88
    Width = 764
    Height = 362
    Align = alClient
    TabOrder = 1
    object Label2: TLabel
      Left = 8
      Top = 3
      Width = 63
      Height = 13
      Caption = 'Raz'#227'o Social'
    end
    object Label3: TLabel
      Left = 363
      Top = 3
      Width = 63
      Height = 13
      Caption = 'Objeto Social'
    end
    object Label4: TLabel
      Left = 12
      Top = 95
      Width = 46
      Height = 13
      Caption = 'Endere'#231'o'
    end
    object Label5: TLabel
      Left = 512
      Top = 91
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object Label11: TLabel
      Left = 514
      Top = 129
      Width = 33
      Height = 13
      Caption = 'Fone 1'
    end
    object Label12: TLabel
      Left = 634
      Top = 129
      Width = 33
      Height = 13
      Caption = 'Fone 2'
    end
    object DBEdit1: TDBEdit
      Left = 8
      Top = 19
      Width = 325
      Height = 21
      DataField = 'RAZAO1'
      DataSource = dsFicha
      TabOrder = 0
    end
    object DBCheckBox1: TDBCheckBox
      Left = 338
      Top = 23
      Width = 24
      Height = 17
      DataField = 'RAZAO_VALIDA1'
      DataSource = dsFicha
      TabOrder = 1
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBEdit2: TDBEdit
      Left = 8
      Top = 43
      Width = 325
      Height = 21
      DataField = 'RAZAO2'
      DataSource = dsFicha
      TabOrder = 2
    end
    object DBCheckBox2: TDBCheckBox
      Left = 338
      Top = 47
      Width = 24
      Height = 17
      DataField = 'RAZAO_VALIDA2'
      DataSource = dsFicha
      TabOrder = 3
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBEdit3: TDBEdit
      Left = 8
      Top = 67
      Width = 325
      Height = 21
      DataField = 'RAZAO3'
      DataSource = dsFicha
      TabOrder = 4
    end
    object DBCheckBox3: TDBCheckBox
      Left = 338
      Top = 71
      Width = 24
      Height = 17
      DataField = 'RAZAO_VALIDA3'
      DataSource = dsFicha
      TabOrder = 5
      ValueChecked = 'S'
      ValueUnchecked = 'N'
    end
    object DBMemo1: TDBMemo
      Left = 363
      Top = 19
      Width = 387
      Height = 69
      DataField = 'OBJETO_SOCIAL'
      DataSource = dsFicha
      TabOrder = 6
    end
    object DBMemo2: TDBMemo
      Left = 12
      Top = 111
      Width = 337
      Height = 45
      DataField = 'ENDERECO'
      DataSource = dsFicha
      TabOrder = 7
    end
    object PageControl1: TPageControl
      Left = 1
      Top = 160
      Width = 762
      Height = 201
      ActivePage = tsAndamento
      Align = alBottom
      HotTrack = True
      MultiLine = True
      TabOrder = 12
      OnChange = PageControl1Change
      object TabSheet1: TTabSheet
        Caption = 'D&ados dos S'#243'cios'
        object DBGrid1: TDBGrid
          Left = 0
          Top = 4
          Width = 753
          Height = 123
          Hint = 'Duplo click - Altera informa'#231#245'es do S'#243'cio'
          DataSource = dsSocios
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGrid1DblClick
          Columns = <
            item
              Expanded = False
              FieldName = 'NOME_RAZAO'
              Title.Caption = 'Nome/Raz'#227'o'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PROFISSAO'
              Title.Caption = 'Profiss'#227'o'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_CAP_SOC'
              Title.Caption = 'Valor Capital Soc.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PORC_CAP_SOC'
              Title.Caption = 'Porc.Capital Soc.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF_CNPJ'
              Title.Caption = 'CPF/CNPJ'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORGAO_EMISSOR'
              Title.Caption = 'Org'#227'o Emissor'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_CIVIL'
              Title.Caption = 'Estado Civil'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORGAO_CLASSE'
              Title.Caption = 'Org'#227'o Classe'
              Visible = True
            end>
        end
        object BitBtn3: TBitBtn
          Left = 0
          Top = 130
          Width = 98
          Height = 25
          Caption = '&Novo S'#243'cio'
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
        object BitBtn5: TBitBtn
          Left = 100
          Top = 130
          Width = 98
          Height = 25
          Caption = '&Apagar S'#243'cio'
          TabOrder = 2
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
      object TabSheet2: TTabSheet
        Caption = '&Capital Social'
        ImageIndex = 1
        object Label6: TLabel
          Left = 8
          Top = 8
          Width = 81
          Height = 13
          Caption = 'Capital Social R$'
        end
        object Label7: TLabel
          Left = 144
          Top = 8
          Width = 60
          Height = 13
          Caption = 'Integralizado'
        end
        object Label8: TLabel
          Left = 276
          Top = 8
          Width = 61
          Height = 13
          Caption = 'A Integralizar'
        end
        object Label9: TLabel
          Left = 404
          Top = 8
          Width = 27
          Height = 13
          Caption = 'Prazo'
        end
        object Label10: TLabel
          Left = 196
          Top = 60
          Width = 141
          Height = 45
          AutoSize = False
          Caption = 'Relacionar os bens: (Descri'#231#227'o, marca, modelo, estado e valor)'
          WordWrap = True
        end
        object DBRadioGroup2: TDBRadioGroup
          Left = 4
          Top = 56
          Width = 185
          Height = 89
          Caption = ' Formas de Integraliza'#231#227'o '
          DataField = 'FORMA_INTEGRALIZAR'
          DataSource = dsFicha
          Items.Strings = (
            'Em Moeda Corrente'
            'Em Moeda Corrente e Bens'
            'Somente em bens')
          TabOrder = 4
          Values.Strings = (
            '1'
            '2'
            '3')
        end
        object DBMemo3: TDBMemo
          Left = 328
          Top = 62
          Width = 369
          Height = 84
          DataField = 'BENS'
          DataSource = dsFicha
          TabOrder = 5
        end
        object RxDBCalcEdit1: TRxDBCalcEdit
          Left = 10
          Top = 23
          Width = 121
          Height = 21
          DataField = 'CAPITAL_SOCIAL'
          DataSource = dsFicha
          DisplayFormat = ',0.00'
          NumGlyphs = 2
          TabOrder = 0
        end
        object DBEdit6: TDBEdit
          Left = 404
          Top = 23
          Width = 293
          Height = 21
          DataField = 'PRAZO'
          DataSource = dsFicha
          TabOrder = 3
        end
        object RxDBCalcEdit5: TRxDBCalcEdit
          Left = 142
          Top = 23
          Width = 121
          Height = 21
          DataField = 'INTEGRALIZADO'
          DataSource = dsFicha
          DisplayFormat = ',0.00'
          NumGlyphs = 2
          TabOrder = 1
        end
        object RxDBCalcEdit6: TRxDBCalcEdit
          Left = 274
          Top = 23
          Width = 121
          Height = 21
          DataField = 'A_INTEGRALIZAR'
          DataSource = dsFicha
          DisplayFormat = ',0.00'
          NumGlyphs = 2
          TabOrder = 2
        end
      end
      object TabSheet3: TTabSheet
        Caption = #211'&rg'#227'os/Tributa'#231#227'o'
        ImageIndex = 2
        object Label16: TLabel
          Left = 217
          Top = 108
          Width = 23
          Height = 13
          Caption = 'Sigla'
        end
        object Label22: TLabel
          Left = 562
          Top = 110
          Width = 116
          Height = 13
          Caption = 'Informe outra Tributa'#231#227'o'
        end
        object DBRadioGroup4: TDBRadioGroup
          Left = 71
          Top = 4
          Width = 141
          Height = 41
          Caption = ' Org'#227'os '
          Columns = 2
          DataField = 'ORGAO1'
          DataSource = dsFicha
          Items.Strings = (
            'JUCESP'
            'RTD')
          TabOrder = 0
          Values.Strings = (
            'JUCESP'
            'RTD')
        end
        object DBCheckBox4: TDBCheckBox
          Left = 71
          Top = 49
          Width = 97
          Height = 17
          Caption = 'INSS'
          DataField = 'ORGAO2'
          DataSource = dsFicha
          TabOrder = 1
          ValueChecked = 'INSS'
          ValueUnchecked = ' '
        end
        object DBCheckBox5: TDBCheckBox
          Left = 71
          Top = 89
          Width = 97
          Height = 17
          Caption = 'FGTS'
          DataField = 'ORGAO4'
          DataSource = dsFicha
          TabOrder = 3
          ValueChecked = 'FGTS'
          ValueUnchecked = ' '
        end
        object DBCheckBox6: TDBCheckBox
          Left = 71
          Top = 69
          Width = 97
          Height = 17
          Caption = 'Receita Federal'
          DataField = 'ORGAO3'
          DataSource = dsFicha
          TabOrder = 2
          ValueChecked = 'Receita Federal'
          ValueUnchecked = ' '
        end
        object DBCheckBox7: TDBCheckBox
          Left = 71
          Top = 109
          Width = 97
          Height = 17
          Caption = 'Estado'
          DataField = 'ORGAO5'
          DataSource = dsFicha
          TabOrder = 4
          ValueChecked = 'Estado'
          ValueUnchecked = ' '
        end
        object DBCheckBox8: TDBCheckBox
          Left = 71
          Top = 128
          Width = 125
          Height = 17
          Caption = 'Conselho de Classe'
          DataField = 'ORGAO6'
          DataSource = dsFicha
          TabOrder = 5
          ValueChecked = 'Conselho de Classe'
          ValueUnchecked = ' '
        end
        object DBEdit4: TDBEdit
          Left = 217
          Top = 124
          Width = 149
          Height = 21
          DataField = 'SIGLA_CONSELHO'
          DataSource = dsFicha
          TabOrder = 6
        end
        object DBRadioGroup5: TDBRadioGroup
          Left = 217
          Top = 4
          Width = 212
          Height = 41
          Caption = 'Licen'#231'a/Alvar'#225' Funcionamento Regular?'
          Columns = 2
          DataField = 'ALVARA_REGULAR'
          DataSource = dsFicha
          Items.Strings = (
            'Sim'
            'N'#227'o')
          TabOrder = 9
          Values.Strings = (
            'S'
            'N')
        end
        object DBRadioGroup6: TDBRadioGroup
          Left = 438
          Top = 4
          Width = 116
          Height = 41
          Caption = ' Pedido de Licen'#231'a ? '
          Columns = 2
          DataField = 'PEDIDO_LICENCA'
          DataSource = dsFicha
          Items.Strings = (
            'Sim'
            'N'#227'o')
          TabOrder = 10
          Values.Strings = (
            'S'
            'N')
        end
        object DBRadioGroup7: TDBRadioGroup
          Left = 559
          Top = 4
          Width = 111
          Height = 91
          Caption = ' Tributa'#231#227'o '
          DataField = 'TRIBUTACAO'
          DataSource = dsFicha
          Items.Strings = (
            'Simples ME'
            'Simples EPP'
            'Lucro Presumido'
            'Lucro Real'
            'Outros')
          TabOrder = 11
          Values.Strings = (
            'Simples ME'
            'Simples EPP'
            'Lucro Presumido'
            'Lucro Real'
            'Outros')
        end
        object DBEdit5: TDBEdit
          Left = 562
          Top = 125
          Width = 114
          Height = 21
          DataField = 'OUTRA_TRIB'
          DataSource = dsFicha
          TabOrder = 12
        end
        object DBCheckBox9: TDBCheckBox
          Left = 217
          Top = 55
          Width = 77
          Height = 17
          Caption = 'Prefeitura'
          DataField = 'ORGAO7'
          DataSource = dsFicha
          TabOrder = 7
          ValueChecked = 'Prefeitura'
          ValueUnchecked = ' '
        end
        object DBEdit10: TDBEdit
          Left = 293
          Top = 55
          Width = 136
          Height = 21
          DataField = 'PREFEITURA'
          DataSource = dsFicha
          TabOrder = 8
        end
      end
      object TabSheet4: TTabSheet
        Caption = '&Dados Contratuais'
        ImageIndex = 3
        object Label17: TLabel
          Left = 118
          Top = 2
          Width = 63
          Height = 13
          Caption = 'Data Contato'
        end
        object Label18: TLabel
          Left = 252
          Top = 2
          Width = 98
          Height = 13
          Caption = 'Data Inicio Processo'
        end
        object Label19: TLabel
          Left = 388
          Top = 2
          Width = 105
          Height = 13
          Caption = 'Data Prevista T'#233'rmino'
        end
        object Label20: TLabel
          Left = 520
          Top = 2
          Width = 64
          Height = 13
          Caption = 'Data T'#233'rmino'
        end
        object Label21: TLabel
          Left = 116
          Top = 44
          Width = 58
          Height = 13
          Caption = 'Observa'#231#227'o'
        end
        object DBDateEdit1: TDBDateEdit
          Left = 116
          Top = 16
          Width = 121
          Height = 21
          DataField = 'DT_CONTATO'
          DataSource = dsFicha
          CheckOnExit = True
          Enabled = False
          NumGlyphs = 2
          TabOrder = 0
          YearDigits = dyFour
        end
        object DBDateEdit2: TDBDateEdit
          Left = 252
          Top = 16
          Width = 121
          Height = 21
          DataField = 'DT_INICIO'
          DataSource = dsFicha
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
          YearDigits = dyFour
        end
        object DBDateEdit3: TDBDateEdit
          Left = 388
          Top = 16
          Width = 121
          Height = 21
          DataField = 'DT_PREV_TERMINO'
          DataSource = dsFicha
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 2
          YearDigits = dyFour
        end
        object DBDateEdit4: TDBDateEdit
          Left = 520
          Top = 16
          Width = 121
          Height = 21
          DataField = 'DT_TERMINO'
          DataSource = dsFicha
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 3
          YearDigits = dyFour
        end
        object obs: TMemo
          Left = 116
          Top = 58
          Width = 521
          Height = 89
          MaxLength = 250
          TabOrder = 4
        end
      end
      object tsAndamento: TTabSheet
        Caption = 'A&ndamento do Processo'
        ImageIndex = 4
        object Label24: TLabel
          Left = 4
          Top = 2
          Width = 80
          Height = 13
          Caption = 'Data Andamento'
        end
        object Label25: TLabel
          Left = 148
          Top = 2
          Width = 105
          Height = 13
          Caption = 'Data Prevista Retorno'
        end
        object Label26: TLabel
          Left = 4
          Top = 40
          Width = 48
          Height = 13
          Caption = 'Descri'#231#227'o'
        end
        object Label27: TLabel
          Left = 298
          Top = 3
          Width = 85
          Height = 13
          Caption = 'Data Fechamento'
        end
        object DBGrid2: TDBGrid
          Left = 432
          Top = 0
          Width = 322
          Height = 155
          Align = alRight
          DataSource = dsAndamento
          TabOrder = 6
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_ANDAMENTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -8
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Caption = 'C'#243'digo'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -8
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_ANDAMENTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -8
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Caption = 'Data'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -8
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 99
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_PREV_RET'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -8
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Caption = 'Previs'#227'o Retorno'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -8
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 88
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_FECHA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -8
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Caption = 'Fechamento'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -8
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESC_ANDAMENTO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -8
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Title.Caption = 'Descri'#231#227'o'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -8
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end>
        end
        object DBMemo4: TDBMemo
          Left = 4
          Top = 53
          Width = 417
          Height = 58
          DataField = 'DESC_ANDAMENTO'
          DataSource = dsAndamento
          MaxLength = 148
          TabOrder = 3
        end
        object BitBtn6: TBitBtn
          Left = 156
          Top = 124
          Width = 61
          Height = 25
          Caption = '&Novo'
          TabOrder = 4
          OnClick = BitBtn6Click
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
        object BitBtn7: TBitBtn
          Left = 219
          Top = 124
          Width = 61
          Height = 25
          Caption = '&Grava'
          TabOrder = 5
          OnClick = BitBtn7Click
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
        object DBDateEdit5: TDBDateEdit
          Left = 4
          Top = 16
          Width = 121
          Height = 21
          DataField = 'DT_ANDAMENTO'
          DataSource = dsAndamento
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
          YearDigits = dyFour
        end
        object DBDateEdit6: TDBDateEdit
          Left = 148
          Top = 16
          Width = 121
          Height = 21
          DataField = 'DT_PREV_RET'
          DataSource = dsAndamento
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
          YearDigits = dyFour
        end
        object DBDateEdit7: TDBDateEdit
          Left = 298
          Top = 16
          Width = 121
          Height = 21
          DataField = 'DT_FECHA'
          DataSource = dsAndamento
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 2
          YearDigits = dyFour
        end
      end
      object TabSheet5: TTabSheet
        Caption = 'Org'#227'os 1 (Procedimentos)'
        ImageIndex = 5
        object Label28: TLabel
          Left = 0
          Top = -1
          Width = 75
          Height = 13
          Caption = 'JUCESP / RTD'
        end
        object Label29: TLabel
          Left = 0
          Top = 77
          Width = 25
          Height = 13
          Caption = 'INSS'
        end
        object Label30: TLabel
          Left = 414
          Top = -1
          Width = 98
          Height = 13
          Caption = 'RECEITA FEDERAL'
        end
        object Label31: TLabel
          Left = 416
          Top = 78
          Width = 28
          Height = 13
          Caption = 'FGTS'
        end
        object DBMemo5: TDBMemo
          Left = 0
          Top = 12
          Width = 338
          Height = 61
          DataField = 'ORGAO1_PROC'
          DataSource = dsFicha
          TabOrder = 0
        end
        object DBMemo6: TDBMemo
          Left = 0
          Top = 90
          Width = 338
          Height = 61
          DataField = 'ORGAO2_PROC'
          DataSource = dsFicha
          TabOrder = 1
        end
        object DBMemo7: TDBMemo
          Left = 414
          Top = 12
          Width = 338
          Height = 61
          DataField = 'ORGAO3_PROC'
          DataSource = dsFicha
          TabOrder = 2
        end
        object DBMemo8: TDBMemo
          Left = 414
          Top = 91
          Width = 338
          Height = 61
          DataField = 'ORGAO4_PROC'
          DataSource = dsFicha
          TabOrder = 3
        end
      end
      object TabSheet6: TTabSheet
        Caption = 'Org'#227'os 2 (Procedimentos)'
        ImageIndex = 6
        object Label32: TLabel
          Left = 0
          Top = -1
          Width = 44
          Height = 13
          Caption = 'ESTADO'
        end
        object Label33: TLabel
          Left = 0
          Top = 77
          Width = 68
          Height = 13
          Caption = 'PREFEITURA'
        end
        object Label34: TLabel
          Left = 414
          Top = -1
          Width = 121
          Height = 13
          Caption = 'CONSELHO DE CLASSE'
        end
        object DBMemo9: TDBMemo
          Left = 0
          Top = 12
          Width = 338
          Height = 61
          DataField = 'ORGAO5_PROC'
          DataSource = dsFicha
          TabOrder = 0
        end
        object DBMemo10: TDBMemo
          Left = 0
          Top = 90
          Width = 338
          Height = 61
          DataField = 'ORGAO6_PROC'
          DataSource = dsFicha
          TabOrder = 1
        end
        object DBMemo11: TDBMemo
          Left = 414
          Top = 12
          Width = 338
          Height = 61
          DataField = 'ORGAO7_PROC'
          DataSource = dsFicha
          TabOrder = 2
        end
      end
      object tsFinanc: TTabSheet
        Caption = 'Dad&os Financeiros'
        ImageIndex = 7
        object Label13: TLabel
          Left = 16
          Top = 8
          Width = 47
          Height = 13
          Caption = 'Vlr. Taxas'
        end
        object Label14: TLabel
          Left = 16
          Top = 44
          Width = 56
          Height = 13
          Caption = 'Vlr.Servi'#231'os'
        end
        object Label15: TLabel
          Left = 16
          Top = 79
          Width = 49
          Height = 13
          Caption = 'Vlr. Outros'
        end
        object Label35: TLabel
          Left = 16
          Top = 117
          Width = 42
          Height = 13
          Caption = 'Vlr. Total'
        end
        object Label36: TLabel
          Left = 148
          Top = 8
          Width = 61
          Height = 13
          Caption = 'Qtd.Parcelas'
        end
        object Label37: TLabel
          Left = 148
          Top = 74
          Width = 53
          Height = 13
          Caption = 'Cod.Banco'
        end
        object SpeedButton4: TSpeedButton
          Left = 224
          Top = 88
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
        object Label38: TLabel
          Left = 249
          Top = 74
          Width = 82
          Height = 13
          Caption = 'Descri'#231#227'o Banco'
        end
        object Label39: TLabel
          Left = 148
          Top = 114
          Width = 85
          Height = 13
          Caption = 'Cod.Plano Contas'
        end
        object SpeedButton3: TSpeedButton
          Left = 224
          Top = 129
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
        object Label40: TLabel
          Left = 249
          Top = 114
          Width = 129
          Height = 13
          Caption = 'Descri'#231#227'o Plano de Contas'
        end
        object calcTaxa: TRxDBCalcEdit
          Left = 16
          Top = 21
          Width = 121
          Height = 21
          DataField = 'VALOR_TAXA'
          DataSource = dsFicha
          DisplayFormat = ',0.00'
          NumGlyphs = 2
          TabOrder = 0
          OnExit = calcTaxaExit
        end
        object calcServico: TRxDBCalcEdit
          Left = 16
          Top = 57
          Width = 121
          Height = 21
          DataField = 'VALOR_SERVICO'
          DataSource = dsFicha
          DisplayFormat = ',0.00'
          NumGlyphs = 2
          TabOrder = 1
          OnExit = calcTaxaExit
        end
        object calcOutro: TRxDBCalcEdit
          Left = 16
          Top = 92
          Width = 121
          Height = 21
          DataField = 'VALOR_OUTROS'
          DataSource = dsFicha
          DisplayFormat = ',0.00'
          NumGlyphs = 2
          TabOrder = 2
          OnExit = calcTaxaExit
        end
        object calcTotal: TRxCalcEdit
          Left = 16
          Top = 130
          Width = 121
          Height = 21
          AutoSize = False
          DisplayFormat = ',0.00'
          Enabled = False
          NumGlyphs = 2
          TabOrder = 3
        end
        object DBGrid3: TDBGrid
          Left = 328
          Top = 0
          Width = 417
          Height = 71
          DataSource = dsPag
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete]
          TabOrder = 9
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnExit = DBGrid3Exit
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_PAG'
              Title.Caption = 'N'#186
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_PREV_PAG'
              Title.Caption = 'Dt.Previsto Pagto.'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_PAG'
              Title.Caption = 'Dt.Pagamento'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR_PAG'
              Title.Caption = 'Valor Pagto.'
              Width = 98
              Visible = True
            end>
        end
        object medParc: TMaskEdit
          Left = 148
          Top = 21
          Width = 57
          Height = 21
          EditMask = '9;0; '
          MaxLength = 1
          TabOrder = 4
        end
        object BitBtn8: TBitBtn
          Left = 212
          Top = 21
          Width = 95
          Height = 25
          Caption = 'Gera Parcelas'
          TabOrder = 10
          OnClick = BitBtn8Click
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500000000055
            555557777777775F55550FFFFFFFFF0555557F5555555F7FFF5F0FEEEEEE0000
            05007F555555777775770FFFFFF0BFBFB00E7F5F5557FFF557770F0EEEE000FB
            FB0E7F75FF57775555770FF00F0FBFBFBF0E7F57757FFFF555770FE0B00000FB
            FB0E7F575777775555770FFF0FBFBFBFBF0E7F5575FFFFFFF5770FEEE0000000
            FB0E7F555777777755770FFFFF0B00BFB0007F55557577FFF7770FEEEEE0B000
            05557F555557577775550FFFFFFF0B0555557FF5F5F57575F55500F0F0F0F0B0
            555577F7F7F7F7F75F5550707070700B055557F7F7F7F7757FF5507070707050
            9055575757575757775505050505055505557575757575557555}
          NumGlyphs = 2
        end
        object medConta: TMaskEdit
          Left = 148
          Top = 88
          Width = 73
          Height = 21
          TabOrder = 5
          OnExit = medContaExit
        end
        object Edit2: TEdit
          Left = 249
          Top = 88
          Width = 361
          Height = 21
          Color = clMenu
          Enabled = False
          TabOrder = 6
        end
        object medPlano: TMaskEdit
          Left = 148
          Top = 129
          Width = 73
          Height = 21
          TabOrder = 7
          OnExit = medPlanoExit
        end
        object Edit3: TEdit
          Left = 249
          Top = 129
          Width = 317
          Height = 21
          Color = clMenu
          Enabled = False
          TabOrder = 8
        end
      end
    end
    object DBRadioGroup3: TDBRadioGroup
      Left = 356
      Top = 88
      Width = 149
      Height = 77
      Caption = ' Gerencia da Sociedade '
      DataField = 'GERENCIA'
      DataSource = dsFicha
      Items.Strings = (
        'Isoladamente'
        'Em Conjunto de Dois'
        'Em Conjunto (Todos)'
        'Outra Forma')
      TabOrder = 8
      Values.Strings = (
        'I'
        'D'
        'T'
        'O')
    end
    object DBEdit7: TDBEdit
      Left = 512
      Top = 105
      Width = 237
      Height = 21
      DataField = 'CONTATO'
      DataSource = dsFicha
      TabOrder = 9
    end
    object DBEdit8: TDBEdit
      Left = 513
      Top = 143
      Width = 118
      Height = 21
      DataField = 'FONE1'
      DataSource = dsFicha
      TabOrder = 10
    end
    object DBEdit9: TDBEdit
      Left = 633
      Top = 143
      Width = 118
      Height = 21
      DataField = 'FONE2'
      DataSource = dsFicha
      TabOrder = 11
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 450
    Width = 764
    Height = 41
    Align = alBottom
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 296
      Top = 6
      Width = 85
      Height = 30
      Caption = '&Nova Ficha'
      TabOrder = 0
      OnClick = BitBtn1Click
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
    object BitBtn2: TBitBtn
      Left = 383
      Top = 6
      Width = 85
      Height = 30
      Caption = '&Grava'
      TabOrder = 1
      OnClick = BitBtn2Click
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
    object BitBtn4: TBitBtn
      Left = 676
      Top = 6
      Width = 85
      Height = 30
      Caption = 'Imprime'
      Enabled = False
      TabOrder = 2
      OnClick = BitBtn4Click
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
  inherited submenu: TMainMenu
    Left = 520
    Top = 116
    object Cadastro1: TMenuItem [1]
      Caption = '&Cadastro'
      object Cliente1: TMenuItem
        Caption = '&Cliente/Fornecedor'
        OnClick = Cliente1Click
      end
    end
  end
  inherited Calculator1: TRxCalculator
    Left = 552
    Top = 116
  end
  object qryFicha: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT * FROM GC_FICHA WHERE (TIPO_PROCESSO='#39'A'#39' or TIPO_PROCESSO' +
        '='#39'T'#39') '
      ' AND COD_FICHA = :COD_FICHA')
    Left = 608
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_FICHA'
        ParamType = ptUnknown
      end>
    object qryFichaCOD_FICHA: TIntegerField
      FieldName = 'COD_FICHA'
      Origin = 'DB.GC_FICHA.COD_FICHA'
    end
    object qryFichaRAZAO1: TStringField
      FieldName = 'RAZAO1'
      Origin = 'DB.GC_FICHA.RAZAO1'
      Size = 50
    end
    object qryFichaRAZAO2: TStringField
      FieldName = 'RAZAO2'
      Origin = 'DB.GC_FICHA.RAZAO2'
      Size = 50
    end
    object qryFichaRAZAO3: TStringField
      FieldName = 'RAZAO3'
      Origin = 'DB.GC_FICHA.RAZAO3'
      Size = 50
    end
    object qryFichaRAZAO_VALIDA1: TStringField
      FieldName = 'RAZAO_VALIDA1'
      Origin = 'DB.GC_FICHA.RAZAO_VALIDA1'
      Size = 1
    end
    object qryFichaRAZAO_VALIDA2: TStringField
      FieldName = 'RAZAO_VALIDA2'
      Origin = 'DB.GC_FICHA.RAZAO_VALIDA2'
      Size = 1
    end
    object qryFichaRAZAO_VALIDA3: TStringField
      FieldName = 'RAZAO_VALIDA3'
      Origin = 'DB.GC_FICHA.RAZAO_VALIDA3'
      Size = 1
    end
    object qryFichaENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'DB.GC_FICHA.ENDERECO'
      Size = 50
    end
    object qryFichaGERENCIA: TStringField
      FieldName = 'GERENCIA'
      Origin = 'DB.GC_FICHA.GERENCIA'
      Size = 1
    end
    object qryFichaCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'DB.GC_FICHA.CONTATO'
      Size = 30
    end
    object qryFichaFONE1: TStringField
      FieldName = 'FONE1'
      Origin = 'DB.GC_FICHA.FONE1'
      EditMask = '(####)9999-9999;1; '
      Size = 15
    end
    object qryFichaFONE2: TStringField
      FieldName = 'FONE2'
      Origin = 'DB.GC_FICHA.FONE2'
      EditMask = '(####)9999-9999;1; '
      Size = 15
    end
    object qryFichaCAPITAL_SOCIAL: TFloatField
      FieldName = 'CAPITAL_SOCIAL'
      Origin = 'DB.GC_FICHA.CAPITAL_SOCIAL'
    end
    object qryFichaINTEGRALIZADO: TFloatField
      FieldName = 'INTEGRALIZADO'
      Origin = 'DB.GC_FICHA.INTEGRALIZADO'
    end
    object qryFichaA_INTEGRALIZAR: TFloatField
      FieldName = 'A_INTEGRALIZAR'
      Origin = 'DB.GC_FICHA.A_INTEGRALIZAR'
    end
    object qryFichaPRAZO: TStringField
      FieldName = 'PRAZO'
      Origin = 'DB.GC_FICHA.PRAZO'
      Size = 30
    end
    object qryFichaFORMA_INTEGRALIZAR: TStringField
      FieldName = 'FORMA_INTEGRALIZAR'
      Origin = 'DB.GC_FICHA.FORMA_INTEGRALIZAR'
      Size = 1
    end
    object qryFichaBENS: TStringField
      FieldName = 'BENS'
      Origin = 'DB.GC_FICHA.BENS'
      Size = 255
    end
    object qryFichaVALOR_TAXA: TFloatField
      FieldName = 'VALOR_TAXA'
      Origin = 'DB.GC_FICHA.VALOR_TAXA'
    end
    object qryFichaVALOR_SERVICO: TFloatField
      FieldName = 'VALOR_SERVICO'
      Origin = 'DB.GC_FICHA.VALOR_SERVICO'
    end
    object qryFichaVALOR_OUTROS: TFloatField
      FieldName = 'VALOR_OUTROS'
      Origin = 'DB.GC_FICHA.VALOR_OUTROS'
    end
    object qryFichaORGAO1: TStringField
      FieldName = 'ORGAO1'
      Origin = 'DB.GC_FICHA.ORGAO1'
    end
    object qryFichaORGAO2: TStringField
      FieldName = 'ORGAO2'
      Origin = 'DB.GC_FICHA.ORGAO2'
    end
    object qryFichaORGAO3: TStringField
      FieldName = 'ORGAO3'
      Origin = 'DB.GC_FICHA.ORGAO3'
    end
    object qryFichaORGAO4: TStringField
      FieldName = 'ORGAO4'
      Origin = 'DB.GC_FICHA.ORGAO4'
    end
    object qryFichaORGAO5: TStringField
      FieldName = 'ORGAO5'
      Origin = 'DB.GC_FICHA.ORGAO5'
    end
    object qryFichaORGAO6: TStringField
      FieldName = 'ORGAO6'
      Origin = 'DB.GC_FICHA.ORGAO6'
    end
    object qryFichaORGAO7: TStringField
      FieldName = 'ORGAO7'
      Origin = 'DB.GC_FICHA.ORGAO7'
    end
    object qryFichaORGAO8: TStringField
      FieldName = 'ORGAO8'
      Origin = 'DB.GC_FICHA.ORGAO8'
    end
    object qryFichaSIGLA_CONSELHO: TStringField
      FieldName = 'SIGLA_CONSELHO'
      Origin = 'DB.GC_FICHA.SIGLA_CONSELHO'
    end
    object qryFichaALVARA_REGULAR: TStringField
      FieldName = 'ALVARA_REGULAR'
      Origin = 'DB.GC_FICHA.ALVARA_REGULAR'
      Size = 1
    end
    object qryFichaPEDIDO_LICENCA: TStringField
      FieldName = 'PEDIDO_LICENCA'
      Origin = 'DB.GC_FICHA.PEDIDO_LICENCA'
      Size = 1
    end
    object qryFichaTRIBUTACAO: TStringField
      FieldName = 'TRIBUTACAO'
      Origin = 'DB.GC_FICHA.TRIBUTACAO'
      Size = 15
    end
    object qryFichaDT_CONTATO: TDateTimeField
      FieldName = 'DT_CONTATO'
      Origin = 'DB.GC_FICHA.DT_CONTATO'
    end
    object qryFichaDT_INICIO: TDateTimeField
      FieldName = 'DT_INICIO'
      Origin = 'DB.GC_FICHA.DT_INICIO'
    end
    object qryFichaDT_PREV_TERMINO: TDateTimeField
      FieldName = 'DT_PREV_TERMINO'
      Origin = 'DB.GC_FICHA.DT_PREV_TERMINO'
    end
    object qryFichaDT_TERMINO: TDateTimeField
      FieldName = 'DT_TERMINO'
      Origin = 'DB.GC_FICHA.DT_TERMINO'
    end
    object qryFichaOBS: TMemoField
      FieldName = 'OBS'
      Origin = 'DB.GC_FICHA.OBS'
      BlobType = ftMemo
      Size = 257
    end
    object qryFichaTIPO_PROCESSO: TStringField
      FieldName = 'TIPO_PROCESSO'
      Origin = 'DB.GC_FICHA.TIPO_PROCESSO'
      Size = 1
    end
    object qryFichaOUTRA_TRIB: TStringField
      FieldName = 'OUTRA_TRIB'
      Origin = 'DB.GC_FICHA.OUTRA_TRIB'
    end
    object qryFichaOBJETO_SOCIAL: TStringField
      FieldName = 'OBJETO_SOCIAL'
      Origin = 'DB.GC_FICHA.OBJETO_SOCIAL'
      Size = 252
    end
    object qryFichaCOD_FUNC: TIntegerField
      FieldName = 'COD_FUNC'
      Origin = 'DB.GC_FICHA.COD_FUNC'
    end
    object qryFichaCOD_DEPTO: TIntegerField
      FieldName = 'COD_DEPTO'
      Origin = 'DB.GC_FICHA.COD_DEPTO'
    end
    object qryFichaPREFEITURA: TStringField
      FieldName = 'PREFEITURA'
      Origin = 'DB.GC_FICHA.PREFEITURA'
    end
    object qryFichaORGAO1_PROC: TMemoField
      FieldName = 'ORGAO1_PROC'
      Origin = 'DB.GC_FICHA.ORGAO1_PROC'
      BlobType = ftMemo
      Size = 1000
    end
    object qryFichaORGAO2_PROC: TMemoField
      FieldName = 'ORGAO2_PROC'
      Origin = 'DB.GC_FICHA.ORGAO2_PROC'
      BlobType = ftMemo
      Size = 1000
    end
    object qryFichaORGAO3_PROC: TMemoField
      FieldName = 'ORGAO3_PROC'
      Origin = 'DB.GC_FICHA.ORGAO3_PROC'
      BlobType = ftMemo
      Size = 1000
    end
    object qryFichaORGAO4_PROC: TMemoField
      FieldName = 'ORGAO4_PROC'
      Origin = 'DB.GC_FICHA.ORGAO4_PROC'
      BlobType = ftMemo
      Size = 1000
    end
    object qryFichaORGAO5_PROC: TMemoField
      FieldName = 'ORGAO5_PROC'
      Origin = 'DB.GC_FICHA.ORGAO5_PROC'
      BlobType = ftMemo
      Size = 1000
    end
    object qryFichaORGAO6_PROC: TMemoField
      FieldName = 'ORGAO6_PROC'
      Origin = 'DB.GC_FICHA.ORGAO6_PROC'
      BlobType = ftMemo
      Size = 1000
    end
    object qryFichaORGAO7_PROC: TMemoField
      FieldName = 'ORGAO7_PROC'
      Origin = 'DB.GC_FICHA.ORGAO7_PROC'
      BlobType = ftMemo
      Size = 1000
    end
    object qryFichaORGAO8_PROC: TMemoField
      FieldName = 'ORGAO8_PROC'
      Origin = 'DB.GC_FICHA.ORGAO8_PROC'
      BlobType = ftMemo
      Size = 1000
    end
    object qryFichaCOD_PLCONTA: TIntegerField
      FieldName = 'COD_PLCONTA'
      Origin = 'DB.GC_FICHA.COD_PLCONTA'
    end
    object qryFichaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'DB.GC_FICHA.COD_CLIENTE'
    end
    object qryFichaCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
      Origin = 'DB.GC_FICHA.COD_BANCO'
    end
  end
  object dsFicha: TDataSource
    AutoEdit = False
    DataSet = qryFicha
    Left = 640
    Top = 108
  end
  object qrySocios: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_FICHA_SOC WHERE COD_FICHA = :COD_FICHA')
    Left = 467
    Top = 170
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_FICHA'
        ParamType = ptUnknown
      end>
    object qrySociosCOD_FICHA: TIntegerField
      FieldName = 'COD_FICHA'
      Origin = 'DB.GC_FICHA_SOC.COD_FICHA'
    end
    object qrySociosCOD_SOCIO: TIntegerField
      FieldName = 'COD_SOCIO'
      Origin = 'DB.GC_FICHA_SOC.COD_SOCIO'
    end
    object qrySociosNOME_RAZAO: TStringField
      FieldName = 'NOME_RAZAO'
      Origin = 'DB.GC_FICHA_SOC.NOME_RAZAO'
      Size = 50
    end
    object qrySociosCPF_CNPJ: TStringField
      FieldName = 'CPF_CNPJ'
      Origin = 'DB.GC_FICHA_SOC.CPF_CNPJ'
    end
    object qrySociosORGAO_EMISSOR: TStringField
      FieldName = 'ORGAO_EMISSOR'
      Origin = 'DB.GC_FICHA_SOC.ORGAO_EMISSOR'
    end
    object qrySociosPROFISSAO: TStringField
      FieldName = 'PROFISSAO'
      Origin = 'DB.GC_FICHA_SOC.PROFISSAO'
    end
    object qrySociosESTADO_CIVIL: TStringField
      FieldName = 'ESTADO_CIVIL'
      Origin = 'DB.GC_FICHA_SOC.ESTADO_CIVIL'
      Size = 1
    end
    object qrySociosORGAO_CLASSE: TStringField
      FieldName = 'ORGAO_CLASSE'
      Origin = 'DB.GC_FICHA_SOC.ORGAO_CLASSE'
    end
    object qrySociosVALOR_CAP_SOC: TFloatField
      FieldName = 'VALOR_CAP_SOC'
      Origin = 'DB.GC_FICHA_SOC.VALOR_CAP_SOC'
      DisplayFormat = ',0.00'
    end
    object qrySociosPORC_CAP_SOC: TFloatField
      FieldName = 'PORC_CAP_SOC'
      Origin = 'DB.GC_FICHA_SOC.PORC_CAP_SOC'
    end
    object qrySociosENDERECO: TStringField
      FieldName = 'ENDERECO'
      Origin = 'DB.GC_FICHA_SOC.ENDERECO'
      Size = 102
    end
    object qrySociosRG: TStringField
      FieldName = 'RG'
      Origin = 'DB.GC_FICHA_SOC.RG'
    end
    object qrySociosTITULO: TStringField
      FieldName = 'TITULO'
      Origin = 'DB.GC_FICHA_SOC.TITULO'
    end
    object qrySociosSEXO: TStringField
      FieldName = 'SEXO'
      Origin = 'DB.GC_FICHA_SOC.SEXO'
      Size = 1
    end
    object qrySociosORGAO_NUMERO: TStringField
      FieldName = 'ORGAO_NUMERO'
      Origin = 'DB.GC_FICHA_SOC.ORGAO_NUMERO'
      Size = 30
    end
  end
  object dsSocios: TDataSource
    AutoEdit = False
    DataSet = qrySocios
    Left = 443
    Top = 178
  end
  object qryDepto: TQuery
    DatabaseName = 'db'
    SQL.Strings = (
      'SELECT * FROM GC_DEPARTAMENTO')
    Left = 490
    Top = 425
    object qryDeptoCOD_DEPTO: TIntegerField
      FieldName = 'COD_DEPTO'
      Origin = 'DB.GC_DEPARTAMENTO.COD_DEPTO'
    end
    object qryDeptoDESC_DEPTO: TStringField
      FieldName = 'DESC_DEPTO'
      Origin = 'DB.GC_DEPARTAMENTO.DESC_DEPTO'
    end
  end
  object dsDepto: TDataSource
    AutoEdit = False
    DataSet = qryDepto
    Left = 522
    Top = 417
  end
  object qryAndamento: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_FICHA_AND WHERE COD_FICHA=:COD_FICHA')
    Left = 625
    Top = 424
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_FICHA'
        ParamType = ptUnknown
      end>
    object qryAndamentoCOD_FICHA: TIntegerField
      FieldName = 'COD_FICHA'
      Origin = 'DB.GC_FICHA_AND.COD_FICHA'
    end
    object qryAndamentoCOD_ANDAMENTO: TIntegerField
      FieldName = 'COD_ANDAMENTO'
      Origin = 'DB.GC_FICHA_AND.COD_ANDAMENTO'
    end
    object qryAndamentoDT_ANDAMENTO: TDateTimeField
      FieldName = 'DT_ANDAMENTO'
      Origin = 'DB.GC_FICHA_AND.DT_ANDAMENTO'
    end
    object qryAndamentoDT_PREV_RET: TDateTimeField
      FieldName = 'DT_PREV_RET'
      Origin = 'DB.GC_FICHA_AND.DT_PREV_RET'
    end
    object qryAndamentoDT_FECHA: TDateTimeField
      FieldName = 'DT_FECHA'
      Origin = 'DB.GC_FICHA_AND.DT_FECHA'
    end
    object qryAndamentoCOD_FUNC: TIntegerField
      FieldName = 'COD_FUNC'
      Origin = 'DB.GC_FICHA_AND.COD_FUNC'
    end
    object qryAndamentoDESC_ANDAMENTO: TMemoField
      FieldName = 'DESC_ANDAMENTO'
      Origin = 'DB.GC_FICHA_AND.DESC_ANDAMENTO'
      BlobType = ftMemo
      Size = 1000
    end
  end
  object dsAndamento: TDataSource
    AutoEdit = False
    DataSet = qryAndamento
    Left = 597
    Top = 424
  end
  object qryPag: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_FICHA_PAG WHERE COD_FICHA=:COD_FICHA')
    Left = 681
    Top = 381
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_FICHA'
        ParamType = ptUnknown
      end>
    object qryPagCOD_FICHA: TIntegerField
      FieldName = 'COD_FICHA'
      Origin = 'DB.GC_FICHA_PAG.COD_FICHA'
    end
    object qryPagCOD_PAG: TIntegerField
      FieldName = 'COD_PAG'
      Origin = 'DB.GC_FICHA_PAG.COD_PAG'
    end
    object qryPagDT_PREV_PAG: TDateTimeField
      FieldName = 'DT_PREV_PAG'
      Origin = 'DB.GC_FICHA_PAG.DT_PREV_PAG'
    end
    object qryPagDT_PAG: TDateTimeField
      FieldName = 'DT_PAG'
      Origin = 'DB.GC_FICHA_PAG.DT_PAG'
    end
    object qryPagVALOR_PAG: TFloatField
      FieldName = 'VALOR_PAG'
      Origin = 'DB.GC_FICHA_PAG.VALOR_PAG'
      DisplayFormat = ',0.00'
    end
  end
  object dsPag: TDataSource
    AutoEdit = False
    DataSet = qryPag
    Left = 653
    Top = 381
  end
  object qryAux: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_FICHA_PAG WHERE COD_FICHA=:COD_FICHA')
    Left = 641
    Top = 325
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_FICHA'
        ParamType = ptUnknown
      end>
  end
  object qryAux2: TQuery
    DatabaseName = 'db'
    SQL.Strings = (
      'SELECT * FROM GC_FICHA_PAG WHERE COD_FICHA=:COD_FICHA')
    Left = 497
    Top = 317
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_FICHA'
        ParamType = ptUnknown
      end>
  end
end
