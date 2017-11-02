unit SearchUtil;

interface

uses
  System.SysUtils, System.Classes, System.UITypes, uClient, uSupplier,
  uExpenseType;

function SearchClient(AOwner: TComponent; var AClient: TClient): boolean;
function SearchSupplier(AOwner: TComponent; var ASupplier: TSupplier): boolean;
function SearchExpenseType(AOwner: TComponent;var AExpenseType: TExpenseType): boolean;

implementation

uses
  AppDialogs, ClientSearch, ExpenseTypeSearch, SupplierSearch;

function SearchClient(AOwner: TComponent; var AClient: TClient): boolean;
begin
  Result := false;
  try
    with TfrmClientSearch.Create(AOwner,AClient) do
    begin
      ShowModal;
      Result := ModalResult = mrOk;
    end;
  except
    on E: Exception do
    begin
      FreeAndNil(AClient);
      ShowErrorBox(E.Message);
    end;
  end;
end;

function SearchSupplier(AOwner: TComponent; var ASupplier: TSupplier): boolean;
begin
  Result := false;
  try
    with TfrmSupplierSearch.Create(AOwner,ASupplier) do
    begin
      ShowModal;
      Result := ModalResult = mrOk;
    end;
  except
    on E: Exception do
    begin
      FreeAndNil(ASupplier);
      ShowErrorBox(E.Message);
    end;
  end;
end;

function SearchExpenseType(AOwner: TComponent;var AExpenseType: TExpenseType): boolean;
begin
  Result := false;
  try
    with TfrmExpenseTypeSearch.Create(AOwner,AExpenseType) do
    begin
      ShowModal;
      Result := ModalResult = mrOk;
    end;
  except
    on E: Exception do
    begin
      FreeAndNil(AExpenseType);
      ShowErrorBox(E.Message);
    end;
  end;
end;

end.
