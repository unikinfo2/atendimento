inherited MostraOcorrencia_f: TMostraOcorrencia_f
  Left = 309
  Top = 142
  Width = 623
  Height = 342
  Caption = 'Visualiza'#231#227'o de Ocorrencias'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel2: TPanel [0]
    Left = 0
    Top = 0
    Width = 615
    Height = 296
    Align = alClient
    TabOrder = 0
    object Label6: TLabel
      Left = 99
      Top = 6
      Width = 63
      Height = 13
      Caption = 'C'#243'digo Func.'
    end
    object SpeedButton1: TSpeedButton
      Left = 163
      Top = 19
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
      Left = 191
      Top = 6
      Width = 28
      Height = 13
      Caption = 'Nome'
    end
    object Label3: TLabel
      Left = 3
      Top = 42
      Width = 109
      Height = 13
      Caption = 'Dat. Hora Abert. Ocorr.'
    end
    object Label4: TLabel
      Left = 3
      Top = 82
      Width = 102
      Height = 13
      Caption = 'Dat. Hora Fec. Ocorr.'
    end
    object Label9: TLabel
      Left = 117
      Top = 42
      Width = 125
      Height = 13
      Caption = 'Descri'#231#227'o do Atendimento'
    end
    object Label10: TLabel
      Left = 3
      Top = 3
      Width = 52
      Height = 13
      Caption = 'Ocorr'#234'ncia'
    end
    object SpeedButton3: TSpeedButton
      Left = 66
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
    object Label1: TLabel
      Left = 5
      Top = 126
      Width = 98
      Height = 13
      Caption = 'Desc. da Ocorr'#234'ncia'
    end
    object edtCodigo: TEdit
      Left = 99
      Top = 20
      Width = 62
      Height = 21
      CharCase = ecUpperCase
      Enabled = False
      TabOrder = 1
      OnExit = edtCodigoExit
    end
    object edtFunc: TEdit
      Left = 189
      Top = 20
      Width = 305
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 2
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 240
      Width = 613
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
      Left = 524
      Top = 43
      Width = 85
      Height = 155
      Caption = ' Status da Ocorr'#234'ncia '
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
      Left = 117
      Top = 57
      Width = 404
      Height = 80
      DataField = 'DESCRICAO_ATEND'
      DataSource = dsOcorrencia
      TabOrder = 6
    end
    object medOcorrencia: TMaskEdit
      Left = 3
      Top = 19
      Width = 58
      Height = 21
      EditMask = '#########;0; '
      MaxLength = 9
      TabOrder = 0
      OnExit = medOcorrenciaExit
    end
    object DBEdit1: TDBEdit
      Left = 4
      Top = 57
      Width = 105
      Height = 21
      DataField = 'DT_OCORRENCIA'
      DataSource = dsOcorrencia
      Enabled = False
      TabOrder = 3
    end
    object DBEdit2: TDBEdit
      Left = 5
      Top = 97
      Width = 105
      Height = 21
      DataField = 'DT_FECHAMENTO_OCORR'
      DataSource = dsOcorrencia
      Enabled = False
      TabOrder = 4
    end
    object edtDep: TEdit
      Left = 496
      Top = 20
      Width = 114
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 8
    end
    object DBMemo2: TDBMemo
      Left = 5
      Top = 139
      Width = 516
      Height = 98
      DataField = 'DESCRICAO_OCORR'
      DataSource = dsOcorrencia
      TabOrder = 9
    end
  end
  inherited submenu: TMainMenu
    Left = 324
    Top = 8
  end
  object dsOcorrencia: TDataSource [2]
    AutoEdit = False
    DataSet = qryOcorrencia
    Left = 212
    Top = 8
  end
  object qryOcorrencia: TQuery [3]
    DatabaseName = 'db'
    SQL.Strings = (
      'SELECT * FROM GC_OCORRENCIA OCO'
      
        'INNER JOIN GC_ATENDIMENTO ATE ON (OCO.COD_ATENDIMENTO=ATE.COD_AT' +
        'ENDIMENTO)'
      'WHERE OCO.COD_OCORRENCIA = :COD_OCORRENCIA AND'
      'OCO.COD_ATENDIMENTO = :COD_ATENDIMENTO AND'
      'OCO.COD_CLIENTE = :COD_CLIENTE')
    Left = 244
    Top = 8
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
    object qryOcorrenciaDESCRICAO_ATEND: TMemoField
      FieldName = 'DESCRICAO_ATEND'
      Origin = 'DB.GC_OCORRENCIA.COD_OCORRENCIA'
      BlobType = ftMemo
      Size = 1000
    end
  end
  object qryAux: TQuery [4]
    DatabaseName = 'db'
    Left = 356
    Top = 8
  end
  object qryFunc: TQuery [5]
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT * FROM GC_FUNCIONARIO WHERE ATIVO_FUNC <> '#39'N'#39' AND COD_FUN' +
        'C = :COD_FUNC')
    Left = 412
    Top = 12
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
  object qryAux2: TQuery
    DatabaseName = 'db'
    Left = 460
    Top = 11
  end
end
