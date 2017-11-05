inherited frmItemMain: TfrmItemMain
  Caption = 'frmItemMain'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 51
      Caption = 'Item list'
      ExplicitWidth = 51
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      DataSource = dmApplication.dscItem
      Columns = <
        item
          Expanded = False
          FieldName = 'ITEM_NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Name'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 275
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ITEM_DESCRIPTION'
          Title.Alignment = taCenter
          Title.Caption = 'Description'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 450
          Visible = True
        end>
    end
  end
  inherited pnlDetail: TRzPanel
    object Label2: TLabel [0]
      Left = 13
      Top = 31
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
    object Label3: TLabel [1]
      Left = 13
      Top = 79
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
    object Label11: TLabel [2]
      Left = 13
      Top = 162
      Width = 25
      Height = 14
      Caption = 'Unit'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edName: TRzDBEdit
      Tag = 1
      Left = 13
      Top = 51
      Width = 249
      Height = 22
      DataSource = dmApplication.dscItem
      DataField = 'ITEM_NAME'
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
    object mmDescription: TRzDBMemo
      Tag = 1
      Left = 13
      Top = 99
      Width = 249
      Height = 55
      DataField = 'ITEM_DESCRIPTION'
      DataSource = dmApplication.dscItem
      TabOrder = 3
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 15794175
      ReadOnlyColorOnFocus = True
      TabOnEnter = True
    end
    object cbxActive: TRzDBCheckBox
      Left = 16
      Top = 215
      Width = 53
      Height = 16
      DataField = 'ACTIVE'
      DataSource = dmApplication.dscItem
      NullAsUnchecked = False
      ValueChecked = 'True'
      ValueUnchecked = 'False'
      Caption = 'Active'
      FrameColor = 7038525
      TabOrder = 5
    end
    object dbluUnit: TRzDBLookupComboBox
      Left = 13
      Top = 182
      Width = 249
      Height = 22
      Color = clWhite
      DataField = 'UNIT_ID'
      DataSource = dmApplication.dscItem
      KeyField = 'UNIT_ID'
      ListField = 'UNIT_NAME'
      ListSource = dmApplication.dscUnits
      TabOrder = 4
      FlatButtons = True
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = clWhite
    end
  end
end
