unit Migrate;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, Vcl.StdCtrls, RzLabel,
  Vcl.ExtCtrls, RzPanel, RzButton, Data.DB, Bde.DBTables;

type
  TBDETable = (tbProjects, tbSuppliers, tbExpenseTypes, tbExpenses);

  TfrmMigrate = class(TfrmBaseDocked)
    pnlProjects: TRzPanel;
    btnProjects: TRzShapeButton;
    pnlSuppliers: TRzPanel;
    btnSuppliers: TRzShapeButton;
    pnlExpenseTypes: TRzPanel;
    btnExpenseTypes: TRzShapeButton;
    pnlExpenses: TRzPanel;
    btnExpenses: TRzShapeButton;
    lblMigrationStatus: TLabel;
    procedure btnProjectsClick(Sender: TObject);
    procedure btnSuppliersClick(Sender: TObject);
    procedure btnExpenseTypesClick(Sender: TObject);
    procedure btnExpensesClick(Sender: TObject);
  private
    { Private declarations }
    procedure Migrate(table: TBDETable);
    procedure MigrateProjects(ATable: TTable);
    procedure MigrateSuppliers(ATable: TTable);
    procedure MigrateExpenseTypes(ATable: TTable);
    procedure MigrateExpenses(ATable: TTable);
  public
    { Public declarations }
  end;

var
  frmMigrate: TfrmMigrate;

implementation

{$R *.dfm}

uses
  AppData;

procedure TfrmMigrate.btnExpensesClick(Sender: TObject);
begin
  Migrate(tbExpenses);
end;

procedure TfrmMigrate.btnExpenseTypesClick(Sender: TObject);
begin
  Migrate(tbExpenseTypes);
end;

procedure TfrmMigrate.btnProjectsClick(Sender: TObject);
begin
  Migrate(tbProjects);
end;

procedure TfrmMigrate.btnSuppliersClick(Sender: TObject);
begin
  Migrate(tbSuppliers);
end;

procedure TfrmMigrate.Migrate(table: TBDETable);
var
  LTable: TTable;
begin
  LTable := TTable.Create(nil);

  LTable.DatabaseName := 'jtconstruction';

  try
    case table of
      tbProjects:
        begin
          LTable.TableName := 'PROJECTS.DB';
          MigrateProjects(LTable);
        end;

      tbSuppliers:
        begin
          LTable.TableName := 'SUPPLIERS.DB';
          MigrateSuppliers(LTable);
        end;

      tbExpenseTypes:
        begin
          LTable.TableName := 'EXPENSE_TYPES.DB';
          MigrateExpenseTypes(LTable);
        end;

      tbExpenses:
        begin
          LTable.TableName := 'PROJECT_RECS.DB';
          MigrateExpenses(LTable);
        end;
    end;
  finally
    LTable.Free;
  end;
end;

procedure TfrmMigrate.MigrateExpenses(ATable: TTable);
begin
  with dmApplication.fdtExpenses do
  begin
    try
      CachedUpdates := true;

      Open;

      lblMigrationStatus.Visible := true;

      ATable.Open;
      while not ATable.Eof do
      begin
        lblMigrationStatus.Caption := 'Migration in progress. ' +
                                      IntToStr(ATable.RecNo) + ' of ' + IntToStr(ATable.RecordCount) + '.';

        lblMigrationStatus.Update;

        Application.ProcessMessages;

        Append;
        // FieldByName('EXPENSE_ID').AsInteger := ATable.FieldByName('EntryNo').Asinteger;
        FieldByName('EXPENSE_DATE').AsDateTime := ATable.FieldByName('Date').AsDateTime;
        FieldByName('RECEIPT').AsString := ATable.FieldByName('Receipt').AsString;
        FieldByName('ITEM_ID').AsInteger := ATable.FieldByName('ExpNo').AsInteger;
        FieldByName('QUANTITY').AsInteger := ATable.FieldByName('Quantity').Asinteger;
        FieldByName('EXPENSE_AMOUNT').AsFloat := ATable.FieldByName('Amount').AsFloat;
        FieldByName('PROJECT_ID').AsInteger := ATable.FieldByName('ProjId').Asinteger;
        FieldByName('SUPPLIER_ID').AsInteger := ATable.FieldByName('SuppId').AsInteger;
        FieldByName('REMARKS').AsString := ATable.FieldByName('Remarks').AsString;
        Post;

        ATable.Next;
      end;

      ApplyUpdates;
      CommitUpdates;

      lblMigrationStatus.Caption := 'Migration done.';
    finally
      Close;
      ATable.Close;
      CachedUpdates := false;
    end;
  end;
end;

procedure TfrmMigrate.MigrateExpenseTypes(ATable: TTable);
begin
  with dmApplication.fdtItem do
  begin
    try
      CachedUpdates := true;

      Open;

      lblMigrationStatus.Visible := true;

      ATable.Open;
      while not ATable.Eof do
      begin
        lblMigrationStatus.Caption := 'Migration in progress. ' +
                                      IntToStr(ATable.RecNo) + ' of ' + IntToStr(ATable.RecordCount) + '.';

        lblMigrationStatus.Update;

        Application.ProcessMessages;

        Append;
        FieldByName('ITEM_ID').AsInteger := ATable.FieldByName('ExpNo').Asinteger;
        FieldByName('ITEM_NAME').AsString := ATable.FieldByName('ExpType').AsString;
        Post;

        ATable.Next;
      end;

      ApplyUpdates;
      CommitUpdates;

      lblMigrationStatus.Caption := 'Migration done.';
    finally
      Close;
      ATable.Close;
      CachedUpdates := false;
    end;
  end;
end;

procedure TfrmMigrate.MigrateProjects(ATable: TTable);
begin
  with dmApplication.fdtProjects do
  begin
    try
      CachedUpdates := true;

      Open;

      lblMigrationStatus.Visible := true;

      ATable.Open;
      while not ATable.Eof do
      begin
        lblMigrationStatus.Caption := 'Migration in progress. ' +
                                      IntToStr(ATable.RecNo) + ' of ' + IntToStr(ATable.RecordCount) + '.';

        lblMigrationStatus.Update;

        Application.ProcessMessages;

        Append;
        FieldByName('PROJECT_NAME').AsString := ATable.FieldByName('ProjName').AsString;
        FieldByName('STATUS_ID').AsString := ATable.FieldByName('Status').AsString;
        FieldByName('PROJECT_ID').AsInteger := ATable.FieldByName('ProjId').AsInteger;
        Post;

        ATable.Next;
      end;

      ApplyUpdates;
      CommitUpdates;

      lblMigrationStatus.Caption := 'Migration done.';
    finally
      Close;
      ATable.Close;
      CachedUpdates := false;
    end;
  end;
end;

procedure TfrmMigrate.MigrateSuppliers(ATable: TTable);
begin
  with dmApplication.fdtSuppliers do
  begin
    try
      CachedUpdates := true;

      Open;

      lblMigrationStatus.Visible := true;

      ATable.Open;
      while not ATable.Eof do
      begin
        lblMigrationStatus.Caption := 'Migration in progress. ' +
                                      IntToStr(ATable.RecNo) + ' of ' + IntToStr(ATable.RecordCount) + '.';

        lblMigrationStatus.Update;

        Application.ProcessMessages;

        Append;
        FieldByName('SUPPLIER_NAME').AsString := ATable.FieldByName('SuppName').AsString;
        FieldByName('SUPPLIER_ID').AsInteger := ATable.FieldByName('SuppId').AsInteger;
        Post;

        ATable.Next;
      end;

      ApplyUpdates;
      CommitUpdates;

      lblMigrationStatus.Caption := 'Migration done.';
    finally
      Close;
      ATable.Close;
      CachedUpdates := false;
    end;
  end;
end;

end.
