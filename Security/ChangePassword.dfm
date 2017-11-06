inherited frmChangePassword: TfrmChangePassword
  Caption = 'frmChangePassword'
  ClientHeight = 356
  OnCreate = FormCreate
  ExplicitWidth = 320
  ExplicitHeight = 395
  PixelsPerInch = 96
  TextHeight = 14
  object Label1: TLabel [0]
    Left = 37
    Top = 51
    Width = 110
    Height = 14
    Caption = 'Current password'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel [1]
    Left = 37
    Top = 115
    Width = 89
    Height = 14
    Caption = 'New password'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel [2]
    Left = 37
    Top = 179
    Width = 48
    Height = 14
    Caption = 'Confirm'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblErrorMessage: TLabel [3]
    Left = 37
    Top = 243
    Width = 139
    Height = 14
    Caption = 'Passwords do not match.'
    Font.Charset = ANSI_CHARSET
    Font.Color = clRed
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 109
      Caption = 'Change password'
      ExplicitWidth = 109
    end
  end
  object edPassword: TRzEdit
    Left = 37
    Top = 71
    Width = 220
    Height = 22
    Text = ''
    DisabledColor = 12630669
    FrameColor = 7827778
    FrameVisible = True
    FramingPreference = fpCustomFraming
    PasswordChar = '*'
    TabOnEnter = True
    TabOrder = 1
  end
  object edNewPassword: TRzEdit
    Left = 37
    Top = 135
    Width = 220
    Height = 22
    Text = ''
    DisabledColor = 12630669
    FrameColor = 7827778
    FrameVisible = True
    FramingPreference = fpCustomFraming
    PasswordChar = '*'
    TabOnEnter = True
    TabOrder = 2
  end
  object edConfirm: TRzEdit
    Left = 37
    Top = 199
    Width = 220
    Height = 22
    Text = ''
    DisabledColor = 12630669
    FrameColor = 7827778
    FrameVisible = True
    FramingPreference = fpCustomFraming
    PasswordChar = '*'
    TabOnEnter = True
    TabOrder = 3
  end
  object pnlSave: TRzPanel
    Left = 37
    Top = 296
    Width = 50
    Height = 22
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
    TabOrder = 4
    object btnSave: TRzShapeButton
      Left = 0
      Top = 0
      Width = 50
      Height = 22
      BorderStyle = bsNone
      Caption = 'Save'
      OnClick = btnSaveClick
    end
  end
end
