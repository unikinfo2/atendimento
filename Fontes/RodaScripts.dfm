object RodaScripts_f: TRodaScripts_f
  Left = 335
  Top = 163
  Width = 575
  Height = 370
  BorderIcons = [biSystemMenu]
  Caption = 'Atualiza Scripts'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 567
    Height = 343
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Scripts'
      object memoScript: TMemo
        Left = 0
        Top = 0
        Width = 559
        Height = 315
        Align = alClient
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clYellow
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Erros'
      ImageIndex = 1
      object memoErro: TMemo
        Left = 0
        Top = 0
        Width = 559
        Height = 315
        Align = alClient
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clSilver
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object qryAux: TQuery
    DatabaseName = 'db'
    Left = 48
    Top = 152
  end
end
