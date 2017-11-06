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
    function GetHasName: boolean;
    function GetHasPasskey: boolean;
    function GetHasRole: boolean;

  public
    property Name: string read FName write FName;
    property Passkey: string read FPasskey write FPasskey;
    property RoleCode: string read FRoleCode write FRoleCode;
    property HasName: boolean read GetHasName;
    property HasPasskey: boolean read GetHasPasskey;
    property HasRole: boolean read GetHasRole;

    procedure AddRight(const code: string);

    function ChangePassword(ANewPasskey: string): Boolean;

    constructor Create; overload;
    constructor Create(const AName: string); overload;
  end;

var
  User: TUser;

implementation

{ TUser }

uses
  AppData;

procedure TUser.AddRight(const code: string);
begin
  SetLength(FRights, Length(FRights) + 1);
  FRights[Length(FRights) - 1] := code;
end;

function TUser.ChangePassword(ANewPasskey: string): Boolean;
var
  sqlStr: string;
begin
  Result := false;
  try
    with dmApplication.fdcMain do
    begin
      sqlStr := 'UPDATE SYSUSER SET PASSKEY = ' + QuotedStr(Trim(ANewPasskey)) +
                ' WHERE USERNAME = ' + QuotedStr(FName);

      ExecSQL(sqlStr);
      Result := true;
    end;
  except

  end;
end;

constructor TUser.Create(const AName: string);
begin
  FName := AName;
end;

function TUser.GetHasName: boolean;
begin
  Result := FName <> '';
end;

function TUser.GetHasPasskey: boolean;
begin
  Result := FPasskey <> '';
end;

function TUser.GetHasRole: boolean;
begin
  Result := RoleCode <> '';
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
