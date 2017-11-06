unit ExpenseList;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePopup, Vcl.StdCtrls, RzLabel,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, RzPanel, Data.DB, Vcl.Grids, Vcl.DBGrids,
  RzDBGrid, uProject, RzEdit, Vcl.Mask, RzBtnEdt, FireDac.Comp.Client, RzDBEdit,
  Vcl.DBCtrls, SetUnboundControlsIntf, uExpense, RzButton, SaveIntf, NewIntf,
  uItem, uSupplier, RzDBCmbo, RzRadChk, RzDBChk;

type
  TfrmExpenseList = class(TfrmBasePopup, ISetUnboundControls, ISave, INew)
    pnlList: TRzPanel;
    grList: TRzDBGrid;
    pnlDetail: TRzPanel;
    lblTotal: TLabel;
    Label1: TLabel;
    bteItem2: TRzButtonEdit;
    bteSupplierFilter: TRzButtonEdit;
    Label2: TLabel;
    Label3: TLabel;
    dteFrom: TRzDateTimeEdit;
    dteUntil: TRzDateTimeEdit;
    Label4: TLabel;
    dteDate: TRzDBDateTimeEdit;
    edReceipt: TRzDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    bteItem: TRzButtonEdit;
    Label7: TLabel;
    bteSupplier: TRzButtonEdit;
    Label8: TLabel;
    edQuantity: TRzDBNumericEdit;
    edAmount: TRzDBNumericEdit;
    Label9: TLabel;
    Label10: TLabel;
    mmRemarks: TRzDBMemo;
    pnlAdd: TRzPanel;
    sbtnNew: TRzShapeButton;
    Label11: TLabel;
    dbluUnit: TRzDBLookupComboBox;
    lblProject: TLabel;
    cbxCancelled: TRzDBCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grListTitleClick(Column: TColumn);
    procedure imgCloseClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure bteItemAltBtnClick(Sender: TObject);
    procedure bteSupplierAltBtnClick(Sender: TObject);
    procedure bteItemButtonClick(Sender: TObject);
    procedure bteSupplierButtonClick(Sender: TObject);
    procedure bteItem2ButtonClick(Sender: TObject);
    procedure bteSupplierFilterButtonClick(Sender: TObject);
    procedure bteItem2AltBtnClick(Sender: TObject);
    procedure bteSupplierFilterAltBtnClick(Sender: TObject);
    procedure dteFromChange(Sender: TObject);
    procedure dteUntilChange(Sender: TObject);
    procedure sbtnNewClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Expense: TExpense;
    procedure BindToObject;
    procedure SetFieldsFromUnboundControls;
    procedure SetTotal;
    procedure FilterGrid;

    function SearchItem: TItem;
    function SearchSupplier: TSupplier;

    function EntryIsValid: boolean;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); overload; override;
    constructor Create(AOwner: TComponent; AProject: TProject); reintroduce; overload;

    procedure SetUnboundControls;
    procedure New;
    procedure Cancel;

    function Save: boolean;
  end;

implementation

{$R *.dfm}

uses
  ProjectData, FormsUtil, AppGlobal, AppDialogs, SearchUtil, AppData;

constructor TfrmExpenseList.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

procedure TfrmExpenseList.BindToObject;
begin
  Expense.Id := grList.DataSource.DataSet.FieldByName('R_EXPENSE_ID').AsInteger;
  Expense.Date := dteDate.Date;
  Expense.Receipt := edReceipt.Text;
  Expense.Quantity := edQuantity.Value;
  Expense.Amount := edAmount.Value;
  Expense.Remarks := mmRemarks.Text;
end;

procedure TfrmExpenseList.bteItem2AltBtnClick(Sender: TObject);
begin
  bteItem2.Clear;
  FilterGrid;
end;

procedure TfrmExpenseList.bteItem2ButtonClick(Sender: TObject);
var
  LExpenseType: TItem;
begin
  LExpenseType := SearchItem;
  if Assigned(LExpenseType) then bteItem2.Text := LExpenseType.Name;
  FilterGrid;
end;

procedure TfrmExpenseList.bteItemAltBtnClick(Sender: TObject);
begin
  inherited;
  Expense.ClearItem;
  bteItem.Clear;
end;

procedure TfrmExpenseList.bteItemButtonClick(Sender: TObject);
var
  LExpenseType: TItem;
begin
  LExpenseType := SearchItem;
  if Assigned(LExpenseType) then
  begin
    Expense.Item := LExpenseType;
    bteItem.Text := LExpenseType.Name;
  end;
end;

procedure TfrmExpenseList.bteSupplierAltBtnClick(Sender: TObject);
begin
  inherited;
  Expense.ClearSupplier;
  bteSupplier.Clear;
end;

procedure TfrmExpenseList.bteSupplierButtonClick(Sender: TObject);
var
  LSupplier: TSupplier;
begin
  LSupplier := SearchSupplier;
  if Assigned(LSupplier) then
  begin
    Expense.Supplier := LSupplier;
    bteSupplier.Text := LSupplier.Name;
  end;
end;

procedure TfrmExpenseList.bteSupplierFilterAltBtnClick(Sender: TObject);
begin
  bteSupplierFilter.Clear;
  FilterGrid;
end;

procedure TfrmExpenseList.bteSupplierFilterButtonClick(Sender: TObject);
var
  LSupplier: TSupplier;
begin
  LSupplier := SearchSupplier;
  if Assigned(LSupplier) then bteSupplierFilter.Text := LSupplier.Name;
  FilterGrid;
end;

procedure TfrmExpenseList.Cancel;
begin
  grList.DataSource.DataSet.Cancel;
  SetUnboundControls;
end;

constructor TfrmExpenseList.Create(AOwner: TComponent; AProject: TProject);
begin
  Create(AOwner);

  Expense := TExpense.Create;
  Expense.Project := AProject;

  dmProject := TdmProject.Create(AOwner,AProject);

  SortGrid(grList,grList.Columns[0]);
end;

procedure TfrmExpenseList.dteFromChange(Sender: TObject);
begin
  try
    if dteFrom.Text <> '' then DateToStr(dteFrom.Date);
    FilterGrid;
  except

  end;
end;

procedure TfrmExpenseList.dteUntilChange(Sender: TObject);
begin
  try
    if dteUntil.Text <> '' then DateToStr(dteUntil.Date);
    FilterGrid;
  except

  end;
end;

function TfrmExpenseList.EntryIsValid: boolean;
var
  error: string;
begin
  if not Expense.HasReceipt then error := 'Please enter receipt number.'
  else if not Expense.HasItem then error := 'Please select an item.'
  else if not Expense.HasSupplier then error := 'Please select a supplier.'
  else if Expense.AmountIsInvalid then error := 'Please enter an amount.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

procedure TfrmExpenseList.FilterGrid;
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
    if bteItem2.Text <> '' then filters.Add('(R_ITEM_NAME = ' + QuotedStr(bteItem2.Text) + ')');

    // supplier
    if bteSupplierFilter.Text <> '' then filters.Add('(R_SUPPLIER_NAME = ' + QuotedStr(bteSupplierFilter.Text) + ')');

    // construct the filter
    cnt := filters.Count - 1;
    filterStr := '';
    for i := 0 to cnt do
    begin
      filterStr := filterStr + filters[i];
      if i < cnt then filterStr := filterStr + ' AND ';
    end;

    // apply the filter
    grList.DataSource.DataSet.Filter := filterStr;

    SetTotal;
  finally
    filters.Free;
  end;
end;

procedure TfrmExpenseList.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  inherited;
  dmProject.Free;
  Action := caFree;
end;

procedure TfrmExpenseList.FormCreate(Sender: TObject);
begin
  OpenDropdownDataSources(pnlDetail);
end;

procedure TfrmExpenseList.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #27 then Close;
end;

procedure TfrmExpenseList.FormShow(Sender: TObject);
begin
  inherited;
  SetUnboundControls;

  // bind the date events
  // don't bind at design time
  // events are triggered when setting the dates
  dteFrom.OnChange := dteFromChange;
  dteUntil.OnChange := dteFromChange;

  // set project name
  lblProject.Caption := Expense.Project.Name;

  FilterGrid;
  SetUnboundControls;

  SetTotal;
end;

procedure TfrmExpenseList.grListTitleClick(Column: TColumn);
begin
  inherited;
  SortGrid(grList,Column);
end;

procedure TfrmExpenseList.imgCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmExpenseList.New;
begin
  if Expense.Project.IsClosed then
    if ShowWarningBox('Project is already CLOSED. Do you still want to continue?') = mrNo then
      Exit;

  grList.DataSource.DataSet.Append;
end;

function TfrmExpenseList.Save: boolean;
var
  LIndexFieldNames: string;
begin
  Result := false;
  BindToObject;
  with grList.DataSource.DataSet, Expense do
  begin
    SetFieldsFromUnboundControls;
    if State in [dsInsert,dsEdit] then
      if EntryIsValid then
      begin
        grList.DataSource.DataSet.Post;
        grList.Enabled := true;
        Result := true;
      end;

    if Result then
    begin
      // reopen the table to refresh the lookup
      LIndexFieldNames := (grList.DataSource.DataSet as TFDStoredProc).IndexFieldNames;

      DisableControls;

      Refresh;

      Close;
      Open;

      SetTotal;

      SortGrid(grList,LIndexFieldNames);

      (grList.DataSource.DataSet as TFDStoredProc).LocateEx('R_EXPENSE_DATE;R_ITEM_ID;R_SUPPLIER_ID;R_RECEIPT',
          VarArrayOf([Expense.Date,Item.Id,Supplier.Id,Receipt]),[]);

      EnableControls;
    end;
  end;
end;

procedure TfrmExpenseList.sbtnNewClick(Sender: TObject);
begin
  inherited;
  New;
end;

procedure TfrmExpenseList.SetTotal;
begin
  // set total
  if grList.DataSource.DataSet.RecordCount > 0 then
    lblTotal.Caption := FormatFloat('Total: ###,###,##0.00', (grList.DataSource.DataSet as TFDStoredProc).Aggregates[0].Value)
  else lblTotal.Caption := 'Total: 0.00';
end;

function TfrmExpenseList.SearchItem: TItem;
var
  LItem: TItem;
begin
  LItem := TItem.Create;
  if SearchUtil.SearchItem(self,LItem) then Result := LItem
  else Result := nil;
end;

function TfrmExpenseList.SearchSupplier: TSupplier;
var
  LSupplier: TSupplier;
begin
  LSupplier := TSupplier.Create;
  if SearchUtil.SearchSupplier(self,LSupplier) then Result := LSupplier
  else Result := nil;
end;

procedure TfrmExpenseList.SetFieldsFromUnboundControls;
begin
  with grList.DataSource.DataSet do
  begin
    if State <> dsInsert then Edit;

    if Expense.HasProject then FieldByName('R_PROJECT_ID').AsInteger := Expense.Project.Id
    else FieldByName('R_PROJECT_ID').AsVariant := null;

    if Expense.HasItem then FieldByName('R_ITEM_ID').AsInteger := Expense.Item.Id
    else FieldByName('R_ITEM_ID').AsVariant := null;

    if Expense.HasSupplier then FieldByName('R_SUPPLIER_ID').AsInteger := Expense.Supplier.Id
    else FieldByName('R_SUPPLIER_ID').AsVariant := null;
  end;
end;

procedure TfrmExpenseList.SetUnboundControls;
var
  LExpenseType: TItem;
  LSupplier: TSupplier;
begin
  with grList.DataSource.DataSet do
  begin
    BindToObject;

    if FieldByName('R_ITEM_ID').IsNull then
    begin
      Expense.ClearItem;
      bteItem.Clear;
    end
    else
    begin
      LExpenseType := TItem.Create;
      LExpenseType.Id := FieldByName('R_ITEM_ID').AsInteger;
      LExpenseType.Name := FieldByName('R_ITEM_NAME').AsString;

      Expense.Item := LExpenseType;

      bteItem.Text := LExpenseType.Name;
    end;

    if FieldByName('R_SUPPLIER_ID').IsNull then
    begin
      Expense.ClearSupplier;
      bteSupplier.Clear;
    end
    else
    begin
      LSupplier := TSupplier.Create;
      LSupplier.Id := FieldByName('R_SUPPLIER_ID').AsInteger;
      LSupplier.Name := FieldByName('R_SUPPLIER_NAME').AsString;

      Expense.Supplier := LSupplier;

      bteSupplier.Text := LSupplier.Name;
    end;
  end;
end;

end.
