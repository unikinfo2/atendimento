inherited CadConfiguracao_f: TCadConfiguracao_f
  Left = 216
  Top = 111
  Width = 562
  Height = 515
  Caption = 'Configura'#231#245'es do Sistema'
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 12
    Top = 8
    Width = 159
    Height = 13
    Caption = 'Mostrar Lan'#231'amentos dos Ultimos'
  end
  object Label2: TLabel [1]
    Left = 204
    Top = 8
    Width = 22
    Height = 13
    Caption = 'dias.'
  end
  object Label3: TLabel [2]
    Left = 246
    Top = 8
    Width = 212
    Height = 13
    Caption = 'Mostrar janela de pend'#234'ncias no intervalo de'
  end
  object Label4: TLabel [3]
    Left = 503
    Top = 8
    Width = 49
    Height = 13
    Caption = 'segundos.'
  end
  object Label5: TLabel [4]
    Left = 12
    Top = 74
    Width = 33
    Height = 13
    Caption = 'Cidade'
  end
  object Label6: TLabel [5]
    Left = 12
    Top = 33
    Width = 46
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label7: TLabel [6]
    Left = 12
    Top = 117
    Width = 41
    Height = 13
    Caption = 'Empresa'
  end
  object Label8: TLabel [7]
    Left = 12
    Top = 160
    Width = 24
    Height = 13
    Caption = 'Fone'
  end
  object Label9: TLabel [8]
    Left = 140
    Top = 160
    Width = 20
    Height = 13
    Caption = 'FAX'
  end
  object Label10: TLabel [9]
    Left = 12
    Top = 201
    Width = 195
    Height = 13
    Caption = 'Caminho do Servidor e Arquivo de Dados'
  end
  object Label11: TLabel [10]
    Left = 12
    Top = 243
    Width = 72
    Height = 13
    Caption = 'Servidor SMTP'
  end
  object Label15: TLabel [11]
    Left = 12
    Top = 353
    Width = 169
    Height = 13
    Caption = 'Caminho do Execut'#225'vel no Servidor'
  end
  object Label16: TLabel [12]
    Left = 12
    Top = 393
    Width = 184
    Height = 13
    Caption = 'Caminho do Execut'#225'vel no Drive Local'
  end
  object SpeedButton3: TSpeedButton [13]
    Left = 525
    Top = 211
    Width = 23
    Height = 22
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      04000000000000010000120B0000120B00001000000000000000000000000000
      800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00550000000005
      555555777777777FF5555500000000805555557777777777FF555550BBBBB008
      05555557F5FFF7777FF55550B000B030805555F7F777F7F777F550000000B033
      005557777777F7F5775550BBBBB00033055557F5FFF777F57F5550B000B08033
      055557F77757F7F57F5550BBBBB08033055557F55557F7F57F5550BBBBB00033
      055557FFFFF777F57F5550000000703305555777777757F57F555550FFF77033
      05555557FFFFF7FF7F55550000000003055555777777777F7F55550777777700
      05555575FF5555777F55555003B3B3B00555555775FF55577FF55555500B3B3B
      005555555775FFFF77F555555570000000555555555777777755}
    NumGlyphs = 2
    OnClick = SpeedButton3Click
  end
  object Label20: TLabel [14]
    Left = 268
    Top = 160
    Width = 106
    Height = 13
    Caption = 'Cod.Cedente (Boletos)'
  end
  object Label21: TLabel [15]
    Left = 237
    Top = 32
    Width = 220
    Height = 13
    Caption = 'Mostrar Agenda de Obriga'#231#245'es no intervalo de'
  end
  object Label22: TLabel [16]
    Left = 503
    Top = 32
    Width = 49
    Height = 13
    Caption = 'segundos.'
  end
  object medHistorico: TMaskEdit [17]
    Left = 174
    Top = 4
    Width = 25
    Height = 21
    EditMask = '!999;0; '
    MaxLength = 3
    TabOrder = 0
  end
  object medMensagem: TMaskEdit [18]
    Left = 462
    Top = 4
    Width = 39
    Height = 21
    EditMask = '!999;1; '
    MaxLength = 3
    TabOrder = 1
    Text = '   '
  end
  object chkCor: TCheckBox [19]
    Left = 372
    Top = 261
    Width = 173
    Height = 17
    Caption = 'Mostrar Cores nas pend'#234'ncias'
    TabOrder = 11
  end
  object edtCidade: TEdit [20]
    Left = 12
    Top = 90
    Width = 316
    Height = 21
    TabOrder = 4
    Text = 'edtCidade'
  end
  object edtEndereco: TEdit [21]
    Left = 12
    Top = 49
    Width = 440
    Height = 21
    TabOrder = 3
    Text = 'Edit1'
  end
  object edtCliente: TEdit [22]
    Left = 12
    Top = 133
    Width = 440
    Height = 21
    TabOrder = 5
    Text = 'Edit1'
  end
  object medFone: TMaskEdit [23]
    Left = 12
    Top = 176
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'medFone'
  end
  object medFax: TMaskEdit [24]
    Left = 140
    Top = 176
    Width = 121
    Height = 21
    TabOrder = 7
    Text = 'medFax'
  end
  object edtServerName: TEdit [25]
    Left = 12
    Top = 217
    Width = 509
    Height = 21
    TabOrder = 9
    Text = 'Edit1'
  end
  object edtSMTP: TEdit [26]
    Left = 12
    Top = 259
    Width = 316
    Height = 21
    TabOrder = 10
    Text = 'Edit1'
  end
  object GroupBox1: TGroupBox [27]
    Left = 12
    Top = 287
    Width = 258
    Height = 57
    Caption = ' Tempo de Prioridades para Atendimentos em Dias  '
    TabOrder = 12
    object Label12: TLabel
      Left = 13
      Top = 18
      Width = 26
      Height = 13
      Caption = 'Baixa'
    end
    object Label13: TLabel
      Left = 110
      Top = 18
      Width = 29
      Height = 13
      Caption = 'M'#233'dia'
    end
    object Label14: TLabel
      Left = 200
      Top = 18
      Width = 18
      Height = 13
      Caption = 'Alta'
    end
    object edtBaixa: TRxCalcEdit
      Left = 12
      Top = 32
      Width = 45
      Height = 21
      AutoSize = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 0
    end
    object edtMedia: TRxCalcEdit
      Left = 109
      Top = 32
      Width = 45
      Height = 21
      AutoSize = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 1
    end
    object edtAlta: TRxCalcEdit
      Left = 199
      Top = 32
      Width = 45
      Height = 21
      AutoSize = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 2
    end
  end
  object BitBtn1: TBitBtn [28]
    Left = 194
    Top = 436
    Width = 80
    Height = 30
    Caption = 'Grava'
    TabOrder = 13
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
  object btnCancel: TBitBtn [29]
    Left = 280
    Top = 436
    Width = 80
    Height = 30
    Caption = 'Cancelar'
    TabOrder = 14
    OnClick = btnCancelClick
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
  object edtServidor: TDirectoryEdit [30]
    Left = 12
    Top = 369
    Width = 509
    Height = 21
    NumGlyphs = 1
    TabOrder = 15
  end
  object edtLocal: TDirectoryEdit [31]
    Left = 12
    Top = 408
    Width = 509
    Height = 21
    NumGlyphs = 1
    TabOrder = 16
  end
  object GroupBox2: TGroupBox [32]
    Left = 272
    Top = 287
    Width = 261
    Height = 57
    Caption = ' Tempo de Prioridades para Liga'#231#245'es em Minutos  '
    TabOrder = 17
    object Label17: TLabel
      Left = 13
      Top = 18
      Width = 26
      Height = 13
      Caption = 'Baixa'
    end
    object Label18: TLabel
      Left = 105
      Top = 18
      Width = 29
      Height = 13
      Caption = 'M'#233'dia'
    end
    object Label19: TLabel
      Left = 200
      Top = 18
      Width = 18
      Height = 13
      Caption = 'Alta'
    end
    object edtBaixa2: TRxCalcEdit
      Left = 12
      Top = 32
      Width = 45
      Height = 21
      AutoSize = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 0
    end
    object edtMedia2: TRxCalcEdit
      Left = 104
      Top = 32
      Width = 45
      Height = 21
      AutoSize = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 1
    end
    object edtAlta2: TRxCalcEdit
      Left = 199
      Top = 32
      Width = 45
      Height = 21
      AutoSize = False
      ButtonWidth = 0
      NumGlyphs = 2
      TabOrder = 2
    end
  end
  object medCedente: TMaskEdit [33]
    Left = 268
    Top = 176
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object medAgenda: TMaskEdit [34]
    Left = 462
    Top = 28
    Width = 39
    Height = 21
    EditMask = '!999;1; '
    MaxLength = 3
    TabOrder = 2
    Text = '   '
  end
  inherited submenu: TMainMenu
    Left = 472
    Top = 237
  end
  inherited Calculator1: TRxCalculator
    Left = 428
    Top = 245
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.gdb'
    FileName = '*.gdb'
    Filter = '*.gdb|*.gdb'
    Left = 524
    Top = 184
  end
end
