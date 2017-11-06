inherited frmAssignRights: TfrmAssignRights
  Caption = 'frmAssignRights'
  ClientHeight = 408
  ClientWidth = 689
  Position = poOwnerFormCenter
  ExplicitWidth = 689
  ExplicitHeight = 408
  PixelsPerInch = 96
  TextHeight = 14
  inherited pnlTitle: TRzPanel
    Width = 689
    ExplicitWidth = 689
    inherited imgClose: TImage
      Left = 668
      ExplicitLeft = 668
    end
    inherited lblCaption: TRzLabel
      Width = 73
      Caption = 'Assign rights'
      ExplicitWidth = 73
    end
  end
  inherited pnlMain: TRzPanel
    Width = 689
    Height = 387
    ExplicitWidth = 689
    ExplicitHeight = 428
    inherited pnlDetail: TRzPanel
      Width = 672
      Height = 338
      ExplicitWidth = 672
      ExplicitHeight = 379
      inherited pcDetail: TRzPageControl
        Width = 670
        Height = 336
        ExplicitWidth = 670
        ExplicitHeight = 377
        FixedDimension = 20
        inherited tsDetail: TRzTabSheet
          ExplicitWidth = 670
          ExplicitHeight = 377
          object chlRights: TRzCheckList
            Left = 16
            Top = 16
            Width = 637
            Height = 304
            Anchors = [akLeft, akTop, akRight, akBottom]
            Color = 14276027
            Columns = 2
            FrameColor = 14276027
            FrameVisible = True
            FramingPreference = fpCustomFraming
            ItemHeight = 17
            TabOrder = 0
            ExplicitHeight = 345
          end
        end
      end
    end
    inherited pnlCancel: TRzPanel
      Left = 630
      Top = 355
      ExplicitLeft = 630
      ExplicitTop = 396
    end
    inherited pnlSave: TRzPanel
      Left = 574
      Top = 355
      ExplicitLeft = 574
      ExplicitTop = 396
    end
  end
end
