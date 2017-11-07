unit UnitMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, Vcl.DBCtrls, RzDBEdit, uUnit;

type
  TfrmUnitMain = class(TfrmBaseGridDetail)
    Label2: TLabel;
    edName: TRzDBEdit;
    Label3: TLabel;
    mmDescription: TRzDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FUnit: TUnit;
  protected
    procedure SearchList; override;
    procedure BindToObject; override;

    function EntryIsValid: boolean; override;
    function NewIsAllowed: boolean; override;
    function EditIsAllowed: boolean; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  AppData, AppDialogs, uUser;

{ TfrmUnitMain }

procedure TfrmUnitMain.BindToObject;
begin
  FUnit.Name := edName.Text;
  FUnit.Description := mmDescription.Text;
end;

function TfrmUnitMain.EditIsAllowed: boolean;
begin
  Result := User.HasRight(MODIFY_UNITS,false);
end;

function TfrmUnitMain.EntryIsValid: boolean;
var
  error: string;
begin
  if not FUnit.HasName then error := 'Please enter unit name.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

procedure TfrmUnitMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  FUnit.Free;
end;

procedure TfrmUnitMain.FormCreate(Sender: TObject);
begin
  FUnit := TUnit.Create;
  inherited;
end;

function TfrmUnitMain.NewIsAllowed: boolean;
begin
  Result := User.HasRight(ADD_UNITS,true);
end;

procedure TfrmUnitMain.SearchList;
var
  filterStr: string;
begin
  filterStr := 'UNIT_NAME LIKE ' + QuotedStr('%' + UpperCase(edSearchKey.Text) + '%');
  grList.DataSource.DataSet.Filter := filterStr;
end;
end.
