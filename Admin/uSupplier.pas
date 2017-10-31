unit uSupplier;

interface

uses
  SysUtils;

type
  TSupplier = class
  private
    FName: string;
    FPhone: string;
    FId: integer;
    FContact: string;
    FAddress: string;
    function GetHasName: boolean;
  public
    property Id: integer read FId write FId;
    property Name: string read FName write FName;
    property ContactPerson: string read FContact write FContact;
    property Phone: string read FPhone write FPhone;
    property Address: string read FAddress write FAddress;
    property HasName: boolean read GetHasName;
  end;

implementation

{ TSupplier }

function TSupplier.GetHasName: boolean;
begin
  Result := Trim(FName) <> '';
end;

end.
