unit Login;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, BasePopup, BaseForm, Vcl.StdCtrls, RzLabel, System.UITypes,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, Vcl.Mask, RzEdit, RzPrgres,
  RzButton, FireDAC.Comp.Client;

type
  TfrmLogin = class(TfrmBasePopup)
    Label4: TLabel;
    Label5: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    edUsername: TRzEdit;
    edPassword: TRzEdit;
    lblErrorMessage: TLabel;
    imgLogo: TImage;
    prbStatus: TRzProgressBar;
    lblStatus: TLabel;
    pnlClose: TRzPanel;
    btnClose: TRzShapeButton;
    pnlLogin: TRzPanel;
    btnLogin: TRzShapeButton;
    lblVersion: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edUsernameChange(Sender: TObject);
    procedure edPasswordKeyPress(Sender: TObject; var Key: Char);
    procedure btnCloseClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure LoadModules;
    procedure LoadSettings;
    procedure SettingAccessRights;
    procedure PauseWindow(timer: integer);
    function UserExists: boolean;
  public
    { Public declarations }
    class function LoggedIn: boolean;
  end;

var
  frmLogin: TfrmLogin;

const
  LIMITGLOBAL = 6;
  TICK = 80;
  INCREMENT = 16;

implementation

{$R *.dfm}

uses
  AppData, AppDialogs, AppUtil, AppGlobal, uUser;

class function TfrmLogin.LoggedIn: boolean;
begin
  with TfrmLogin.Create(nil) do
  try
    Result := ShowModal = mrOk;
  finally
    Free;
  end;
end;

function TfrmLogin.UserExists: boolean;
var
  username: string;
var
  userQuery: TFDQuery;
begin
  userQuery := TFDQuery.Create(nil);
  with dmApplication do
  begin
    try
      try
        userQuery.Connection := fdcMain;

        userQuery.SQL.Text := 'SELECT U.*, ' +
                                      'RR.RIGHT_CODE, ' +
                                      'U.USERNAME ' +
                                'FROM SYSUSER U ' +
                           'LEFT JOIN SYSROLERIGHT RR ' +
                                  'ON RR.ROLE_CODE = U.ROLE_CODE ' +
                               'WHERE USERNAME = ' + QuotedStr(edUsername.Text) +
                                 'AND PASSKEY = ' + QuotedStr(edPassword.Text);

        userQuery.Connection.Open;
        userQuery.Open;

        if userQuery.RecordCount > 0 then
        begin
          Result := true;

          // set user object
          User := TUser.Create;

          User.Name := Trim(edUsername.Text);
          User.Passkey := Trim(edPassword.Text);

          // rights
          while not userQuery.Eof  do
          begin
            User.AddRight(userQuery.FieldByName('RIGHT_CODE').AsString);
            userQuery.Next;
          end;
        end;
      except
        on E: Exception do lblErrorMessage.Caption := 'Unable to authenticate user.';
      end;
    finally
      userQuery.Close;
      userQuery.Free;
    end;
  end;
end;

procedure TfrmLogin.edPasswordKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then btnLogin.Click;
end;

procedure TfrmLogin.edUsernameChange(Sender: TObject);
begin
  inherited;
  lblErrorMessage.Visible := false;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
begin
  inherited;
  dmApplication := TdmApplication.Create(Application);

  lblVersion.Caption := 'Version ' + GetAppVersionStr(ParamStr(0));;
end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
  prbStatus.Visible := false;
end;

procedure TfrmLogin.PauseWindow(timer: integer);
var
  StartTimer: integer;
  EndTimer: Integer;
begin
  // wait a few miliseconds
  StartTimer := GetTickCount;
  EndTimer   := StartTimer + timer;

  while StartTimer < EndTimer do
    StartTimer := GetTickCount;
end;

procedure TfrmLogin.pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbLeft then
  begin
    ReleaseCapture;
    Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;

procedure TfrmLogin.btnLoginClick(Sender: TObject);
begin
  if UserExists then
  begin
    try
      try
        edUsername.Enabled := false;
        edPassword.Enabled := false;
        btnLogin.Enabled := false;
        btnClose.Enabled := false;

        lblVersion.Visible := false;

        lblStatus.Visible := true;
        prbStatus.Visible := true;
        lblErrorMessage.Visible := false;

        self.Update;

        App := TApp.Create;

        LoadModules;
        SettingAccessRights;
        LoadSettings;

        ModalResult := 1;
      except
        on e: Exception do
        begin
          ShowErrorBox('An exception has been detected and the application needs to close. ' +
            'Please contact the administrator with the message below.' + #13#10 + #13#10 +
            e.Message);
          Application.Terminate;
        end;
      end;
    finally

    end;
  end
  else
  begin
    lblErrorMessage.Visible := true;
    edUsername.SetFocus;
  end;
end;

procedure TfrmLogin.btnCloseClick(Sender: TObject);
begin
  inherited;
  ModalResult := mrAbort;
end;

procedure TfrmLogin.LoadSettings;
var
  limit: integer;
  i: integer;
  timer: integer;
begin
  limit := LIMITGLOBAL;
  i := 1;
  timer := TICK;

  prbStatus.Percent := 0;
  lblStatus.Caption := 'Loading settings.';
  self.Update;

//  with dmApplication.dstConfig do
//  begin
//    Open;
//
    app.AppDate := Date;
//
//    // location code
//    Locate('sysconfig_code','LOCATION_CODE',[]);
//    ifn.LocationCode := FieldbyName('sysconfig_value').AsString;
//
//    // location prefix
//    Locate('sysconfig_code','LOCATION_PREFIX',[]);
//    ifn.LocationPrefix := FieldbyName('sysconfig_value').AsString;
//
//    Close;
//
//    // photo path
//    ifn.PhotoPath := ExtractFilePath(Application.ExeName) + 'photos\';
//    if not DirectoryExists(ifn.PhotoPath) then
//      CreateDir(ifn.PhotoPath);
//
//    // application images path
//    ifn.AppImagesPath := ExtractFilePath(Application.ExeName) + '_images\';
//
//    // version
    app.Version := GetAppVersionStr(ParamStr(0));
//
//    // get all locations
//    GetLocations;
//  end;

  while i <= limit do
  begin
    PauseWindow(timer);
    prbStatus.Percent := prbStatus.Percent + INCREMENT;
    Application.ProcessMessages;
    self.Update;

    Inc(i);
  end;
end;

procedure TfrmLogin.LoadModules;
var
  limit: integer;
  i: integer;
  timer: integer;
begin
  limit := LIMITGLOBAL;
  i := 1;
  timer := TICK;

  lblStatus.Caption := 'Loading modules.';
  while i <= limit do
  begin
    PauseWindow(timer);
    prbStatus.Percent := prbStatus.Percent + INCREMENT;
    Application.ProcessMessages;
    self.Update;

    Inc(i);
  end;
end;

procedure TfrmLogin.SettingAccessRights;
var
  limit, i, timer: integer;
  right: string;
begin
  limit := LIMITGLOBAL;
  i := 1;
  timer := TICK;

  prbStatus.Percent := 0;
  lblStatus.Caption := 'Setting user rights.';
  while i <= limit do
  begin
    PauseWindow(timer);
    prbStatus.Percent := prbStatus.Percent + INCREMENT;
    Application.ProcessMessages;
    self.Update;

    Inc(i);
  end;

//  with dmApplication.dstUser do
//  begin
//    ifn.User.UserId := FieldByName('id_num').AsString;
//    ifn.User.FirstName := FieldByName('employee_firstname').AsString;
//    ifn.User.LastName := FieldByName('employee_lastname').AsString;
//
//    while not Eof do
//    begin
//      right := FieldbyName('privilege_code').AsString;
//      ifn.User.SetRight(right);
//      Next;
//    end;
//  end;
end;

end.
