unit ConnectionConfiguration;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, Vcl.Mask,
  RzEdit;

type
  TfrmConnectionConfiguration = class(TfrmBasePopupDetail)
    Label5: TLabel;
    Label1: TLabel;
    edServer: TRzEdit;
    Label2: TLabel;
    edDatabaseFile: TRzEdit;
    Label3: TLabel;
    edUsername: TRzEdit;
    Label4: TLabel;
    edPassword: TRzEdit;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure BindControlToObject;
  public
    { Public declarations }
  protected
    procedure Save; override;
    procedure Cancel; override;
    function ValidEntry: boolean; override;
  end;

var
  frmConnectionConfiguration: TfrmConnectionConfiguration;

implementation

{$R *.dfm}

{ TfrmConnectionConfiguration }

uses
  uSettings;

procedure TfrmConnectionConfiguration.BindControlToObject;
begin
  with Settings.Database do
  begin
    Server := edServer.Text;
    DatabaseFile := edDatabaseFile.Text;
    User := edUsername.Text;
    Password := edPassword.Text;
  end;
end;

procedure TfrmConnectionConfiguration.Cancel;
begin
  inherited;
  ModalResult := mrCancel;
end;

procedure TfrmConnectionConfiguration.FormCreate(Sender: TObject);
begin
  inherited;
  with Settings.Database do
  begin
    edServer.Text := Server;
    edDatabaseFile.Text := DatabaseFile;
    edUsername.Text := User;
    edPassword.Text := Password;
  end;
end;

procedure TfrmConnectionConfiguration.Save;
begin
  inherited;
  Settings.Save;
end;

function TfrmConnectionConfiguration.ValidEntry: boolean;
begin
  BindControlToObject;
  Result := true;
end;

end.
