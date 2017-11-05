unit ItemMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, Vcl.DBCtrls, RzDBEdit, uItem, RzRadChk, RzDBChk,
  RzDBCmbo;

type
  TfrmItemMain = class(TfrmBaseGridDetail)
    Label2: TLabel;
    edName: TRzDBEdit;
    Label3: TLabel;
    mmDescription: TRzDBMemo;
    cbxActive: TRzDBCheckBox;
    dbluUnit: TRzDBLookupComboBox;
    Label11: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Item: TItem;
  protected
    procedure SearchList; override;
    procedure BindToObject; override;
    function EntryIsValid: boolean; override;
  public
    { Public declarations }
    procedure SetIdentity; override;
  end;

implementation

{$R *.dfm}

uses
  AppData, AppDialogs, DBUtil;

{ TfrmItemName }

procedure TfrmItemMain.BindToObject;
begin
  inherited;
  Item.Name := edName.Text;
  Item.Description := mmDescription.Text;
end;

function TfrmItemMain.EntryIsValid: boolean;
var
  error: string;
begin
  if not Item.HasName then error := 'Please enter item name.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

procedure TfrmItemMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  Item.Free;
end;

procedure TfrmItemMain.FormCreate(Sender: TObject);
begin
  Item := TItem.Create;
  inherited;
end;

procedure TfrmItemMain.SearchList;
var
  filterStr: string;
begin
  filterStr := 'ITEM_NAME LIKE ' + QuotedStr('%' + UpperCase(edSearchKey.Text) + '%');
  grList.DataSource.DataSet.Filter := filterStr;
end;

procedure TfrmItemMain.SetIdentity;
begin
  SetItemIdentity;
end;

end.
