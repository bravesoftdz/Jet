inherited frmExpenseList: TfrmExpenseList
  Caption = 'frmExpenseList'
  ClientHeight = 485
  ClientWidth = 954
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  ExplicitWidth = 954
  ExplicitHeight = 485
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 954
    ExplicitWidth = 954
    inherited imgClose: TImage
      Left = 933
      ExplicitLeft = 932
    end
    inherited lblCaption: TRzLabel
      Width = 67
      Caption = 'Expense list'
      ExplicitWidth = 67
    end
  end
  inherited pnlMain: TRzPanel
    Width = 954
    Height = 464
    ExplicitWidth = 954
    ExplicitHeight = 464
    object lblTotal: TLabel
      Left = 884
      Top = 11
      Width = 47
      Height = 18
      Alignment = taRightJustify
      Anchors = [akTop, akBottom]
      Caption = 'Total: '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5525550
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 316
      Top = 49
      Width = 46
      Height = 14
      Caption = 'Expense'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 632
      Top = 49
      Width = 43
      Height = 14
      Caption = 'Supplier'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 22
      Top = 49
      Width = 26
      Height = 14
      Caption = 'Date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object lblProject: TLabel
      Left = 23
      Top = 8
      Width = 607
      Height = 29
      Anchors = [akLeft, akBottom]
      AutoSize = False
      Caption = 'Name of Project Here'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 5525550
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
    end
    object pnlList: TRzPanel
      Left = 22
      Top = 82
      Width = 608
      Height = 363
      Anchors = [akLeft, akTop, akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 7038525
      BorderWidth = 1
      ParentColor = True
      TabOrder = 0
      object grList: TRzDBGrid
        Left = 1
        Top = 1
        Width = 606
        Height = 361
        Align = alClient
        BorderStyle = bsNone
        Color = 15794175
        DataSource = dmProject.dscExpenses
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
        Columns = <
          item
            Expanded = False
            FieldName = 'R_EXPENSE_DATE'
            Title.Alignment = taCenter
            Title.Caption = 'Date'
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
            FieldName = 'R_RECEIPT'
            Title.Alignment = taCenter
            Title.Caption = 'Receipt #'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_EXPENSE_NAME'
            Title.Alignment = taCenter
            Title.Caption = 'Item'
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
            FieldName = 'R_QUANTITY'
            Title.Alignment = taCenter
            Title.Caption = 'Qty'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_UNIT_NAME'
            Title.Alignment = taCenter
            Title.Caption = 'Unit'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_EXPENSE_AMOUNT'
            Title.Alignment = taCenter
            Title.Caption = 'Amount'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_SUPPLIER_NAME'
            Title.Alignment = taCenter
            Title.Caption = 'Supplier'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'R_REMARKS'
            Title.Alignment = taCenter
            Title.Caption = 'Remarks'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 250
            Visible = True
          end>
      end
    end
    object pnlDetail: TRzPanel
      Left = 650
      Top = 82
      Width = 281
      Height = 363
      Anchors = [akTop, akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 7038525
      BorderWidth = 1
      ParentColor = True
      TabOrder = 1
      DesignSize = (
        281
        363)
      object Label4: TLabel
        Left = 13
        Top = 12
        Width = 29
        Height = 14
        Caption = 'Date'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 140
        Top = 12
        Width = 59
        Height = 14
        Caption = 'Receipt #'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 13
        Top = 63
        Width = 29
        Height = 14
        Caption = 'Item'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 13
        Top = 111
        Width = 50
        Height = 14
        Caption = 'Supplier'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 13
        Top = 159
        Width = 22
        Height = 14
        Caption = 'Qty'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 180
        Top = 159
        Width = 50
        Height = 14
        Caption = 'Amount'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 13
        Top = 207
        Width = 52
        Height = 14
        Caption = 'Remarks'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 74
        Top = 159
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
      object dteDate: TRzDBDateTimeEdit
        Left = 13
        Top = 32
        Width = 121
        Height = 22
        DataSource = dmProject.dscExpenses
        DataField = 'R_EXPENSE_DATE'
        FrameColor = 7038525
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 15794175
        TabOrder = 0
        EditType = etDate
        Format = 'mm/dd/yyyy'
      end
      object edReceipt: TRzDBEdit
        Tag = 1
        Left = 140
        Top = 32
        Width = 124
        Height = 22
        DataSource = dmProject.dscExpenses
        DataField = 'R_RECEIPT'
        CharCase = ecUpperCase
        DisabledColor = 15794175
        FrameColor = 7038525
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 15794175
        ReadOnlyColorOnFocus = True
        TabOnEnter = True
        TabOrder = 1
      end
      object bteExpense: TRzButtonEdit
        Left = 13
        Top = 83
        Width = 251
        Height = 22
        Text = ''
        Color = 15794175
        FrameColor = 7038525
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnly = True
        ReadOnlyColor = 15794175
        TabOrder = 2
        AltBtnKind = bkReject
        ButtonKind = bkFind
        AltBtnVisible = True
        AltBtnWidth = 15
        ButtonWidth = 15
        FlatButtons = True
        HideButtonsOnReadOnly = False
        OnAltBtnClick = bteExpenseAltBtnClick
        OnButtonClick = bteExpenseButtonClick
      end
      object bteSupplier: TRzButtonEdit
        Left = 13
        Top = 131
        Width = 251
        Height = 22
        Text = ''
        Color = 15794175
        FrameColor = 7038525
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnly = True
        ReadOnlyColor = 15794175
        TabOrder = 3
        AltBtnKind = bkReject
        ButtonKind = bkFind
        AltBtnVisible = True
        AltBtnWidth = 15
        ButtonWidth = 15
        FlatButtons = True
        HideButtonsOnReadOnly = False
        OnAltBtnClick = bteSupplierAltBtnClick
        OnButtonClick = bteSupplierButtonClick
      end
      object edQuantity: TRzDBNumericEdit
        Left = 13
        Top = 179
        Width = 54
        Height = 22
        DataSource = dmProject.dscExpenses
        DataField = 'R_QUANTITY'
        Alignment = taLeftJustify
        FrameColor = 7038525
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOrder = 4
        IntegersOnly = False
        DisplayFormat = '0.00'
      end
      object edAmount: TRzDBNumericEdit
        Left = 176
        Top = 179
        Width = 88
        Height = 22
        DataSource = dmProject.dscExpenses
        DataField = 'R_EXPENSE_AMOUNT'
        Alignment = taLeftJustify
        FrameColor = 7038525
        FrameVisible = True
        FramingPreference = fpCustomFraming
        TabOrder = 6
        IntegersOnly = False
        DisplayFormat = '###,###,##0.00'
      end
      object mmRemarks: TRzDBMemo
        Tag = 1
        Left = 13
        Top = 227
        Width = 251
        Height = 55
        DataField = 'R_REMARKS'
        DataSource = dmProject.dscExpenses
        TabOrder = 7
        FrameColor = 7038525
        FrameVisible = True
        FramingPreference = fpCustomFraming
        ReadOnlyColor = 15794175
        ReadOnlyColorOnFocus = True
        TabOnEnter = True
      end
      object pnlAdd: TRzPanel
        Left = 8
        Top = 333
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
        TabOrder = 8
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
      object dbluUnit: TRzDBLookupComboBox
        Left = 74
        Top = 179
        Width = 94
        Height = 22
        DataField = 'R_UNIT_ID'
        DataSource = dmProject.dscExpenses
        KeyField = 'UNIT_ID'
        ListField = 'UNIT_NAME'
        ListSource = dmApplication.dscUnits
        TabOrder = 5
        FlatButtons = True
        FrameColor = 7038525
        FrameVisible = True
        FramingPreference = fpCustomFraming
      end
    end
    object bteExpenseFilter: TRzButtonEdit
      Left = 367
      Top = 43
      Width = 249
      Height = 22
      Text = ''
      Color = clWhite
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnly = True
      ReadOnlyColor = clWhite
      TabOrder = 2
      AltBtnKind = bkReject
      ButtonKind = bkFind
      AltBtnVisible = True
      AltBtnWidth = 15
      ButtonWidth = 15
      FlatButtons = True
      HideButtonsOnReadOnly = False
      OnAltBtnClick = bteExpenseFilterAltBtnClick
      OnButtonClick = bteExpenseFilterButtonClick
    end
    object bteSupplierFilter: TRzButtonEdit
      Left = 682
      Top = 43
      Width = 249
      Height = 22
      Text = ''
      Color = clWhite
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnly = True
      ReadOnlyColor = clWhite
      TabOrder = 3
      AltBtnKind = bkReject
      ButtonKind = bkFind
      AltBtnVisible = True
      AltBtnWidth = 15
      ButtonWidth = 15
      FlatButtons = True
      HideButtonsOnReadOnly = False
      OnAltBtnClick = bteSupplierFilterAltBtnClick
      OnButtonClick = bteSupplierFilterButtonClick
    end
    object dteFrom: TRzDateTimeEdit
      Left = 54
      Top = 43
      Width = 121
      Height = 22
      EditType = etDate
      Format = 'mm/dd/yyyy'
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 4
    end
    object dteUntil: TRzDateTimeEdit
      Left = 181
      Top = 43
      Width = 121
      Height = 22
      EditType = etDate
      Format = 'mm/dd/yyyy'
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 5
    end
  end
end
