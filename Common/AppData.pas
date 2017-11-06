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
    fdtItem: TFDTable;
    dscItem: TDataSource;
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
    procedure fdtItemAfterClose(DataSet: TDataSet);
    procedure fdtClientsAfterClose(DataSet: TDataSet);
    procedure fdtProjectsAfterScroll(DataSet: TDataSet);
    procedure fdcMainBeforeConnect(Sender: TObject);
    procedure DataModuleCreate(Sender: TObject);
    procedure fdtProjectsNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    procedure OpenConnection;
    function ConfigureConnection: boolean;
  public
    { Public declarations }
  end;

var
  dmApplication: TdmApplication;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

uses
  SetUnboundControlsIntf, Main, uSettings, ConnectionConfiguration;

function TdmApplication.ConfigureConnection: boolean;
begin
  with TfrmConnectionConfiguration.Create(Application) do
  begin
    ShowModal;
    Result := ModalResult = mrOk;
  end;
end;

procedure TdmApplication.DataModuleCreate(Sender: TObject);
begin
  OpenConnection;
end;

procedure TdmApplication.fdcMainBeforeConnect(Sender: TObject);
begin
  // set connection params
  with fdcMain.Params as TFDPhysFBConnectionDefParams do
  begin
    Server := Settings.Database.Server;
    Database := Settings.Database.DatabaseFile;
    UserName := Settings.Database.User;
    Password := Settings.Database.Password;
  end;
end;

procedure TdmApplication.fdtClientsAfterClose(DataSet: TDataSet);
begin
  // clear the index
  (DataSet as TFDTable).IndexFieldNames := '';
end;

procedure TdmApplication.fdtItemAfterClose(DataSet: TDataSet);
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

procedure TdmApplication.fdtProjectsNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('STATUS_ID').AsString := 'O';
end;

procedure TdmApplication.fdtSuppliersAfterClose(DataSet: TDataSet);
begin
  // clear the index
  (DataSet as TFDTable).IndexFieldNames := '';
end;

procedure TdmApplication.OpenConnection;
begin
  try
    fdcMain.Open;
    Settings.Database.Connected := true;
  except
    on E: Exception do
    begin
      if ConfigureConnection then OpenConnection
      else Application.Terminate;
    end;
  end;
end;

end.
