program TextComparer;

uses
  Vcl.Forms,
  UMain in 'UMain.pas' {FrmMain},
  UWord in 'UWord.pas',
  UComparer in 'UComparer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
