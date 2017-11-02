inherited frmBaseSearch: TfrmBaseSearch
  Caption = 'frmBaseSearch'
  ClientHeight = 342
  ClientWidth = 314
  OnClose = FormClose
  OnCreate = FormCreate
  ExplicitWidth = 314
  ExplicitHeight = 342
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 314
    ExplicitWidth = 314
    DesignSize = (
      314
      21)
    inherited imgClose: TImage
      Left = 293
      ExplicitLeft = 293
    end
  end
  inherited pnlMain: TRzPanel
    Width = 314
    Height = 321
    ExplicitWidth = 314
    ExplicitHeight = 321
    DesignSize = (
      314
      321)
    object RzLabel2: TRzLabel
      Left = 8
      Top = 14
      Width = 37
      Height = 14
      Caption = 'Search'
    end
    object edSearchKey: TRzEdit
      Left = 47
      Top = 8
      Width = 257
      Height = 22
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 0
      OnChange = edSearchKeyChange
    end
    object pnlSearch: TRzPanel
      Left = 8
      Top = 35
      Width = 296
      Height = 245
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 7038525
      BorderWidth = 1
      Color = 14273211
      TabOrder = 1
      object grSearch: TRzDBGrid
        Left = 1
        Top = 1
        Width = 294
        Height = 243
        Align = alClient
        BorderStyle = bsNone
        Color = 15794175
        Ctl3D = True
        DrawingStyle = gdsGradient
        FixedColor = 14276027
        GradientEndColor = 14276027
        GradientStartColor = 14276027
        Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        ParentCtl3D = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = grSearchDblClick
        OnTitleClick = grSearchTitleClick
        FrameColor = 7038525
        FrameStyle = fsNone
        FrameVisible = True
        FramingPreference = fpCustomFraming
        FixedLineColor = clWhite
        AltRowShadingColor = 16249582
      end
    end
    object pnlSelect: TRzPanel
      Left = 9
      Top = 289
      Width = 50
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 6577975
      BorderWidth = 1
      Color = 9077581
      TabOrder = 2
      object btnSelect: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        Hint = 'Select row '
        Caption = 'Select'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnSelectClick
      end
    end
    object pnlNew: TRzPanel
      Left = 65
      Top = 289
      Width = 50
      Height = 22
      Anchors = [akLeft, akBottom]
      BorderOuter = fsNone
      BorderColor = 6577975
      BorderWidth = 1
      Color = 9077581
      TabOrder = 3
      object btnNew: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        Hint = 'Select row '
        Caption = 'New'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnNewClick
      end
    end
    object pnlCancel: TRzPanel
      Left = 254
      Top = 289
      Width = 50
      Height = 22
      Anchors = [akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 6577975
      BorderWidth = 1
      Color = 9077581
      TabOrder = 4
      object btnCancel: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        Hint = 'Select row '
        Caption = 'Cancel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        OnClick = btnCancelClick
      end
    end
  end
end
