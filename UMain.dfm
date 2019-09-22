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
      ActivePage = TbsText4
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      Images = ImageList
      MultiLine = True
      ParentFont = False
      TabHeight = 40
      TabOrder = 0
      TabWidth = 150
      object TbsText1: TTabSheet
        Caption = 'Text 1'
        object Pnl1: TPanel
          Left = 0
          Top = 0
          Width = 746
          Height = 81
          Align = alTop
          TabOrder = 0
        end
        object mmText1: TMemo
          Left = 0
          Top = 81
          Width = 746
          Height = 185
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 1
          ExplicitTop = 41
          ExplicitHeight = 225
        end
      end
      object TbsText2: TTabSheet
        Caption = 'Text 2'
        object Pnl2: TPanel
          Left = 0
          Top = 0
          Width = 746
          Height = 81
          Align = alTop
          TabOrder = 0
        end
        object mmText2: TMemo
          Left = 0
          Top = 81
          Width = 746
          Height = 185
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 1
          ExplicitTop = 41
          ExplicitHeight = 225
        end
      end
      object TbsText3: TTabSheet
        Caption = 'Text 3'
        object Pnl3: TPanel
          Left = 0
          Top = 0
          Width = 746
          Height = 81
          Align = alTop
          TabOrder = 0
        end
        object mmText3: TMemo
          Left = 0
          Top = 81
          Width = 746
          Height = 185
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 1
          ExplicitTop = 41
          ExplicitHeight = 225
        end
      end
      object TbsText4: TTabSheet
        Caption = 'Text 4'
        object pnl4: TPanel
          Left = 0
          Top = 0
          Width = 746
          Height = 81
          Align = alTop
          TabOrder = 0
        end
        object mmText4: TMemo
          Left = 0
          Top = 81
          Width = 746
          Height = 185
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 1
          ExplicitLeft = -1
          ExplicitTop = 47
          ExplicitHeight = 225
        end
      end
      object TbsText5: TTabSheet
        Caption = 'Text 5'
        object Pnl5: TPanel
          Left = 0
          Top = 0
          Width = 746
          Height = 81
          Align = alTop
          TabOrder = 0
        end
        object mmText5: TMemo
          Left = 0
          Top = 81
          Width = 746
          Height = 185
          Align = alClient
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 1
          ExplicitTop = 41
          ExplicitHeight = 225
        end
      end
      object TbsText6: TTabSheet
        Caption = 'Results                '
        ImageIndex = 1
        object Chart: TChart
          Left = 0
          Top = 0
          Width = 746
          Height = 266
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
      DesignSize = (
        754
        71)
      object SpeedButton1: TSpeedButton
        Left = 552
        Top = 20
        Width = 193
        Height = 41
        Anchors = [akTop, akRight]
        Caption = 'Load texts from directory...'
        OnClick = SpeedButton1Click
      end
      object BtCheck: TButton
        Left = 24
        Top = 20
        Width = 175
        Height = 41
        Cursor = crHandPoint
        Caption = 'Check it!'
        ModalResult = 1
        Style = bsCommandLink
        TabOrder = 0
        OnClick = BtCheckClick
      end
    end
  end
  object ImageList: TImageList
    Left = 1057
    Top = 72
    Bitmap = {
      494C010102000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFAF800FBFAF800FBFAF800FBFA
      F800FBFAF800FBFAF800FBFAF800FBFAF800FBFAF800FBFAF800FBFAF800FBFA
      F800FBFAF800FBFAF800FBFAF800FBFAF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0029252100292521002925
      2100292521002925210029252100292521002925210029252100292521002925
      21002925210029252100FFFFFF00FFFFFF00FBFAF8003F212D003F212D003F21
      2D003F212D003F212D003F212D003F212D003F212D003F212D003F212D003F21
      2D003F212D003F212D003F212D00FBFAF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0029252100292521009492
      9000949290009492900094929000949290009492900094929000949290009492
      90009492900029252100FFFFFF00FFFFFF00FBFAF8003F212D003F212D006D7C
      F4006D7CF4003F212D00FBFAF8003F212D00E9E1AA003F212D00FBFAF8003F21
      2D0094DEFE0094DEFE00FBFAF800FBFAF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF002925210029252100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009492900029252100FFFFFF00FFFFFF00FBFAF8003F212D003F212D006D7C
      F4006D7CF4003F212D00FBFAF8003F212D00E9E1AA003F212D00FBFAF8003F21
      2D0094DEFE0094DEFE00FBFAF800FBFAF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF002925210029252100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009492900029252100FFFFFF00FFFFFF00FBFAF8003F212D003F212D006D7C
      F4006D7CF4003F212D00FBFAF8003F212D00E9E1AA003F212D00FBFAF8003F21
      2D0094DEFE0094DEFE00FBFAF800FBFAF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF002925210029252100FFFF
      FF0029252100292521002925210029252100292521002925210029252100FFFF
      FF009492900029252100FFFFFF00FFFFFF00FBFAF8003F212D003F212D006D7C
      F4006D7CF4003F212D00FBFAF8003F212D00E9E1AA003F212D00FBFAF8003F21
      2D0094DEFE0094DEFE00FBFAF800FBFAF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF002925210029252100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009492900029252100FFFFFF00FFFFFF00FBFAF8003F212D003F212D006D7C
      F4006D7CF4003F212D00FBFAF8003F212D00E9E1AA003F212D00FBFAF8003F21
      2D0094DEFE0094DEFE00FBFAF800FBFAF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF002925210029252100FFFF
      FF0029252100292521002925210029252100292521002925210029252100FFFF
      FF009492900029252100FFFFFF00FFFFFF00FBFAF8003F212D003F212D006D7C
      F4006D7CF4003F212D00FBFAF8003F212D00E9E1AA003F212D00FBFAF8003F21
      2D0094DEFE0094DEFE00FBFAF800FBFAF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF002925210029252100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009492900029252100FFFFFF00FFFFFF00FBFAF8003F212D003F212D003F21
      2D003F212D003F212D00FBFAF8003F212D00E9E1AA003F212D00FBFAF8003F21
      2D0094DEFE0094DEFE00FBFAF800FBFAF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF002925210029252100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009492900029252100FFFFFF00FFFFFF00FBFAF8003F212D00FBFAF800FBFA
      F800FBFAF800FBFAF800FBFAF8003F212D00E9E1AA003F212D00FBFAF8003F21
      2D0094DEFE0094DEFE00FBFAF800FBFAF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF002925210029252100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002925210029252100292521002925
      21002925210029252100FFFFFF00FFFFFF00FBFAF8003F212D00FBFAF800FBFA
      F800FBFAF800FBFAF800FBFAF8003F212D003F212D003F212D00FBFAF8003F21
      2D0094DEFE0094DEFE00FBFAF800FBFAF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF002925210029252100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002925210029252100FFFFFF00FFFF
      FF002925210029252100FFFFFF00FFFFFF00FBFAF8003F212D00FBFAF800FBFA
      F800FBFAF800FBFAF800FBFAF800FBFAF800FBFAF800FBFAF800FBFAF8003F21
      2D0094DEFE0094DEFE00FBFAF800FBFAF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF002925210029252100FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF002925210029252100FFFFFF002925
      210029252100FFFFFF00FFFFFF00FFFFFF00FBFAF8003F212D00FBFAF800FBFA
      F800FBFAF800FBFAF800FBFAF800FBFAF800FBFAF800FBFAF800FBFAF8003F21
      2D0094DEFE0094DEFE00FBFAF800FBFAF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0029252100292521002925
      2100292521002925210029252100292521002925210029252100292521004D49
      4600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFAF8003F212D00FBFAF800FBFA
      F800FBFAF800FBFAF800FBFAF800FBFAF800FBFAF800FBFAF800FBFAF8003F21
      2D003F212D003F212D00FBFAF800FBFAF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF004D4946002925
      210029252100292521002925210029252100292521002925210087848200FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFAF8003F212D00FBFAF800FBFA
      F800FBFAF800FBFAF800FBFAF800FBFAF800FBFAF800FBFAF800FBFAF800FBFA
      F800FBFAF800FBFAF800FBFAF800FBFAF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FBFAF800FBFAF800FBFAF800FBFA
      F800FBFAF800FBFAF800FBFAF800FBFAF800FBFAF800FBFAF800FBFAF800FBFA
      F800FBFAF800FBFAF800FBFAF800FBFAF8000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object FileOpenDialog: TFileOpenDialog
    FavoriteLinks = <>
    FileNameLabel = 'Arquivos de textos'
    FileTypes = <
      item
        DisplayName = 'Arquivos de texto'
        FileMask = '*.txt'
      end>
    Options = [fdoPickFolders]
    Left = 1001
    Top = 112
  end
end
