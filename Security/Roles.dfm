inherited frmRoles: TfrmRoles
  Caption = 'frmRoles'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 55
      Caption = 'Roles list'
      ExplicitWidth = 55
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      DataSource = dmSecurity.dscRole
      OnDblClick = grListDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'ROLE_CODE'
          Title.Alignment = taCenter
          Title.Caption = 'Code'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ROLE_NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Name'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ROLE_DESCRIPTION'
          Title.Alignment = taCenter
          Title.Caption = 'Description'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 200
          Visible = True
        end>
    end
  end
  inherited pnlDetail: TRzPanel
    object Label2: TLabel [0]
      Left = 13
      Top = 31
      Width = 31
      Height = 14
      Caption = 'Code'
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
      Width = 33
      Height = 14
      Caption = 'Name'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel [2]
      Left = 13
      Top = 127
      Width = 69
      Height = 14
      Caption = 'Description'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object urlRoles: TRzURLLabel [3]
      Left = 13
      Top = 221
      Width = 82
      Height = 14
      Caption = 'Assigned rights'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7038525
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlRolesClick
    end
    inherited pnlSave: TRzPanel
      TabOrder = 5
    end
    inherited pnlCancel: TRzPanel
      TabOrder = 6
    end
    object edCode: TRzDBEdit
      Tag = 1
      Left = 13
      Top = 51
      Width = 249
      Height = 22
      DataSource = dmSecurity.dscRole
      DataField = 'ROLE_CODE'
      CharCase = ecUpperCase
      Color = clWhite
      DisabledColor = 15794175
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = clWhite
      TabOnEnter = True
      TabOrder = 2
    end
    object edName: TRzDBEdit
      Tag = 1
      Left = 13
      Top = 99
      Width = 249
      Height = 22
      DataSource = dmSecurity.dscRole
      DataField = 'ROLE_NAME'
      Color = clWhite
      DisabledColor = 15794175
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 15794175
      TabOnEnter = True
      TabOrder = 3
    end
    object mmDescription: TRzDBMemo
      Tag = 1
      Left = 13
      Top = 147
      Width = 249
      Height = 55
      DataField = 'ROLE_DESCRIPTION'
      DataSource = dmSecurity.dscRole
      TabOrder = 4
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 15794175
      ReadOnlyColorOnFocus = True
      TabOnEnter = True
    end
  end
end
