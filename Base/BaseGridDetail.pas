unit BaseGridDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, RzEdit, RzTabs, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, RzButton, System.ImageList, Vcl.ImgList,
  SaveIntf, NewIntf, RzDBEdit, SetIdentityIntf;

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
    procedure FormCreate(Sender: TObject);
    procedure edSearchKeyChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sbtnNewClick(Sender: TObject);
    procedure grListTitleClick(Column: TColumn);
  private
    { Private declarations }
    procedure EnableControls;
  protected
    procedure SearchList; virtual; abstract;
    procedure BindToObject; virtual; abstract;
    function EntryIsValid: boolean; virtual; abstract;
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
  FormsUtil;

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
  cnt := pnlDetail.ControlCount - 1;
  for i := 0 to cnt do
  begin
    winCtrl := pnlDetail.Controls[i];
    readOnly := grList.DataSource.DataSet.RecordCount = 0;
    if winCtrl.Tag = 1 then
    begin
      if  winCtrl is TRzDBEdit then
        (winCtrl as TRzDBEdit).ReadOnly := readOnly
      else if  winCtrl is TRzDBMemo then
        (winCtrl as TRzDBMemo).ReadOnly := readOnly;
    end;
  end;
end;

procedure TfrmBaseGridDetail.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  OpenDropdownDataSources(pnlDetail,false);
  OpenGridDataSources(pnlList,false);
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
    if State in [dsInsert,dsEdit] then
      if EntryIsValid then
      begin
        grList.DataSource.DataSet.Post;
        grList.Enabled := true;
        Result := true;
      end
  end;
end;

procedure TfrmBaseGridDetail.sbtnNewClick(Sender: TObject);
begin
  New;
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
  grList.DataSource.DataSet.Append;

  // disable the grid
  grList.Enabled := false;

  // focus the first control
  grList.DataSource.DataSet.FieldByName(grList.Columns[0].FieldName).FocusControl;
end;

end.
