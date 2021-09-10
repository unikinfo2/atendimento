inherited CadDocumento_f: TCadDocumento_f
  Left = 296
  Top = 149
  Width = 565
  Height = 326
  Caption = 'Cadastro de Documentos'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 6
    Top = 7
    Width = 68
    Height = 13
    Caption = 'C'#243'digo Docto.'
  end
  object SpeedButton1: TSpeedButton [1]
    Left = 90
    Top = 24
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
  object Label2: TLabel [2]
    Left = 118
    Top = 7
    Width = 95
    Height = 13
    Caption = 'Descri'#231#227'o do Docto'
  end
  object edtCodigo: TEdit [3]
    Left = 6
    Top = 24
    Width = 81
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
    OnExit = edtCodigoExit
  end
  object DBEdit1: TDBEdit [4]
    Left = 116
    Top = 24
    Width = 417
    Height = 21
    CharCase = ecUpperCase
    DataField = 'DESC_DOCTO'
    DataSource = dsDocto
    TabOrder = 1
  end
  object BitBtn1: TBitBtn [5]
    Left = 243
    Top = 251
    Width = 75
    Height = 25
    Caption = 'Grava'
    TabOrder = 3
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
  object BitBtn2: TBitBtn [6]
    Left = 330
    Top = 251
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 5
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
  object BitBtn3: TBitBtn [7]
    Left = 155
    Top = 251
    Width = 75
    Height = 25
    Caption = '&Novo'
    TabOrder = 4
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
  object PageControl1: TPageControl [8]
    Left = 6
    Top = 56
    Width = 543
    Height = 185
    ActivePage = TabSheet1
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'Dados Gerais'
      object Label3: TLabel
        Left = 5
        Top = 6
        Width = 68
        Height = 13
        Caption = 'C'#243'digo Depto.'
      end
      object SpeedButton2: TSpeedButton
        Left = 89
        Top = 23
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
      object Label4: TLabel
        Left = 117
        Top = 6
        Width = 95
        Height = 13
        Caption = 'Descri'#231#227'o do Depto'
      end
      object Label5: TLabel
        Left = 9
        Top = 101
        Width = 75
        Height = 13
        Caption = 'Nr. Dias Vencto'
      end
      object edtDepto: TEdit
        Left = 3
        Top = 23
        Width = 81
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 0
        OnExit = edtDeptoExit
      end
      object edtDesc: TEdit
        Left = 117
        Top = 23
        Width = 415
        Height = 21
        Color = clMenu
        Enabled = False
        TabOrder = 1
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 2
        Top = 47
        Width = 531
        Height = 39
        Caption = ' Tipo de Compet'#234'ncia '
        Columns = 7
        DataField = 'COMPETENCIA_DOCTO'
        DataSource = dsDocto
        Items.Strings = (
          'Semanal'
          'Decendial'
          'Quinzenal'
          'Mensal'
          'Trimestral'
          'Semestral'
          'Anual')
        TabOrder = 2
        Values.Strings = (
          'S'
          'D'
          'Q'
          'M'
          'T'
          'L'
          'A')
      end
      object DBEdit3: TDBEdit
        Left = 7
        Top = 118
        Width = 82
        Height = 21
        DataField = 'DIAS_DOCTO'
        DataSource = dsDocto
        TabOrder = 3
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 97
        Top = 88
        Width = 84
        Height = 67
        Caption = ' Tipo de Dias '
        DataField = 'STATUS_DIAS_DOCTO'
        DataSource = dsDocto
        Items.Strings = (
          'Corridos'
          #218'teis')
        TabOrder = 4
        Values.Strings = (
          'C'
          'U')
      end
      object DBRadioGroup3: TDBRadioGroup
        Left = 181
        Top = 88
        Width = 124
        Height = 67
        Caption = ' Tipo de Vencimento '
        DataField = 'TIPO_VENCTO'
        DataSource = dsDocto
        Items.Strings = (
          'Antecipa'
          'Posterga'
          'Fixo')
        TabOrder = 5
        Values.Strings = (
          'A'
          'P'
          'F')
      end
      object DBCheckBox1: TDBCheckBox
        Left = 312
        Top = 120
        Width = 193
        Height = 17
        Caption = 'Gera agenda de Compromissos'
        DataField = 'GERA_AGENDA'
        DataSource = dsDocto
        TabOrder = 6
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Dados Financeiros'
      ImageIndex = 1
      object Label21: TLabel
        Left = 4
        Top = 50
        Width = 90
        Height = 13
        Caption = 'Cod.Conta (Banco)'
      end
      object Label22: TLabel
        Left = 4
        Top = 90
        Width = 85
        Height = 13
        Caption = 'Cod.Plano Contas'
      end
      object SpeedButton3: TSpeedButton
        Left = 80
        Top = 105
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
      object Label23: TLabel
        Left = 105
        Top = 90
        Width = 129
        Height = 13
        Caption = 'Descri'#231#227'o Plano de Contas'
      end
      object Label24: TLabel
        Left = 105
        Top = 50
        Width = 124
        Height = 13
        Caption = 'Descri'#231#227'o Conta Banc'#225'ria'
      end
      object SpeedButton4: TSpeedButton
        Left = 80
        Top = 64
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
      object Label11: TLabel
        Left = 4
        Top = 11
        Width = 58
        Height = 13
        Caption = 'Cod.Servi'#231'o'
      end
      object SpeedButton5: TSpeedButton
        Left = 80
        Top = 24
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
        OnClick = SpeedButton5Click
      end
      object Label12: TLabel
        Left = 107
        Top = 11
        Width = 48
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object medConta: TMaskEdit
        Left = 4
        Top = 64
        Width = 73
        Height = 21
        TabOrder = 2
        OnExit = medContaExit
      end
      object medPlano: TMaskEdit
        Left = 4
        Top = 105
        Width = 73
        Height = 21
        TabOrder = 4
        OnExit = medPlanoExit
      end
      object Edit3: TEdit
        Left = 105
        Top = 105
        Width = 317
        Height = 21
        Color = clMenu
        Enabled = False
        TabOrder = 5
      end
      object Edit2: TEdit
        Left = 105
        Top = 64
        Width = 361
        Height = 21
        Color = clMenu
        Enabled = False
        TabOrder = 3
      end
      object medServico: TMaskEdit
        Left = 4
        Top = 24
        Width = 73
        Height = 21
        TabOrder = 0
        OnExit = medServicoExit
      end
      object Edit1: TEdit
        Left = 106
        Top = 24
        Width = 354
        Height = 21
        Color = clMenu
        Enabled = False
        TabOrder = 1
      end
    end
  end
  inherited submenu: TMainMenu
    Top = 92
  end
  inherited Calculator1: TRxCalculator
    Left = 68
    Top = 88
  end
  object qryDocto: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_DOCUMENTO WHERE COD_DOCTO = :COD_DOCTO')
    Left = 260
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_DOCTO'
        ParamType = ptUnknown
      end>
  end
  object dsDocto: TDataSource
    DataSet = qryDocto
    Left = 16
    Top = 96
  end
  object qryDepto: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM GC_DEPARTAMENTO WHERE COD_DEPTO = :COD_DEPTO')
    Left = 396
    Top = 80
    ParamData = <
      item
        DataType = ftString
        Name = 'COD_DEPTO'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TQuery
    DatabaseName = 'db'
    Left = 392
  end
end
