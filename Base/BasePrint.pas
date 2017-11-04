unit BasePrint;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseDocked, RLReport, RLPreview,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ExtCtrls, BaseForm, RzLabel, RzPanel,
  Vcl.DBCtrls, RzDBCmbo, RzButton, RzDBEdit, RzEdit, RzBtnEdt, Vcl.Mask;

type
  TfrmBasePrint = class(TfrmBaseDocked)
    pnlReport: TRzPanel;
    rlPreview: TRLPreview;
    rlReport: TRLReport;
    dscReport: TDataSource;
    fdspReport: TFDStoredProc;
    pnlStatus: TRzPanel;
    Shape1: TShape;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    LOADING: boolean;

    const MSG_RUN_ONSHOW  =  WM_USER + 1000;

    procedure HandleRunOnShow(var Msg:TMessage);  message MSG_RUN_ONSHOW;

    procedure GenerateReport; virtual;
    procedure SetReportDate; virtual;
    procedure ShowStatusPanel;
  public
    { Public declarations }
  end;

var
  frmBasePrint: TfrmBasePrint;

implementation

{$R *.dfm}

uses
  AppDialogs, AppData;

procedure TfrmBasePrint.FormShow(Sender: TObject);
begin
  LOADING := true;
  fdspReport.Open;
  rlPreview.ZoomIn(-20);
  GenerateReport;
end;

procedure TfrmBasePrint.GenerateReport;
begin
  try
    try
      Screen.Cursor := crHourGlass;

      ShowStatusPanel;

      fdspReport.Close;
      fdspReport.Open;

      rlReport.Prepare;
      rlReport.Preview(rlPreview);

      Application.ProcessMessages;
    except
      on E: Exception do ShowErrorBox(E.Message);
    end;
  finally
    Screen.Cursor := crDefault;
    pnlStatus.Visible := false;
  end;
end;

procedure TfrmBasePrint.HandleRunOnShow(var Msg: TMessage);
begin
  GenerateReport;
end;

procedure TfrmBasePrint.SetReportDate;
begin

end;

procedure TfrmBasePrint.ShowStatusPanel;
begin
  with pnlStatus do
  begin
    Top := Round((rlPreview.Height/2) - (Height/2));
    Left := Round((rlPreview.Width/2) - (Width/2));
  end;
end;

end.
