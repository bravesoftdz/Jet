unit SearchUtil;

interface

uses
  System.SysUtils, System.Classes, System.UITypes, uClient, uSupplier,
  uItem, uProject;

function SearchClient(AOwner: TComponent; var AClient: TClient): boolean;
function SearchSupplier(AOwner: TComponent; var ASupplier: TSupplier): boolean;
function SearchItem(AOwner: TComponent;var AItem: TItem): boolean;
function SearchProject(AOwner: TComponent; var AProject: TProject): boolean;

implementation

uses
  AppDialogs, ClientSearch, ItemSearch, SupplierSearch, ProjectSearch;

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

function SearchItem(AOwner: TComponent;var AItem: TItem): boolean;
begin
  Result := false;
  try
    with TfrmItemSearch.Create(AOwner,AItem) do
    begin
      ShowModal;
      Result := ModalResult = mrOk;
    end;
  except
    on E: Exception do
    begin
      FreeAndNil(AItem);
      ShowErrorBox(E.Message);
    end;
  end;
end;

function SearchProject(AOwner: TComponent; var AProject: TProject): boolean;
begin
  Result := false;
  try
    with TfrmProjectSearch.Create(AOwner,AProject) do
    begin
      ShowModal;
      Result := ModalResult = mrOk;
    end;
  except
    on E: Exception do
    begin
      FreeAndNil(AProject);
      ShowErrorBox(E.Message);
    end;
  end;
end;

end.
