inherited LicacaoSolicit_f: TLicacaoSolicit_f
  Left = 45
  Top = 88
  Width = 723
  Height = 453
  Caption = 'Ligações Solicitadas'
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel [0]
    Left = 0
    Top = 29
    Width = 715
    Height = 337
    Align = alClient
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 713
      Height = 335
      Align = alClient
      DataSource = dsLigacao
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'DT_PEDIDO_LIG'
          Title.Caption = 'Data/Hora'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 94
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
          FieldName = 'DESC_LIG'
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
          FieldName = 'EuRecep'
          Title.Caption = 'Quem Fala'
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
          FieldName = 'FONE1'
          Title.Caption = 'Fone(1)'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
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
    Top = 366
    Width = 715
    Height = 41
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 8
      Top = 12
      Width = 58
      Height = 13
      Caption = 'Observação'
    end
    object BitBtn1: TBitBtn
      Left = 497
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Baixa'
      TabOrder = 1
      OnClick = BitBtn1Click
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
      Left = 69
      Top = 2
      Width = 424
      Height = 37
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 577
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Espera'
      TabOrder = 2
      OnClick = BitBtn2Click
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
  end
  object Panel1: TPanel [2]
    Left = 0
    Top = 0
    Width = 715
    Height = 29
    Align = alTop
    TabOrder = 2
    object Label2: TLabel
      Left = 12
      Top = 8
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
    object Label4: TLabel
      Left = 71
      Top = 8
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
    object Label5: TLabel
      Left = 203
      Top = 8
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
  inherited submenu: TMainMenu
    Left = 36
    Top = 296
    object Agendamento1: TMenuItem
      Caption = '&Agendamento'
      object AgendamentodeLigao1: TMenuItem
        Caption = '&Ligação'
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
      'SELECT LIG.*, CLI.NOME_CLI, FUN.NOME_FUNC, DEP.DESC_DEPTO'
      'FROM GC_LIGACAO LIG'
      'LEFT JOIN GC_CLIENTE CLI ON (LIG.COD_CLIENTE=CLI.COD_CLIENTE)'
      'LEFT JOIN GC_FUNCIONARIO FUN ON (LIG.COD_FUNC=FUN.COD_FUNC)'
      'LEFT JOIN GC_DEPARTAMENTO DEP ON (LIG.COD_DEPTO=DEP.COD_DEPTO)'
      'WHERE LIG.STATUS_LIG IN ('#39'A'#39','#39'E'#39')'
      'ORDER BY LIG.DT_PEDIDO_LIG')
    Left = 212
    Top = 84
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
    object qryLigacaoEuRecep: TStringField
      FieldKind = fkCalculated
      FieldName = 'EuRecep'
      Size = 15
      Calculated = True
    end
  end
  object dsLigacao: TDataSource
    AutoEdit = False
    DataSet = qryLigacao
    Left = 244
    Top = 84
  end
  object qryLigacao2: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM GC_LIGACAO'
      'WHERE COD_LIGACAO = :COD_LIGACAO')
    Left = 244
    Top = 116
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
end
