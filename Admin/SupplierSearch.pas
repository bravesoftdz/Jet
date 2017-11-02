unit SupplierSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Data.DB, RzButton,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, uSupplier;

type
  TfrmSupplierSearch = class(TfrmBaseSearch)
  private
    { Private declarations }
    Supplier: TSupplier;
  protected
    { Public declarations }
    procedure SearchList; override;
    procedure SetReturn; override;
    procedure Add; override;
    procedure Cancel; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; var ASupplier: TSupplier); reintroduce; overload;
  end;

var
  frmSupplierSearch: TfrmSupplierSearch;

implementation

{$R *.dfm}

uses
  ProjectData;

{ TfrmSupplierSearch }

procedure TfrmSupplierSearch.Add;
begin
  inherited;

end;

procedure TfrmSupplierSearch.Cancel;
begin
  inherited;

end;

constructor TfrmSupplierSearch.Create(AOwner: TComponent;
  var ASupplier: TSupplier);
begin
  Create(AOwner);
  Supplier := ASupplier;
end;

constructor TfrmSupplierSearch.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TfrmSupplierSearch.SearchList;
var
  filterStr: string;
begin
  filterStr := 'R_SUPPLIER_NAME LIKE ' + QuotedStr('%' + UpperCase(edSearchKey.Text) + '%');
  grSearch.DataSource.DataSet.Filter := filterStr;
end;

procedure TfrmSupplierSearch.SetReturn;
begin
  with grSearch.DataSource.DataSet, Supplier do
  begin
    Id := FieldByName('R_SUPPLIER_ID').AsInteger;
    Name := FieldByName('R_SUPPLIER_NAME').AsString;
  end;
end;

end.
