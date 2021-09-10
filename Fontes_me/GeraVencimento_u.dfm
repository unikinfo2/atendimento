inherited GeraVencimento_f: TGeraVencimento_f
  Left = 296
  Top = 148
  Width = 637
  Height = 460
  Caption = 'Gera Obriga'#231#245'es para Clientes'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 629
    Height = 50
    Align = alTop
    TabOrder = 0
    object sbPesq: TSpeedButton
      Left = 79
      Top = 21
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
      Left = 105
      Top = 8
      Width = 96
      Height = 13
      Caption = 'Nome/Raz'#227'o Social'
    end
    object Label1: TLabel
      Left = 5
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Cliente'
    end
    object Label3: TLabel
      Left = 443
      Top = 8
      Width = 89
      Height = 13
      Caption = 'Ano de Refer'#234'ncia'
    end
    object medCliente: TMaskEdit
      Left = 5
      Top = 22
      Width = 73
      Height = 21
      EditMask = '#########;0; '
      MaxLength = 9
      TabOrder = 0
      OnExit = medClienteExit
    end
    object edtNomeCli: TEdit
      Left = 105
      Top = 22
      Width = 336
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 1
    end
    object medAno: TMaskEdit
      Left = 443
      Top = 22
      Width = 89
      Height = 21
      EditMask = '9999;1; '
      MaxLength = 4
      TabOrder = 2
      Text = '    '
      OnExit = medAnoExit
    end
    object BitBtn1: TBitBtn
      Left = 551
      Top = 16
      Width = 62
      Height = 25
      Caption = '&Gerar'
      TabOrder = 3
      TabStop = False
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
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 50
    Width = 629
    Height = 234
    Align = alClient
    TabOrder = 1
    object dbg: TDBGrid
      Left = 1
      Top = 1
      Width = 627
      Height = 232
      Align = alClient
      DataSource = dsObriga
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = dbgCellClick
      Columns = <
        item
          Expanded = False
          FieldName = 'COD_DOCTO'
          Title.Caption = 'Docto.'
          Width = 37
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESC_DOCTO'
          Title.Caption = 'Descri'#231#227'o'
          Width = 234
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_VENCTO'
          Title.Caption = 'Dt.Vencto'
          Width = 92
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DT_ENVIO'
          Title.Caption = 'Dt.Envio'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEIO_ENVIO'
          Title.Caption = 'Meio de Envio'
          Width = 92
          Visible = True
        end>
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 284
    Width = 629
    Height = 130
    Align = alBottom
    TabOrder = 2
    object Label4: TLabel
      Left = 8
      Top = 4
      Width = 53
      Height = 13
      Caption = 'Data Envio'
    end
    object dtEnvio: TDateEdit
      Left = 8
      Top = 20
      Width = 105
      Height = 21
      NumGlyphs = 2
      YearDigits = dyFour
      TabOrder = 0
    end
    object BitBtn2: TBitBtn
      Left = 522
      Top = 87
      Width = 99
      Height = 37
      Caption = 'Imprimir'
      TabOrder = 5
      OnClick = BitBtn2Click
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
    object chkDoc: TCheckBox
      Left = 461
      Top = 7
      Width = 163
      Height = 24
      Caption = 'Mostrar somente Documentos Enviados'
      TabOrder = 4
      WordWrap = True
    end
    object rgEnvio: TRadioGroup
      Left = 8
      Top = 45
      Width = 140
      Height = 80
      Caption = ' Meio de Envio '
      ItemIndex = 0
      Items.Strings = (
        '1-Expedi'#231#227'o'
        '2-Retirado pelo Cliente'
        '3-Correio'
        '4-CEDEX'
        '5-Internet')
      TabOrder = 1
    end
    object memoObs: TMemo
      Left = 149
      Top = 3
      Width = 264
      Height = 122
      TabOrder = 2
    end
    object BitBtn6: TBitBtn
      Left = 416
      Top = 87
      Width = 99
      Height = 37
      Caption = 'Grava Envio'
      TabOrder = 3
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
    Left = 24
    Top = 264
  end
  object qryAux: TQuery
    DatabaseName = 'db'
    Left = 88
    Top = 260
  end
  object qryDocs: TQuery
    DatabaseName = 'db'
    SQL.Strings = (
      'SELECT * FROM EMISSAO_DOCTO EMI'
      'INNER JOIN gc_documento DOC ON (EMI.COD_DOCTO=DOC.cod_docto)'
      'WHERE EMI.COD_CLIENTE = :COD_CLIENTE '
      'AND DOC.GERA_AGENDA = '#39'S'#39)
    Left = 312
    Top = 265
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptUnknown
      end>
  end
  object qryObriga: TQuery
    AfterScroll = qryObrigaAfterScroll
    DatabaseName = 'db'
    SQL.Strings = (
      'SELECT * FROM gc_obrigacoes OBR'
      'INNER JOIN gc_documento DOC ON (OBR.COD_DOCTO = DOC.cod_docto)'
      'WHERE obr.COD_CLIENTE = :COD_CLIENTE'
      'AND OBR.ANOMES_OBR >= :INI AND OBR.ANOMES_OBR <= :FIM'
      'ORDER BY OBR.DT_VENCTO')
    Left = 312
    Top = 225
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'INI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'FIM'
        ParamType = ptUnknown
      end>
    object qryObrigaCOD_OBR: TIntegerField
      FieldName = 'COD_OBR'
      Origin = 'DB.GC_OBRIGACOES.COD_OBR'
    end
    object qryObrigaANOMES_OBR: TStringField
      FieldName = 'ANOMES_OBR'
      Origin = 'DB.GC_OBRIGACOES.ANOMES_OBR'
      Size = 6
    end
    object qryObrigaCOD_CLIENTE: TIntegerField
      FieldName = 'COD_CLIENTE'
      Origin = 'DB.GC_OBRIGACOES.COD_CLIENTE'
    end
    object qryObrigaCOD_DOCTO: TIntegerField
      FieldName = 'COD_DOCTO'
      Origin = 'DB.GC_OBRIGACOES.COD_DOCTO'
    end
    object qryObrigaDT_VENCTO: TDateTimeField
      FieldName = 'DT_VENCTO'
      Origin = 'DB.GC_OBRIGACOES.DT_VENCTO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryObrigaDT_ENVIO: TDateTimeField
      FieldName = 'DT_ENVIO'
      Origin = 'DB.GC_OBRIGACOES.DT_ENVIO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryObrigaMEIO_ENVIO: TStringField
      FieldName = 'MEIO_ENVIO'
      Origin = 'DB.GC_OBRIGACOES.MEIO_ENVIO'
      Size = 1
    end
    object qryObrigaVALOR_DOCTO: TFloatField
      FieldName = 'VALOR_DOCTO'
      Origin = 'DB.GC_OBRIGACOES.VALOR_DOCTO'
    end
    object qryObrigaCOD_DOCTO_1: TIntegerField
      FieldName = 'COD_DOCTO_1'
      Origin = 'DB.GC_OBRIGACOES.VALOR_DOCTO'
    end
    object qryObrigaCOD_DEPTO: TIntegerField
      FieldName = 'COD_DEPTO'
      Origin = 'DB.GC_OBRIGACOES.VALOR_DOCTO'
    end
    object qryObrigaDESC_DOCTO: TStringField
      FieldName = 'DESC_DOCTO'
      Origin = 'DB.GC_OBRIGACOES.VALOR_DOCTO'
      Size = 50
    end
    object qryObrigaCOMPETENCIA_DOCTO: TStringField
      FieldName = 'COMPETENCIA_DOCTO'
      Origin = 'DB.GC_OBRIGACOES.VALOR_DOCTO'
      Size = 1
    end
    object qryObrigaDIAS_DOCTO: TIntegerField
      FieldName = 'DIAS_DOCTO'
      Origin = 'DB.GC_OBRIGACOES.VALOR_DOCTO'
    end
    object qryObrigaSTATUS_DIAS_DOCTO: TStringField
      FieldName = 'STATUS_DIAS_DOCTO'
      Origin = 'DB.GC_OBRIGACOES.VALOR_DOCTO'
      Size = 1
    end
    object qryObrigaCOD_SERV: TIntegerField
      FieldName = 'COD_SERV'
      Origin = 'DB.GC_OBRIGACOES.VALOR_DOCTO'
    end
    object qryObrigaCOD_PLCONTA: TIntegerField
      FieldName = 'COD_PLCONTA'
      Origin = 'DB.GC_OBRIGACOES.VALOR_DOCTO'
    end
    object qryObrigaCOD_BANCO: TIntegerField
      FieldName = 'COD_BANCO'
      Origin = 'DB.GC_OBRIGACOES.VALOR_DOCTO'
    end
    object qryObrigaDATA_VENCTO_DOCTO: TDateTimeField
      FieldName = 'DATA_VENCTO_DOCTO'
      Origin = 'DB.GC_OBRIGACOES.VALOR_DOCTO'
    end
    object qryObrigaTIPO_VENCTO: TStringField
      FieldName = 'TIPO_VENCTO'
      Origin = 'DB.GC_OBRIGACOES.VALOR_DOCTO'
      Size = 1
    end
    object qryObrigaOBS_OBRIGACAO: TMemoField
      FieldName = 'OBS_OBRIGACAO'
      Origin = 'DB.GC_OBRIGACOES.OBS_OBRIGACAO'
      BlobType = ftMemo
      Size = 1000
    end
    object qryObrigaGERA_AGENDA: TStringField
      FieldName = 'GERA_AGENDA'
      Origin = 'DB.GC_OBRIGACOES.OBS_OBRIGACAO'
      Size = 1
    end
  end
  object dsObriga: TDataSource
    DataSet = qryObriga
    Left = 280
    Top = 226
  end
  object RvSystem1: TRvSystem
    TitleSetup = 'Output Options'
    TitleStatus = 'Report Status'
    TitlePreview = 'Report Preview'
    SystemSetups = [ssAllowCopies, ssAllowCollate, ssAllowDuplex, ssAllowDestPreview, ssAllowDestPrinter, ssAllowDestFile, ssAllowPrinterSetup, ssAllowPreviewSetup]
    SystemFiler.StatusFormat = 'Generating page %p'
    SystemPreview.FormState = wsMaximized
    SystemPreview.ZoomFactor = 100.000000000000000000
    SystemPrinter.ScaleX = 100.000000000000000000
    SystemPrinter.ScaleY = 100.000000000000000000
    SystemPrinter.StatusFormat = 'Printing page %p'
    SystemPrinter.Title = 'ReportPrinter Report'
    SystemPrinter.UnitsFactor = 1.000000000000000000
    OnPrint = RvSystem1Print
    OnNewPage = RvSystem1NewPage
    Left = 464
    Top = 228
  end
  object qryClientes: TQuery
    DatabaseName = 'db'
    SQL.Strings = (
      'select * from gc_cliente where ativo_cli = '#39'A'#39)
    Left = 144
    Top = 284
  end
end
