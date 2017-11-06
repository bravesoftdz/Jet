unit AssignRights;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopupDetail, RzButton, RzTabs,
  Vcl.StdCtrls, RzLabel, Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, RzLstBox,
  RzChkLst, uRole;

type
  TRight = class
  strict private
    FName: string;
    FCode: string;
  public
    property Code: string read FCode write FCode;
    property Name: string read FName write FName;
  end;

  TfrmAssignRights = class(TfrmBasePopupDetail)
    chlRights: TRzCheckList;
  private
    { Private declarations }
    Role: TRole;
    procedure PopulateRightsList;
  protected
    procedure Save; override;
    procedure Cancel; override;
    function ValidEntry: boolean; override;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; var ARole: TRole); reintroduce; overload;
  end;

implementation

{$R *.dfm}

uses
  SecurityData;

{ TfrmAssignRights }

constructor TfrmAssignRights.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TfrmAssignRights.Cancel;
begin
  inherited;

end;

constructor TfrmAssignRights.Create(AOwner: TComponent; var ARole: TRole);
begin
  Create(AOwner);
  Role := ARole;
end;

procedure TfrmAssignRights.PopulateRightsList;
var
  LRight: TRight;
begin
  with chlRights do
  begin
     LRight := TRight.Create;

  end;
end;

procedure TfrmAssignRights.Save;
begin
  inherited;

end;

function TfrmAssignRights.ValidEntry: boolean;
begin

end;

end.
