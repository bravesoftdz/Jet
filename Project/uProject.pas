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
    FStatus: string;
    function GetHasClient: boolean;
    function GetHasName: boolean;
    function GetIsClosed: boolean;
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
    property IsClosed: boolean read GetIsClosed;
    property Status: string read FStatus write FStatus;

    procedure ClearClient;

    destructor Destroy; override;
  end;

implementation

{ TProject }

procedure TProject.ClearClient;
begin
  if Assigned(FClient) then
    FreeAndNil(FClient);
end;

destructor TProject.Destroy;
begin
  ClearClient;
  inherited;
end;

function TProject.GetHasClient: boolean;
begin
  Result := Assigned(FClient);
end;

function TProject.GetHasName: boolean;
begin
  Result := Trim(FName) <> '';
end;

function TProject.GetIsClosed: boolean;
begin
  Result := FStatus = 'C';
end;

end.
