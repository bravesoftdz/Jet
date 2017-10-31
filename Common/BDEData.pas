unit BDEData;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Bde.DBTables;

type
  TdmBDE = class(TDataModule)
    tbProjects: TTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmBDE: TdmBDE;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
