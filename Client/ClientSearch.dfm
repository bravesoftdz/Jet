inherited frmClientSearch: TfrmClientSearch
  Caption = 'frmClientSearch'
  ClientHeight = 365
  ClientWidth = 467
  ExplicitWidth = 467
  ExplicitHeight = 365
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 467
    inherited imgClose: TImage
      Left = 446
    end
    inherited lblCaption: TRzLabel
      Width = 73
      Caption = 'Client search'
      ExplicitWidth = 73
    end
  end
  inherited pnlMain: TRzPanel
    Width = 467
    Height = 344
    inherited edSearchKey: TRzEdit
      Width = 410
    end
    inherited pnlSearch: TRzPanel
      Width = 449
      Height = 268
      inherited grSearch: TRzDBGrid
        Width = 447
        Height = 266
        DataSource = dmApplication.dscClients
        Columns = <
          item
            Expanded = False
            FieldName = 'CLIENT_NAME'
            Title.Alignment = taCenter
            Title.Caption = 'Name'
            Title.Font.Charset = DEFAULT_CHARSET
            Title.Font.Color = clWindowText
            Title.Font.Height = -12
            Title.Font.Name = 'Tahoma'
            Title.Font.Style = [fsBold]
            Width = 410
            Visible = True
          end>
      end
    end
    inherited pnlSelect: TRzPanel
      Top = 312
    end
    inherited pnlNew: TRzPanel
      Top = 312
      Visible = False
    end
    inherited pnlCancel: TRzPanel
      Left = 407
      Top = 312
    end
  end
end
