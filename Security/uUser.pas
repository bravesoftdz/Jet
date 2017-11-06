unit uUser;

interface

uses
  StrUtils, SysUtils;

type

  TUser = class
  private
    FName: string;
    FPasskey: string;
    FRoleCode: string;
    FRights: array of string;

    function HasRight(const code: string): boolean;

  public
    property Name: string read FName write FName;
    property Passkey: string read FPasskey write FPasskey;
    property RoleCode: string read FRoleCode write FRoleCode;

    procedure AddRight(const code: string);

    constructor Create; overload;
    constructor Create(const AName: string); overload;
  end;

var
  User: TUser;

implementation

{ TUser }

procedure TUser.AddRight(const code: string);
begin
  SetLength(FRights, Length(FRights) + 1);
  FRights[Length(FRights) - 1] := code;
end;

constructor TUser.Create(const AName: string);
begin
  FName := AName;
end;

constructor TUser.Create;
begin
  if User <> nil then User := self
  else inherited Create;
end;

function TUser.HasRight(const code: string): boolean;
var
  rt: string;
begin
  Result := false;

  for rt in FRights do
    if rt = code then
    begin
      Result := true;
      Exit;
    end;
end;

end.
