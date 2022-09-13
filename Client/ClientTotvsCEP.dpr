program ClientTotvsCEP;

uses
  Vcl.Forms,
  CEP.Entity in 'src\CEP\Model\CEP.Entity.pas',
  Endpoints.Enum in 'src\Endpoints\Model\Endpoints.Enum.pas',
  Main.View in 'src\Principal\View\Main.View.pas' {frmMain},
  CEP.Controller in 'src\CEP\Controller\CEP.Controller.pas',
  CEP.Controller.Contract in 'src\CEP\Controller\CEP.Controller.Contract.pas',
  Main.Controller in 'src\Principal\Controller\Main.Controller.pas',
  Main.Controller.Contract in 'src\Principal\Controller\Main.Controller.Contract.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
