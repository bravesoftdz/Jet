inherited frmBaseGridDetail: TfrmBaseGridDetail
  Caption = 'frmBaseGridDetail'
  ClientHeight = 474
  ClientWidth = 778
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 794
  ExplicitHeight = 513
  DesignSize = (
    778
    474)
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 778
    ExplicitWidth = 778
  end
  object pnlList: TRzPanel
    Left = 6
    Top = 65
    Width = 483
    Height = 403
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 7038525
    BorderWidth = 1
    ParentColor = True
    TabOrder = 1
    object grList: TRzDBGrid
      Left = 1
      Top = 1
      Width = 481
      Height = 401
      Align = alClient
      BorderStyle = bsNone
      Color = 15794175
      DrawingStyle = gdsGradient
      FixedColor = 14276027
      GradientEndColor = 14276027
      GradientStartColor = 14276027
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Tahoma'
      TitleFont.Style = []
      OnTitleClick = grListTitleClick
      DisabledColor = 15794175
      FrameColor = 7038525
      FrameStyle = fsNone
      FramingPreference = fpCustomFraming
      FixedLineColor = clWhite
      LineColor = clWhite
      AltRowShadingColor = 15854564
    end
  end
  object pnlSearch: TRzPanel
    Left = 0
    Top = 28
    Width = 778
    Height = 33
    Align = alTop
    BorderOuter = fsNone
    BorderSides = [sdLeft, sdTop, sdRight]
    ParentColor = True
    TabOrder = 2
    DesignSize = (
      778
      33)
    object Label1: TLabel
      Left = 8
      Top = 15
      Width = 37
      Height = 14
      Caption = 'Search'
    end
    object edSearchKey: TRzEdit
      Left = 52
      Top = 9
      Width = 437
      Height = 22
      Text = ''
      Anchors = [akLeft, akTop, akRight]
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 0
      OnChange = edSearchKeyChange
    end
  end
  object pnlDetail: TRzPanel
    Left = 495
    Top = 37
    Width = 277
    Height = 431
    Anchors = [akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 7038525
    BorderWidth = 1
    ParentColor = True
    TabOrder = 3
    DesignSize = (
      277
      431)
    object pnlAdd: TRzPanel
      Left = 8
      Top = 401
      Width = 50
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
      object sbtnNew: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        Hint = 'Add a new record'
        BorderStyle = bsNone
        Caption = 'New'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnNewClick
      end
    end
    object pnlDetailHead: TRzPanel
      Left = 1
      Top = 1
      Width = 275
      Height = 21
      Align = alTop
      BorderOuter = fsNone
      BorderSides = [sdBottom]
      BorderColor = 7827778
      BorderWidth = 1
      Color = 7827778
      GradientColorStyle = gcsCustom
      GradientColorStart = 7038525
      GradientColorStop = 7827778
      TabOrder = 0
      VisualStyle = vsGradient
      object lblDetailHeadCaption: TRzLabel
        Left = 7
        Top = 3
        Width = 41
        Height = 14
        Caption = 'Details'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
      end
    end
    object pnlSave: TRzPanel
      Left = 64
      Top = 401
      Width = 50
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
      object sbtnSave: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        Hint = 'Save'
        BorderStyle = bsNone
        Caption = 'Save'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnSaveClick
      end
    end
    object pnlCancel: TRzPanel
      Left = 219
      Top = 401
      Width = 50
      Height = 22
      Anchors = [akRight, akBottom]
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
      TabOrder = 3
      object sbtnCancel: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        Hint = 'Cancel'
        BorderStyle = bsNone
        Caption = 'Cancel'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnCancelClick
      end
    end
  end
end
