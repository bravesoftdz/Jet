unit ProjectSearch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseSearch, Data.DB, RzButton,
  Vcl.Grids, Vcl.DBGrids, RzDBGrid, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, uProject;

type
  TfrmProjectSearch = class(TfrmBaseSearch)
  private
    { Private declarations }
    Project: TProject;
  protected
    { Public declarations }
    procedure SearchList; override;
    procedure SetReturn; override;
    procedure Add; override;
    procedure Cancel; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; var AProject: TProject); reintroduce; overload;
  end;

implementation

{$R *.dfm}

uses
  AppData;

{ TfrmProjectSearch }

procedure TfrmProjectSearch.Add;
begin
  inherited;

end;

procedure TfrmProjectSearch.Cancel;
begin
  inherited;

end;

constructor TfrmProjectSearch.Create(AOwner: TComponent;
  var AProject: TProject);
begin
  Create(AOwner);
  Project := AProject;
end;

constructor TfrmProjectSearch.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TfrmProjectSearch.SearchList;
var
  filterStr: string;
begin
  filterStr := 'PROJECT_NAME LIKE ' + QuotedStr('%' + UpperCase(edSearchKey.Text) + '%');
  grSearch.DataSource.DataSet.Filter := filterStr;
end;

procedure TfrmProjectSearch.SetReturn;
begin
  with grSearch.DataSource.DataSet, Project do
  begin
    Id := FieldByName('PROJECT_ID').AsInteger;
    Name := FieldByName('PROJECT_NAME').AsString;
  end;
end;

end.
