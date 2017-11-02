unit uUnit;

interface

uses
  SysUtils;

type
  TUnit = class
  private
    FName: string;
    FId: integer;
    FDescription: string;
    function GetHasName: boolean;
  public
    property Id: integer read FId write FId;
    property Name: string read FName write FName;
    property Description: string read FDescription write FDescription;
    property HasName: boolean read GetHasName;
  end;

implementation

{ TUnit }

function TUnit.GetHasName: boolean;
begin
  Result := Trim(FName) <> '';
end;

end.
