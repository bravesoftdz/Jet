unit ProjectMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, Bde.DBTables, RzDBEdit, Vcl.DBCtrls, RzBtnEdt,
  uProject;

type
  TfrmProjectMain = class(TfrmBaseGridDetail)
    Label2: TLabel;
    Label3: TLabel;
    edName: TRzDBEdit;
    Label5: TLabel;
    mmDescription: TRzDBMemo;
    bteClient: TRzButtonEdit;
    Label4: TLabel;
    dteStart: TRzDBDateTimeEdit;
    Label6: TLabel;
    dteEnd: TRzDBDateTimeEdit;
    Label7: TLabel;
    mmAddress: TRzDBMemo;
    Label8: TLabel;
    edBudget: TRzDBNumericEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Project: TProject;
    procedure SearchList; override;
    procedure BindToObject; override;
    function EntryIsValid: boolean; override;
  public
    { Public declarations }
    procedure SetIdentity; override;
  end;

var
  frmProjectMain: TfrmProjectMain;

implementation

{$R *.dfm}

uses
  AppData, AppDialogs, DBUtil;

{ TfrmProjectMain }

procedure TfrmProjectMain.BindToObject;
begin
  Project.Name := edName.Text;
  Project.Description := mmDescription.Text;
  Project.Address := mmAddress.Text;
  Project.StartDate := dteStart.Date;
  Project.EndDate := dteEnd.Date;
  Project.Budget := edBudget.Value;
end;

function TfrmProjectMain.EntryIsValid: boolean;
var
  error: string;
begin
  if not Project.HasClient then
  begin
    if ShowDecisionBox('No client selected. Do you wan to proceed?') = mrNo then Exit;
  end
  else if not Project.HasName then error := 'Please enter project name.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

procedure TfrmProjectMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Project.Free;
end;

procedure TfrmProjectMain.FormCreate(Sender: TObject);
begin
  Project := TProject.Create;
  inherited;
end;

procedure TfrmProjectMain.SearchList;
begin
  inherited;

end;

procedure TfrmProjectMain.SetIdentity;
begin
  SetProjectIdentity;
end;

end.
