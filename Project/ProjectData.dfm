object dmProject: TdmProject
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 215
  Width = 491
  object fdspExpenses: TFDStoredProc
    BeforeOpen = fdspExpensesBeforeOpen
    AfterOpen = fdspExpensesAfterOpen
    AfterScroll = fdspExpensesAfterScroll
    OnNewRecord = fdspExpensesNewRecord
    Filtered = True
    Connection = dmApplication.fdcMain
    UpdateObject = fduExpenses
    StoredProcName = 'P_GET_EXPENSES'
    Left = 72
    Top = 32
    ParamData = <
      item
        Position = 1
        Name = 'P_PROJECT_ID'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Position = 5
        Name = 'R_EXPENSE_ID'
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
        Name = 'R_ITEM_ID'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 6
        Name = 'R_ITEM_NAME'
        DataType = ftString
        ParamType = ptOutput
        Size = 50
      end
      item
        Position = 7
        Name = 'R_QUANTITY'
        DataType = ftInteger
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
        Position = 11
        Name = 'R_REMARKS'
        DataType = ftString
        ParamType = ptOutput
        Size = 250
      end
      item
        Position = 12
        Name = 'R_CANCELLED'
        DataType = ftBoolean
        ParamType = ptOutput
      end
      item
        Position = 13
        Name = 'R_PROJECT_ID'
        DataType = ftInteger
        ParamType = ptOutput
      end>
    object fdspExpensesR_EXPENSE_DATE: TSQLTimeStampField
      FieldName = 'R_EXPENSE_DATE'
      Origin = 'R_EXPENSE_DATE'
      DisplayFormat = 'mm/dd/yyyy'
    end
    object fdspExpensesR_RECEIPT: TStringField
      FieldName = 'R_RECEIPT'
      Origin = 'R_RECEIPT'
      Size = 12
    end
    object fdspExpensesR_QUANTITY: TCurrencyField
      FieldName = 'R_QUANTITY'
      Origin = 'R_QUANTITY'
      DisplayFormat = '0.00'
    end
    object fdspExpensesR_EXPENSE_AMOUNT: TBCDField
      FieldName = 'R_EXPENSE_AMOUNT'
      Origin = 'R_EXPENSE_AMOUNT'
      DisplayFormat = '###,###,##0.00'
      Precision = 18
      Size = 2
    end
    object fdspExpensesR_SUPPLIER_ID: TIntegerField
      FieldName = 'R_SUPPLIER_ID'
      Origin = 'R_SUPPLIER_ID'
    end
    object fdspExpensesR_SUPPLIER_NAME: TStringField
      FieldName = 'R_SUPPLIER_NAME'
      Origin = 'R_SUPPLIER_NAME'
      Size = 50
    end
    object fdspExpensesR_REMARKS: TStringField
      FieldName = 'R_REMARKS'
      Origin = 'R_REMARKS'
      Size = 250
    end
    object fdspExpensesR_CANCELLED: TBooleanField
      FieldName = 'R_CANCELLED'
      Origin = 'R_CANCELLED'
    end
    object fdspExpensesR_PROJECT_ID: TIntegerField
      FieldName = 'R_PROJECT_ID'
      Origin = 'R_PROJECT_ID'
    end
    object fdspExpensesR_UNIT_ID: TIntegerField
      FieldName = 'R_UNIT_ID'
      Origin = 'R_UNIT_ID'
    end
    object fdspExpensesR_UNIT_NAME: TStringField
      FieldName = 'R_UNIT_NAME'
      Origin = 'R_UNIT_NAME'
      Size = 50
    end
    object fdspExpensesR_EXPENSE_ID: TIntegerField
      FieldName = 'R_EXPENSE_ID'
      Origin = 'R_EXPENSE_ID'
    end
    object fdspExpensesR_ITEM_ID: TIntegerField
      FieldName = 'R_ITEM_ID'
      Origin = 'R_ITEM_ID'
    end
    object fdspExpensesR_ITEM_NAME: TStringField
      FieldName = 'R_ITEM_NAME'
      Origin = 'R_ITEM_NAME'
      Size = 50
    end
  end
  object dscExpenses: TDataSource
    DataSet = fdspExpenses
    Left = 176
    Top = 32
  end
  object fduExpenses: TFDUpdateSQL
    Connection = dmApplication.fdcMain
    InsertSQL.Strings = (
      ' INSERT'
      '    INTO EXPENSE'
      '             (EXPENSE_DATE,'
      '              RECEIPT,'
      '              ITEM_ID,'
      '              QUANTITY,'
      '              EXPENSE_AMOUNT,'
      '              PROJECT_ID,'
      '              SUPPLIER_ID,'
      '              REMARKS,'
      '             CANCELLED)'
      'VALUES (:NEW_R_EXPENSE_DATE,'
      '               :NEW_R_RECEIPT,'
      '               :NEW_R_ITEM_ID,'
      '               :NEW_R_QUANTITY,'
      '               :NEW_R_EXPENSE_AMOUNT,'
      '               :NEW_R_PROJECT_ID,'
      '               :NEW_R_SUPPLIER_ID,'
      '               :NEW_R_REMARKS,'
      '              :NEW_R_CANCELLED)')
    ModifySQL.Strings = (
      'UPDATE EXPENSE'
      'SET EXPENSE_DATE = :NEW_R_EXPENSE_DATE,'
      '      RECEIPT =  :NEW_R_RECEIPT,'
      '      ITEM_ID = :NEW_R_ITEM_ID,'
      '      QUANTITY =  :NEW_R_QUANTITY,'
      '      EXPENSE_AMOUNT =   :NEW_R_EXPENSE_AMOUNT,'
      '      PROJECT_ID = :NEW_R_PROJECT_ID,'
      '      SUPPLIER_ID =  :NEW_R_SUPPLIER_ID,'
      '      REMARKS = :NEW_R_REMARKS,'
      '      CANCELLED =  :NEW_R_CANCELLED'
      'WHERE EXPENSE_ENTRY_ID = :R_EXPENSE_ENTRY_ID')
    Left = 72
    Top = 104
  end
  object fdspItems: TFDStoredProc
    Filtered = True
    Connection = dmApplication.fdcMain
    StoredProcName = 'P_GET_ITEMS'
    Left = 280
    Top = 32
    ParamData = <
      item
        Position = 1
        Name = 'R_ITEM_ID'
        DataType = ftInteger
        ParamType = ptOutput
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
        Name = 'R_ITEM_DESCRIPTION'
        DataType = ftString
        ParamType = ptOutput
        Size = 100
      end>
  end
  object dscItems: TDataSource
    DataSet = fdspItems
    Left = 368
    Top = 32
  end
  object fdspSuppliers: TFDStoredProc
    Filtered = True
    Connection = dmApplication.fdcMain
    StoredProcName = 'P_GET_SUPPLIERS'
    Left = 280
    Top = 104
    ParamData = <
      item
        Position = 1
        Name = 'R_SUPPLIER_ID'
        DataType = ftInteger
        ParamType = ptOutput
      end
      item
        Position = 2
        Name = 'R_SUPPLIER_NAME'
        DataType = ftString
        ParamType = ptOutput
        Size = 50
      end
      item
        Position = 3
        Name = 'R_SUPPLIER_ADDRESS'
        DataType = ftString
        ParamType = ptOutput
        Size = 100
      end>
  end
  object dscSuppliers: TDataSource
    DataSet = fdspSuppliers
    Left = 368
    Top = 104
  end
end
