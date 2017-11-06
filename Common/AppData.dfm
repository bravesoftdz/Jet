object dmApplication: TdmApplication
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 305
  Width = 678
  object fdcMain: TFDConnection
    Params.Strings = (
      'Database=C:\Projects\Jet\_db\JET.FDB'
      'User_Name=sysdba'
      'Password=masterkey'
      'DriverID=FB')
    LoginPrompt = False
    BeforeConnect = fdcMainBeforeConnect
    Left = 40
    Top = 32
  end
  object fdtProjects: TFDTable
    AfterClose = fdtProjectsAfterClose
    AfterScroll = fdtProjectsAfterScroll
    OnNewRecord = fdtProjectsNewRecord
    Filtered = True
    FilterOptions = [foCaseInsensitive]
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
    object fdtProjectsPROJECT_ID: TFDAutoIncField
      FieldName = 'PROJECT_ID'
      Origin = 'PROJECT_ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      IdentityInsert = True
    end
    object fdtProjectsCLIENT_ID: TIntegerField
      FieldName = 'CLIENT_ID'
      Origin = 'CLIENT_ID'
    end
    object fdtProjectsPROJECT_NAME: TStringField
      FieldName = 'PROJECT_NAME'
      Origin = 'PROJECT_NAME'
      Required = True
      Size = 50
    end
    object fdtProjectsPROJECT_DESCRIPTION: TStringField
      FieldName = 'PROJECT_DESCRIPTION'
      Origin = 'PROJECT_DESCRIPTION'
      Size = 100
    end
    object fdtProjectsSTART_DATE: TSQLTimeStampField
      FieldName = 'START_DATE'
      Origin = 'START_DATE'
    end
    object fdtProjectsEND_DATE: TSQLTimeStampField
      FieldName = 'END_DATE'
      Origin = 'END_DATE'
    end
    object fdtProjectsADDRESS: TStringField
      FieldName = 'ADDRESS'
      Origin = 'ADDRESS'
      Size = 150
    end
    object fdtProjectsBUDGET: TBCDField
      FieldName = 'BUDGET'
      Origin = 'BUDGET'
      Precision = 18
      Size = 2
    end
    object fdtProjectsSTATUS_ID: TStringField
      FieldName = 'STATUS_ID'
      Origin = 'STATUS_ID'
      Required = True
      FixedChar = True
      Size = 1
    end
    object fdtProjectsOLD_PROJECT_ID: TIntegerField
      FieldName = 'OLD_PROJECT_ID'
      Origin = 'OLD_PROJECT_ID'
    end
    object fdtProjectsCLIENT_NAME: TStringField
      FieldKind = fkLookup
      FieldName = 'CLIENT_NAME'
      LookupDataSet = fdtClients
      LookupKeyFields = 'CLIENT_ID'
      LookupResultField = 'CLIENT_NAME'
      KeyFields = 'CLIENT_ID'
      Size = 100
      Lookup = True
    end
  end
  object dscProjects: TDataSource
    DataSet = fdtProjects
    Left = 120
    Top = 32
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Console'
    ScreenCursor = gcrNone
    Left = 40
    Top = 248
  end
  object fdtSuppliers: TFDTable
    AfterClose = fdtSuppliersAfterClose
    Filtered = True
    IndexFieldNames = 'SUPPLIER_ID'
    Connection = fdcMain
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoSymbols]
    UpdateOptions.UpdateTableName = 'SUPPLIER'
    UpdateOptions.AutoIncFields = 'SUPPLIER_ID'
    TableName = 'SUPPLIER'
    Left = 200
    Top = 104
  end
  object dscSuppliers: TDataSource
    DataSet = fdtSuppliers
    Left = 112
    Top = 104
  end
  object fdtItem: TFDTable
    AfterClose = fdtItemAfterClose
    Filtered = True
    IndexFieldNames = 'ITEM_ID'
    Connection = fdcMain
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoSymbols]
    UpdateOptions.UpdateTableName = 'ITEM'
    UpdateOptions.AutoIncFields = 'ITEM_ID'
    TableName = 'ITEM'
    Left = 384
    Top = 32
  end
  object dscItem: TDataSource
    DataSet = fdtItem
    Left = 304
    Top = 32
  end
  object fdtExpenses: TFDTable
    IndexFieldNames = 'EXPENSE_ID'
    Connection = fdcMain
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoSymbols]
    UpdateOptions.UpdateTableName = 'EXPENSE'
    UpdateOptions.AutoIncFields = 'EXPENSE_ID'
    TableName = 'EXPENSE'
    Left = 384
    Top = 104
  end
  object dscExpenses: TDataSource
    DataSet = fdtExpenses
    Left = 296
    Top = 104
  end
  object fdtClients: TFDTable
    AfterClose = fdtClientsAfterClose
    Filtered = True
    IndexFieldNames = 'CLIENT_ID'
    Connection = fdcMain
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoSymbols]
    UpdateOptions.UpdateTableName = 'CLIENT'
    UpdateOptions.AutoIncFields = 'CLIENT_ID'
    TableName = 'CLIENT'
    Left = 200
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
  object fdtUnits: TFDTable
    Filtered = True
    IndexFieldNames = 'UNIT_ID'
    Connection = fdcMain
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoSymbols]
    UpdateOptions.UpdateTableName = 'T_UNIT'
    UpdateOptions.AutoIncFields = 'UNIT_ID'
    TableName = 'T_UNIT'
    Left = 384
    Top = 184
  end
  object dscUnits: TDataSource
    DataSet = fdtUnits
    Left = 296
    Top = 184
  end
end
