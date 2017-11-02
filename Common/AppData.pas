unit AppData;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.UI, Forms, Controls;

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
    fdtProjectsPROJECT_ID: TFDAutoIncField;
    fdtProjectsCLIENT_ID: TIntegerField;
    fdtProjectsPROJECT_NAME: TStringField;
    fdtProjectsPROJECT_DESCRIPTION: TStringField;
    fdtProjectsSTART_DATE: TSQLTimeStampField;
    fdtProjectsEND_DATE: TSQLTimeStampField;
    fdtProjectsADDRESS: TStringField;
    fdtProjectsBUDGET: TBCDField;
    fdtProjectsSTATUS_ID: TStringField;
    fdtProjectsOLD_PROJECT_ID: TIntegerField;
    fdtProjectsCLIENT_NAME: TStringField;
    fdtUnits: TFDTable;
    dscUnits: TDataSource;
    procedure fdtProjectsAfterClose(DataSet: TDataSet);
    procedure fdtSuppliersAfterClose(DataSet: TDataSet);
    procedure fdtExpenseTypesAfterClose(DataSet: TDataSet);
    procedure fdtClientsAfterClose(DataSet: TDataSet);
    procedure fdtProjectsAfterScroll(DataSet: TDataSet);
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

uses
  SetUnboundControlsIntf, Main;

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

procedure TdmApplication.fdtProjectsAfterScroll(DataSet: TDataSet);
var
  intf: ISetUnboundControls;
  control: TControl;
begin
  if (Application.MainForm as TfrmMain).pnlDockMain.ControlCount > 0 then
  begin
    control := (Application.MainForm as TfrmMain).pnlDockMain.Controls[0];
    if (Assigned(control)) and (control is TForm) then
      if Supports((Application.MainForm as TfrmMain).pnlDockMain.Controls[0] as TForm,
        ISetUnboundControls, intf) then intf.SetUnboundControls;
  end;
end;

procedure TdmApplication.fdtSuppliersAfterClose(DataSet: TDataSet);
begin
  // clear the index
  (DataSet as TFDTable).IndexFieldNames := '';
end;

end.
