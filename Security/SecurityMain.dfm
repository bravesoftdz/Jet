inherited frmSecurityMain: TfrmSecurityMain
  Caption = 'frmSecurityMain'
  ClientHeight = 563
  ClientWidth = 1053
  OnCreate = FormCreate
  ExplicitWidth = 1069
  ExplicitHeight = 602
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 1053
    ExplicitWidth = 1053
    inherited lblTitle: TRzLabel
      Width = 86
      Caption = 'User and roles'
      ExplicitWidth = 86
    end
  end
  object pnlOptions: TRzPanel
    Left = 18
    Top = 48
    Width = 179
    Height = 493
    Anchors = [akLeft, akTop, akBottom]
    BorderOuter = fsNone
    BorderColor = 7038525
    BorderWidth = 1
    ParentColor = True
    TabOrder = 1
    object urlChangePassword: TRzURLLabel
      Left = 26
      Top = 21
      Width = 96
      Height = 14
      Caption = 'Change password'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7038525
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlChangePasswordClick
    end
    object urlUsers: TRzURLLabel
      Left = 26
      Top = 53
      Width = 72
      Height = 14
      Caption = 'System users'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7038525
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlUsersClick
    end
    object urlRoles: TRzURLLabel
      Left = 26
      Top = 85
      Width = 69
      Height = 14
      Caption = 'System roles'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7038525
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlRolesClick
    end
  end
  object pnlDock: TRzPanel
    Left = 211
    Top = 48
    Width = 822
    Height = 493
    Anchors = [akLeft, akTop, akRight, akBottom]
    BorderOuter = fsNone
    BorderColor = 7038525
    BorderWidth = 1
    ParentColor = True
    TabOrder = 2
  end
end
