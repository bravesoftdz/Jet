inherited frmTestReport: TfrmTestReport
  Caption = 'frmTestReport'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlReport: TRzPanel
    inherited rlPreview: TRLPreview
      inherited rlReport: TRLReport
        object RLBand1: TRLBand
          Left = 38
          Top = 38
          Width = 718
          Height = 27
          object RLDBText1: TRLDBText
            Left = 0
            Top = 9
            Width = 115
            Height = 15
            DataField = 'R_EXPENSE_NAME'
            DataSource = dscReport
            Text = ''
          end
        end
        object RLLabel1: TRLLabel
          Left = 41
          Top = 71
          Width = 76
          Height = 15
          Caption = 'This is a test.'
        end
      end
    end
  end
  inherited pnlDetail: TRzPanel
    inherited bteExpense: TRzButtonEdit
      OnAltBtnClick = nil
      OnButtonClick = nil
    end
    inherited pnlGenerate: TRzPanel
      inherited btnGenerate: TRzShapeButton
        OnClick = nil
      end
    end
    inherited pnlPrint: TRzPanel
      Left = 79
      ExplicitLeft = 79
    end
  end
  inherited fdspReport: TFDStoredProc
    BeforeOpen = fdspReportBeforeOpen
    StoredProcName = 'P_GET_EXPENSES'
    ParamData = <
      item
        Position = 1
        Name = 'P_PROJECT_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 2
        Name = 'R_EXPENSE_ENTRY_ID'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 3
        Name = 'R_EXPENSE_DATE'
        DataType = ftTimeStamp
        ParamType = ptOutput
      end
      item
        Position = 4
        Name = 'R_RECEIPT'
        DataType = ftString
        ParamType = ptOutput
        Size = 12
      end
      item
        Position = 5
        Name = 'R_EXPENSE_ID'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 6
        Name = 'R_EXPENSE_NAME'
        DataType = ftString
        ParamType = ptOutput
        Size = 50
      end
      item
        Position = 7
        Name = 'R_QUANTITY'
        DataType = ftBCD
        Precision = 8
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 8
        Name = 'R_EXPENSE_AMOUNT'
        DataType = ftFMTBcd
        Precision = 10
        NumericScale = 2
        ParamType = ptOutput
      end
      item
        Position = 9
        Name = 'R_SUPPLIER_ID'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 10
        Name = 'R_SUPPLIER_NAME'
        DataType = ftString
        ParamType = ptOutput
        Size = 50
      end
      item
        Position = 11
        Name = 'R_UNIT_ID'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 12
        Name = 'R_UNIT_NAME'
        DataType = ftString
        ParamType = ptOutput
        Size = 50
      end
      item
        Position = 13
        Name = 'R_REMARKS'
        DataType = ftString
        ParamType = ptOutput
        Size = 250
      end
      item
        Position = 14
        Name = 'R_CANCELLED'
        DataType = ftBoolean
        ParamType = ptOutput
      end
      item
        Position = 15
        Name = 'R_PROJECT_ID'
        DataType = ftInteger
        ParamType = ptOutput
      end>
  end
end
