inherited LogOn_f: TLogOn_f
  Left = 353
  Top = 161
  Width = 293
  Height = 189
  Caption = 'Logon de Usu'#225'rios'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 8
    Top = 8
    Width = 36
    Height = 13
    Caption = 'Usu'#225'rio'
  end
  object Label3: TLabel [1]
    Left = 8
    Top = 49
    Width = 31
    Height = 13
    Caption = 'Senha'
  end
  object btnOk: TBitBtn [2]
    Left = 91
    Top = 94
    Width = 98
    Height = 33
    Caption = ' &Ok'
    TabOrder = 2
    OnClick = btnOkClick
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
  object edtNome: TEdit [3]
    Left = 8
    Top = 22
    Width = 263
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 0
  end
  object edtSenha: TEdit [4]
    Left = 8
    Top = 63
    Width = 94
    Height = 21
    PasswordChar = '*'
    TabOrder = 1
  end
  inherited submenu: TMainMenu
    Left = 200
    Top = 64
  end
  object qryAux: TQuery
    DatabaseName = 'db'
    Left = 228
    Top = 64
  end
end
