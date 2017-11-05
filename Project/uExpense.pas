unit uExpense;

interface

uses
  SysUtils, uItem, uSupplier, uProject;

type
  TExpense = class
  private
    FDate: TDateTime;
    FRemarks: string;
    FItem: TItem;
    FProject: TProject;
    FIsCancelled: boolean;
    FId: integer;
    FAmount: single;
    FQuantity: single;
    FReceipt: string;
    FSupplier: TSupplier;
    function GetHasItem: boolean;
    function GetHasProject: boolean;
    function GetHasSupplier: boolean;
    function GetAmountIsInvalid: boolean;
    function GetHasReceipt: boolean;
  public
    property Id: integer read FId write FId;
    property Date: TDateTime read FDate write FDate;
    property Receipt: string read FReceipt write FReceipt;
    property Item: TItem read FItem write FItem;
    property Quantity: single read FQuantity write FQuantity;
    property Amount: single read FAmount write FAmount;
    property Project: TProject read FProject write FProject;
    property Supplier: TSupplier read FSupplier write FSupplier;
    property Remarks: string read FRemarks write FRemarks;
    property IsCancelled: boolean read FIsCancelled write FIsCancelled;
    property HasItem: boolean read GetHasItem;
    property HasProject: boolean read GetHasProject;
    property HasSupplier: boolean read GetHasSupplier;
    property AmountIsInvalid: boolean read GetAmountIsInvalid;
    property HasReceipt: boolean read GetHasReceipt;

    procedure ClearSupplier;
    procedure ClearItem;

    destructor Destroy; override;
  end;

implementation

{ TExpense }

procedure TExpense.ClearItem;
begin
  if Assigned(FItem) then FreeAndNil(FItem);
end;

procedure TExpense.ClearSupplier;
begin
  if Assigned(FSupplier) then FreeAndNil(FSupplier);
end;

destructor TExpense.Destroy;
begin
  ClearItem;
  ClearSupplier;
  inherited;
end;

function TExpense.GetAmountIsInvalid: boolean;
begin
  Result := FAmount <= 0;
end;

function TExpense.GetHasItem: boolean;
begin
  Result := Assigned(FItem);
end;

function TExpense.GetHasProject: boolean;
begin
  Result := Assigned(FProject);
end;

function TExpense.GetHasReceipt: boolean;
begin
  Result := Trim(FReceipt) <> '';
end;

function TExpense.GetHasSupplier: boolean;
begin
  Result := Assigned(FSupplier);
end;

end.
