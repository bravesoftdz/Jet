unit TestReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BaseReport, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  RLReport, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls,
  Vcl.ExtCtrls, RLPreview, RzLabel, RzPanel, Vcl.DBCtrls, RzDBCmbo, RzButton,
  RzDBEdit, RzEdit, RzBtnEdt, Vcl.Mask, BasePrint;

type
  TfrmTestReport = class(TfrmBaseReport)
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLLabel1: TRLLabel;
    procedure fdspReportBeforeOpen(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTestReport: TfrmTestReport;

implementation

{$R *.dfm}

procedure TfrmTestReport.fdspReportBeforeOpen(DataSet: TDataSet);
begin
  inherited;
  fdspReport.ParamByName('P_PROJECT_ID').Value := 114;
end;

end.
