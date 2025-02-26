unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.ExtCtrls, RzPanel,
  JvPageList, JvNavigationPane, JvExControls, RzButton, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, AppConstants, Vcl.StdCtrls, RzLabel,
  JvImageList, RzStatus, DockIntf, RzLstBox,  Vcl.AppEvnts,
  Generics.Collections, RzTabs, Vcl.Imaging.pngimage, System.Actions, Vcl.ActnList, Vcl.Buttons;

type
  TfrmMain = class(TForm,IDock)
    pnlTitle: TRzPanel;
    imgClose: TImage;
    lblCaption: TRzLabel;
    pnlMain: TRzPanel;
    pnlDockMain: TRzPanel;
    pnlProjects: TRzPanel;
    imgProjects: TImage;
    lblWelcome: TRzLabel;
    pnlSave: TRzPanel;
    imgSave: TImage;
    pnlCancel: TRzPanel;
    imgCancel: TImage;
    pnlSuppliers: TRzPanel;
    imgSuppliers: TImage;
    pnlSecurity: TRzPanel;
    imgSecurity: TImage;
    pnlReports: TRzPanel;
    imgReports: TImage;
    pnlMigrate: TRzPanel;
    imgMigrate: TImage;
    mmMain: TMainMenu;
    File1: TMenuItem;
    Save1: TMenuItem;
    alMain: TActionList;
    acSave: TAction;
    acAddClient: TAction;
    Newclient1: TMenuItem;
    acNewLoan: TAction;
    Newloan1: TMenuItem;
    acGenericNew: TAction;
    New1: TMenuItem;
    lblDate: TLabel;
    lblVersion: TLabel;
    Client1: TMenuItem;
    Loan1: TMenuItem;
    Selectclient1: TMenuItem;
    acSelectClient: TAction;
    pnlItems: TRzPanel;
    imgItems: TImage;
    Newpayment1: TMenuItem;
    acNewPayment: TAction;
    Payment1: TMenuItem;
    Selectclient2: TMenuItem;
    acAddActiveLoan: TAction;
    pnlClients: TRzPanel;
    imgClients: TImage;
    pnlUnits: TRzPanel;
    imgUnit: TImage;
    Label1: TLabel;
    Label2: TLabel;
    imgMinimise: TImage;
    procedure FormCreate(Sender: TObject);
    procedure pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgCloseClick(Sender: TObject);
    procedure imgProjectsMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure imgProjectsMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Save1Click(Sender: TObject);
    procedure imgSaveClick(Sender: TObject);
    procedure imgCancelClick(Sender: TObject);
    procedure acGenericNewExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure imgMigrateClick(Sender: TObject);
    procedure imgSuppliersClick(Sender: TObject);
    procedure imgItemsClick(Sender: TObject);
    procedure imgProjectsClick(Sender: TObject);
    procedure imgClientsClick(Sender: TObject);
    procedure imgUnitClick(Sender: TObject);
    procedure imgReportsClick(Sender: TObject);
    procedure imgSecurityClick(Sender: TObject);
    procedure imgMinimiseClick(Sender: TObject);
  private
    { Private declarations }
    DOCKED_FORM: TForms;
    procedure Save(retry: boolean = true);
    procedure GetActiveForm(var frm: TForm);
  public
    { Public declarations }
    procedure DockForm(const fm: TForms; const title: string = '');
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses
  AppDialogs, SaveIntf, FormsUtil, NewIntf, ProjectMain, Migrate, SupplierMain,
  ItemMain, ClientMain, SetIdentityIntf, AppGlobal, UnitMain, ProjectReport,
  uUser, SecurityMain;

procedure TfrmMain.pnlTitleMouseDown(Sender: TObject; Button: TMouseButton;
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

procedure TfrmMain.Save1Click(Sender: TObject);
begin
  imgSave.OnClick(Sender);
end;

procedure TfrmMain.DockForm(const fm: TForms; const title: string);
var
  frm: TForm;
  control: integer;
begin
  if (pnlDockMain.ControlCount = 0) or (fm <> DOCKED_FORM) then
  begin
    control := 0;

    while control < pnlDockMain.ControlCount do
    begin
      if pnlDockMain.Controls[control] is TForm then
      begin
        (pnlDockMain.Controls[control] as TForm).Close;
        (pnlDockMain.Controls[control] as TForm).Free;
      end;

      Inc(control);
    end;

    // instantiate form
    case fm of
      fmClientMain: frm := TfrmClientMain.Create(Application);
      fmProjectMain: frm := TfrmProjectMain.Create(Application);
      fmSupplierMain: frm := TfrmSupplierMain.Create(Application);
      fmItemMain: frm := TfrmItemMain.Create(Application);
      fmUnitMain: frm := TfrmUnitMain.Create(Application);
      fmSecurityMain: frm := TfrmSecurityMain.Create(Application);
      fmProjectReport: frm := TfrmProjectReport.Create(Application);
      fmMigrate: frm := TfrmMigrate.Create(Application);
      else
        frm := TForm.Create(Application);
    end;

    DOCKED_FORM := fm;

    frm.ManualDock(pnlDockMain);
    frm.Show;
  end
  else ShowInfoBox('Window is already open.');
end;

procedure TfrmMain.GetActiveForm(var frm: TForm);
begin
  frm := nil;
  // check if a popup is active
  if Application.MainForm <> Screen.ActiveForm then frm := Screen.ActiveForm
  else if pnlDockMain.ControlCount > 0 then frm := pnlDockMain.Controls[0] as TForm;
end;

procedure TfrmMain.Save(retry: boolean);
var
  intf: ISave;
  identIntf: ISetIdentity;
  frm: TForm;
begin
  try
    GetActiveForm(frm);

    if Assigned(frm) then
      if Supports(frm, ISave, intf) then
        if intf.Save then ShowConfirmationBox;
  except
    on e: Exception do
    begin
      // try to reset the identity column
      if (Supports(frm, ISetIdentity, identIntf)) and retry then
      begin
        identIntf.SetIdentity;
        Save(false);
      end
      else ShowErrorBox(e.Message);
    end;
  end;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Height := 700; // for some reason form keeps on resizing...

  // hide menu bar
  Self.Menu := nil;
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  lblCaption.Caption := app.AppName;

  if not User.IsSuperUser then lblWelcome.Caption := 'Welcome back ' + User.Name + '.';

  lblDate.Caption := 'Today is ' + FormatDateTime('mmmm dd, yyyy.',app.AppDate);
  lblVersion.Caption :=  'Version ' + app.Version;
end;

procedure TfrmMain.imgProjectsClick(Sender: TObject);
begin
  DockForm(fmProjectMain);
end;

procedure TfrmMain.imgProjectsMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ButtonDown(Sender);
end;

procedure TfrmMain.imgProjectsMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  ButtonUp(Sender);
end;

procedure TfrmMain.imgReportsClick(Sender: TObject);
begin
  DockForm(fmProjectReport);
end;

procedure TfrmMain.imgCancelClick(Sender: TObject);
var
  intf: ISave;
  frm: TForm;
begin
  try
    GetActiveForm(frm);
    if Assigned(frm) then
      if Supports(frm,ISave,intf) then
        intf.Cancel;
  except
    on e:Exception do
      ShowErrorBox(e.Message);
  end;
end;

procedure TfrmMain.imgCloseClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.imgItemsClick(Sender: TObject);
begin
  DockForm(fmItemMain);
end;

procedure TfrmMain.imgMigrateClick(Sender: TObject);
begin
  DockForm(fmMigrate);
end;

procedure TfrmMain.imgMinimiseClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TfrmMain.imgSaveClick(Sender: TObject);
begin
  Save;
end;

procedure TfrmMain.imgSecurityClick(Sender: TObject);
begin
  DockForm(fmSecurityMain);
end;

procedure TfrmMain.imgSuppliersClick(Sender: TObject);
begin
  DockForm(fmSupplierMain);
end;

procedure TfrmMain.imgUnitClick(Sender: TObject);
begin
  DockForm(fmUnitMain);
end;

procedure TfrmMain.acGenericNewExecute(Sender: TObject);
var
  intf: INew;
  frm: TForm;
begin
  try
    GetActiveForm(frm);
    if Assigned(frm) then
      if Supports(frm,INew,intf) then
        intf.New;
  except
    on e:Exception do
      ShowErrorBox(e.Message);
  end;
end;

procedure TfrmMain.imgClientsClick(Sender: TObject);
begin
  DockForm(fmClientMain);
end;

end.
