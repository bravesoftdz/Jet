unit ItemSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Data.DB, RzButton,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, uItem;

type
  TfrmItemSearch = class(TfrmBaseSearch)
  private
    { Private declarations }
    Item: TItem;
  protected
    { Public declarations }
    procedure SearchList; override;
    procedure SetReturn; override;
    procedure Add; override;
    procedure Cancel; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; var AItem: TItem); reintroduce; overload;
  end;

implementation

{$R *.dfm}

uses
  ProjectData;

{ TfrmItemSearch }

constructor TfrmItemSearch.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TfrmItemSearch.Add;
begin
  inherited;

end;

procedure TfrmItemSearch.Cancel;
begin
  inherited;

end;

constructor TfrmItemSearch.Create(AOwner: TComponent;
  var AItem: TItem);
begin
  Create(AOwner);
  Item := AItem;
end;

procedure TfrmItemSearch.SearchList;
var
  filterStr: string;
begin
  filterStr := 'R_ITEM_NAME LIKE ' + QuotedStr('%' + UpperCase(edSearchKey.Text) + '%');
  grSearch.DataSource.DataSet.Filter := filterStr;
end;

procedure TfrmItemSearch.SetReturn;
begin
  with grSearch.DataSource.DataSet, Item do
  begin
    Id := FieldByName('R_ITEM_ID').AsInteger;
    Name := FieldByName('R_ITEM_NAME').AsString;
  end;
end;

end.
