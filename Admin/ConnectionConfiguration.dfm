inherited frmConnectionConfiguration: TfrmConnectionConfiguration
  Caption = 'frmConnectionConfiguration'
  ClientHeight = 281
  ClientWidth = 510
  OnCreate = FormCreate
  ExplicitWidth = 510
  ExplicitHeight = 281
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 510
    ExplicitWidth = 510
    inherited imgClose: TImage
      Left = 489
      ExplicitLeft = 489
    end
    inherited lblCaption: TRzLabel
      Width = 141
      Caption = 'Connection configuration'
      ExplicitWidth = 141
    end
  end
  inherited pnlMain: TRzPanel
    Width = 510
    Height = 260
    ExplicitWidth = 510
    ExplicitHeight = 260
    inherited pnlDetail: TRzPanel
      Width = 493
      Height = 211
      ExplicitWidth = 493
      ExplicitHeight = 211
      inherited pcDetail: TRzPageControl
        Width = 491
        Height = 209
        ExplicitWidth = 491
        ExplicitHeight = 209
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          object Label5: TLabel
            Left = 20
            Top = 20
            Width = 440
            Height = 14
            Caption = 
              'Error: Unable to connect to the database. Check the parameters b' +
              'elow.'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label1: TLabel
            Left = 20
            Top = 75
            Width = 39
            Height = 14
            Caption = 'Server'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label2: TLabel
            Left = 21
            Top = 102
            Width = 79
            Height = 14
            Caption = 'Database file'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 21
            Top = 130
            Width = 59
            Height = 14
            Caption = 'Username'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label4: TLabel
            Left = 20
            Top = 158
            Width = 59
            Height = 14
            Caption = 'Password'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object edServer: TRzEdit
            Left = 113
            Top = 69
            Width = 345
            Height = 22
            Text = ''
            FrameColor = 7827778
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOrder = 0
          end
          object edDatabaseFile: TRzEdit
            Left = 114
            Top = 96
            Width = 345
            Height = 22
            Text = ''
            FrameColor = 7827778
            FrameVisible = True
            FramingPreference = fpCustomFraming
            TabOrder = 1
          end
          object edUsername: TRzEdit
            Left = 114
            Top = 124
            Width = 345
            Height = 22
            Text = ''
            FrameColor = 7827778
            FrameVisible = True
            FramingPreference = fpCustomFraming
            PasswordChar = '*'
            TabOrder = 2
          end
          object edPassword: TRzEdit
            Left = 113
            Top = 152
            Width = 345
            Height = 22
            Text = ''
            FrameColor = 7827778
            FrameVisible = True
            FramingPreference = fpCustomFraming
            PasswordChar = '*'
            TabOrder = 3
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 451
      Top = 228
      ExplicitLeft = 451
      ExplicitTop = 228
    end
    inherited pnlSave: TRzPanel
      Left = 395
      Top = 228
      ExplicitLeft = 395
      ExplicitTop = 228
    end
  end
end
