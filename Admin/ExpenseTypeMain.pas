unit ExpenseTypeMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, Vcl.DBCtrls, RzDBEdit, uExpenseType, RzRadChk, RzDBChk;

type
  TfrmExpenseTypeMain = class(TfrmBaseGridDetail)
    Label2: TLabel;
    edName: TRzDBEdit;
    Label3: TLabel;
    mmDescription: TRzDBMemo;
    cbxActive: TRzDBCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    ExpenseType: TExpenseType;
  protected
    procedure SearchList; override;
    procedure BindToObject; override;
    function EntryIsValid: boolean; override;
  public
    { Public declarations }
    procedure SetIdentity; override;
  end;

var
  frmExpenseTypeMain: TfrmExpenseTypeMain;

implementation

{$R *.dfm}

uses
  AppData, AppDialogs, DBUtil;

{ TfrmExpenseTypeMain }

procedure TfrmExpenseTypeMain.BindToObject;
begin
  inherited;
  ExpenseType.Name := edName.Text;
  ExpenseType.Description := mmDescription.Text;
end;

function TfrmExpenseTypeMain.EntryIsValid: boolean;
var
  error: string;
begin
  if not ExpenseType.HasName then error := 'Please enter type name.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

procedure TfrmExpenseTypeMain.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  ExpenseType.Free;
end;

procedure TfrmExpenseTypeMain.FormCreate(Sender: TObject);
begin
  ExpenseType := TExpenseType.Create;
  inherited;
end;

procedure TfrmExpenseTypeMain.SearchList;
var
  filterStr: string;
begin
  filterStr := 'EXPENSE_NAME LIKE ' + QuotedStr('%' + UpperCase(edSearchKey.Text) + '%');
  grList.DataSource.DataSet.Filter := filterStr;
end;

procedure TfrmExpenseTypeMain.SetIdentity;
begin
  SetExpenseTypeIdentity;
end;

end.
