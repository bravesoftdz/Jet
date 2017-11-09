unit KeyGeneratorMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmKeyGenerator = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    edPhrase: TEdit;
    edKey: TEdit;
    btnGenerate: TButton;
    cbxSimple: TCheckBox;
    procedure btnGenerateClick(Sender: TObject);
  private
    { Private declarations }
    procedure GenerateKey;
  public
    { Public declarations }
  end;

var
  frmKeyGenerator: TfrmKeyGenerator;

implementation

{$R *.dfm}

uses
  SecurityUtil;

procedure TfrmKeyGenerator.btnGenerateClick(Sender: TObject);
begin
  GenerateKey;
end;

procedure TfrmKeyGenerator.GenerateKey;
var
  phrase, key: string;
begin
  phrase := edPhrase.Text;

  if cbxSimple.Checked then key := Decrypt(phrase)
  else key := GetKey(phrase,true);

  edKey.Text := key;
end;

end.
