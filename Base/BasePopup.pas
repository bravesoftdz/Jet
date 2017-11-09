unit BasePopup;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseForm, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, RzPanel, Vcl.StdCtrls, RzLabel;

type
  TfrmBasePopup = class(TfrmBase)
    pnlTitle: TRzPanel;
    imgClose: TImage;
    pnlMain: TRzPanel;
    lblCaption: TRzLabel;
    procedure imgCloseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBasePopup: TfrmBasePopup;

implementation

{$R *.dfm}

procedure TfrmBasePopup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
end;

procedure TfrmBasePopup.FormKeyPress(Sender: TObject; var Key: Char);
begin
  // escape key
  if Key = #27 then  ModalResult := mrClose;
end;

procedure TfrmBasePopup.imgCloseClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrClose;
end;

end.
