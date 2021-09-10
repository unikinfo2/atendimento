inherited EmiteDarf_f: TEmiteDarf_f
  Left = 228
  Top = 143
  Width = 454
  Height = 338
  Caption = 'Dados para impressão de DARF´s'
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 4
    Top = 49
    Width = 46
    Height = 13
    Caption = 'Apuração'
  end
  object Label4: TLabel [1]
    Left = 116
    Top = 49
    Width = 82
    Height = 13
    Caption = 'Data Vencimento'
  end
  object Label1: TLabel [2]
    Left = 117
    Top = 89
    Width = 88
    Height = 13
    Caption = 'Código da Receita'
  end
  object Label2: TLabel [3]
    Left = 4
    Top = 2
    Width = 32
    Height = 13
    Caption = 'Cliente'
  end
  object sbPesq: TSpeedButton [4]
    Left = 81
    Top = 16
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
  object Label5: TLabel [5]
    Left = 107
    Top = 2
    Width = 96
    Height = 13
    Caption = 'Nome/Razão Social'
  end
  object Label6: TLabel [6]
    Left = 4
    Top = 127
    Width = 67
    Height = 13
    Caption = 'Valor Principal'
  end
  object Label7: TLabel [7]
    Left = 162
    Top = 127
    Width = 68
    Height = 13
    Caption = 'Valor da Multa'
  end
  object Label8: TLabel [8]
    Left = 320
    Top = 127
    Width = 102
    Height = 13
    Caption = 'Valor Juros/Encargos'
  end
  object Label10: TLabel [9]
    Left = 225
    Top = 49
    Width = 82
    Height = 13
    Caption = 'Nº de Referência'
  end
  object Label11: TLabel [10]
    Left = 225
    Top = 89
    Width = 95
    Height = 13
    Caption = 'Descrição do DARF'
  end
  object Label9: TLabel [11]
    Left = 4
    Top = 200
    Width = 37
    Height = 13
    Caption = 'Receita'
  end
  object Label12: TLabel [12]
    Left = 162
    Top = 200
    Width = 65
    Height = 13
    Caption = 'Receita Bruta'
  end
  object Label13: TLabel [13]
    Left = 320
    Top = 200
    Width = 51
    Height = 13
    Caption = 'Percentual'
  end
  object Label14: TLabel [14]
    Left = 4
    Top = 164
    Width = 77
    Height = 13
    Caption = 'Base de Calculo'
  end
  object BitBtn1: TBitBtn [15]
    Left = 165
    Top = 249
    Width = 116
    Height = 33
    Caption = 'Imprime &DARF'
    TabOrder = 15
    OnClick = BitBtn1Click
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
  object medAte: TMaskEdit [16]
    Left = 4
    Top = 62
    Width = 105
    Height = 21
    EditMask = '!00/00/0000;1; '
    MaxLength = 10
    TabOrder = 2
    Text = '  /  /    '
  end
  object medVencto: TMaskEdit [17]
    Left = 116
    Top = 62
    Width = 105
    Height = 21
    EditMask = '!00/00/0000;1; '
    MaxLength = 10
    TabOrder = 3
    Text = '  /  /    '
  end
  object Edit1: TEdit [18]
    Left = 117
    Top = 102
    Width = 88
    Height = 21
    TabOrder = 6
  end
  object medCliente: TMaskEdit [19]
    Left = 4
    Top = 16
    Width = 73
    Height = 21
    EditMask = '#########;0; '
    MaxLength = 9
    TabOrder = 0
    OnExit = medClienteExit
  end
  object edtNomeCli: TEdit [20]
    Left = 107
    Top = 16
    Width = 334
    Height = 21
    Color = clMenu
    Enabled = False
    TabOrder = 1
  end
  object RxCalcEdit1: TRxCalcEdit [21]
    Left = 4
    Top = 141
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00'
    NumGlyphs = 2
    TabOrder = 8
  end
  object RxCalcEdit2: TRxCalcEdit [22]
    Left = 162
    Top = 141
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00'
    NumGlyphs = 2
    TabOrder = 9
  end
  object RxCalcEdit3: TRxCalcEdit [23]
    Left = 320
    Top = 140
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00'
    NumGlyphs = 2
    TabOrder = 10
  end
  object Edit2: TEdit [24]
    Left = 225
    Top = 62
    Width = 216
    Height = 21
    TabOrder = 4
  end
  object CheckBox1: TCheckBox [25]
    Left = 4
    Top = 104
    Width = 97
    Height = 17
    Caption = 'DARF - Simples'
    TabOrder = 5
    OnClick = CheckBox1Click
  end
  object Edit3: TEdit [26]
    Left = 225
    Top = 102
    Width = 216
    Height = 21
    TabOrder = 7
  end
  object RxCalcEdit4: TRxCalcEdit [27]
    Left = 4
    Top = 214
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00'
    Enabled = False
    NumGlyphs = 2
    TabOrder = 12
  end
  object RxCalcEdit5: TRxCalcEdit [28]
    Left = 162
    Top = 214
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00'
    Enabled = False
    NumGlyphs = 2
    TabOrder = 13
  end
  object RxCalcEdit6: TRxCalcEdit [29]
    Left = 320
    Top = 213
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00'
    Enabled = False
    NumGlyphs = 2
    TabOrder = 14
  end
  object RxCalcEdit7: TRxCalcEdit [30]
    Left = 4
    Top = 177
    Width = 121
    Height = 21
    AutoSize = False
    DisplayFormat = ',0.00'
    NumGlyphs = 2
    TabOrder = 11
  end
  inherited submenu: TMainMenu
    Left = 320
    Top = 8
  end
  inherited Calculator1: TRxCalculator
    Left = 392
    Top = 152
  end
  object qryDarf: TQuery
    DatabaseName = 'db'
    Left = 356
    Top = 8
  end
  object qryCliente: TQuery
    DatabaseName = 'db'
    RequestLive = True
    Left = 400
    Top = 13
  end
end
