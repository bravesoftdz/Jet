unit BaseReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, BasePrint, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  RzButton, RzEdit, RzBtnEdt, Vcl.StdCtrls, Vcl.Mask, RzDBEdit, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.ExtCtrls, RLReport, RLPreview,
  RzLabel, RzPanel;

type
  TfrmBaseReport = class(TfrmBasePrint)
    pnlDetail: TRzPanel;
    Label4: TLabel;
    bteExpense: TRzButtonEdit;
    pnlGenerate: TRzPanel;
    btnGenerate: TRzShapeButton;
    pnlPrint: TRzPanel;
    btnPrint: TRzShapeButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmBaseReport: TfrmBaseReport;

implementation

{$R *.dfm}

end.
