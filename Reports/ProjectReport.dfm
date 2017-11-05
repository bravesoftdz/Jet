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
          Top = 134
          ExplicitTop = 134
        end
        object RLBand1: TRLBand
          Left = 38
          Top = 113
          Width = 718
          Height = 16
          object RLDBText1: TRLDBText
            Left = 0
            Top = 1
            Width = 86
            Height = 15
            DataField = 'R_ITEM_NAME'
            DataSource = dscReport
            Text = ''
          end
          object RLDBText2: TRLDBText
            Left = 312
            Top = 1
            Width = 39
            Height = 15
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'R_QUANTITY'
            DataSource = dscReport
            Text = ''
          end
          object RLDBText3: TRLDBText
            Left = 493
            Top = 1
            Width = 99
            Height = 15
            Alignment = taRightJustify
            AutoSize = False
            DataField = 'R_EXPENSE_AMOUNT'
            DataSource = dscReport
            DisplayMask = ',0.00'
            Text = ''
          end
          object RLDBText4: TRLDBText
            Left = 358
            Top = 1
            Width = 87
            Height = 15
            DataField = 'R_UNIT_NAME'
            DataSource = dscReport
            DisplayMask = '0.00'
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
            Left = 0
            Top = 1
            Width = 28
            Height = 14
            Align = faLeft
            Caption = 'Item'
          end
          object RLLabel3: TRLLabel
            Left = 329
            Top = 1
            Width = 22
            Height = 15
            Alignment = taRightJustify
            Caption = 'Qty'
          end
          object RLLabel4: TRLLabel
            Left = 545
            Top = 0
            Width = 47
            Height = 15
            Alignment = taRightJustify
            Caption = 'Amount'
          end
          object RLLabel1: TRLLabel
            Left = 358
            Top = 1
            Width = 25
            Height = 15
            Alignment = taRightJustify
            Caption = 'Unit'
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
    inherited pnlPrint: TRzPanel
      Left = 79
      ExplicitLeft = 79
    end
  end
  inherited fdspReport: TFDStoredProc
    BeforeOpen = fdspReportBeforeOpen
    AfterOpen = fdspReportAfterOpen
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
  end
end
