unit AppData;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.UI;

type
  TdmApplication = class(TDataModule)
    fdcMain: TFDConnection;
    fdtProjects: TFDTable;
    dscProjects: TDataSource;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    fdtSuppliers: TFDTable;
    dscSuppliers: TDataSource;
    fdtExpenseTypes: TFDTable;
    dscExpenseTypes: TDataSource;
    fdtExpenses: TFDTable;
    dscExpenses: TDataSource;
    fdtClients: TFDTable;
    dscClients: TDataSource;
    fdqApp: TFDQuery;
    procedure fdtProjectsAfterClose(DataSet: TDataSet);
    procedure fdtSuppliersAfterClose(DataSet: TDataSet);
    procedure fdtExpenseTypesAfterClose(DataSet: TDataSet);
    procedure fdtClientsAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmApplication: TdmApplication;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TdmApplication.fdtClientsAfterClose(DataSet: TDataSet);
begin
  // clear the index
  (DataSet as TFDTable).IndexFieldNames := '';
end;

procedure TdmApplication.fdtExpenseTypesAfterClose(DataSet: TDataSet);
begin
  // clear the index
  (DataSet as TFDTable).IndexFieldNames := '';
end;

procedure TdmApplication.fdtProjectsAfterClose(DataSet: TDataSet);
begin
  // clear the index
  (DataSet as TFDTable).IndexFieldNames := '';
end;

procedure TdmApplication.fdtSuppliersAfterClose(DataSet: TDataSet);
begin
  // clear the index
  (DataSet as TFDTable).IndexFieldNames := '';
end;

end.
