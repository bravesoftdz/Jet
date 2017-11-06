inherited frmUsers: TfrmUsers
  Caption = 'frmUsers'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 81
      Caption = 'System users'
      ExplicitWidth = 81
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      DataSource = dmSecurity.dscUser
      Columns = <
        item
          Expanded = False
          FieldName = 'USERNAME'
          Title.Alignment = taCenter
          Title.Caption = 'Username'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PASSKEY'
          Title.Alignment = taCenter
          Title.Caption = 'Password'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 230
          Visible = True
        end>
    end
  end
  inherited pnlDetail: TRzPanel
    object Label2: TLabel [0]
      Left = 13
      Top = 31
      Width = 59
      Height = 14
      Caption = 'Username'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel [1]
      Left = 13
      Top = 79
      Width = 59
      Height = 14
      Caption = 'Password'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel [2]
      Left = 13
      Top = 130
      Width = 27
      Height = 14
      Caption = 'Role'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edUsername: TRzDBEdit
      Tag = 1
      Left = 13
      Top = 51
      Width = 249
      Height = 22
      DataSource = dmSecurity.dscUser
      DataField = 'USERNAME'
      CharCase = ecUpperCase
      DisabledColor = 15794175
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 15794175
      ReadOnlyColorOnFocus = True
      TabOnEnter = True
      TabOrder = 2
    end
    object edPassword: TRzDBEdit
      Tag = 1
      Left = 13
      Top = 99
      Width = 249
      Height = 22
      DataSource = dmSecurity.dscUser
      DataField = 'PASSKEY'
      DisabledColor = 15794175
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 15794175
      ReadOnlyColorOnFocus = True
      TabOnEnter = True
      TabOrder = 3
    end
    object dbluRole: TRzDBLookupComboBox
      Left = 13
      Top = 150
      Width = 249
      Height = 22
      Color = clWhite
      DataField = 'ROLE_CODE'
      DataSource = dmSecurity.dscUser
      KeyField = 'ROLE_CODE'
      ListField = 'ROLE_NAME'
      ListSource = dmSecurity.dscRole
      TabOrder = 4
      FlatButtons = True
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = clWhite
    end
  end
end
