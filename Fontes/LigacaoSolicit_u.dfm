inherited LigacaoSolicit_f: TLigacaoSolicit_f
  Left = 120
  Top = 118
  Width = 779
  Height = 453
  Caption = 'Controle de Liga'#231#245'es'
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel [0]
    Left = 0
    Top = 67
    Width = 771
    Height = 261
    Align = alClient
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 769
      Height = 259
      Align = alClient
      DataSource = dsLigacao
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      OnDblClick = DBGrid1DblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'NOME_FUNC'
          Title.Caption = 'Funcion'#225'rio'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 196
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RAMAL_FUNC'
          Title.Caption = 'Ramal Func.'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 62
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
          Width = 204
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FONE1'
          Title.Caption = 'Fone(1)'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RAMAL1'
          Title.Caption = 'Ramal(1)'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FONE2'
          Title.Caption = 'Fone(2)'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 98
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RAMAL2'
          Title.Caption = 'Ramal(2)'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FONE3'
          Title.Caption = 'Fone(3)'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RAMAL3'
          Title.Caption = 'Ramal(3)'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CONTATO'
          Title.Caption = 'Contato'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 132
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'desc_lig3'
          Title.Caption = 'Assunto'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 253
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_PEDIDO_LIG'
          Title.Caption = 'Data/Hora'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 123
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Prioridade'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_LIGACAO'
          Title.Caption = 'Cod.Liga'#231#227'o'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EuRecep'
          Title.Caption = 'Quem Fala'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 70
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
          Width = 117
          Visible = True
        end>
    end
  end
  object Panel3: TPanel [1]
    Left = 0
    Top = 328
    Width = 771
    Height = 71
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 5
      Top = 8
      Width = 117
      Height = 52
      Caption = 
        'Observa'#231#227'o para Baixa/Espera e/ou'#13#10'Relato do Cliente para o Aten' +
        'dimento'
      WordWrap = True
    end
    object btnBaixa: TBitBtn
      Left = 556
      Top = 10
      Width = 75
      Height = 25
      Caption = 'Baixa'
      TabOrder = 1
      OnClick = btnBaixaClick
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
    object memoObs: TMemo
      Left = 127
      Top = 2
      Width = 424
      Height = 65
      MaxLength = 1000
      TabOrder = 0
      OnEnter = memoObsEnter
      OnExit = memoObsExit
    end
    object btnEspera: TBitBtn
      Left = 556
      Top = 36
      Width = 75
      Height = 25
      Caption = 'Espera'
      TabOrder = 2
      OnClick = btnEsperaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333FFFFFFFFFFFFF3344444444444443337777777777777F334CCCCCCCCCC
        C43337777777777777F33444881B188444333777F3737337773333308881FF70
        33333337F3373337F3333330888BF770333333373F33F337333333330881F703
        3333333373F73F7333333333308B703333333333373F77333333333333080333
        3333333333777FF333333333301F103333333333377777FF3333333301B1F103
        333333337737777FF3333330881BFB7033333337F3737F77F333333088881F70
        333333F7F3337777FFF334448888888444333777FFFFFFF777F334CCCCCCCCCC
        C43337777777777777F334444444444444333777777777777733}
      NumGlyphs = 2
    end
    object btnAtendimento: TBitBtn
      Left = 634
      Top = 9
      Width = 133
      Height = 51
      Caption = '&Gerar Atendimento'
      TabOrder = 3
      OnClick = btnAtendimentoClick
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
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 0
    Width = 771
    Height = 67
    Align = alTop
    TabOrder = 2
    object rgSelect: TRadioGroup
      Left = 176
      Top = 5
      Width = 145
      Height = 60
      Caption = ' Tipo de Sele'#231#227'o '
      Color = clActiveBorder
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Liga'#231#245'es Solicitadas'
        'Liga'#231#245'es Recebidas')
      ParentColor = False
      ParentFont = False
      TabOrder = 0
      OnClick = rgSelectClick
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 4
      Width = 161
      Height = 61
      Caption = ' Legenda '
      TabOrder = 1
      object Label4: TLabel
        Left = 12
        Top = 15
        Width = 46
        Height = 13
        Caption = 'Amarelo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 12
        Top = 30
        Width = 31
        Height = 13
        Caption = 'Preto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 12
        Top = 44
        Width = 53
        Height = 13
        Caption = 'Vermelho'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 70
        Top = 15
        Width = 72
        Height = 13
        Caption = '= Em Espera'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 70
        Top = 30
        Width = 49
        Height = 13
        Caption = '= Aberto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 70
        Top = 44
        Width = 69
        Height = 13
        Caption = '= Em Atraso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object rgDisca: TRadioGroup
      Left = 657
      Top = 1
      Width = 76
      Height = 62
      Caption = ' Discar '
      ItemIndex = 0
      Items.Strings = (
        'Fone 1'
        'Fone 2'
        'Fone 3')
      TabOrder = 2
    end
  end
  inherited submenu: TMainMenu
    Left = 36
    Top = 296
    object Agendamento1: TMenuItem
      Caption = '&Agendamento'
      object AgendamentodeLigao1: TMenuItem
        Caption = '&Liga'#231#227'o'
        OnClick = AgendamentodeLigao1Click
      end
      object Visita1: TMenuItem
        Caption = '&Visita'
        OnClick = Visita1Click
      end
    end
  end
  object qryLigacao: TQuery
    AfterScroll = qryLigacaoAfterScroll
    OnCalcFields = qryLigacaoCalcFields
    DatabaseName = 'db'
    SQL.Strings = (
      
        'SELECT LIG.*, CLI.NOME_CLI, FUN.NOME_FUNC, FUN.RAMAL_FUNC, DEP.D' +
        'ESC_DEPTO,'
      '       LIG.DESC_LIG DESC_LIG2'
      'FROM GC_LIGACAO LIG'
      'LEFT JOIN GC_CLIENTE CLI ON (LIG.COD_CLIENTE=CLI.COD_CLIENTE)'
      'LEFT JOIN GC_FUNCIONARIO FUN ON (LIG.COD_FUNC=FUN.COD_FUNC)'
      'LEFT JOIN GC_DEPARTAMENTO DEP ON (LIG.COD_DEPTO=DEP.COD_DEPTO)'
      'WHERE LIG.STATUS_LIG IN ('#39'A'#39','#39'E'#39')'
      'ORDER BY LIG.DT_PEDIDO_LIG')
    Left = 176
    Top = 108
    object qryLigacaoEuRecep: TStringField
      FieldKind = fkCalculated
      FieldName = 'EuRecep'
      Size = 15
      Calculated = True
    end
    object qryLigacaoPrioridade: TStringField
      FieldKind = fkCalculated
      FieldName = 'Prioridade'
      Size = 8
      Calculated = True
    end
    object qryLigacaoCOD_LIGACAO: TIntegerField
      FieldName = 'COD_LIGACAO'
    end
    object qryLigacaoCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
    end
    object qryLigacaoCOD_CONTATO: TIntegerField
      FieldName = 'COD_CONTATO'
    end
    object qryLigacaoCOD_FUNC: TIntegerField
      FieldName = 'COD_FUNC'
    end
    object qryLigacaoCOD_DEPTO: TIntegerField
      FieldName = 'COD_DEPTO'
    end
    object qryLigacaoDESC_LIG: TMemoField
      FieldName = 'DESC_LIG'
      BlobType = ftMemo
      Size = 1002
    end
    object qryLigacaoPRIORIDADE_LIG: TStringField
      FieldName = 'PRIORIDADE_LIG'
      Size = 1
    end
    object qryLigacaoSTATUS_LIG: TStringField
      FieldName = 'STATUS_LIG'
      Size = 1
    end
    object qryLigacaoDT_PEDIDO_LIG: TDateTimeField
      FieldName = 'DT_PEDIDO_LIG'
    end
    object qryLigacaoDT_FECHAMENTO_LIG: TDateTimeField
      FieldName = 'DT_FECHAMENTO_LIG'
    end
    object qryLigacaoFONE1: TStringField
      FieldName = 'FONE1'
      Size = 15
    end
    object qryLigacaoFONE2: TStringField
      FieldName = 'FONE2'
      Size = 15
    end
    object qryLigacaoFONE3: TStringField
      FieldName = 'FONE3'
      Size = 15
    end
    object qryLigacaoFONE4: TStringField
      FieldName = 'FONE4'
      Size = 15
    end
    object qryLigacaoCONTATO: TStringField
      FieldName = 'CONTATO'
      Size = 50
    end
    object qryLigacaoRAMAL1: TStringField
      FieldName = 'RAMAL1'
      Size = 4
    end
    object qryLigacaoRAMAL2: TStringField
      FieldName = 'RAMAL2'
      Size = 4
    end
    object qryLigacaoRAMAL3: TStringField
      FieldName = 'RAMAL3'
      Size = 4
    end
    object qryLigacaoRAMAL4: TStringField
      FieldName = 'RAMAL4'
      Size = 4
    end
    object qryLigacaoCOD_FUNC_CAD: TIntegerField
      FieldName = 'COD_FUNC_CAD'
    end
    object qryLigacaoOBS_LIG: TMemoField
      FieldName = 'OBS_LIG'
      BlobType = ftMemo
      Size = 1002
    end
    object qryLigacaoQUEMFALA: TStringField
      FieldName = 'QUEMFALA'
      Size = 1
    end
    object qryLigacaoTIPO_LIGACAO: TStringField
      FieldName = 'TIPO_LIGACAO'
      Size = 1
    end
    object qryLigacaoINFORMADO_LIG: TStringField
      FieldName = 'INFORMADO_LIG'
      Size = 1
    end
    object qryLigacaoPARTICULAR_LIG: TStringField
      FieldName = 'PARTICULAR_LIG'
      Size = 1
    end
    object qryLigacaoCOD_ASSUNTO: TIntegerField
      FieldName = 'COD_ASSUNTO'
    end
    object qryLigacaoNOME_CLI: TStringField
      FieldName = 'NOME_CLI'
      Size = 50
    end
    object qryLigacaoNOME_FUNC: TStringField
      FieldName = 'NOME_FUNC'
      Size = 50
    end
    object qryLigacaoRAMAL_FUNC: TStringField
      FieldName = 'RAMAL_FUNC'
      Size = 5
    end
    object qryLigacaoDESC_DEPTO: TStringField
      FieldName = 'DESC_DEPTO'
    end
    object qryLigacaoDESC_LIG2: TMemoField
      FieldName = 'DESC_LIG2'
      BlobType = ftMemo
      Size = 1002
    end
    object qryLigacaodesc_lig3: TStringField
      FieldKind = fkCalculated
      FieldName = 'desc_lig3'
      Size = 250
      Calculated = True
    end
  end
  object dsLigacao: TDataSource
    AutoEdit = False
    DataSet = qryLigacao
    Left = 216
    Top = 112
  end
  object qryLigacao2: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM GC_LIGACAO'
      'WHERE COD_LIGACAO = :COD_LIGACAO')
    Left = 244
    Top = 136
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_LIGACAO'
        ParamType = ptUnknown
      end>
  end
  object Timer1: TTimer
    Interval = 60000
    OnTimer = Timer1Timer
    Left = 320
    Top = 109
  end
  object qryAux: TQuery
    DatabaseName = 'db'
    Left = 172
    Top = 144
  end
  object Dialer1: TDialer
    ComPort = dpCOM4
    Confirm = False
    NumberToDial = '94241755'
    Language = dlEnglish
    DialCommand = 'ATDT'
    Mode = mTapi
    Left = 316
    Top = 160
  end
end
