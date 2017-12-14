unit ProjectReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  RLReport, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.ExtCtrls, RLPreview, RzLabel, RzPanel, Vcl.DBCtrls, RzDBCmbo, RzButton,
  RzDBEdit, RzEdit, RzBtnEdt, Vcl.Mask, BasePrint, uItem;

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
    bteItem: TRzButtonEdit;
    Label2: TLabel;
    Label3: TLabel;
    dteFrom: TRzDateTimeEdit;
    dteUntil: TRzDateTimeEdit;
    RLLabel5: TRLLabel;
    fdspReportR_EXPENSE_DATE: TSQLTimeStampField;
    RLDBText5: TRLDBText;
    procedure fdspReportBeforeOpen(DataSet: TDataSet);
    procedure fdspReportAfterOpen(DataSet: TDataSet);
    procedure bteItemButtonClick(Sender: TObject);
    procedure bteItemAltBtnClick(Sender: TObject);
  private
    { Private declarations }
    LItem: TItem;
  protected
    procedure SetUnboundControls; override;
    procedure FilterReport; override;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

uses
  SearchUtil;

procedure TfrmProjectReport.bteItemAltBtnClick(Sender: TObject);
begin
  if Assigned(LItem) then LItem.Free;
  bteItem.Clear;
end;

procedure TfrmProjectReport.bteItemButtonClick(Sender: TObject);
begin
  LItem := TItem.Create;
  if SearchUtil.SearchItem(self,LItem) then bteItem.Text := LItem.Name
  else LItem.Free;
end;

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

procedure TfrmProjectReport.FilterReport;
var
  filters: TStringList;
  filterStr: string;
  i,cnt: integer;
begin
  filters := TStringList.Create;
  try
    // dates
    if dteFrom.Text <> '' then
      filters.Add('(R_EXPENSE_DATE >= ' + QuotedStr(DateToStr(dteFrom.Date)) +
                  ' ) AND (R_EXPENSE_DATE <= ' + QuotedStr(DateToStr(dteUntil.Date)) + ')');

    // item
    if bteItem.Text <> '' then filters.Add('(R_ITEM_NAME = ' + QuotedStr(bteItem.Text) + ')');

    // construct the filter
    cnt := filters.Count - 1;
    filterStr := '';
    for i := 0 to cnt do
    begin
      filterStr := filterStr + filters[i];
      if i < cnt then filterStr := filterStr + ' AND ';
    end;

    // apply the filter
    fdspReport.Filter := filterStr;
  finally
    filters.Free;
  end;
end;

procedure TfrmProjectReport.SetUnboundControls;
var
  aggregate: TFDAggregate;
begin
  inherited;
  // project name
  if Assigned(Project) then lblProject.Caption := 'PROJECT NAME: ' + Project.Name;

  // total
  // TODO: This is generating a Index out of bounds exception
  try
    aggregate := fdspReport.Aggregates.FindAggregate('Total');
    if (Assigned(aggregate)) and (aggregate.Value <> null) then
        lblTotal.Caption := FormatFloat('TOTAL: ###,###,##0.00', aggregate.Value)
    else lblTotal.Caption := 'TOTAL: 0.00';
  except

  end;
end;

end.
