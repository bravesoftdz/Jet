unit ProjectData;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, uProject, uSupplier, uItem,
  SetUnBoundControlsIntf, Forms;

type
  TdmProject = class(TDataModule)
    fdspExpenses: TFDStoredProc;
    dscExpenses: TDataSource;
    fdspExpensesR_EXPENSE_DATE: TSQLTimeStampField;
    fdspExpensesR_RECEIPT: TStringField;
    fdspExpensesR_EXPENSE_AMOUNT: TBCDField;
    fdspExpensesR_SUPPLIER_ID: TIntegerField;
    fdspExpensesR_SUPPLIER_NAME: TStringField;
    fdspExpensesR_REMARKS: TStringField;
    fdspExpensesR_CANCELLED: TBooleanField;
    fduExpenses: TFDUpdateSQL;
    fdspExpensesR_PROJECT_ID: TIntegerField;
    fdspSuppliers: TFDStoredProc;
    dscSuppliers: TDataSource;
    fdspExpensesR_UNIT_ID: TIntegerField;
    fdspExpensesR_UNIT_NAME: TStringField;
    fdspExpensesR_QUANTITY: TCurrencyField;
    fdspExpensesR_EXPENSE_ID: TIntegerField;
    fdspExpensesR_ITEM_ID: TIntegerField;
    fdspExpensesR_ITEM_NAME: TStringField;
    procedure fdspExpensesBeforeOpen(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure fdspExpensesAfterOpen(DataSet: TDataSet);
    procedure fdspExpensesAfterScroll(DataSet: TDataSet);
    procedure fdspExpensesNewRecord(DataSet: TDataSet);
  private
    { Private declarations }
    Project: TProject;
  public
     { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; AProject: TProject); reintroduce; overload;
  end;

var
  dmProject: TdmProject;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses
  AppData, AppGlobal;

{ TdmProject }

constructor TdmProject.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

constructor TdmProject.Create(AOwner: TComponent; AProject: TProject);
begin
  Create(AOwner);
  Project := AProject;

  fdspExpenses.Open;
end;

procedure TdmProject.DataModuleDestroy(Sender: TObject);
begin
  fdspExpenses.Close;
end;

procedure TdmProject.fdspExpensesAfterOpen(DataSet: TDataSet);
begin
  // compute total
  with fdspExpenses.Aggregates.Add do
  begin
    if not Assigned(fdspExpenses.Aggregates.FindAggregate('Total')) then
    begin
      Name := 'Total';
      Expression := 'SUM(R_EXPENSE_AMOUNT)';
      Active := True;
    end
  end;
  fdspExpenses.AggregatesActive := true;
end;

procedure TdmProject.fdspExpensesAfterScroll(DataSet: TDataSet);
var
  intf: ISetUnboundControls;
begin
  if Supports(Screen.ActiveForm, ISetUnboundControls, intf) then intf.SetUnboundControls;
end;

procedure TdmProject.fdspExpensesBeforeOpen(DataSet: TDataSet);
begin
  fdspExpenses.DisableControls;
  fdspExpenses.Params.ParamByName('P_PROJECT_ID').AsInteger := Project.Id;
  fdspExpenses.EnableControls;
end;

procedure TdmProject.fdspExpensesNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('R_EXPENSE_DATE').AsDateTime := app.AppDate;
  DataSet.FieldByName('R_PROJECT_ID').AsInteger := Project.Id;
  DataSet.FieldByName('R_CANCELLED').AsBoolean := false;

  DataSet.FieldByName('R_RECEIPT').FocusControl;
end;

end.
