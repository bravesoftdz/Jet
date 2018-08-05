inherited frmProjectReport: TfrmProjectReport
  Caption = 'frmProjectReport'
  ClientWidth = 1060
  ExplicitWidth = 1076
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 1060
    ExplicitWidth = 1060
  end
  inherited pnlReport: TRzPanel
    Width = 776
    Color = 15794175
    ExplicitWidth = 776
    inherited rlPreview: TRLPreview
      Width = 774
      ExplicitWidth = 774
      inherited rlReport: TRLReport
        inherited RLBand2: TRLBand
          inherited lblReportTitle: TRLLabel
            Caption = 'PROJECT REPORT'
          end
          object lblProject: TRLLabel
            Left = 0
            Top = 44
            Width = 54
            Height = 15
            Align = faLeftBottom
          end
          object lblTotal: TRLLabel
            Left = 675
            Top = 44
            Width = 43
            Height = 15
            Align = faRightBottom
          end
        end
        inherited bndFooter: TRLBand
          Top = 129
          ExplicitTop = 129
        end
        object RLBand1: TRLBand
          Left = 38
          Top = 113
          Width = 718
          Height = 16
          object RLDBText1: TRLDBText
            Left = 259
            Top = 1
            Width = 190
            Height = 15
            AutoSize = False
            DataField = 'R_ITEM_NAME'
            DataSource = dscReport
            Text = ''
          end
          object RLDBText2: TRLDBText
            Left = 450
            Top = 0
            Width = 49
            Height = 15
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'R_QUANTITY'
            DataSource = dscReport
            Text = ''
          end
          object RLDBText3: TRLDBText
            Left = 502
            Top = 0
            Width = 60
            Height = 15
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'R_EXPENSE_AMOUNT'
            DataSource = dscReport
            DisplayMask = ',0.00'
            Text = ''
          end
          object RLDBText4: TRLDBText
            Left = 568
            Top = 1
            Width = 77
            Height = 15
            DataField = 'R_REMARKS'
            DataSource = dscReport
            Text = ''
          end
          object RLDBText5: TRLDBText
            Left = 0
            Top = 0
            Width = 63
            Height = 16
            Align = faLeft
            AutoSize = False
            DataField = 'R_EXPENSE_DATE'
            DataSource = dscReport
            Text = ''
          end
          object RLDBText6: TRLDBText
            Left = 68
            Top = 0
            Width = 73
            Height = 16
            AutoSize = False
            DataField = 'R_RECEIPT'
            DataSource = dscReport
            Text = ''
          end
          object RLDBText7: TRLDBText
            Left = 144
            Top = 0
            Width = 114
            Height = 16
            AutoSize = False
            DataField = 'R_SUPPLIER_NAME'
            DataSource = dscReport
            Text = ''
          end
        end
        object RLBand3: TRLBand
          Left = 38
          Top = 97
          Width = 718
          Height = 16
          BandType = btColumnHeader
          Borders.Sides = sdCustom
          Borders.DrawLeft = False
          Borders.DrawTop = True
          Borders.DrawRight = False
          Borders.DrawBottom = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          object RLLabel2: TRLLabel
            Left = 259
            Top = 1
            Width = 28
            Height = 15
            Caption = 'Item'
          end
          object RLLabel3: TRLLabel
            Left = 477
            Top = 1
            Width = 22
            Height = 15
            Alignment = taRightJustify
            Caption = 'Qty'
          end
          object RLLabel4: TRLLabel
            Left = 515
            Top = 1
            Width = 47
            Height = 15
            Alignment = taRightJustify
            Caption = 'Amount'
          end
          object RLLabel1: TRLLabel
            Left = 568
            Top = 1
            Width = 55
            Height = 15
            Caption = 'Remarks'
          end
          object RLLabel5: TRLLabel
            Left = 0
            Top = 1
            Width = 29
            Height = 14
            Align = faLeft
            Caption = 'Date'
          end
          object RLLabel6: TRLLabel
            Left = 68
            Top = 1
            Width = 56
            Height = 15
            Caption = 'Receipt #'
          end
          object RLLabel7: TRLLabel
            Left = 145
            Top = 1
            Width = 50
            Height = 15
            Caption = 'Supplier'
          end
        end
      end
    end
    inherited pnlReportAction: TRzPanel
      Width = 774
      ExplicitWidth = 774
      inherited urlNext: TRzURLLabel
        Left = 733
        ExplicitLeft = 733
      end
      inherited urlPrevious: TRzURLLabel
        Left = 685
        ExplicitLeft = 685
      end
    end
  end
  inherited pnlDetail: TRzPanel
    object Label2: TLabel [1]
      Left = 13
      Top = 70
      Width = 29
      Height = 14
      Caption = 'Item'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel [2]
      Left = 14
      Top = 127
      Width = 29
      Height = 14
      Caption = 'Date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited pnlGenerate: TRzPanel
      TabOrder = 4
    end
    inherited pnlPrint: TRzPanel
      Left = 79
      TabOrder = 5
      ExplicitLeft = 79
    end
    object bteItem: TRzButtonEdit
      Left = 13
      Top = 90
      Width = 204
      Height = 22
      Text = ''
      Color = 15794175
      FocusColor = clWhite
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnly = True
      ReadOnlyColor = 15794175
      TabOrder = 1
      AltBtnKind = bkReject
      ButtonKind = bkFind
      AltBtnVisible = True
      AltBtnWidth = 15
      ButtonWidth = 15
      FlatButtons = True
      HideButtonsOnReadOnly = False
      OnAltBtnClick = bteItemAltBtnClick
      OnButtonClick = bteItemButtonClick
    end
    object dteFrom: TRzDateTimeEdit
      Left = 13
      Top = 147
      Width = 100
      Height = 22
      EditType = etDate
      Format = 'mm/dd/yyyy'
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 2
    end
    object dteUntil: TRzDateTimeEdit
      Left = 117
      Top = 147
      Width = 100
      Height = 22
      EditType = etDate
      Format = 'mm/dd/yyyy'
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      TabOrder = 3
    end
    object rbDescending: TRzRadioButton
      Left = 13
      Top = 186
      Width = 108
      Height = 16
      Caption = 'Sort descending'
      Checked = True
      TabOrder = 6
      TabStop = True
    end
    object rbAscending: TRzRadioButton
      Left = 13
      Top = 206
      Width = 100
      Height = 16
      Caption = 'Sort ascending'
      TabOrder = 7
    end
  end
  inherited fdspReport: TFDStoredProc
    BeforeOpen = fdspReportBeforeOpen
    Filtered = True
    StoredProcName = 'P_RPT_PROJECT'
    ParamData = <
      item
        Position = 1
        Name = 'P_PROJECT_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'R_ITEM_NAME'
        DataType = ftString
        ParamType = ptOutput
        Size = 50
      end
      item
        Position = 3
        Name = 'R_QUANTITY'
        DataType = ftBCD
        Precision = 8
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 4
        Name = 'R_EXPENSE_AMOUNT'
        DataType = ftFMTBcd
        Precision = 10
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 5
        Name = 'R_UNIT_NAME'
        DataType = ftString
        ParamType = ptOutput
        Size = 50
      end
      item
        Position = 6
        Name = 'R_EXPENSE_DATE'
        DataType = ftTimeStamp
        ParamType = ptOutput
      end
      item
        Position = 7
        Name = 'R_RECEIPT'
        DataType = ftString
        ParamType = ptOutput
        Size = 12
      end
      item
        Position = 8
        Name = 'R_SUPPLIER_NAME'
        DataType = ftString
        ParamType = ptOutput
        Size = 50
      end
      item
        Position = 9
        Name = 'R_REMARKS'
        DataType = ftString
        ParamType = ptOutput
        Size = 250
      end>
    object fdspReportR_ITEM_NAME: TStringField
      FieldName = 'R_ITEM_NAME'
      Origin = 'R_ITEM_NAME'
      Size = 50
    end
    object fdspReportR_QUANTITY: TCurrencyField
      FieldName = 'R_QUANTITY'
      Origin = 'R_QUANTITY'
      DisplayFormat = '###,###,##0.00'
    end
    object fdspReportR_EXPENSE_AMOUNT: TBCDField
      FieldName = 'R_EXPENSE_AMOUNT'
      Origin = 'R_EXPENSE_AMOUNT'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object fdspReportR_UNIT_NAME: TStringField
      FieldName = 'R_UNIT_NAME'
      Origin = 'R_UNIT_NAME'
      Size = 50
    end
    object fdspReportR_EXPENSE_DATE: TSQLTimeStampField
      FieldName = 'R_EXPENSE_DATE'
      Origin = 'R_EXPENSE_DATE'
      DisplayFormat = 'mm/dd/yyyy'
    end
    object fdspReportR_RECEIPT: TStringField
      FieldName = 'R_RECEIPT'
      Origin = 'R_RECEIPT'
      Size = 12
    end
    object fdspReportR_SUPPLIER_NAME: TStringField
      FieldName = 'R_SUPPLIER_NAME'
      Origin = 'R_SUPPLIER_NAME'
      Size = 50
    end
    object fdspReportR_REMARKS: TStringField
      FieldName = 'R_REMARKS'
      Origin = 'R_REMARKS'
      Size = 250
    end
  end
end
