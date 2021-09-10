inherited AssociaClienteDoc_f: TAssociaClienteDoc_f
  Left = 205
  Top = 176
  Width = 553
  Height = 446
  Caption = 'Associa documentos a clientes'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel [0]
    Left = 0
    Top = 0
    Width = 545
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
      Width = 368
      Height = 21
      Color = clMenu
      Enabled = False
      TabOrder = 1
    end
  end
  object Panel2: TPanel [1]
    Left = 0
    Top = 50
    Width = 545
    Height = 318
    Align = alClient
    TabOrder = 1
    object Label3: TLabel
      Left = 8
      Top = 12
      Width = 91
      Height = 13
      Caption = '&Documentos Livres'
      FocusControl = lbDocLivres
    end
    object SpeedButton1: TSpeedButton
      Left = 261
      Top = 103
      Width = 23
      Height = 22
      Caption = '>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton1Click
    end
    object SpeedButton2: TSpeedButton
      Left = 261
      Top = 127
      Width = 23
      Height = 22
      Caption = '<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton2Click
    end
    object Label4: TLabel
      Left = 289
      Top = 12
      Width = 117
      Height = 13
      Caption = 'Documentos &Associados'
      FocusControl = lbDocAssoc
    end
    object SpeedButton3: TSpeedButton
      Left = 261
      Top = 159
      Width = 23
      Height = 22
      Caption = '>>'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton3Click
    end
    object SpeedButton4: TSpeedButton
      Left = 261
      Top = 183
      Width = 23
      Height = 22
      Caption = '<<'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = SpeedButton4Click
    end
    object SpeedButton5: TSpeedButton
      Left = 105
      Top = 7
      Width = 23
      Height = 21
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
    object lbDocLivres: TListBox
      Left = 8
      Top = 32
      Width = 247
      Height = 280
      ItemHeight = 13
      TabOrder = 0
      OnDblClick = lbDocLivresDblClick
    end
    object lbDocAssoc: TListBox
      Left = 289
      Top = 32
      Width = 247
      Height = 280
      ItemHeight = 13
      TabOrder = 1
      OnDblClick = lbDocAssocDblClick
    end
  end
  object Panel3: TPanel [2]
    Left = 0
    Top = 368
    Width = 545
    Height = 32
    Align = alBottom
    TabOrder = 2
    object BitBtn1: TBitBtn
      Left = 235
      Top = 5
      Width = 75
      Height = 25
      Caption = '&Grava'
      TabOrder = 0
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
      'DELETE FROM EMISSAO_DOCTO WHERE COD_CLIENTE = :COD_CLIENTE')
    Left = 408
    Top = 241
    ParamData = <
      item
        DataType = ftInteger
        Name = 'COD_CLIENTE'
        ParamType = ptUnknown
      end>
  end
  object qryDocAssoc: TQuery
    DatabaseName = 'db'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM EMISSAO_DOCTO WHERE 1=0')
    Left = 312
    Top = 225
  end
end
