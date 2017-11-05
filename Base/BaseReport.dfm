inherited frmBaseReport: TfrmBaseReport
  Caption = 'frmBaseReport'
  ClientHeight = 563
  ExplicitHeight = 602
  DesignSize = (
    1053
    563)
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    ExplicitWidth = 1127
  end
  inherited pnlReport: TRzPanel
    Left = 264
    Width = 769
    Height = 493
    ExplicitLeft = 264
    ExplicitWidth = 843
    inherited rlPreview: TRLPreview
      Width = 767
      Height = 467
      ExplicitWidth = 841
      inherited rlReport: TRLReport
        Left = 3
        Top = 13
        ExplicitLeft = 3
        ExplicitTop = 13
        object RLBand2: TRLBand
          Left = 38
          Top = 38
          Width = 718
          Height = 59
          BandType = btTitle
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = False
          Borders.DrawRight = False
          Borders.DrawBottom = False
          object lblCompanyName: TRLLabel
            Left = 0
            Top = 15
            Width = 718
            Height = 15
            Align = faTopOnly
            Alignment = taCenter
            AutoSize = False
            Caption = 'JET Construction'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
          object lblReportTitle: TRLLabel
            Left = 0
            Top = 0
            Width = 718
            Height = 15
            Align = faTop
            Alignment = taCenter
            Caption = 'Report Title'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -12
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
          end
        end
        object bndFooter: TRLBand
          Left = 38
          Top = 97
          Width = 718
          Height = 16
          BandType = btFooter
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = True
          object siDate: TRLSystemInfo
            Left = 0
            Top = 0
            Width = 95
            Height = 15
            Text = 'Print date: '
          end
          object siPageNumber: TRLSystemInfo
            AlignWithMargins = True
            Left = 601
            Top = 1
            Width = 117
            Height = 14
            Align = faRight
            Alignment = taRightJustify
            Info = itPageNumber
            SecondHoldStyle = hsRelatively
            Text = 'Page '
          end
        end
      end
    end
    inherited pnlReportAction: TRzPanel
      Top = 468
      Width = 767
      object urlNext: TRzURLLabel
        Left = 726
        Top = 5
        Width = 23
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Next'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7038525
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = urlNextClick
        ExplicitLeft = 800
      end
      object urlPrevious: TRzURLLabel
        Left = 678
        Top = 5
        Width = 41
        Height = 13
        Anchors = [akRight, akBottom]
        Caption = 'Previous'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 7038525
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = urlPreviousClick
        ExplicitLeft = 752
      end
      object lblCount: TRzLabel
        Left = 8
        Top = 6
        Width = 76
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = '0 records found.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblPage: TRzLabel
        Left = 227
        Top = 6
        Width = 51
        Height = 13
        Anchors = [akLeft, akBottom]
        Caption = 'Page 0 of 0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
    end
  end
  object pnlDetail: TRzPanel [2]
    Left = 18
    Top = 48
    Width = 231
    Height = 493
    Anchors = [akLeft, akTop, akBottom]
    BorderOuter = fsNone
    BorderColor = 7038525
    BorderWidth = 1
    ParentColor = True
    TabOrder = 2
    ExplicitHeight = 489
    DesignSize = (
      231
      493)
    object Label4: TLabel
      Left = 13
      Top = 12
      Width = 44
      Height = 14
      Caption = 'Project'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bteProject: TRzButtonEdit
      Left = 13
      Top = 32
      Width = 204
      Height = 22
      Text = ''
      Color = 15794175
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnly = True
      ReadOnlyColor = 15794175
      TabOrder = 0
      AltBtnKind = bkReject
      ButtonKind = bkFind
      AltBtnWidth = 15
      ButtonWidth = 15
      FlatButtons = True
      HideButtonsOnReadOnly = False
      OnButtonClick = bteProjectButtonClick
    end
    object pnlGenerate: TRzPanel
      Left = 8
      Top = 463
      Width = 65
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 6577975
      BorderWidth = 1
      Color = 9077581
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      ExplicitTop = 459
      object btnGenerate: TRzShapeButton
        Left = 0
        Top = 0
        Width = 66
        Height = 22
        Hint = 'Generate the report'
        BorderStyle = bsNone
        Caption = 'Generate'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnGenerateClick
      end
    end
    object pnlPrint: TRzPanel
      Left = 80
      Top = 463
      Width = 65
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 6577975
      BorderWidth = 1
      Color = 9077581
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      ExplicitTop = 459
      object btnPrint: TRzShapeButton
        Left = 0
        Top = 0
        Width = 66
        Height = 22
        Hint = 'Generate the report'
        BorderStyle = bsNone
        Caption = 'Print'
        ParentShowHint = False
        ShowHint = True
        OnClick = btnPrintClick
      end
    end
  end
end
