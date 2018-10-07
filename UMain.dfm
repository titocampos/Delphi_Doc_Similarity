object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'Text Comparer'
  ClientHeight = 429
  ClientWidth = 1149
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 393
    Height = 429
    Align = alLeft
    BevelInner = bvLowered
    TabOrder = 0
    object Panel2: TPanel
      Left = 2
      Top = 2
      Width = 389
      Height = 70
      Align = alTop
      Caption = 'Base text'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial Narrow'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object mmBaseText: TMemo
      Left = 2
      Top = 72
      Width = 389
      Height = 355
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  object Panel3: TPanel
    Left = 393
    Top = 0
    Width = 756
    Height = 429
    Align = alClient
    TabOrder = 1
    object Pg: TPageControl
      Left = 1
      Top = 72
      Width = 754
      Height = 356
      ActivePage = TbsText1
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      MultiLine = True
      ParentFont = False
      TabHeight = 40
      TabOrder = 0
      TabPosition = tpLeft
      TabWidth = 100
      object TbsText1: TTabSheet
        Caption = 'Text 1'
        ImageIndex = 4
        object Pnl1: TPanel
          Left = 0
          Top = 0
          Width = 666
          Height = 41
          Align = alTop
          TabOrder = 0
        end
        object mmText1: TMemo
          Left = 0
          Top = 41
          Width = 666
          Height = 307
          Align = alClient
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
      object TbsText2: TTabSheet
        Caption = 'Text 2'
        ImageIndex = 1
        object Pnl2: TPanel
          Left = 0
          Top = 0
          Width = 666
          Height = 41
          Align = alTop
          TabOrder = 0
        end
        object mmText2: TMemo
          Left = 0
          Top = 41
          Width = 666
          Height = 307
          Align = alClient
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
      object TbsText3: TTabSheet
        Caption = 'Text 3'
        ImageIndex = 2
        object Pnl3: TPanel
          Left = 0
          Top = 0
          Width = 666
          Height = 41
          Align = alTop
          TabOrder = 0
        end
        object mmText3: TMemo
          Left = 0
          Top = 41
          Width = 666
          Height = 307
          Align = alClient
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
      object TbsText4: TTabSheet
        Caption = 'Text 4'
        ImageIndex = 3
        object pnl4: TPanel
          Left = 0
          Top = 0
          Width = 666
          Height = 41
          Align = alTop
          TabOrder = 0
        end
        object mmText4: TMemo
          Left = 0
          Top = 41
          Width = 666
          Height = 307
          Align = alClient
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
      object TbsText5: TTabSheet
        Caption = 'Text 5'
        ImageIndex = 4
        object Pnl5: TPanel
          Left = 0
          Top = 0
          Width = 666
          Height = 41
          Align = alTop
          TabOrder = 0
        end
        object mmText5: TMemo
          Left = 0
          Top = 41
          Width = 666
          Height = 307
          Align = alClient
          ScrollBars = ssVertical
          TabOrder = 1
        end
      end
      object TbsText6: TTabSheet
        Caption = 'Chart'
        ImageIndex = 5
        object Chart: TChart
          Left = 0
          Top = 0
          Width = 666
          Height = 348
          Legend.Visible = False
          Title.Text.Strings = (
            'Correlation chart')
          View3D = False
          Align = alClient
          TabOrder = 0
          DefaultCanvas = 'TGDIPlusCanvas'
          PrintMargins = (
            15
            24
            15
            24)
          ColorPaletteIndex = 13
          object Series1: TBarSeries
            ColorEachPoint = True
            Marks.Brush.Gradient.Colors = <
              item
                Color = clRed
              end
              item
                Color = 819443
                Offset = 0.067915690866510540
              end
              item
                Color = clYellow
                Offset = 1.000000000000000000
              end>
            Marks.Brush.Gradient.Direction = gdTopBottom
            Marks.Brush.Gradient.EndColor = clYellow
            Marks.Brush.Gradient.MidColor = 819443
            Marks.Brush.Gradient.StartColor = clRed
            Marks.Brush.Gradient.Visible = True
            Marks.Font.Color = 159
            Marks.Font.Name = 'Tahoma'
            Marks.Font.Style = [fsBold, fsItalic]
            Marks.Frame.Color = 33023
            Marks.RoundSize = 14
            Marks.Style = smsValue
            Title = 'ChartBars'
            XValues.Name = 'X'
            XValues.Order = loAscending
            YValues.Name = 'Bar'
            YValues.Order = loNone
          end
        end
      end
    end
    object Panel4: TPanel
      Left = 1
      Top = 1
      Width = 754
      Height = 71
      Align = alTop
      TabOrder = 1
      object BtCheck: TButton
        Left = 24
        Top = 20
        Width = 153
        Height = 33
        Caption = 'Check it!'
        TabOrder = 0
        OnClick = BtCheckClick
      end
    end
  end
end
