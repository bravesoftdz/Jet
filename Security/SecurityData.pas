unit SecurityData;

interface

uses
  System.SysUtils, System.Classes;

type
  TdmSecurity = class(TDataModule)
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmSecurity: TdmSecurity;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

end.
