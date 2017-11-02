unit ExpenseTypeSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Data.DB, RzButton,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, uExpenseType;

type
  TfrmExpenseTypeSearch = class(TfrmBaseSearch)
  private
    { Private declarations }
    ExpenseType: TExpenseType;
  protected
    { Public declarations }
    procedure SearchList; override;
    procedure SetReturn; override;
    procedure Add; override;
    procedure Cancel; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; var AType: TExpenseType); reintroduce; overload;
  end;

var
  frmExpenseTypeSearch: TfrmExpenseTypeSearch;

implementation

{$R *.dfm}

uses
  ProjectData;

{ TfrmExpenseTypesSearch }

constructor TfrmExpenseTypeSearch.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TfrmExpenseTypeSearch.Add;
begin
  inherited;

end;

procedure TfrmExpenseTypeSearch.Cancel;
begin
  inherited;

end;

constructor TfrmExpenseTypeSearch.Create(AOwner: TComponent;
  var AType: TExpenseType);
begin
  Create(AOwner);
  ExpenseType := AType;
end;

procedure TfrmExpenseTypeSearch.SearchList;
var
  filterStr: string;
begin
  filterStr := 'R_EXPENSE_NAME LIKE ' + QuotedStr('%' + UpperCase(edSearchKey.Text) + '%');
  grSearch.DataSource.DataSet.Filter := filterStr;
end;

procedure TfrmExpenseTypeSearch.SetReturn;
begin
  with grSearch.DataSource.DataSet, ExpenseType do
  begin
    Id := FieldByName('R_EXPENSE_ID').AsInteger;
    Name := FieldByName('R_EXPENSE_NAME').AsString;
  end;
end;

end.
