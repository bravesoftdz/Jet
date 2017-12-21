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
    pnlReportAction: TRzPanel;
    procedure FormShow(Sender: TObject);
    procedure fdspReportAfterGetRecords(DataSet: TFDDataSet);
  private
    { Private declarations }
    LOADING: boolean;

    const MSG_RUN_ONSHOW  =  WM_USER + 1000;

    procedure HandleRunOnShow(var Msg:TMessage);  message MSG_RUN_ONSHOW;
  protected
    procedure GenerateReport; virtual;
    procedure SetReportDate; virtual;
    procedure SetPageNumber; virtual;
    procedure SetCount; virtual;
    procedure ShowStatusPanel;
    procedure Print;
    procedure SetUnboundControls; virtual;
    procedure FilterReport; virtual;
    procedure SortReport; virtual;
  public
    { Public declarations }
  end;

var
  frmBasePrint: TfrmBasePrint;

implementation

{$R *.dfm}

uses
  AppDialogs, AppData;

procedure TfrmBasePrint.fdspReportAfterGetRecords(DataSet: TFDDataSet);
begin
  inherited;
  // initially was in the AfterOpen event of the DataSet
  // however, getting TOTAL values is an issue
  // not all records are added
  SetUnboundControls;
end;

procedure TfrmBasePrint.FilterReport;
begin

end;

procedure TfrmBasePrint.FormShow(Sender: TObject);
begin
  LOADING := true;
  fdspReport.Open;
  rlPreview.ZoomIn(-10);
  GenerateReport;
end;

procedure TfrmBasePrint.GenerateReport;
begin
  try
    try
      Screen.Cursor := crHourGlass;

      rlPreview.Hide;

      ShowStatusPanel;

      Application.ProcessMessages;

      fdspReport.Close;
      fdspReport.Open;

      FilterReport;
      SortReport;

      rlReport.Prepare;
      rlReport.Preview(rlPreview);

      rlPreview.FirstPage;

      Application.ProcessMessages;

      SetCount;
      SetPageNumber;

    except
      on E: Exception do ShowErrorBox(E.Message);
    end;
  finally
    Screen.Cursor := crDefault;
    pnlStatus.Visible := false;
    rlPreview.Show;
  end;
end;

procedure TfrmBasePrint.HandleRunOnShow(var Msg: TMessage);
begin
  GenerateReport;
end;

procedure TfrmBasePrint.Print;
begin
  rlReport.Print;
end;

procedure TfrmBasePrint.SetCount;
begin

end;

procedure TfrmBasePrint.SetPageNumber;
begin

end;

procedure TfrmBasePrint.SetReportDate;
begin

end;

procedure TfrmBasePrint.SetUnboundControls;
begin
  inherited;

end;

procedure TfrmBasePrint.ShowStatusPanel;
begin
  with pnlStatus do
  begin
    Top := Round((pnlReport.Height/2) - (Height/2));
    Left := Round((pnlReport.Width/2) - (Width/2));
    Visible := true;
  end;
end;

procedure TfrmBasePrint.SortReport;
begin

end;

end.
