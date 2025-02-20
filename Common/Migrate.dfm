inherited frmMigrate: TfrmMigrate
  Caption = 'frmMigrate'
  ClientHeight = 389
  ClientWidth = 664
  ExplicitWidth = 680
  ExplicitHeight = 428
  PixelsPerInch = 96
  TextHeight = 14
  object lblMigrationStatus: TLabel [0]
    Left = 336
    Top = 79
    Width = 116
    Height = 14
    Caption = 'Migration in progress.'
    Visible = False
  end
  inherited pnlTitle: TRzPanel
    Width = 664
    ExplicitWidth = 664
    inherited lblTitle: TRzLabel
      Width = 79
      Caption = 'Migrate data'
      ExplicitWidth = 79
    end
  end
  object pnlProjects: TRzPanel
    Left = 64
    Top = 68
    Width = 217
    Height = 37
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
    TabOrder = 1
    object btnProjects: TRzShapeButton
      Left = 0
      Top = 0
      Width = 217
      Height = 37
      Hint = 'Migrate projects'
      BorderStyle = bsNone
      Caption = 'Migrate projects'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnProjectsClick
    end
  end
  object pnlSuppliers: TRzPanel
    Left = 64
    Top = 124
    Width = 217
    Height = 37
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
    TabOrder = 2
    object btnSuppliers: TRzShapeButton
      Left = 0
      Top = 0
      Width = 217
      Height = 37
      Hint = 'Migrate suppliers'
      BorderStyle = bsNone
      Caption = 'Migrate suppliers'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnSuppliersClick
    end
  end
  object pnlExpenseTypes: TRzPanel
    Left = 64
    Top = 180
    Width = 217
    Height = 37
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
    TabOrder = 3
    object btnExpenseTypes: TRzShapeButton
      Left = 0
      Top = 0
      Width = 217
      Height = 37
      Hint = 'Migrate expense types'
      BorderStyle = bsNone
      Caption = 'Migrate expense types'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnExpenseTypesClick
    end
  end
  object pnlExpenses: TRzPanel
    Left = 64
    Top = 236
    Width = 217
    Height = 37
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
    TabOrder = 4
    object btnExpenses: TRzShapeButton
      Left = 0
      Top = 0
      Width = 217
      Height = 37
      Hint = 'Migrate expenses'
      BorderStyle = bsNone
      Caption = 'Migrate expenses'
      ParentShowHint = False
      ShowHint = True
      OnClick = btnExpensesClick
    end
  end
end
