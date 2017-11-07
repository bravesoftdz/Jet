unit ProjectMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, Bde.DBTables, RzDBEdit, Vcl.DBCtrls, RzBtnEdt,
  uProject, uClient, ClientSearch, SetUnboundControlsIntf, FireDac.Comp.Client,
  RzRadChk, RzDBChk;

type
  TfrmProjectMain = class(TfrmBaseGridDetail, ISetUnboundControls)
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
    cbxActive: TRzDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bteClientButtonClick(Sender: TObject);
    procedure bteClientAltBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure grListDblClick(Sender: TObject);
  private
    { Private declarations }
    Project: TProject;
  protected
    procedure SearchList; override;
    procedure BindToObject; override;
    procedure SearchClient;
    procedure SetFieldsFromUnboundControls; override;
    procedure ShowExpenses;

    function EntryIsValid: boolean; override;
    function NewIsAllowed: boolean; override;
    function EditIsAllowed: boolean; override;
  public
    { Public declarations }
    procedure SetIdentity; override;
    procedure SetUnboundControls;
    procedure Cancel; override;
    function Save: boolean; override;
  end;

var
  frmProjectMain: TfrmProjectMain;

implementation

{$R *.dfm}

uses
  AppData, AppDialogs, DBUtil, FormsUtil, ExpenseList, SearchUtil, uUser;

{ TfrmProjectMain }

procedure TfrmProjectMain.BindToObject;
begin
  Project.Id := grList.DataSource.DataSet.FieldByName('PROJECT_ID').AsInteger;
  Project.Name := edName.Text;
  Project.Description := mmDescription.Text;
  Project.Address := mmAddress.Text;
  Project.StartDate := dteStart.Date;
  Project.EndDate := dteEnd.Date;
  Project.Budget := edBudget.Value;
  Project.Status := grList.DataSource.DataSet.FieldByName('STATUS_ID').AsString;
end;

procedure TfrmProjectMain.bteClientAltBtnClick(Sender: TObject);
begin
  Project.ClearClient;
  bteClient.Clear;
end;

procedure TfrmProjectMain.bteClientButtonClick(Sender: TObject);
begin
  inherited;
  SearchClient;
end;

procedure TfrmProjectMain.Cancel;
begin
  inherited;
  SetUnboundControls;
end;

function TfrmProjectMain.EditIsAllowed: boolean;
begin
  Result := User.HasRight(MODIFY_PROJECT,false);
end;

function TfrmProjectMain.EntryIsValid: boolean;
var
  error: string;
begin
  Result := false;

  if not Project.HasClient then
  begin
    if ShowWarningBox('No client selected. Do you want to proceed?') <> mrYes then
    begin
      grList.DataSource.DataSet.Cancel;
      Exit;
    end;
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

procedure TfrmProjectMain.FormShow(Sender: TObject);
begin
  inherited;
  SetUnboundControls;
end;

procedure TfrmProjectMain.grListDblClick(Sender: TObject);
begin
  BindToObject;
  ShowExpenses;
end;

function TfrmProjectMain.NewIsAllowed: boolean;
begin
  Result := User.HasRight(ADD_PROJECT);
end;

procedure TfrmProjectMain.ShowExpenses;
begin
  with TfrmExpenseList.Create(self.Parent,Project) do
  begin
    try
      // WinApi.Windows.SetParent(Handle,self.Parent.Handle);
      ShowModal;
      Free;
    finally

    end;
  end;
end;

function TfrmProjectMain.Save: boolean;
var
  LIndexFieldNames: string;
begin
  Result := inherited Save;

  if Result then
  begin
    // reopen the table to refresh the lookup
    with grList.DataSource.DataSet do
    begin
      LIndexFieldNames := (grList.DataSource.DataSet as TFDTable).IndexFieldNames;

      DisableControls;
      Refresh;

      Close;
      Open;

      SortGrid(grList,LIndexFieldNames);

      Locate('PROJECT_ID',Project.Id,[]);

      EnableControls;
    end;
  end;
end;

procedure TfrmProjectMain.SearchClient;
var
  LClient: TClient;
begin
  LClient := TClient.Create;
  if SearchUtil.SearchClient(self,LClient) then
  begin
    Project.Client := LClient;
    bteClient.Text := LClient.Name;
  end;
end;

procedure TfrmProjectMain.SearchList;
var
  filterStr: string;
begin
  filterStr := 'PROJECT_NAME LIKE ' + QuotedStr('%' + UpperCase(edSearchKey.Text) + '%');
  grList.DataSource.DataSet.Filter := filterStr;
end;

procedure TfrmProjectMain.SetFieldsFromUnboundControls;
begin
  inherited;
  with grList.DataSource.DataSet do
  begin
    if State <> dsInsert then Edit;
    if Project.HasClient then FieldByName('CLIENT_ID').AsInteger := Project.Client.Id
    else FieldByName('CLIENT_ID').AsVariant := null;
  end;
end;

procedure TfrmProjectMain.SetIdentity;
begin
  SetProjectIdentity;
end;

procedure TfrmProjectMain.SetUnboundControls;
var
  LClient: TClient;
begin
  with grList.DataSource.DataSet do
  begin
    if FieldByName('CLIENT_ID').IsNull then
    begin
      Project.ClearClient;
      bteClient.Clear;
    end
    else
    begin
      BindToObject;
      LClient := TClient.Create;

      LClient.Id := FieldByName('CLIENT_ID').AsInteger;
      LClient.Name := FieldByName('CLIENT_NAME').AsString;

      Project.Client := LClient;

      bteClient.Text := LClient.Name;
    end;
  end;
end;

end.
