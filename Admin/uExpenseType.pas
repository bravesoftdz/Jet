unit uExpenseType;

interface

uses
  SysUtils;

type
  TExpenseType = class
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

{ TExpenseType }

function TExpenseType.GetHasName: boolean;
begin
  Result := Trim(FName) <> '';
end;

end.
