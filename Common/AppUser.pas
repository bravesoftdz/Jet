unit AppUser;

interface

uses
  SysUtils;

type
  TAppUser = class
  private
    FUserId: string;
    FUserName: string;
    FUserRights: array of string;
    FFirstName: string;
    FLastName: string;
    function GetName: string;
  public
    property UserId: string read FUserId write FUserId;
    property UserName: string read FUserName write FUserName;
    property FirstName: string write FFirstName;
    property LastName: string write FLastName;
    property Name: string read GetName;

    procedure SetRight(const right: string);
    function HasRights(const rights: array of string;
      const warn: boolean = false): boolean;

    constructor Create;
    destructor Destroy; override;
  end;

var
  User: TAppUser;


implementation

{ TUser }

constructor TAppUser.Create;
begin
  if User <> nil then
    Abort
  else
    User := self;
end;

destructor TAppUser.Destroy;
begin
  if User = self then
    User := nil;
  inherited Destroy;
end;

function TAppUser.GetName: string;
begin
  Result := FLastName + ', ' + FFirstName;
end;

function TAppUser.HasRights(const rights: array of string;
  const warn: boolean = false): boolean;
begin
  Result := true;
end;

procedure TAppUser.SetRight(const right: string);
var
  len: integer;
begin
  len := Length(FUserRights);

  SetLength(FUserRights, len + 1);
  FUserRights[len] := right;
end;

end.
