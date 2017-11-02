unit ClientSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Data.DB, RzButton,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, uClient;

type
  TfrmClientSearch = class(TfrmBaseSearch)
  private
    { Private declarations }
    Client: TClient;
  protected
    { Public declarations }
    procedure SearchList; override;
    procedure SetReturn; override;
    procedure Add; override;
    procedure Cancel; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; var AClient: TClient); reintroduce; overload;
  end;

var
  frmClientSearch: TfrmClientSearch;

implementation

{$R *.dfm}

uses
  AppData;

{ TfrmClientSearch }

procedure TfrmClientSearch.Add;
begin
  inherited;

end;

procedure TfrmClientSearch.Cancel;
begin
  inherited;

end;

constructor TfrmClientSearch.Create(AOwner: TComponent);
begin
  inherited;
end;

constructor TfrmClientSearch.Create(AOwner: TComponent; var AClient: TClient);
begin
  Create(AOwner);
  Client := AClient;
end;

procedure TfrmClientSearch.SearchList;
var
  filterStr: string;
begin
  filterStr := 'CLIENT_NAME LIKE ' + QuotedStr('%' + UpperCase(edSearchKey.Text) + '%');
  grSearch.DataSource.DataSet.Filter := filterStr;
end;

procedure TfrmClientSearch.SetReturn;
begin
  with grSearch.DataSource.DataSet, Client do
  begin
    Id := FieldByName('CLIENT_ID').AsInteger;
    Name := FieldByName('CLIENT_NAME').AsString;
    Description := FieldByName('CLIENT_DESCRIPTION').AsString;
  end;
end;

end.
