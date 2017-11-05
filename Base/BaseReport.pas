unit BaseReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePrint, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  RzButton, RzEdit, RzBtnEdt, Vcl.StdCtrls, Vcl.Mask, RzDBEdit, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, RLReport, RLPreview,
  RzLabel, RzPanel, uProject;

type
  TfrmBaseReport = class(TfrmBasePrint)
    pnlDetail: TRzPanel;
    Label4: TLabel;
    bteProject: TRzButtonEdit;
    pnlGenerate: TRzPanel;
    btnGenerate: TRzShapeButton;
    pnlPrint: TRzPanel;
    btnPrint: TRzShapeButton;
    RLBand2: TRLBand;
    lblCompanyName: TRLLabel;
    lblReportTitle: TRLLabel;
    bndFooter: TRLBand;
    siDate: TRLSystemInfo;
    siPageNumber: TRLSystemInfo;
    urlNext: TRzURLLabel;
    urlPrevious: TRzURLLabel;
    lblCount: TRzLabel;
    lblPage: TRzLabel;
    procedure btnGenerateClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure urlNextClick(Sender: TObject);
    procedure urlPreviousClick(Sender: TObject);
    procedure bteProjectButtonClick(Sender: TObject);
  private
    { Private declarations }
  protected
    Project: TProject;
    procedure SetPageNumber; override;
    procedure SetCount; override;
    function SearchProject: TProject;
  public
    { Public declarations }
  end;

var
  frmBaseReport: TfrmBaseReport;

implementation

{$R *.dfm}

uses
  SearchUtil;

procedure TfrmBaseReport.bteProjectButtonClick(Sender: TObject);
var
  LProject: TProject;
begin
  LProject := SearchProject;
  if Assigned(LProject) then
  begin
    Project := LProject;
    bteProject.Text := LProject.Name;
  end;
end;

procedure TfrmBaseReport.btnGenerateClick(Sender: TObject);
begin
  inherited;
  GenerateReport;
end;

procedure TfrmBaseReport.btnPrintClick(Sender: TObject);
begin
  inherited;
  Print;
end;

function TfrmBaseReport.SearchProject: TProject;
var
  LProject: TProject;
begin
  LProject := TProject.Create;
  if SearchUtil.SearchProject(self,LProject) then Result := LProject
  else Result := nil;
end;

procedure TfrmBaseReport.SetCount;
begin
  inherited;
  if fdspReport.RecordCount = 1 then lblCount.Caption := '1 record found.'
  else lblCount.Caption := IntToStr(fdspReport.RecordCount) + ' records found.';
end;

procedure TfrmBaseReport.SetPageNumber;
begin
  lblPage.Caption := 'Page ' + IntToStr(rlPreview.PageNumber) + ' of ' +
    IntToStr(rlPreview.Pages.PageCount);
end;

procedure TfrmBaseReport.urlNextClick(Sender: TObject);
begin
  inherited;
  rlPreview.NextPage;
  SetPageNumber;
end;

procedure TfrmBaseReport.urlPreviousClick(Sender: TObject);
begin
  inherited;
  rlPreview.PriorPage;
  SetPageNumber;
end;

end.
