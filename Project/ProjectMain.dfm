inherited frmProjectMain: TfrmProjectMain
  Caption = 'frmProjectMain'
  ClientHeight = 513
  Position = poOwnerFormCenter
  ExplicitHeight = 552
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblTitle: TRzLabel
      Width = 66
      Caption = 'Project list'
      ExplicitWidth = 66
    end
  end
  inherited pnlList: TRzPanel
    Height = 442
    inherited grList: TRzDBGrid
      Height = 440
      DataSource = dmApplication.dscProjects
      OnDblClick = grListDblClick
      Columns = <
        item
          Expanded = False
          FieldName = 'PROJECT_NAME'
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
          FieldName = 'CLIENT_NAME'
          Title.Alignment = taCenter
          Title.Caption = 'Client'
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
          FieldName = 'PROJECT_DESCRIPTION'
          Title.Alignment = taCenter
          Title.Caption = 'Description'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -12
          Title.Font.Name = 'Tahoma'
          Title.Font.Style = [fsBold]
          Width = 260
          Visible = True
        end>
    end
  end
  inherited pnlDetail: TRzPanel
    Height = 470
    object Label2: TLabel [0]
      Left = 13
      Top = 31
      Width = 35
      Height = 14
      Caption = 'Client'
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
    object Label5: TLabel [2]
      Left = 13
      Top = 127
      Width = 69
      Height = 14
      Caption = 'Description'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel [3]
      Left = 13
      Top = 287
      Width = 64
      Height = 14
      Caption = 'Start date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel [4]
      Left = 141
      Top = 287
      Width = 55
      Height = 14
      Caption = 'End date'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel [5]
      Left = 13
      Top = 207
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
    object Label8: TLabel [6]
      Left = 13
      Top = 335
      Width = 45
      Height = 14
      Caption = 'Budget'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object urlExpenseList: TRzURLLabel [7]
      Left = 13
      Top = 389
      Width = 64
      Height = 14
      Caption = 'Expense list'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = 7038525
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = urlExpenseListClick
    end
    inherited pnlAdd: TRzPanel
      Top = 440
    end
    inherited pnlSave: TRzPanel
      Top = 440
      TabOrder = 10
    end
    inherited pnlCancel: TRzPanel
      Left = 163
      Top = 440
      TabOrder = 11
      ExplicitLeft = 163
    end
    object edName: TRzDBEdit
      Tag = 1
      Left = 13
      Top = 99
      Width = 249
      Height = 22
      DataSource = dmApplication.dscProjects
      DataField = 'PROJECT_NAME'
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
    object mmDescription: TRzDBMemo
      Tag = 1
      Left = 13
      Top = 147
      Width = 249
      Height = 55
      DataField = 'PROJECT_DESCRIPTION'
      DataSource = dmApplication.dscProjects
      TabOrder = 4
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 15794175
      ReadOnlyColorOnFocus = True
      TabOnEnter = True
    end
    object bteClient: TRzButtonEdit
      Tag = 1
      Left = 13
      Top = 51
      Width = 249
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
      OnAltBtnClick = bteClientAltBtnClick
      OnButtonClick = bteClientButtonClick
    end
    object dteStart: TRzDBDateTimeEdit
      Tag = 1
      Left = 13
      Top = 307
      Width = 121
      Height = 22
      DataSource = dmApplication.dscProjects
      DataField = 'START_DATE'
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 15794175
      TabOrder = 6
      EditType = etDate
      Format = 'mm/dd/yyyy'
    end
    object dteEnd: TRzDBDateTimeEdit
      Tag = 1
      Left = 141
      Top = 307
      Width = 121
      Height = 22
      DataSource = dmApplication.dscProjects
      DataField = 'END_DATE'
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 15794175
      TabOrder = 7
      EditType = etDate
      Format = 'mm/dd/yyyy'
    end
    object mmAddress: TRzDBMemo
      Tag = 1
      Left = 13
      Top = 227
      Width = 249
      Height = 55
      DataField = 'ADDRESS'
      DataSource = dmApplication.dscProjects
      TabOrder = 5
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 15794175
      ReadOnlyColorOnFocus = True
      TabOnEnter = True
    end
    object edBudget: TRzDBNumericEdit
      Tag = 1
      Left = 13
      Top = 355
      Width = 121
      Height = 22
      DataSource = dmApplication.dscProjects
      DataField = 'BUDGET'
      Alignment = taLeftJustify
      FrameColor = 7038525
      FrameVisible = True
      FramingPreference = fpCustomFraming
      ReadOnlyColor = 15794175
      TabOrder = 8
      IntegersOnly = False
      DisplayFormat = '###,###,##0.00'
    end
    object cbxActive: TRzDBCheckBox
      Tag = 1
      Left = 141
      Top = 361
      Width = 53
      Height = 16
      DataField = 'STATUS_ID'
      DataSource = dmApplication.dscProjects
      NullAsUnchecked = False
      ValueChecked = 'O'
      ValueUnchecked = 'C'
      Caption = 'Active'
      FrameColor = 7038525
      TabOrder = 9
    end
    object pnlDelete: TRzPanel
      Left = 218
      Top = 440
      Width = 50
      Height = 22
      Anchors = [akRight, akBottom]
      BorderOuter = fsNone
      BorderColor = 6577975
      BorderWidth = 1
      Color = clRed
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      ExplicitTop = 401
      object sbtnDelete: TRzShapeButton
        Left = 0
        Top = 0
        Width = 50
        Height = 22
        Hint = 'Cancel'
        BorderStyle = bsNone
        Caption = 'Delete'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnDeleteClick
      end
    end
  end
end
