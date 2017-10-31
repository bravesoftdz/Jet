unit FormsUtil;

interface

uses
  Vcl.Controls, RzDBCmbo, RzDBGrid, RzGrids, DB, RzLstBox, RzChkLst, Vcl.ExtCtrls,
  System.Classes, RzCmboBx, VCL.DBGrids, FireDAC.Comp.Client;

procedure OpenDropdownDataSources(const parentCtrl: TWinControl;
  const open: boolean = true);
procedure OpenGridDataSources(const parentCtrl: TWinControl;
  const open: boolean = true);
procedure ButtonDown(Sender: TObject);
procedure ButtonUp(Sender: TObject);
procedure ExtendLastColumn(grid: TRzDBGrid); overload;
procedure ExtendLastColumn(grid: TRzStringGrid); overload;
procedure PopulateComboBox(source: TDataSet; comboBox: TRzComboBox;
  const codeField, nameField: string); overload;
procedure SortGrid(grid: TRzDBGrid; column: TColumn; const ASort: string = '');

function FirstRow(grid: TRzStringGrid): boolean;

implementation

procedure OpenDropdownDataSources(const parentCtrl: TWinControl;
  const open: boolean = true);
var
  ctrlCnt: integer;
  i: integer;
  ds: TDataSet;
begin
  ctrlCnt := parentCtrl.ControlCount - 1;
  for i := 0 to ctrlCnt do
  begin
    if parentCtrl.Controls[i] is TRzDBLookupComboBox then
    begin
      if (parentCtrl.Controls[i] as TRzDBLookupComboBox).DataSource <> nil then
      begin
        ds := (parentCtrl.Controls[i] as TRzDBLookupComboBox).ListSource.DataSet;

        ds.Close;

        if open then
          ds.Open;
      end
    end
  end;
end;

procedure OpenGridDataSources(const parentCtrl: TWinControl;
  const open: boolean = true);
var
  ctrlCnt: integer;
  i: integer;
  ds: TDataSet;
begin
  ctrlCnt := parentCtrl.ControlCount - 1;
  for i := 0 to ctrlCnt do
  begin
    if parentCtrl.Controls[i] is TRzDBGrid then
    begin
      if (parentCtrl.Controls[i] as TRzDBGrid).DataSource <> nil then
      begin
        ds := (parentCtrl.Controls[i] as TRzDBGrid).DataSource.DataSet;

        ds.Close;

        if open then
          ds.Open;
      end
    end
  end;
end;

procedure ButtonDown(Sender: TObject);
begin
  (Sender as TImage).Left := (Sender as TImage).Left + 1;
  (Sender as TImage).Top := (Sender as TImage).Top + 1;
end;

procedure ButtonUp(Sender: TObject);
begin
  (Sender as TImage).Left := (Sender as TImage).Left - 1;
  (Sender as TImage).Top := (Sender as TImage).Top - 1;
end;

procedure ExtendLastColumn(grid: TRzDBGrid);
var
  widths, i: integer;
begin
  widths := 0;

  // get total width
  for i := 0 to grid.Columns.Count - 1 do widths := widths + grid.Columns[i].Width;

  // add extra column
  grid.Columns.Add;

  //extend to the size of the grid
  grid.Columns[grid.Columns.Count - 1].Width := grid.Width - widths + 5;
end;

procedure ExtendLastColumn(grid: TRzStringGrid);
var
  widths, i: integer;
begin
  widths := 0;

  // get total width
  for i := 0 to grid.ColCount - 1 do widths := widths + grid.ColWidths[i];

  // add extra column
  grid.ColCount := grid.ColCount + 1;

  //extend to the size of the grid
  grid.ColWidths[grid.ColCount - 1] := grid.Width - widths - 4;
end;

procedure PopulateComboBox(source: TDataSet; comboBox: TRzComboBox;
  const codeField, nameField: string); overload;
begin
  with source, comboBox do
  begin
    DisableControls;
    while not Eof do
    begin
      AddItemValue(FieldByName(nameField).AsString,FieldByName(codeField).AsString);
      Next;
    end;
    EnableControls;
  end;
end;

function FirstRow(grid: TRzStringGrid): boolean;
begin
  with grid do
    Result := (RowCount = FixedRows + 1) and (not Assigned(Objects[0,1]));
end;

procedure SortGrid(grid: TRzDBGrid; column: TColumn; const ASort: string);
var
  currentIndex: string;
  LSort: string;
begin
  with grid.DataSource.DataSet as TFDTable do
  begin
    if ASort <> '' then LSort := ASort
    else LSort := Column.FieldName;

    currentIndex := IndexFieldNames;

    if currentIndex <> LSort then
      IndexFieldNames := LSort          // ascending
    else
      IndexFieldNames := LSort + ':D';  // descending
  end;
end;

end.
