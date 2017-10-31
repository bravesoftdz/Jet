inherited frmClientSearch: TfrmClientSearch
  Caption = 'frmClientSearch'
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    inherited lblCaption: TRzLabel
      Width = 73
      Caption = 'Client search'
      ExplicitWidth = 73
    end
  end
  inherited pnlMain: TRzPanel
    inherited pnlSearch: TRzPanel
      inherited grSearch: TRzDBGrid
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
            Width = 265
            Visible = True
          end>
      end
    end
  end
end
