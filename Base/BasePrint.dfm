inherited frmBasePrint: TfrmBasePrint
  Caption = 'frmBasePrint'
  ClientHeight = 559
  ClientWidth = 1053
  OnShow = FormShow
  ExplicitWidth = 1069
  ExplicitHeight = 598
  DesignSize = (
    1053
    559)
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 1053
    ExplicitWidth = 1053
    inherited lblTitle: TRzLabel
      Width = 43
      Caption = 'Report'
      ExplicitWidth = 43
    end
  end
  object pnlReport: TRzPanel
    Left = 16
    Top = 48
    Width = 1017
    Height = 489
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 7827778
    BorderWidth = 1
    Color = 12630669
    TabOrder = 1
    object rlPreview: TRLPreview
      Left = 1
      Top = 1
      Width = 1015
      Height = 463
      HorzScrollBar.Tracking = True
      VertScrollBar.Smooth = True
      VertScrollBar.Style = ssFlat
      VertScrollBar.Tracking = True
      Align = alClient
      BevelEdges = []
      BevelInner = bvNone
      BevelOuter = bvNone
      BorderStyle = bsNone
      Color = 15794175
      Padding.Top = 10
      Padding.Bottom = 10
      ParentColor = False
      TabOrder = 0
      ExplicitHeight = 487
      object rlReport: TRLReport
        AlignWithMargins = True
        Left = 122
        Top = 72
        Width = 794
        Height = 1123
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        DataSource = dscReport
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ShowProgress = False
        Visible = False
      end
    end
    object pnlReportAction: TRzPanel
      Left = 1
      Top = 464
      Width = 1015
      Height = 24
      Align = alBottom
      BorderOuter = fsNone
      BorderSides = [sdTop]
      BorderColor = 7038525
      BorderWidth = 1
      Color = 14276027
      TabOrder = 1
    end
    object pnlStatus: TRzPanel
      Left = 448
      Top = -100
      Width = 265
      Height = 83
      BorderOuter = fsNone
      TabOrder = 2
      Visible = False
      object Shape1: TShape
        Left = 0
        Top = 0
        Width = 265
        Height = 83
        Align = alClient
        Brush.Color = 14276027
        ExplicitLeft = 80
        ExplicitTop = 32
        ExplicitWidth = 65
        ExplicitHeight = 65
      end
      object Label1: TLabel
        Left = 43
        Top = 35
        Width = 179
        Height = 14
        Caption = 'Generating report. Please wait...'
      end
    end
  end
  object dscReport: TDataSource
    DataSet = fdspReport
    Left = 714
    Top = 147
  end
  object fdspReport: TFDStoredProc
    AfterGetRecords = fdspReportAfterGetRecords
    Connection = dmApplication.fdcMain
    Left = 778
    Top = 147
  end
end
