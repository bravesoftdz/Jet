unit uProject;

interface

uses
  SysUtils, uClient;

type
  TProject = class
  private
    FEndDate: TDateTime;
    FName: string;
    FBudget: single;
    FId: integer;
    FDescription: string;
    FStartDate: TDateTime;
    FAddress: string;
    FClient: TClient;
    function GetHasClient: boolean;
    function GetHasName: boolean;
  public
    property Id: integer read FId write FId;
    property Client: TClient read FClient write FClient;
    property Name: string read FName write FName;
    property Description: string read FDescription write FDescription;
    property StartDate: TDateTime read FStartDate write FStartDate;
    property EndDate: TDateTime read FEndDate write FEndDate;
    property Address: string read FAddress write FAddress;
    property Budget: single read FBudget write FBudget;
    property HasName: boolean read GetHasName;
    property HasClient: boolean read GetHasClient;

  end;

implementation

{ TProject }

function TProject.GetHasClient: boolean;
begin
  Result := Assigned(FClient);
end;

function TProject.GetHasName: boolean;
begin
  Result := Trim(FName) <> '';
end;

end.
