unit uRole;

interface

type
  TRole = class
  private
    FName: string;
    FCode: string;
    FDescription: string;
    function GetHasCode: boolean;
    function GetHasName: boolean;
  public
    property Code: string read FCode write FCode;
    property Name: string read FName write FName;
    property Description: string read FDescription write FDescription;
    property HasCode: boolean read GetHasCode;
    property HasName: boolean read GetHasName;
  end;

implementation

{ TRole }

function TRole.GetHasCode: boolean;
begin
  Result := FCode <> '';
end;

function TRole.GetHasName: boolean;
begin
  Result := FName <> '';
end;

end.
