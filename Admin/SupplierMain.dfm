inherited frmSupplierMain: TfrmSupplierMain
  Caption = 'frmSupplierMain'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 72
      Caption = 'Supplier list'
      ExplicitWidth = 72
    end
  end
  inherited pnlList: TRzPanel
    inherited grList: TRzDBGrid
      DataSource = dmApplication.dscSuppliers
      Columns = <
        item
          Expanded = False
          FieldName = 'SUPPLIER_NAME'
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
          FieldName = 'SUPPLIER_ADDRESS'
          Title.Alignment = taCenter
          Title.Caption = 'Address'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 330
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SUPPLIER_PHONE'
          Title.Alignment = taCenter
          Title.Caption = 'Phone'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 150
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
      Width = 95
      Height = 14
      Caption = 'Contact person'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblPhone: TLabel [2]
      Left = 13
      Top = 127
      Width = 39
      Height = 14
      Caption = 'Phone'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel [3]
      Left = 13
      Top = 175
      Width = 49
      Height = 14
      Caption = 'Address'
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
      DataSource = dmApplication.dscSuppliers
      DataField = 'SUPPLIER_NAME'
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
    object edContact: TRzDBEdit
      Tag = 1
      Left = 13
      Top = 99
      Width = 249
      Height = 22
      DataSource = dmApplication.dscSuppliers
      DataField = 'SUPPLIER_CONTACT'
      CharCase = ecUpperCase
      DisabledColor = 15794175
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 15794175
      ReadOnlyColorOnFocus = True
      TabOnEnter = True
      TabOrder = 3
    end
    object edPhone: TRzDBEdit
      Tag = 1
      Left = 13
      Top = 147
      Width = 249
      Height = 22
      DataSource = dmApplication.dscSuppliers
      DataField = 'SUPPLIER_PHONE'
      CharCase = ecUpperCase
      DisabledColor = 15794175
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 15794175
      ReadOnlyColorOnFocus = True
      TabOnEnter = True
      TabOrder = 4
    end
    object mmAddress: TRzDBMemo
      Tag = 1
      Left = 13
      Top = 195
      Width = 249
      Height = 55
      DataField = 'SUPPLIER_ADDRESS'
      DataSource = dmApplication.dscSuppliers
      TabOrder = 5
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 15794175
      ReadOnlyColorOnFocus = True
      TabOnEnter = True
    end
  end
end
