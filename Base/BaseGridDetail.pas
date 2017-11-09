unit BaseGridDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, RzEdit, RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, RzButton, System.ImageList, Vcl.ImgList,
  SaveIntf, NewIntf, RzDBEdit, SetIdentityIntf, RzDBCmbo, RzDBChk, RzBtnEdt;

type
  TfrmBaseGridDetail = class(TfrmBaseDocked,ISave,INew,ISetIdentity)
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    pnlSearch: TRzPanel;
    Label1: TLabel;
    edSearchKey: TRzEdit;
    pnlDetail: TRzPanel;
    pnlAdd: TRzPanel;
    pnlDetailHead: TRzPanel;
    lblDetailHeadCaption: TRzLabel;
    sbtnNew: TRzShapeButton;
    pnlSave: TRzPanel;
    sbtnSave: TRzShapeButton;
    pnlCancel: TRzPanel;
    sbtnCancel: TRzShapeButton;
    procedure FormCreate(Sender: TObject);
    procedure edSearchKeyChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnNewClick(Sender: TObject);
    procedure grListTitleClick(Column: TColumn);
    procedure sbtnSaveClick(Sender: TObject);
    procedure sbtnCancelClick(Sender: TObject);
  private
    { Private declarations }
    procedure EnableControls;
  protected
    procedure SearchList; virtual; abstract;
    procedure BindToObject; virtual; abstract;
    procedure SetFieldsFromUnboundControls; virtual;
    function EntryIsValid: boolean; virtual; abstract;
    function NewIsAllowed: boolean; virtual; abstract;
    function EditIsAllowed: boolean; virtual; abstract;
  public
    { Public declarations }
    function Save: boolean; virtual;
    procedure Cancel; virtual;
    procedure New; virtual;
    procedure SetIdentity; virtual;
  end;

var
  frmBaseGridDetail: TfrmBaseGridDetail;

implementation

{$R *.dfm}

uses
  FormsUtil, AppDialogs;

procedure TfrmBaseGridDetail.edSearchKeyChange(Sender: TObject);
begin
  inherited;
  SearchList;
end;

procedure TfrmBaseGridDetail.EnableControls;
var
  i, cnt: integer;
  winCtrl: TControl;
  readOnly: boolean;
begin
  with grList.DataSource.DataSet do
  begin
    if State = dsInsert then readOnly := false
    else if State = dsBrowse then readOnly := (RecordCount = 0) or (not EditIsAllowed);
  end;

  cnt := pnlDetail.ControlCount - 1;
  for i := 0 to cnt do
  begin
    winCtrl := pnlDetail.Controls[i];

    if winCtrl.Tag = 1 then
    begin
      if  winCtrl is TRzDBEdit then
        (winCtrl as TRzDBEdit).ReadOnly := readOnly
      else if  winCtrl is TRzDBMemo then
        (winCtrl as TRzDBMemo).ReadOnly := readOnly
      else if  winCtrl is TRzDBLookupComboBox then
        (winCtrl as TRzDBLookupComboBox).ReadOnly := readOnly
      else if  winCtrl is TRzDBDateTimeEdit then
        (winCtrl as TRzDBDateTimeEdit).ReadOnly := readOnly
      else if  winCtrl is TRzDBCheckBox then
        (winCtrl as TRzDBCheckBox).ReadOnly := readOnly
      else if  winCtrl is TRzDBNumericEdit then
        (winCtrl as TRzDBNumericEdit).ReadOnly := readOnly
      else if  winCtrl is TRzButtonEdit then
        (winCtrl as TRzButtonEdit).HideButtonsOnReadOnly := readOnly;
    end;
  end;
end;

procedure TfrmBaseGridDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  OpenDropdownDataSources(pnlDetail,false);
  OpenGridDataSources(pnlList,false);
  // remove any filters
  grList.DataSource.DataSet.Filter := '';
  inherited;
end;

procedure TfrmBaseGridDetail.FormCreate(Sender: TObject);
begin
  inherited;
  OpenGridDataSources(pnlList);
  SortGrid(grList,grList.Columns[0]);
end;

procedure TfrmBaseGridDetail.FormShow(Sender: TObject);
begin
  inherited;
  OpenDropdownDataSources(pnlDetail);
  EnableControls;
end;

procedure TfrmBaseGridDetail.grListTitleClick(Column: TColumn);
begin
  inherited;
  SortGrid(grList,Column);
end;

function TfrmBaseGridDetail.Save: boolean;
begin
  Result := false;
  BindToObject;
  with grList.DataSource.DataSet do
  begin
    SetFieldsFromUnboundControls;
    if State in [dsInsert,dsEdit] then
      if EntryIsValid then
      begin
        grList.DataSource.DataSet.Post;
        grList.Enabled := true;
        Result := true;
      end
  end;
end;

procedure TfrmBaseGridDetail.sbtnCancelClick(Sender: TObject);
begin
  inherited;
  Cancel;
end;

procedure TfrmBaseGridDetail.sbtnNewClick(Sender: TObject);
begin
  New;
end;

procedure TfrmBaseGridDetail.sbtnSaveClick(Sender: TObject);
begin
  inherited;
  if Save then ShowConfirmationBox;
end;

procedure TfrmBaseGridDetail.SetFieldsFromUnboundControls;
begin

end;

procedure TfrmBaseGridDetail.SetIdentity;
begin

end;

procedure TfrmBaseGridDetail.Cancel;
begin
  grList.DataSource.DataSet.Cancel;
  grList.Enabled := true;
end;

procedure TfrmBaseGridDetail.New;
begin
  if NewIsAllowed then
  begin
    grList.DataSource.DataSet.Append;

    EnableControls;

    // disable the grid
    grList.Enabled := false;

    // focus the first control
    grList.DataSource.DataSet.FieldByName(grList.Columns[0].FieldName).FocusControl;
  end;
end;

end.
