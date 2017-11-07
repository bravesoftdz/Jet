unit Users;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, RzDBEdit, Vcl.DBCtrls, RzDBCmbo, uUser;

type
  TfrmUsers = class(TfrmBaseGridDetail)
    Label2: TLabel;
    edUsername: TRzDBEdit;
    Label3: TLabel;
    edPassword: TRzDBEdit;
    Label11: TLabel;
    dbluRole: TRzDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    LUser: TUser;
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
  SecurityData, AppDialogs;

{ TfrmUsers }

procedure TfrmUsers.BindToObject;
begin
  inherited;
  LUser.Name := edUsername.Text;
  LUser.Passkey := edPassword.Text;

  if dbluRole.Text <> '' then LUser.RoleCode := dbluRole.KeyValue
  else LUser.RoleCode := '';
end;

function TfrmUsers.EditIsAllowed: boolean;
begin
  Result := User.HasRight(MODIFY_USER,false);
end;

function TfrmUsers.EntryIsValid: boolean;
var
  error: string;
begin
  if not LUser.HasName then error := 'Please enter username.'
  else if not LUser.HasPasskey then error := 'Please enter password.'
  else if not LUser.HasRole then error := 'Please select a role.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

procedure TfrmUsers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  LUser.Free;
end;

procedure TfrmUsers.FormCreate(Sender: TObject);
begin
  LUser := TUser.Create;
  inherited;
end;

function TfrmUsers.NewIsAllowed: boolean;
begin
  Result := User.HasRight(ADD_USER);
end;

procedure TfrmUsers.SearchList;
var
  filterStr: string;
begin
  filterStr := 'USERNAME LIKE ' + QuotedStr('%' + UpperCase(edSearchKey.Text) + '%');
  grList.DataSource.DataSet.Filter := filterStr;
end;

end.
