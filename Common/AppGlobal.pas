unit AppGlobal;

interface

uses
  SysUtils, AppUser, Vcl.Graphics, uSupplier;

type
  TParams = class
  private
    FSupplier: TSupplier;
  public
    property Supplier: TSupplier read FSupplier write FSupplier;
  end;

  TApp = class(TObject)
  private
    FAppName: string;
    FAppDescription: string;
    FAppDate: TDate;
    FVersion: string;
    FUser: TAppUser;
    FParams: TParams;
  public

    property AppDate: TDate read FAppDate write FAppDate;
    property Version: string read FVersion write FVersion;
    property AppName: string read FAppName write FAppName;
    property AppDescription: string read FAppDescription write FAppDescription;
    property User: TAppUser read FUser write FUser;
    property Params: TParams read FParams write FParams;

    constructor Create;
    destructor Destroy; override;
  end;

var
  App: TApp;

implementation

{ TApp }

constructor TApp.Create;
begin
  if App <> nil then
    Abort
  else
  begin
    FAppName := 'Jet Construction Expense Management System';
    FAppDescription := 'Jet Construction Expense Management System';

    FUser := TAppUser.Create;
    FParams := TParams.Create;
    FParams.Supplier := TSupplier.Create;

    App := self;
  end;
end;

destructor TApp.Destroy;
begin
  if App = self then
    App := nil;

  inherited Destroy;
end;

end.
