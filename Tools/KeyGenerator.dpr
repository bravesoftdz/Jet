program KeyGenerator;

uses
  Vcl.Forms,
  KeyGeneratorMain in 'KeyGeneratorMain.pas' {frmKeyGenerator};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmKeyGenerator, frmKeyGenerator);
  Application.Run;
end.
