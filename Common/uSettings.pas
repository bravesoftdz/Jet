unit uSettings;

interface

uses
  SysUtils, IniFiles;

type
  TDatabase = class
  strict private
    FDatabaseFile: string;
    FUser: string;
    FPassword: string;
    FServer: string;
    FConnected: boolean;
  private

  public
    property DatabaseFile: string read FDatabaseFile write FDatabaseFile;
    property User: string read FUser write FUser;
    property Password: string read FPassword write FPassword;
    property Server: string read FServer write FServer;
    property Connected: boolean read FConnected write FConnected;
  end;

  TSettings = class
  strict private
    FDatabase: TDatabase;
    function GetIniFile: TIniFile;
  private
    const CONFIG_FILE = 'jet.ini';
  public
    property Database: TDatabase read FDatabase write FDatabase;

    constructor Create;

    procedure Save;
    procedure Load;
  end;

var
  Settings: TSettings;

implementation

uses
  SecurityUtil;

constructor TSettings.Create;

begin
  if Settings = nil then
  begin
    inherited Create;
    Load;
  end
  else Settings := self;
end;

function TSettings.GetIniFile: TIniFile;
var
  dir: string;
begin
  dir := GetCurrentDir;
  Result := TIniFile.Create(dir + '\' + CONFIG_FILE);
end;

procedure TSettings.Load;
var
  iniFile: TIniFile;
begin
  // read inifile
  iniFile := GetIniFile;

  // db settings
  FDataBase := TDatabase.Create;

  FDataBase.DatabaseFile := iniFile.ReadString('DATABASE','File','');
  FDataBase.User := iniFile.ReadString('DATABASE','User','sysdba');
  FDataBase.Password := iniFile.ReadString('DATABASE','Password','masterkey');
  FDataBase.Server := iniFile.ReadString('DATABASE','Server','localhost');
end;

procedure TSettings.Save;
var
  iniFile: TIniFile;
begin
  iniFile := GetIniFile;

  // db settings
  iniFile.WriteString('DATABASE','File',FDataBase.DatabaseFile);
  iniFile.WriteString('DATABASE','User',Encrypt(FDataBase.User));
  iniFile.WriteString('DATABASE','Password',Encrypt(FDataBase.Password));
  iniFile.WriteString('DATABASE','Server',FDataBase.Server);
end;

end.
