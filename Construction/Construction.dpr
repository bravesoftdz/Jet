program Construction;

uses
  Vcl.Forms,
  Login in 'Login.pas',
  Main in 'Main.pas' {frmMain},
  BasePopup in '..\Base\BasePopup.pas' {frmBasePopup},
  AppUtil in '..\Common\AppUtil.pas' {$R *.res};

{$R *.res}

begin
  if not RestoreIfRunning(Application.Handle) then
  begin
    if TfrmLogin.LoggedIn then
    begin
      Application.Initialize;
      Application.MainFormOnTaskbar := True;
      Application.CreateForm(TfrmMain, frmMain);
      Application.Run;
    end;
  end;
end.
