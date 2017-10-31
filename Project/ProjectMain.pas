unit ProjectMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, Bde.DBTables, RzDBEdit, Vcl.DBCtrls, RzBtnEdt,
  uProject, uClient, ClientSearch, SetUnboundControlsIntf;

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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure bteClientButtonClick(Sender: TObject);
    procedure bteClientAltBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Project: TProject;
  protected
    procedure SearchList; override;
    procedure BindToObject; override;
    procedure SearchClient;
    procedure SetFieldsFromUnboundControls; override;

    function EntryIsValid: boolean; override;
    function Save: boolean; override;
  public
    { Public declarations }
    procedure SetIdentity; override;
    procedure SetUnboundControls;
  end;

var
  frmProjectMain: TfrmProjectMain;

implementation

{$R *.dfm}

uses
  AppData, AppDialogs, DBUtil, FormsUtil;

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

function TfrmProjectMain.EntryIsValid: boolean;
var
  error: string;
begin
  Result := false;

  if not Project.HasClient then
  begin
    if ShowDecisionBox('No client selected. Do you want to proceed?') = mrNo then Exit;
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

function TfrmProjectMain.Save: boolean;
var
  id:integer;
begin
  inherited Save;

  if Result then
  begin
    // reopen the table to refresh the lookup
    with grList.DataSource.DataSet do
    begin
      Refresh;
      id := FieldByName('PROJECT_ID').AsInteger;
      Close;
      Open;
      SortGrid(grList,grList.Columns[0]);
      Locate('PROJECT_ID',id,[]);
    end;
  end;
end;

procedure TfrmProjectMain.SearchClient;
var
  LClient: TClient;
begin
  LClient := TClient.Create;
  try
    with TfrmClientSearch.Create(self,LClient) do
    begin
      ShowModal;
      if ModalResult = mrOk then
      begin
        Project.Client := LClient;
        bteClient.Text := LClient.Name;
      end;
    end;
  except
    on E: Exception do
    begin
      LClient.Free;
      ShowErrorBox(E.Message);
    end;
  end;
end;

procedure TfrmProjectMain.SearchList;
begin
  inherited;

end;

procedure TfrmProjectMain.SetFieldsFromUnboundControls;
begin
  inherited;
  with grList.DataSource.DataSet do
  begin
    Edit;
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
      LClient := TClient.Create;

      LClient.Id := FieldByName('CLIENT_ID').AsInteger;
      LClient.Name := FieldByName('CLIENT_NAME').AsString;

      Project.Client := LClient;

      bteClient.Text := LClient.Name;
    end;
  end;
end;

end.
