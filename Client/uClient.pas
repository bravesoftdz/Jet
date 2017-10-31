unit uClient;

interface

uses
  SysUtils;

type
  TClient = class
  private
    FName: string;
    FDescription: string;
    FId: integer;
    function GetHasName: boolean;
  public
    property Id: integer read FId write FId;
    property Name: string read FName write FName;
    property Description: string read FDescription write FDescription;
    property HasName: boolean read GetHasName;

  end;

implementation

{ TClient }

function TClient.GetHasName: boolean;
begin
  Result := Trim(FName) <> '';
end;

end.
