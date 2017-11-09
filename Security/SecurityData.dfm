object dmSecurity: TdmSecurity
  OldCreateOrder = False
  Height = 276
  Width = 524
  object fdtUser: TFDTable
    BeforePost = fdtUserBeforePost
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    IndexFieldNames = 'USERNAME'
    Connection = dmApplication.fdcMain
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoSymbols]
    UpdateOptions.UpdateTableName = 'SYSUSER'
    UpdateOptions.AutoIncFields = 'PROJECT_ID'
    TableName = 'SYSUSER'
    Left = 152
    Top = 48
  end
  object dscUser: TDataSource
    DataSet = fdtUser
    Left = 72
    Top = 48
  end
  object fdtRole: TFDTable
    Filtered = True
    FilterOptions = [foCaseInsensitive]
    IndexFieldNames = 'ROLE_CODE'
    Connection = dmApplication.fdcMain
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoSymbols]
    UpdateOptions.UpdateTableName = 'SYSROLE'
    UpdateOptions.AutoIncFields = 'PROJECT_ID'
    TableName = 'SYSROLE'
    Left = 152
    Top = 120
  end
  object dscRole: TDataSource
    DataSet = fdtRole
    Left = 72
    Top = 120
  end
  object fdtRight: TFDTable
    FilterOptions = [foCaseInsensitive]
    IndexFieldNames = 'RIGHT_CODE'
    Connection = dmApplication.fdcMain
    FormatOptions.AssignedValues = [fvStrsTrim, fvSortLocale, fvSortOptions]
    FormatOptions.StrsTrim = False
    FormatOptions.SortLocale = 0
    FormatOptions.SortOptions = [soNoSymbols]
    UpdateOptions.UpdateTableName = 'SYSRIGHT'
    UpdateOptions.AutoIncFields = 'PROJECT_ID'
    TableName = 'SYSRIGHT'
    Left = 352
    Top = 48
  end
  object dscRight: TDataSource
    DataSet = fdtRight
    Left = 272
    Top = 48
  end
  object fdspRights: TFDStoredProc
    Connection = dmApplication.fdcMain
    StoredProcName = 'P_GET_ASSIGNED_RIGHTS'
    Left = 272
    Top = 120
    ParamData = <
      item
        Position = 1
        Name = 'P_ROLE_CODE'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 3
      end
      item
        Position = 2
        Name = 'R_RIGHT_CODE'
        DataType = ftString
        ParamType = ptOutput
        Size = 15
      end
      item
        Position = 3
        Name = 'R_RIGHT_NAME'
        DataType = ftString
        ParamType = ptOutput
        Size = 100
      end
      item
        Position = 4
        Name = 'R_ASSIGNED'
        DataType = ftBoolean
        ParamType = ptOutput
      end>
  end
end
