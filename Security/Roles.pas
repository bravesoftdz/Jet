unit Roles;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, Vcl.DBCtrls, RzDBEdit, uRole;

type
  TfrmRoles = class(TfrmBaseGridDetail)
    Label2: TLabel;
    edCode: TRzDBEdit;
    Label3: TLabel;
    edName: TRzDBEdit;
    Label4: TLabel;
    mmDescription: TRzDBMemo;
    urlRoles: TRzURLLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure urlRolesClick(Sender: TObject);
  private
    { Private declarations }
    Role: TRole;
  protected
    procedure SearchList; override;
    procedure BindToObject; override;
    function EntryIsValid: boolean; override;
  public
    { Public declarations }
  end;

var
  frmRoles: TfrmRoles;

implementation

{$R *.dfm}

uses
  SecurityData, AppDialogs, AssignRights;

{ TfrmRoles }

procedure TfrmRoles.BindToObject;
begin
  Role.Code := edCode.Text;
  Role.Name := edName.Text;
  Role.Description := mmDescription.Text;
end;

function TfrmRoles.EntryIsValid: boolean;
var
  error: string;
begin
  if not Role.HasCode then error := 'Please enter role code.'
  else if not Role.HasName then error := 'Please enter role name.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

procedure TfrmRoles.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Role.Free;
end;

procedure TfrmRoles.FormCreate(Sender: TObject);
begin
  Role := TRole.Create;
  inherited;
end;

procedure TfrmRoles.SearchList;
var
  filterStr: string;
begin
  filterStr := 'ROLE_NAME LIKE ' + QuotedStr('%' + UpperCase(edSearchKey.Text) + '%');
  grList.DataSource.DataSet.Filter := filterStr;
end;

procedure TfrmRoles.urlRolesClick(Sender: TObject);
begin
  with TfrmAssignRights.Create(self,Role) do
  begin
    Parent := self.Parent;
    Show;
  end;
end;

end.
