inherited Atendimento_f: TAtendimento_f
  Left = 164
  Top = 50
  Width = 784
  Height = 522
  Caption = 'Atendimento ao Cliente'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 776
    Height = 85
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 5
      Top = 42
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object sbPesq: TSpeedButton
      Left = 67
      Top = 55
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
      Left = 96
      Top = 42
      Width = 96
      Height = 13
      Caption = 'Nome/Razão Social'
    end
    object Label5: TLabel
      Left = 5
      Top = 4
      Width = 59
      Height = 13
      Caption = 'Atendimento'
    end
    object SpeedButton1: TSpeedButton
      Left = 69
      Top = 18
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
    object sbFunc: TSpeedButton
      Left = 621
      Top = 55
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
      OnClick = sbFuncClick
    end
    object Label14: TLabel
      Left = 358
      Top = 42
      Width = 37
      Height = 13
      Caption = 'Contato'
    end
    object Label15: TLabel
      Left = 646
      Top = 42
      Width = 67
      Height = 13
      Caption = 'Departamento'
    end
    object medCliente: TMaskEdit
      Left = 5
      Top = 56
      Width = 60
      Height = 21
      EditMask = '#########;0; '
      MaxLength = 9
      TabOrder = 3
      OnExit = medClienteExit
    end
    object edtNomeCli: TEdit
      Left = 93
      Top = 56
      Width = 261
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
      TabOrder = 4
    end
    object medAtendimento: TMaskEdit
      Left = 5
      Top = 19
      Width = 60
      Height = 21
      EditMask = '#########;0; '
      MaxLength = 9
      TabOrder = 0
      OnExit = medAtendimentoExit
    end
    object chkAtendimento: TCheckBox
      Left = 95
      Top = 19
      Width = 270
      Height = 17
      Caption = 'Visualizar apenas ocorrencias deste atendimento.'
      TabOrder = 1
      OnClick = chkAtendimentoClick
    end
    object edtFunc: TEdit
      Left = 357
      Top = 56
      Width = 261
      Height = 21
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnChange = edtFuncChange
      OnExit = edtFuncExit
    end
    object chkMeuDepto: TCheckBox
      Left = 367
      Top = 19
      Width = 154
      Height = 17
      Caption = 'Ocorrências do meu Depto.'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object cbDepto: TDBLookupComboBox
      Left = 646
      Top = 56
      Width = 126
      Height = 21
      DataField = 'COD_DEPTO'
      DataSource = dsAtendimento
      KeyField = 'COD_DEPTO'
      ListField = 'DESC_DEPTO'
      ListSource = dsDepto
      TabOrder = 6
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 85
    Width = 776
    Height = 162
    Align = alTop
    TabOrder = 1
    object Label3: TLabel
      Left = 654
      Top = 6
      Width = 113
      Height = 13
      Caption = 'Data/Hora Atendimento'
    end
    object Label4: TLabel
      Left = 416
      Top = 53
      Width = 143
      Height = 13
      Caption = 'Relato do Cliente ou Operador'
    end
    object Label22: TLabel
      Left = 8
      Top = 8
      Width = 98
      Height = 13
      Caption = 'Tipo de Atendimento'
    end
    object medData: TMaskEdit
      Left = 654
      Top = 22
      Width = 113
      Height = 21
      TabStop = False
      EditMask = '!99/99/99 99:99;1; '
      MaxLength = 14
      ReadOnly = True
      TabOrder = 3
      Text = '  /  /     :  '
    end
    object rgAtendimento: TDBRadioGroup
      Left = 347
      Top = 4
      Width = 304
      Height = 41
      Caption = ' Status Atendimento '
      Columns = 4
      DataField = 'STATUS_ATEND'
      DataSource = dsAtendimento
      Items.Strings = (
        'Aberto'
        'Fechado'
        'Cancelado'
        'Espera')
      ReadOnly = True
      TabOrder = 2
      Values.Strings = (
        'A'
        'F'
        'C'
        'E')
    end
    object DBRadioGroup2: TDBRadioGroup
      Left = 187
      Top = 4
      Width = 160
      Height = 41
      Caption = ' Prioridada do Atendimento'
      Columns = 3
      DataField = 'PRIORIDADE_ATEND'
      DataSource = dsAtendimento
      Items.Strings = (
        'Baixa'
        'Media'
        'Alta')
      TabOrder = 1
      Values.Strings = (
        'B'
        'M'
        'A'
        '')
    end
    object cbTipo: TComboBox
      Left = 8
      Top = 24
      Width = 177
      Height = 22
      Style = csOwnerDrawFixed
      ItemHeight = 16
      TabOrder = 0
      OnChange = cbTipoChange
      Items.Strings = (
        'Solicitação'
        'Reenvio'
        'Recalculo'
        'Reclamação'
        'Observação'
        'Informação')
    end
    object gbtipo: TGroupBox
      Left = 8
      Top = 48
      Width = 404
      Height = 112
      Caption = ' Dados do Atendimento '
      TabOrder = 4
      object Label17: TLabel
        Left = 9
        Top = 12
        Width = 55
        Height = 13
        Caption = 'Documento'
      end
      object SpeedButton3: TSpeedButton
        Left = 71
        Top = 25
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
      object Label18: TLabel
        Left = 100
        Top = 12
        Width = 48
        Height = 13
        Caption = 'Descrição'
      end
      object Label16: TLabel
        Left = 8
        Top = 50
        Width = 66
        Height = 13
        Caption = 'Compet.Inicial'
      end
      object Label19: TLabel
        Left = 106
        Top = 50
        Width = 61
        Height = 13
        Caption = 'Compet.Final'
      end
      object Label20: TLabel
        Left = 204
        Top = 50
        Width = 37
        Height = 13
        Caption = 'Vencto.'
      end
      object Label21: TLabel
        Left = 302
        Top = 50
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object Label23: TLabel
        Left = 12
        Top = 92
        Width = 75
        Height = 13
        Caption = 'Gerar Cobrança'
      end
      object edtCodDocto: TMaskEdit
        Left = 9
        Top = 26
        Width = 60
        Height = 21
        EditMask = '#########;0; '
        MaxLength = 9
        TabOrder = 0
        OnExit = edtCodDoctoExit
      end
      object edtDescDocto: TEdit
        Left = 97
        Top = 26
        Width = 248
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
      object RxDBComboBox1: TRxDBComboBox
        Left = 95
        Top = 88
        Width = 82
        Height = 21
        Style = csDropDownList
        DataField = 'COBRA_ATEND'
        DataSource = dsAtendimento
        EnableValues = True
        ItemHeight = 13
        Items.Strings = (
          'Sim'
          'Não'
          'Não Sei')
        TabOrder = 6
        Values.Strings = (
          'S'
          'N'
          'A')
      end
      object dtIni: TDBDateEdit
        Left = 8
        Top = 64
        Width = 97
        Height = 21
        DataField = 'DT_COMPET_INI'
        DataSource = dsAtendimento
        NumGlyphs = 2
        TabOrder = 2
        YearDigits = dyFour
      end
      object dtFin: TDBDateEdit
        Left = 106
        Top = 64
        Width = 97
        Height = 21
        DataField = 'DT_COMPET_FIN'
        DataSource = dsAtendimento
        NumGlyphs = 2
        TabOrder = 3
        YearDigits = dyFour
      end
      object dtVencto: TDBDateEdit
        Left = 204
        Top = 64
        Width = 97
        Height = 21
        DataField = 'DT_VENCTO'
        DataSource = dsAtendimento
        NumGlyphs = 2
        TabOrder = 4
        YearDigits = dyFour
      end
      object edtValor: TRxDBCalcEdit
        Left = 304
        Top = 64
        Width = 96
        Height = 21
        DataField = 'VALOR_DOCTO'
        DataSource = dsAtendimento
        DisplayFormat = ',0.00'
        NumGlyphs = 2
        TabOrder = 5
      end
    end
    object DBMemo1: TDBMemo
      Left = 416
      Top = 68
      Width = 353
      Height = 89
      DataField = 'DESCRICAO_ATEND'
      DataSource = dsAtendimento
      MaxLength = 1000
      TabOrder = 5
    end
  end
  object PageControl1: TPageControl [2]
    Left = 0
    Top = 247
    Width = 776
    Height = 188
    ActivePage = TabSheet3
    Align = alClient
    HotTrack = True
    Images = ImageList1
    TabOrder = 2
    object TabSheet3: TTabSheet
      Caption = '&Ocorrências'
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 768
        Height = 159
        Hint = 'Duplo Click para ver Ocorrência'
        Align = alClient
        DataSource = dsOcorrencia
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
            FieldName = 'COD_ATENDIMENTO'
            Title.Caption = 'Cod.Atend.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COD_OCORRENCIA'
            Title.Caption = 'Cod.Ocorrencia'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRICAO_OCORR2'
            Title.Caption = 'Descrição Ocorrência'
            Width = 174
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_OCORRENCIA'
            Title.Caption = 'Dt.Ocorrencia'
            Width = 94
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_FECHAMENTO_OCORR'
            Title.Caption = 'Dt.Fechamento'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS_OCORR'
            Title.Caption = 'Status'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_FUNC'
            Title.Caption = 'Nome Funcionário'
            Width = 194
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_DEPTO'
            Title.Caption = 'Depto.'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_FUNC_1'
            Title.Caption = 'Transferido para'
            Width = 259
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_DEPTO_1'
            Title.Caption = 'Depto.'
            Width = 107
            Visible = True
          end>
      end
    end
    object TabSheet1: TTabSheet
      Caption = '&Ligações'
      ImageIndex = 2
      object DBGrid2: TDBGrid
        Left = 0
        Top = 16
        Width = 768
        Height = 143
        Align = alClient
        DataSource = dsLigacao
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGrid2DrawColumnCell
        Columns = <
          item
            Expanded = False
            FieldName = 'DESC_LIG'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Caption = 'Motivo'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 360
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS_LIG'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Caption = 'Status'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_PEDIDO_LIG'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Caption = 'Dat.Ligacao'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 119
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_FECHAMENTO_LIG'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Caption = 'Dat.Fechamento'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CONTATO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Caption = 'Contato'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 124
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_FUNC'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Caption = 'Funcionario'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 188
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_DEPTO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Caption = 'Depto.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBS_LIG'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -8
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Title.Caption = 'Obs.'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -11
            Title.Font.Name = 'MS Sans Serif'
            Title.Font.Style = [fsBold]
            Width = 500
            Visible = True
          end>
      end
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 768
        Height = 16
        Align = alTop
        TabOrder = 1
        object Label11: TLabel
          Left = 12
          Top = 1
          Width = 54
          Height = 13
          Caption = 'Legenda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label12: TLabel
          Left = 71
          Top = 1
          Width = 107
          Height = 13
          Caption = 'Vermelho = Espera'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label13: TLabel
          Left = 203
          Top = 1
          Width = 83
          Height = 13
          Caption = 'Preto = Aberto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = '&Visitas'
      ImageIndex = 4
      object Panel4: TPanel
        Left = 0
        Top = 16
        Width = 768
        Height = 143
        Align = alClient
        TabOrder = 0
        object DBGrid3: TDBGrid
          Left = 1
          Top = 1
          Width = 766
          Height = 141
          Align = alClient
          DataSource = dsVisita
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -8
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGrid3DrawColumnCell
          Columns = <
            item
              Expanded = False
              FieldName = 'DT_VISITA'
              Title.Caption = 'Dt.Visita'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DT_PREV_RET'
              Title.Caption = 'Dt.Prev.Retorno'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 117
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_CLI'
              Title.Caption = 'Cliente'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 249
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STATUS_VISITA'
              Title.Caption = 'Status'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME_FUNC'
              Title.Caption = 'Funcionário'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 193
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESC_DEPTO'
              Title.Caption = 'Depto.'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MOTIVO_VISITA'
              Title.Caption = 'Motivo da Visita'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clWindowText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = [fsBold]
              Width = 382
              Visible = True
            end>
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 768
        Height = 16
        Align = alTop
        TabOrder = 1
        object Label6: TLabel
          Left = 12
          Top = 1
          Width = 54
          Height = 13
          Caption = 'Legenda:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 84
          Top = 1
          Width = 85
          Height = 13
          Caption = 'Azul = Baixada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 192
          Top = 1
          Width = 107
          Height = 13
          Caption = 'Vermelho = Adiada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label9: TLabel
          Left = 320
          Top = 1
          Width = 83
          Height = 13
          Caption = 'Preto = Aberto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 426
          Top = 1
          Width = 120
          Height = 13
          Caption = 'Purpura = Cancelada'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clPurple
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
      end
    end
    object TabSheet4: TTabSheet
      Caption = '&Documentos Emitidos'
      ImageIndex = 6
      object DBGrid4: TDBGrid
        Left = 0
        Top = 0
        Width = 768
        Height = 159
        Align = alClient
        DataSource = dsDocto
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'COD_PROTOCOLO'
            Title.Caption = 'Nº Protocolo'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_EMISSAO_PROTO'
            Title.Caption = 'Emitido em'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_ENTREGA_PREV'
            Title.Caption = 'Dt.Prevista Entrega'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DT_ENTREGA_PROTO'
            Title.Caption = 'Dt.Entrega'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_DOCTO'
            Title.Caption = 'Documento'
            Width = 186
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBS_DOCTO_EMI'
            Title.Caption = 'Compl.'
            Width = 233
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS_ENTREGA'
            Title.Caption = 'Status da Entrega'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_FUNC'
            Title.Caption = 'Entregue por Func.'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMPETENCIA_DOCTO'
            Title.Caption = 'Competencia Docto.'
            Visible = True
          end>
      end
    end
  end
  object Panel3: TPanel [3]
    Left = 0
    Top = 435
    Width = 776
    Height = 41
    Align = alBottom
    TabOrder = 3
    object BitBtn1: TBitBtn
      Left = 3
      Top = 3
      Width = 99
      Height = 37
      Caption = 'Novo Atend.'
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
      Layout = blGlyphTop
      NumGlyphs = 2
      Spacing = 1
    end
    object btnOcorr: TBitBtn
      Left = 581
      Top = 3
      Width = 99
      Height = 37
      Caption = 'Nova Ocorrencia'
      Enabled = False
      TabOrder = 3
      OnClick = btnOcorrClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      Layout = blGlyphTop
      NumGlyphs = 2
      Spacing = 1
    end
    object BitBtn3: TBitBtn
      Left = 205
      Top = 3
      Width = 99
      Height = 37
      Caption = 'Apaga Atend.'
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
      Layout = blGlyphTop
      NumGlyphs = 2
      Spacing = 1
    end
    object BitBtn6: TBitBtn
      Left = 104
      Top = 3
      Width = 99
      Height = 37
      Caption = 'Grava Atend.'
      TabOrder = 1
      OnClick = BitBtn6Click
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
      Layout = blGlyphTop
      NumGlyphs = 2
    end
  end
  inherited submenu: TMainMenu
    Left = 632
    Top = 340
    object Cadastro1: TMenuItem [1]
      Caption = '&Cadastro'
      object Documentos1: TMenuItem
        Caption = '&Documentos'
        OnClick = Documentos1Click
      end
      object Pendncias1: TMenuItem
        Caption = '&Pendências'
        OnClick = Pendncias1Click
      end
      object Ligaes1: TMenuItem
        Caption = '&Ligações'
        OnClick = Ligaes1Click
      end
      object Visitas1: TMenuItem
        Caption = '&Visitas'
        OnClick = Visitas1Click
      end
    end
    object Impresso1: TMenuItem [2]
      Caption = '&Impressão'
      object AtendimentosEfetuados1: TMenuItem
        Caption = '&Atendimentos Efetuados'
        OnClick = AtendimentosEfetuados1Click
      end
    end
  end
  object ImageList1: TImageList [5]
    Left = 24
    Top = 315
    Bitmap = {
      494C010108000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001001000000000000018
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000EF3DEF3DEF3DEF3DEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D0000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF7FEF3D
      EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D0000EF3DFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FEF3D0000EF3DEF3D0000FF7FFF7F00000000
      000000000000000000000000FF7FEF3DEF3D0000000000000000000000000000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000000000000000FF7FEF3DEF3DEF3D
      FF7F0000FF7FFF7FFF7FFF7F00000000EF3D0000FF7FEF3DEF3DFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FEF3DEF3DFF7F0000EF3DFF7FEF3DEF3D0000FF7FFF7F
      FF7FFF7FFF7FFF7FFF7FEF3DEF3DFF7FEF3D00000000000000000000FF7F0000
      FF7F0000000000000000FF7FFF7FFF7F00000000FF7FEF3DEF3DEF3DFF7FEF3D
      FF7FEF3DEF3DEF3DEF3D000000000000EF3D0000FF7FFF7FFF7FEF3DEF3D0000
      000000000000000000000000000000000000EF3DFF7F00000000EF3DEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D000000000000FF7F0000FF7F0000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000EF3DEF3DEF3DFF7FEF3DFF7FEF3D
      FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FEF3D0000FF7FFF7FFF7FFF7FFF7F0000
      E07FE07FE07FE07FE07FE07FE07FE07F0000EF3DFF7F000000000000FF7FEF3D
      FF7F0000FF7FFF7F00000000FF7FFF7FEF3D0000FF7F0000FF7F0000FF7F0000
      FF7F000000000000000000000000FF7F0000EF3DFF7FEF3DFF7FEF3DFF7FEF3D
      FF7FEF3DEF3DEF3DEF3DEF3DEF3D0000EF3D0000FF7FFF7FFF7FEF3D00000000
      E07F00000000E07FE07F00000000E07F0000EF3DFF7F0000FF7FEF3DEF3DEF3D
      FF7FEF3DEF3DFF7F0000EF3DEF3D0000EF3D0000FF7F0000FF7F0000FF7F0000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000EF3DFF7FEF3DFF7FEF3DFF7FEF3D
      FF7F0000FF7FFF7FFF7FFF7FFF7FFF7FEF3D0000FF7FEF3D0000EF3DFF7F0000
      E07FE07F0000E07F00000000E07FE07F0000EF3DFF7FEF3DEF3D00000000EF3D
      FF7F0000EF3DFF7FEF3DEF3D00000000EF3D0000FF7F0000FF7F0000FF7F0000
      FF7F000000000000000000000000FF7F0000EF3DFF7FEF3DFF7FEF3DFF7FEF3D
      FF7FEF3DEF3DEF3DEF3DEF3DEF3D0000EF3D00000000EF3DFF03FF03FF030000
      E07FE07F0000E07F0000E07FE07FE07F0000EF3DEF3DFF7FFF7FFF7FFF7FEF3D
      FF7F0000EF3DFF7FEF3DFF7F00000000EF3D0000FF7F0000FF7F0000FF7F0000
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7F0000EF3DFF7FEF3DFF7FEF3DFF7FEF3D
      FF7F0000FF7FFF7FFF7F000000000000EF3D0000EF3DEF3DEF3DEF3DEF3D0000
      FF03FF03000000000000FF03FF03FF030000EF3DEF3DEF3DEF3DEF3DEF3DEF3D
      FF7F0000EF3DEF3DEF3DFF7F0000FF7FEF3D0000FF7F0000FF7F0000FF7F0000
      FF7F000000000000FF7FFF7FFF7FFF7F0000EF3DFF7FEF3DFF7FEF3DFF7FEF3D
      FF7FEF3DEF3DEF3D00000000FF7FFF7FEF3D00000000EF3DFF03FF03FF030000
      FF030000FF0300000000FF030000FF0300000000EF3DEF3D0000FF7FFF7FEF3D
      FF7FEF3D0000EF3DEF3DFF7FEF3D0000EF3D0000FF7F0000FF7F0000FF7F0000
      FF7FFF7FFF7FFF7FFF7F0000000000000000EF3DFF7FEF3DFF7FEF3DFF7FEF3D
      FF7F0000FF7FFF7F0000EF3DEF3DEF3DEF3D00000000EF3D0000EF3DFF7F0000
      FF03FF030000000000000000FF03FF030000000000000000EF3DEF3D0000EF3D
      FF7F0000EF3DEF3DEF3DEF3D00000000EF3D0000FF7F0000FF7F0000FF7F0000
      FF7F00000000FF7FFF7F0000FF7F00000000EF3DFF7FEF3DFF7FEF3DFF7FEF3D
      FF7FEF3DEF3D00000000EF3DFF7FEF3D00000000000000000000EF3D00000000
      FF03FF03FF0300000000FF03FF03FF03000000000000000000000000EF3DEF3D
      FF7F00000000EF3DEF3DFF7FFF7F0000EF3D0000FF7F0000FF7F0000FF7F0000
      FF7FFF7FFF7FFF7FFF7F0000000000000000EF3DFF7FEF3DFF7FEF3DFF7FEF3D
      FF7FFF7FFF7FFF7FFF7FEF3DEF3D000000000000000000000000000000000000
      FF03FF03FF03FF0300000000FF03FF030000000000000000000000000000EF3D
      FF7F000000000000EF3DEF3DFF7F0000EF3D0000FF7F0000FF7F0000FF7F0000
      000000000000000000000000000000000000EF3DFF7FEF3DFF7FEF3DFF7FEF3D
      EF3DEF3DEF3DEF3DEF3DEF3D0000000000000000000000000000000000000000
      FF03FF03FF03FF0300000000FF03FF030000000000000000000000000000EF3D
      FF7F000000000000EF3DEF3D00000000EF3D0000FF7F0000FF7F000000000000
      000000000000000000000000000000000000EF3DFF7FEF3DFF7FEF3DEF3DEF3D
      EF3DEF3DEF3DEF3D000000000000000000000000000000000000000000000000
      FF03FF03FF03FF03FF03FF03FF03FF030000000000000000000000000000EF3D
      FF7FFF7FFF7FFF7FFF7FFF7FFF7FFF7FEF3D0000FF7F00000000000000000000
      000000000000000000000000000000000000EF3DFF7FEF3DEF3DEF3DEF3DEF3D
      EF3DEF3D00000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000EF3D
      EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D0000000000000000000000000000
      000000000000000000000000000000000000EF3DEF3DEF3DEF3DEF3DEF3DEF3D
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000EF3DEF3DEF3DEF3DEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3D0000FF7F00000000E07F00000000000000000000
      00000000000000000000000000000000E07F0000EF3DFF7FEF3DEF3DEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3DEF3DFF7FEF3D0000F75EF75EF75EF75EF75EF75E
      F75EF75EF75EF75EF75EF75E000000000000EF3DFF7F0000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7FFF7FEF3D0000FF7F0000E07FE07F0000007C00400040
      0040004000400040004000400000E07FE07F0000EF3DEF3DEF3DFF7F0000FF7F
      0000FF7F0000FF7F0000FF7FEF3DEF3DEF3D0000F75E00000000000000000000
      00000000000000000000F75EF75E00000000EF3D0000EF3DEF3DEF3DEF3DEF3D
      EF3DEF3DEF3DEF3DEF3D0000FF7FEF3D00000000004000400000007CF75E0000
      F75E0000F75E0000F75E00400000E07F00000000EF3DEF3DEF3DFF7FEF3D0000
      EF3D0000EF3D0000EF3D0000EF3DEF3D000000000000F75E0000FF7FFF7FFF7F
      FF7FFF7FFF7F000000000000F75EF75E00000000EF3DFF7FEF3DFF7FFF7FFF7F
      FF7FFF7FFF7FEF3D0000EF3D0000FF7FEF3D0040000000000000007C007C007C
      007C007C007C007C007C0040000000000000EF3DFF7F0000EF3D0000FF7F0000
      FF7F0000FF7F0000FF7F0000EF3D000000000000000000000000000000000000
      000000000000FF7F0000FF7F0000F75E0000EF3DEF3DEF3DEF3DEF3DEF3DEF3D
      EF3DEF3DEF3D0000EF3D0000EF3DFF7FEF3D00400000000000000000007CF75E
      0000F75E0000F75E007C0000000000000000EF3DFF7F00000000EF3D0000EF3D
      0000EF3D0000EF3D0000EF3D0000000000000000FF7FFF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7F0000FF7F00000000F75E0000EF3D0000FF7F0000FF7FFF7F0000
      FF7FFF7F0000EF3D0000EF3DEF3DFF7FEF3D004000000000000000000000007C
      007C007C007C007C00000000000000000000EF3DFF7FFF7FFF7FFF7FEF3DFF7F
      FF7FFF7FFF7FFF7FEF3DFF7FFF7FFF7FFF7F00000000FF7F00000000FF7F0000
      0000FF7FFF7FFF7F0000FF7F0000F75E00000000EF3DFF7FEF3DEF3D0000EF3D
      EF3D000000000000EF3DFF7FEF3DFF7FEF3DE07F000000400040E07F00000000
      00000000000000000000E07FE07FE07FE07FEF3DEF3DEF3DEF3DEF3DEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D00000000FF7FFF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7F0000FF7F0000F75E00000000EF3DFF7FFF7F000000000000
      0000000000000000EF3D0000EF3DFF7FEF3DE07F00000040004000400000E07F
      E07FE07FE07FE07F0000E07FE07FE07FE07FEF3DEF3DFF7F0000EF3DEF3DEF3D
      EF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3DEF3D000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000000000000000EF3DEF3DEF3DFF7FFF7F0000FF7F
      FF7FFF7FFF7FFF7F0000EF3DEF3DEF3DEF3D000000000040004000400000F75E
      E07FE07F00000000000000000000000000000000EF3DFF7F00000000EF3D0000
      EF3DEF3DFF7F0000FF7FFF7FFF7FFF7F00000000007C00000000FF7F00000000
      000000000000FF7F000000000000007C0000EF3DFF7FEF3DEF3D0000EF3DEF3D
      EF3DEF3DEF3D0000EF3DEF3DEF3DFF7FEF3D00000000007C007C004000400040
      E07FE07F00000000004000000000000000000000EF3D0000FF7F00000000EF3D
      EF3DEF3DFF7FEF3DEF3DEF3DEF3D0000FF7F0000007C0000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F00000000007C0000EF3DFF7FEF3DFF7F000000000000
      00000000000000000000EF3DEF3D0000EF3D000000000040007C007C007C0040
      00000000004000000040004000400000000000000000EF3D0000FF7FFF7FFF7F
      EF3DEF3DEF3DEF3D000000000000EF3DFF7F000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F0000FF7F00000000EF3DEF3DEF3DFF7F0000FF7FFF7F
      FF7F0000FF7FFF7F0000EF3DFF7FEF3DEF3D000000000000000000000000007C
      007C007C007C0040007C007C007C00000000000000000000EF3DEF3DEF3D0000
      FF7FFF7FFF7FFF7F000000000000EF3D0000000000000000FF7F000000000000
      FF7F00000000FF7FFF7F0000FF7F0000000000000000EF3DFF7FEF3DEF3DEF3D
      0000EF3DEF3D00000000EF3DFF7FEF3DFF7F000000000000E07FE07FEF3D0040
      000000000040007C007C0040004000000000000000000000EF3DEF3D0000EF3D
      EF3DEF3DEF3D0000FF7FFF7FEF3DFF7F0000000000000000FF7FFF7FFF7FFF7F
      FF7FFF7FFF7FFF7FFF7F000000000000000000000000EF3DFF7F000000000000
      FF7FFF7FFF7FFF7FFF7FEF3DEF3DEF3D000000000000E07FE07F000000000000
      E07FE07FEF3D000000400040E07F0000000000000000EF3DEF3D000000000000
      EF3DEF3DFF7FEF3DEF3DEF3DEF3DFF7FFF7F000000000000FF7FFF7FFF7F0000
      00000000000000000000000000000000000000000000EF3D0000FF7FFF7FEF3D
      EF3DEF3DEF3DEF3DEF3DEF3D0000000000000000E07FE07F0000000000000000
      E07FE07F0000000000000000E07FE07F00000000EF3DEF3D0000000000000000
      EF3DEF3DFF7F000000000000EF3DEF3DFF7F0000000000000000000000000000
      000000000000000000000000000000000000000000000000EF3DEF3DEF3D0000
      000000000000000000000000000000000000E07FE07F00000000000000000000
      E07FE07F00000000000000000000E07FE07FEF3DEF3D00000000000000000000
      EF3DEF3D00000000000000000000EF3DEF3D424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000080008000FC00F800000027F8F000E086
      00000800C000800E000030000000008000003898000000020000201200000080
      00000C8600000002000000860000008E00000084000000188000904200000090
      C000E48600010031F000F8C200030003FC00FCE200070007FC00FCE6001F001F
      FC00FC00007F007FFC00FC0001FF01FF80078005A00280000003200280008550
      00014009800182A98010801460032AAB000000287007355700005250780F0000
      800084E00000000080008FE80000100000000410807F9A21000008208043AC02
      00000FF2C001D01C00000890E001E21DC001C130E003E421C001CE01CE03CE00
      C007D0079E799E38E3FFE3FF3E7C3E7C00000000000000000000000000000000
      000000000000}
  end
  object qryLigacao: TQuery [6]
    DatabaseName = 'db'
    SQL.Strings = (
      'SELECT LIG.*, CLI.NOME_CLI, FUN.NOME_FUNC, DEP.DESC_DEPTO'
      'FROM GC_LIGACAO LIG'
      'LEFT JOIN GC_CLIENTE CLI ON (LIG.COD_CLIENTE=CLI.COD_CLIENTE)'
      'LEFT JOIN GC_FUNCIONARIO FUN ON (LIG.COD_FUNC=FUN.COD_FUNC)'
      'LEFT JOIN GC_DEPARTAMENTO DEP ON (LIG.COD_DEPTO=DEP.COD_DEPTO)'
      'WHERE LIG.STATUS_LIG IN ('#39'A'#39','#39'E'#39','#39'F'#39') AND'
      'LIG.COD_CLIENTE = :COD_CLIENTE'
      'ORDER BY LIG.DT_PEDIDO_LIG DESC')
    Left = 56
    Top = 316
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'COD_CLIENTE'
        ParamType = ptUnknown
      end>
    object qryLigacaoCOD_LIGACAO: TIntegerField
      FieldName = 'COD_LIGACAO'
      Origin = 'DB.GC_LIGACAO.COD_LIGACAO'
    end
    object qryLigacaoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'DB.GC_LIGACAO.COD_CLIENTE'
    end
    object qryLigacaoCOD_FUNC: TIntegerField
      FieldName = 'COD_FUNC'
      Origin = 'DB.GC_LIGACAO.COD_FUNC'
    end
    object qryLigacaoCOD_DEPTO: TIntegerField
      FieldName = 'COD_DEPTO'
      Origin = 'DB.GC_LIGACAO.COD_DEPTO'
    end
    object qryLigacaoDESC_LIG: TStringField
      FieldName = 'DESC_LIG'
      Origin = 'DB.GC_LIGACAO.DESC_LIG'
      Size = 100
    end
    object qryLigacaoPRIORIDADE_LIG: TStringField
      FieldName = 'PRIORIDADE_LIG'
      Origin = 'DB.GC_LIGACAO.PRIORIDADE_LIG'
      Size = 1
    end
    object qryLigacaoSTATUS_LIG: TStringField
      FieldName = 'STATUS_LIG'
      Origin = 'DB.GC_LIGACAO.STATUS_LIG'
      Size = 1
    end
    object qryLigacaoDT_PEDIDO_LIG: TDateTimeField
      FieldName = 'DT_PEDIDO_LIG'
      Origin = 'DB.GC_LIGACAO.DT_PEDIDO_LIG'
    end
    object qryLigacaoDT_FECHAMENTO_LIG: TDateTimeField
      FieldName = 'DT_FECHAMENTO_LIG'
      Origin = 'DB.GC_LIGACAO.DT_FECHAMENTO_LIG'
    end
    object qryLigacaoFONE1: TStringField
      FieldName = 'FONE1'
      Origin = 'DB.GC_LIGACAO.FONE1'
      Size = 15
    end
    object qryLigacaoFONE2: TStringField
      FieldName = 'FONE2'
      Origin = 'DB.GC_LIGACAO.FONE2'
      Size = 15
    end
    object qryLigacaoFONE3: TStringField
      FieldName = 'FONE3'
      Origin = 'DB.GC_LIGACAO.FONE3'
      Size = 15
    end
    object qryLigacaoFONE4: TStringField
      FieldName = 'FONE4'
      Origin = 'DB.GC_LIGACAO.FONE4'
      Size = 15
    end
    object qryLigacaoCONTATO: TStringField
      FieldName = 'CONTATO'
      Origin = 'DB.GC_LIGACAO.CONTATO'
      Size = 50
    end
    object qryLigacaoRAMAL1: TStringField
      FieldName = 'RAMAL1'
      Origin = 'DB.GC_LIGACAO.RAMAL1'
      Size = 4
    end
    object qryLigacaoRAMAL2: TStringField
      FieldName = 'RAMAL2'
      Origin = 'DB.GC_LIGACAO.RAMAL2'
      Size = 4
    end
    object qryLigacaoRAMAL3: TStringField
      FieldName = 'RAMAL3'
      Origin = 'DB.GC_LIGACAO.RAMAL3'
      Size = 4
    end
    object qryLigacaoRAMAL4: TStringField
      FieldName = 'RAMAL4'
      Origin = 'DB.GC_LIGACAO.RAMAL4'
      Size = 4
    end
    object qryLigacaoCOD_FUNC_CAD: TIntegerField
      FieldName = 'COD_FUNC_CAD'
      Origin = 'DB.GC_LIGACAO.COD_FUNC_CAD'
    end
    object qryLigacaoNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Size = 50
    end
    object qryLigacaoNOME_FUNC: TStringField
      FieldName = 'NOME_FUNC'
      Size = 50
    end
    object qryLigacaoDESC_DEPTO: TStringField
      FieldName = 'DESC_DEPTO'
    end
    object qryLigacaoOBS_LIG: TStringField
      FieldName = 'OBS_LIG'
      Size = 255
    end
    object qryLigacaoQUEMFALA: TStringField
      FieldName = 'QUEMFALA'
      Size = 1
    end
  end
  object dsLigacao: TDataSource [7]
    AutoEdit = False
    DataSet = qryLigacao
    Left = 88
    Top = 316
  end
  object dsVisita: TDataSource [8]
    AutoEdit = False
    DataSet = qryVisita
    Left = 208
    Top = 324
  end
  object qryVisita: TQuery [9]
    DatabaseName = 'db'
    SQL.Strings = (
      'SELECT VIS.*, CLI.*, FUN.NOME_FUNC, DEP.DESC_DEPTO'
      'FROM GC_VISITA VIS'
      'LEFT JOIN GC_CLIENTE CLI ON (VIS.COD_CLIENTE=CLI.COD_CLIENTE)'
      'LEFT JOIN GC_FUNCIONARIO FUN ON (VIS.COD_FUNC=FUN.COD_FUNC)'
      'LEFT JOIN GC_DEPARTAMENTO DEP ON (FUN.COD_DEPTO=DEP.COD_DEPTO)'
      'WHERE VIS.COD_CLIENTE = :COD_CLIENTE'
      'ORDER BY VIS.DT_VISITA DESC')
    Left = 180
    Top = 328
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptUnknown
      end>
    object qryVisitaCOD_VISITA: TIntegerField
      FieldName = 'COD_VISITA'
    end
    object qryVisitaCOD_FUNC: TIntegerField
      FieldName = 'COD_FUNC'
    end
    object qryVisitaDT_VISITA: TDateTimeField
      FieldName = 'DT_VISITA'
    end
    object qryVisitaDT_PREV_RET: TDateTimeField
      FieldName = 'DT_PREV_RET'
    end
    object qryVisitaMOTIVO_VISITA: TMemoField
      FieldName = 'MOTIVO_VISITA'
      BlobType = ftMemo
      Size = 100
    end
    object qryVisitaOBS_VISITA: TStringField
      FieldName = 'OBS_VISITA'
      Size = 255
    end
    object qryVisitaCONTATO_VISITA: TStringField
      FieldName = 'CONTATO_VISITA'
      Size = 50
    end
    object qryVisitaSTATUS_VISITA: TStringField
      FieldName = 'STATUS_VISITA'
      Size = 1
    end
    object qryVisitaCOD_FUNC_CAD_VIS: TIntegerField
      FieldName = 'COD_FUNC_CAD_VIS'
    end
    object qryVisitaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object qryVisitaCOD_CLIENTE_1: TIntegerField
      FieldName = 'COD_CLIENTE_1'
    end
    object qryVisitaCOD_CLIENTE_ALT: TIntegerField
      FieldName = 'COD_CLIENTE_ALT'
    end
    object qryVisitaCNPJCPF_CLI: TStringField
      FieldName = 'CNPJCPF_CLI'
      Size = 18
    end
    object qryVisitaTIPO_CLI: TStringField
      FieldName = 'TIPO_CLI'
      Size = 1
    end
    object qryVisitaNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Size = 50
    end
    object qryVisitaFANTASIA_CLI: TStringField
      FieldName = 'FANTASIA_CLI'
      Size = 50
    end
    object qryVisitaENDERECO_CLI: TStringField
      FieldName = 'ENDERECO_CLI'
      Size = 50
    end
    object qryVisitaEND_COB_CLI: TStringField
      FieldName = 'END_COB_CLI'
      Size = 60
    end
    object qryVisitaCOMPLEMENTO_CLI: TStringField
      FieldName = 'COMPLEMENTO_CLI'
    end
    object qryVisitaBAIRRO_CLI: TStringField
      FieldName = 'BAIRRO_CLI'
    end
    object qryVisitaCIDADE_CLI: TStringField
      FieldName = 'CIDADE_CLI'
    end
    object qryVisitaUF_CLI: TStringField
      FieldName = 'UF_CLI'
      Size = 2
    end
    object qryVisitaFONE1_CLI: TStringField
      FieldName = 'FONE1_CLI'
      Size = 15
    end
    object qryVisitaFONE2_CLI: TStringField
      FieldName = 'FONE2_CLI'
      Size = 15
    end
    object qryVisitaFONE3_CLI: TStringField
      FieldName = 'FONE3_CLI'
      Size = 15
    end
    object qryVisitaEMAIL_CLI: TStringField
      FieldName = 'EMAIL_CLI'
      Size = 50
    end
    object qryVisitaCONTATO_CLI: TStringField
      FieldName = 'CONTATO_CLI'
    end
    object qryVisitaATIVO_CLI: TStringField
      FieldName = 'ATIVO_CLI'
      Size = 1
    end
    object qryVisitaSTATUS_CLI: TStringField
      FieldName = 'STATUS_CLI'
      Size = 1
    end
    object qryVisitaVALOR_MENSAL: TFloatField
      FieldName = 'VALOR_MENSAL'
    end
    object qryVisitaDIA_VENCTO: TSmallintField
      FieldName = 'DIA_VENCTO'
    end
    object qryVisitaNOME_FUNC: TStringField
      FieldName = 'NOME_FUNC'
      Size = 50
    end
    object qryVisitaDESC_DEPTO: TStringField
      FieldName = 'DESC_DEPTO'
    end
    object qryVisitaCEP_CLI: TStringField
      FieldName = 'CEP_CLI'
      Size = 11
    end
  end
  object qryAux: TQuery [10]
    DatabaseName = 'db'
    RequestLive = True
    Left = 304
    Top = 316
  end
  object qryAtendimento: TQuery [11]
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_ATENDIMENTO '
      'WHERE COD_ATENDIMENTO = :COD_ATENDIMENTO')
    Left = 560
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_ATENDIMENTO'
        ParamType = ptUnknown
      end>
  end
  object dsAtendimento: TDataSource [12]
    AutoEdit = False
    DataSet = qryAtendimento
    Left = 592
    Top = 336
  end
  object qryOcorrencia: TQuery [13]
    DatabaseName = 'db'
    SQL.Strings = (
      'SELECT OCO.*, FUN1.NOME_FUNC, DEP1.DESC_DEPTO,'
      
        'FUN2.NOME_FUNC, DEP2.DESC_DEPTO, CAST(DESCRICAO_OCORR AS VARCHAR' +
        '(100)) DESCRICAO_OCORR2'
      'FROM GC_OCORRENCIA OCO'
      'LEFT JOIN GC_FUNCIONARIO FUN1 ON (OCO.COD_FUNC=FUN1.COD_FUNC)'
      
        'LEFT JOIN GC_DEPARTAMENTO DEP1 ON (FUN1.COD_DEPTO=DEP1.COD_DEPTO' +
        ')'
      
        'LEFT JOIN GC_FUNCIONARIO FUN2 ON (OCO.COD_FUNC_TRANS=FUN2.COD_FU' +
        'NC)'
      
        'LEFT JOIN GC_DEPARTAMENTO DEP2 ON (FUN2.COD_DEPTO=DEP2.COD_DEPTO' +
        ')'
      
        'WHERE OCO.COD_CLIENTE = :COD_CLIENTE AND OCO.DT_OCORRENCIA >=  :' +
        'DT_OCORRENCIA'
      'ORDER BY OCO.COD_ATENDIMENTO, OCO.DT_OCORRENCIA DESC')
    Left = 264
    Top = 373
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DT_OCORRENCIA'
        ParamType = ptUnknown
      end>
    object qryOcorrenciaCOD_OCORRENCIA: TIntegerField
      FieldName = 'COD_OCORRENCIA'
    end
    object qryOcorrenciaCOD_ATENDIMENTO: TIntegerField
      FieldName = 'COD_ATENDIMENTO'
    end
    object qryOcorrenciaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object qryOcorrenciaCOD_FUNC: TIntegerField
      FieldName = 'COD_FUNC'
    end
    object qryOcorrenciaDT_OCORRENCIA: TDateTimeField
      FieldName = 'DT_OCORRENCIA'
    end
    object qryOcorrenciaSTATUS_OCORR: TStringField
      FieldName = 'STATUS_OCORR'
      Size = 1
    end
    object qryOcorrenciaCOD_FUNC_TRANS: TIntegerField
      FieldName = 'COD_FUNC_TRANS'
    end
    object qryOcorrenciaNOME_FUNC: TStringField
      FieldName = 'NOME_FUNC'
      Size = 50
    end
    object qryOcorrenciaDESC_DEPTO: TStringField
      FieldName = 'DESC_DEPTO'
    end
    object qryOcorrenciaNOME_FUNC_1: TStringField
      FieldName = 'NOME_FUNC_1'
      Size = 50
    end
    object qryOcorrenciaDESC_DEPTO_1: TStringField
      FieldName = 'DESC_DEPTO_1'
    end
    object qryOcorrenciaDESCRICAO_OCORR2: TStringField
      FieldName = 'DESCRICAO_OCORR2'
      Size = 100
    end
    object qryOcorrenciaDT_FECHAMENTO_OCORR: TDateTimeField
      FieldName = 'DT_FECHAMENTO_OCORR'
    end
  end
  object dsOcorrencia: TDataSource [14]
    AutoEdit = False
    DataSet = qryOcorrencia
    Left = 292
    Top = 369
  end
  object qryDocto: TQuery [15]
    DatabaseName = 'db'
    SQL.Strings = (
      'SELECT EMI.*, DOC.*, PRO.*, FUN.NOME_FUNC'
      'FROM GC_PROTOCOLO PRO'
      
        'INNER JOIN GC_DOCUMENTO_EMITIDO EMI ON (PRO.COD_PROTOCOLO = EMI.' +
        'COD_PROTOCOLO)'
      
        'INNER JOIN GC_DOCUMENTO         DOC ON (DOC.COD_DOCTO=EMI.COD_DO' +
        'CTO)'
      
        'LEFT  JOIN GC_FUNCIONARIO       FUN ON (PRO.COD_FUNC=FUN.COD_FUN' +
        'C)'
      'WHERE PRO.COD_CLIENTE = :COD_CLIENTE'
      'ORDER BY PRO.DT_EMISSAO_PROTO, PRO.DT_ENTREGA_PROTO DESC')
    Left = 367
    Top = 373
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptUnknown
      end>
    object qryDoctoCOD_PROTOCOLO: TIntegerField
      FieldName = 'COD_PROTOCOLO'
    end
    object qryDoctoCOD_DOCTO_EMI: TIntegerField
      FieldName = 'COD_DOCTO_EMI'
    end
    object qryDoctoCOD_DOCTO: TIntegerField
      FieldName = 'COD_DOCTO'
    end
    object qryDoctoOBS_DOCTO_EMI: TStringField
      FieldName = 'OBS_DOCTO_EMI'
      Size = 30
    end
    object qryDoctoCOD_DOCTO_1: TIntegerField
      FieldName = 'COD_DOCTO_1'
    end
    object qryDoctoCOD_DEPTO: TIntegerField
      FieldName = 'COD_DEPTO'
    end
    object qryDoctoDESC_DOCTO: TStringField
      FieldName = 'DESC_DOCTO'
      Size = 50
    end
    object qryDoctoCOMPETENCIA_DOCTO: TStringField
      FieldName = 'COMPETENCIA_DOCTO'
      Size = 1
    end
    object qryDoctoDIAS_DOCTO: TIntegerField
      FieldName = 'DIAS_DOCTO'
    end
    object qryDoctoSTATUS_DIAS_DOCTO: TStringField
      FieldName = 'STATUS_DIAS_DOCTO'
      Size = 1
    end
    object qryDoctoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object qryDoctoOBS_PROTOCOLO: TStringField
      FieldName = 'OBS_PROTOCOLO'
      Size = 255
    end
    object qryDoctoDT_EMISSAO_PROTO: TDateTimeField
      FieldName = 'DT_EMISSAO_PROTO'
    end
    object qryDoctoDT_ENTREGA_PREV: TDateTimeField
      FieldName = 'DT_ENTREGA_PREV'
    end
    object qryDoctoDT_ENTREGA_PROTO: TDateTimeField
      FieldName = 'DT_ENTREGA_PROTO'
    end
    object qryDoctoSTATUS_ENTREGA: TStringField
      FieldName = 'STATUS_ENTREGA'
      Size = 1
    end
    object qryDoctoCOD_FUNC: TIntegerField
      FieldName = 'COD_FUNC'
    end
    object qryDoctoCOD_PROTOCOLO_1: TIntegerField
      FieldName = 'COD_PROTOCOLO_1'
    end
    object qryDoctoNOME_FUNC: TStringField
      FieldName = 'NOME_FUNC'
      Size = 50
    end
  end
  object dsDocto: TDataSource [16]
    AutoEdit = False
    DataSet = qryDocto
    Left = 395
    Top = 369
  end
  object qryDocto2: TQuery [17]
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_DOCUMENTO WHERE COD_DOCTO = :COD_DOCTO')
    Left = 396
    Top = 320
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_DOCTO'
        ParamType = ptUnknown
      end>
  end
  object qryCliFunc: TQuery [18]
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_CLIENTE_FUNC WHERE COD_CLIENTE = :COD_CLIENTE')
    Left = 548
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_CLIENTE'
        ParamType = ptUnknown
      end>
  end
  inherited Calculator1: TRxCalculator
    Left = 44
    Top = 288
  end
  object qryDepto: TQuery
    DatabaseName = 'db'
    SQL.Strings = (
      'SELECT * FROM GC_DEPARTAMENTO')
    Left = 450
    Top = 373
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
    Left = 482
    Top = 373
  end
end
