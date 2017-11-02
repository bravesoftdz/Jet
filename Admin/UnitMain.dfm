inherited frmUnitMain: TfrmUnitMain
  Caption = 'frmUnitMain'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 47
      Caption = 'Unit list'
      ExplicitWidth = 47
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      DataSource = dmApplication.dscUnits
      Columns = <
        item
          Expanded = False
          FieldName = 'UNIT_NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Name'
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
          FieldName = 'UNIT_DESCRIPTION'
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
    object edName: TRzDBEdit
      Tag = 1
      Left = 13
      Top = 51
      Width = 249
      Height = 22
      DataSource = dmApplication.dscUnits
      DataField = 'UNIT_NAME'
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
      DataField = 'UNIT_DESCRIPTION'
      DataSource = dmApplication.dscUnits
      TabOrder = 3
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 15794175
      ReadOnlyColorOnFocus = True
      TabOnEnter = True
    end
  end
end
