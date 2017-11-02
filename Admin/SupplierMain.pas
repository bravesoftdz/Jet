unit SupplierMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, Vcl.DBCtrls, RzDBEdit, uSupplier;

type
  TfrmSupplierMain = class(TfrmBaseGridDetail)
    Label2: TLabel;
    edName: TRzDBEdit;
    Label3: TLabel;
    edContact: TRzDBEdit;
    lblPhone: TLabel;
    edPhone: TRzDBEdit;
    Label5: TLabel;
    mmAddress: TRzDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Supplier: TSupplier;
  protected
    procedure SearchList; override;
    procedure BindToObject; override;
    function EntryIsValid: boolean; override;
  public
    { Public declarations }
    procedure SetIdentity; override;
  end;

var
  frmSupplierMain: TfrmSupplierMain;

implementation

{$R *.dfm}

uses
  AppData, AppDialogs, DBUtil;

{ TfrmSupplierMain }

procedure TfrmSupplierMain.BindToObject;
begin
  Supplier.Name := edName.Text;
  Supplier.ContactPerson := edContact.Text;
  Supplier.Phone := edPhone.Text;
  Supplier.Address := mmAddress.Text;
end;

function TfrmSupplierMain.EntryIsValid: boolean;
var
  error: string;
begin
  if not Supplier.HasName then error := 'Please enter supplier name.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

procedure TfrmSupplierMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Supplier.Free;
end;

procedure TfrmSupplierMain.FormCreate(Sender: TObject);
begin
  Supplier := TSupplier.Create;
  inherited;
end;

procedure TfrmSupplierMain.SearchList;
var
  filterStr: string;
begin
  filterStr := 'SUPPLIER_NAME LIKE ' + QuotedStr('%' + UpperCase(edSearchKey.Text) + '%');
  grList.DataSource.DataSet.Filter := filterStr;
end;

procedure TfrmSupplierMain.SetIdentity;
begin
  SetSupplierIdentity;
end;

end.
