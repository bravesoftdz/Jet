inherited frmProjectSearch: TfrmProjectSearch
  Caption = 'frmProjectSearch'
  ClientHeight = 365
  ClientWidth = 627
  ExplicitWidth = 627
  ExplicitHeight = 365
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 627
    inherited imgClose: TImage
      Left = 606
    end
    inherited lblCaption: TRzLabel
      Width = 82
      Caption = 'Project search'
      ExplicitWidth = 82
    end
  end
  inherited pnlMain: TRzPanel
    Width = 627
    Height = 344
    inherited edSearchKey: TRzEdit
      Width = 570
    end
    inherited pnlSearch: TRzPanel
      Width = 609
      Height = 268
      inherited grSearch: TRzDBGrid
        Width = 607
        Height = 266
        DataSource = dmApplication.dscProjects
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
            FieldName = 'PROJECT_DESCRIPTION'
            Title.Alignment = taCenter
            Title.Caption = 'Description'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 300
            Visible = True
          end>
      end
    end
    inherited pnlSelect: TRzPanel
      Top = 312
    end
    inherited pnlNew: TRzPanel
      Top = 312
    end
    inherited pnlCancel: TRzPanel
      Left = 567
      Top = 312
    end
  end
end
