unit ProjectReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  RLReport, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.ExtCtrls, RLPreview, RzLabel, RzPanel, Vcl.DBCtrls, RzDBCmbo, RzButton,
  RzDBEdit, RzEdit, RzBtnEdt, Vcl.Mask, BasePrint;

type
  TfrmProjectReport = class(TfrmBaseReport)
    RLBand1: TRLBand;
    RLBand3: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    lblProject: TRLLabel;
    RLLabel1: TRLLabel;
    RLDBText4: TRLDBText;
    lblTotal: TRLLabel;
    fdspReportR_ITEM_NAME: TStringField;
    fdspReportR_QUANTITY: TCurrencyField;
    fdspReportR_EXPENSE_AMOUNT: TBCDField;
    fdspReportR_UNIT_NAME: TStringField;
    procedure fdspReportBeforeOpen(DataSet: TDataSet);
    procedure fdspReportAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
  protected
    procedure SetUnboundControls; override;
  public
    { Public declarations }
  end;

var
  frmProjectReport: TfrmProjectReport;

implementation

{$R *.dfm}

procedure TfrmProjectReport.fdspReportAfterOpen(DataSet: TDataSet);
begin
  // compute total
  fdspReport.Aggregates.Clear;
  with fdspReport.Aggregates.Add do
  begin
    if not Assigned(fdspReport.Aggregates.FindAggregate('Total')) then
    begin
      Name := 'Total';
      Expression := 'SUM(R_EXPENSE_AMOUNT)';
      Active := True;
    end;
  end;
  fdspReport.AggregatesActive := true;
end;

procedure TfrmProjectReport.fdspReportBeforeOpen(DataSet: TDataSet);
begin
  if Assigned(Project) then fdspReport.Params.ParamByName('P_PROJECT_ID').Value := Project.Id
  else fdspReport.Params.ParamByName('P_PROJECT_ID').Value := -1;
end;

procedure TfrmProjectReport.SetUnboundControls;
begin
  inherited;
  // project name
  if Assigned(Project) then lblProject.Caption := 'PROJECT NAME: ' + Project.Name;

  // total
  if fdspReport.RecordCount > 0 then
    lblTotal.Caption := FormatFloat('TOTAL: ###,###,##0.00', fdspReport.Aggregates[0].Value)
  else lblTotal.Caption := 'TOTAL: 0.00';
end;

end.
