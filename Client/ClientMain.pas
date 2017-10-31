unit ClientMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseGridDetail, Data.DB, RzButton,
  Vcl.StdCtrls, Vcl.Mask, RzEdit, Vcl.Grids, Vcl.DBGrids, RzDBGrid, RzLabel,
  Vcl.ExtCtrls, RzPanel, uClient, Data.Bind.Components, Data.Bind.ObjectScope,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, System.Rtti, System.Bindings.Outputs,
  Vcl.Bind.Editors, RzDBEdit, Vcl.DBCtrls;

type
  TfrmClientMain = class(TfrmBaseGridDetail)
    edName: TRzDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    mmDescription: TRzDBMemo;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    Client: TClient;
  protected
    procedure SearchList; override;
    procedure BindToObject; override;
    function EntryIsValid: boolean; override;
  public
    { Public declarations }
    procedure SetIdentity; override;
  end;

var
  frmClientMain: TfrmClientMain;

implementation

uses
  AppData, AppDialogs, DBUtil;

{$R *.dfm}

{ TfrmClientMain }

procedure TfrmClientMain.BindToObject;
begin
  Client.Name := edName.Text;
  Client.Description := mmDescription.Text;
end;

function TfrmClientMain.EntryIsValid: boolean;
var
  error: string;
begin
  if not Client.HasName then error := 'Please enter client name.';

  Result := error = '';

  if not Result then ShowErrorBox(error);
end;

procedure TfrmClientMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Client.Free;
end;

procedure TfrmClientMain.FormCreate(Sender: TObject);
begin
  Client := TClient.Create;
  inherited;
end;

procedure TfrmClientMain.SearchList;
begin
  inherited;

end;

procedure TfrmClientMain.SetIdentity;
begin
  SetClientIdentity;
end;

end.
