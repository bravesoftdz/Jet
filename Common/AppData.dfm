object dmApplication: TdmApplication
  OldCreateOrder = False
  Height = 305
  Width = 503
  object fdcMain: TFDConnection
    Params.Strings = (
      'Database=C:\Projects\Jet\_db\JET.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 40
    Top = 32
  end
  object fdtProjects: TFDTable
    AfterClose = fdtProjectsAfterClose
    IndexFieldNames = 'PROJECT_ID'
    Connection = fdcMain
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoSymbols]
    UpdateOptions.UpdateTableName = 'PROJECT'
    UpdateOptions.AutoIncFields = 'PROJECT_ID'
    TableName = 'PROJECT'
    Left = 200
    Top = 32
  end
  object dscProjects: TDataSource
    DataSet = fdtProjects
    Left = 120
    Top = 32
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    Left = 40
    Top = 248
  end
  object fdtSuppliers: TFDTable
    AfterClose = fdtSuppliersAfterClose
    IndexFieldNames = 'SUPPLIER_ID'
    Connection = fdcMain
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoSymbols]
    UpdateOptions.UpdateTableName = 'SUPPLIER'
    TableName = 'SUPPLIER'
    Left = 192
    Top = 104
  end
  object dscSuppliers: TDataSource
    DataSet = fdtSuppliers
    Left = 112
    Top = 104
  end
  object fdtExpenseTypes: TFDTable
    AfterClose = fdtExpenseTypesAfterClose
    IndexFieldNames = 'EXPENSE_ID'
    Connection = fdcMain
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoSymbols]
    UpdateOptions.UpdateTableName = 'T_EXPENSETYPE'
    UpdateOptions.AutoIncFields = 'EXPENSE_ID'
    TableName = 'T_EXPENSETYPE'
    Left = 384
    Top = 32
  end
  object dscExpenseTypes: TDataSource
    DataSet = fdtExpenseTypes
    Left = 304
    Top = 32
  end
  object fdtExpenses: TFDTable
    IndexFieldNames = 'EXPENSE_ENTRY_ID'
    Connection = fdcMain
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoSymbols]
    UpdateOptions.UpdateTableName = 'EXPENSE'
    UpdateOptions.AutoIncFields = 'EXPENSE_ENTRY_ID'
    TableName = 'EXPENSE'
    Left = 376
    Top = 104
  end
  object dscExpenses: TDataSource
    DataSet = fdtExpenses
    Left = 296
    Top = 104
  end
  object fdtClients: TFDTable
    AfterClose = fdtClientsAfterClose
    IndexFieldNames = 'CLIENT_ID'
    Connection = fdcMain
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoSymbols]
    UpdateOptions.UpdateTableName = 'CLIENT'
    UpdateOptions.AutoIncFields = 'CLIENT_ID'
    TableName = 'CLIENT'
    Left = 192
    Top = 184
  end
  object dscClients: TDataSource
    DataSet = fdtClients
    Left = 112
    Top = 184
  end
  object fdqApp: TFDQuery
    Connection = fdcMain
    Left = 40
    Top = 104
  end
end
