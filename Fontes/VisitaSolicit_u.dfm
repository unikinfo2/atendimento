inherited VisitaSolicit_f: TVisitaSolicit_f
  Left = 19
  Top = 85
  Width = 786
  Height = 453
  Caption = 'Visitas Solicitadas'
  OldCreateOrder = True
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel [0]
    Left = 0
    Top = 29
    Width = 778
    Height = 336
    Align = alClient
    TabOrder = 0
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 776
      Height = 334
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
      OnDrawColumnCell = DBGrid1DrawColumnCell
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_VISITA'
          Title.Caption = 'Cod.Visita'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Visible = True
        end
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
          FieldName = 'Tipo'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = [fsBold]
          Width = 102
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
  object Panel3: TPanel [1]
    Left = 0
    Top = 365
    Width = 778
    Height = 42
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
      Width = 68
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
      Left = 566
      Top = 8
      Width = 68
      Height = 25
      Caption = 'Adia'
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
    object BitBtn3: TBitBtn
      Left = 635
      Top = 8
      Width = 68
      Height = 25
      Caption = 'Cancela'
      TabOrder = 3
      OnClick = BitBtn3Click
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333FFF33FF333FFF339993370733
        999333777FF37FF377733339993000399933333777F777F77733333399970799
        93333333777F7377733333333999399933333333377737773333333333990993
        3333333333737F73333333333331013333333333333777FF3333333333910193
        333333333337773FF3333333399000993333333337377737FF33333399900099
        93333333773777377FF333399930003999333337773777F777FF339993370733
        9993337773337333777333333333333333333333333333333333333333333333
        3333333333333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
    object BitBtn4: TBitBtn
      Left = 704
      Top = 8
      Width = 68
      Height = 25
      Caption = 'Imprime'
      TabOrder = 4
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
  object Panel1: TPanel [2]
    Left = 0
    Top = 0
    Width = 778
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
    object Label3: TLabel
      Left = 84
      Top = 8
      Width = 89
      Height = 13
      Caption = 'Azul = Fechada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 192
      Top = 8
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
    object Label5: TLabel
      Left = 320
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
    object Label6: TLabel
      Left = 426
      Top = 8
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
  inherited submenu: TMainMenu
    Left = 36
    Top = 296
    object Agendamento1: TMenuItem
      Caption = 'Agendamento'
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
  object qryVisita: TQuery
    AfterScroll = qryVisitaAfterScroll
    OnCalcFields = qryVisitaCalcFields
    DatabaseName = 'db'
    SQL.Strings = (
      'SELECT VIS.*, CLI.*, FUN.NOME_FUNC, DEP.DESC_DEPTO'
      'FROM GC_VISITA VIS'
      'LEFT JOIN GC_CLIENTE CLI ON (VIS.COD_CLIENTE=CLI.COD_CLIENTE)'
      'LEFT JOIN GC_FUNCIONARIO FUN ON (VIS.COD_FUNC=FUN.COD_FUNC)'
      'LEFT JOIN GC_DEPARTAMENTO DEP ON (FUN.COD_DEPTO=DEP.COD_DEPTO)'
      'ORDER BY VIS.DT_VISITA DESC')
    Left = 212
    Top = 84
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
      Size = 1000
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
    object qryVisitaTIPO_COMPROMISSO: TStringField
      FieldName = 'TIPO_COMPROMISSO'
      Size = 1
    end
    object qryVisitaDETALHE_VISTA: TMemoField
      FieldName = 'DETALHE_VISTA'
      BlobType = ftMemo
      Size = 1000
    end
    object qryVisitaTipo: TStringField
      FieldKind = fkCalculated
      FieldName = 'Tipo'
      Calculated = True
    end
  end
  object dsVisita: TDataSource
    AutoEdit = False
    DataSet = qryVisita
    Left = 244
    Top = 84
  end
  object qryVisita2: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT *'
      'FROM GC_VISITA'
      'WHERE COD_VISITA = :COD_VISITA')
    Left = 244
    Top = 116
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_VISITA'
        ParamType = ptUnknown
      end>
  end
end
