inherited frmBaseReport: TfrmBaseReport
  Caption = 'frmBaseReport'
  ClientWidth = 1127
  ExplicitWidth = 1143
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 1127
  end
  inherited pnlReport: TRzPanel
    Left = 264
    Width = 843
    ExplicitLeft = 264
    ExplicitWidth = 769
    inherited rlPreview: TRLPreview
      Width = 841
      inherited rlReport: TRLReport
        Left = 18
        Top = 48
        ExplicitLeft = 18
        ExplicitTop = 48
      end
    end
  end
  object pnlDetail: TRzPanel [3]
    Left = 18
    Top = 48
    Width = 231
    Height = 489
    Anchors = [akLeft, akTop, akBottom]
    BorderOuter = fsNone
    BorderColor = 7038525
    BorderWidth = 1
    ParentColor = True
    TabOrder = 3
    DesignSize = (
      231
      489)
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
    object bteExpense: TRzButtonEdit
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
      AltBtnVisible = True
      AltBtnWidth = 15
      ButtonWidth = 15
      FlatButtons = True
      HideButtonsOnReadOnly = False
    end
    object pnlGenerate: TRzPanel
      Left = 8
      Top = 459
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
      end
    end
    object pnlPrint: TRzPanel
      Left = 80
      Top = 459
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
      end
    end
  end
end
