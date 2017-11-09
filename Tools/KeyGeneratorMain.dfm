object frmKeyGenerator: TfrmKeyGenerator
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Key Generator'
  ClientHeight = 213
  ClientWidth = 347
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  DesignSize = (
    347
    213)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 27
    Width = 33
    Height = 13
    Caption = 'Phrase'
  end
  object Label2: TLabel
    Left = 40
    Top = 88
    Width = 18
    Height = 13
    Caption = 'Key'
  end
  object edPhrase: TEdit
    Left = 40
    Top = 46
    Width = 265
    Height = 21
    TabOrder = 0
  end
  object edKey: TEdit
    Left = 40
    Top = 107
    Width = 265
    Height = 21
    TabOrder = 1
  end
  object btnGenerate: TButton
    Left = 40
    Top = 160
    Width = 265
    Height = 25
    Anchors = [akRight, akBottom]
    Caption = 'Generate key'
    TabOrder = 2
    OnClick = btnGenerateClick
  end
end
