program ApiConsultaCEP;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.CORS,
  Horse.Logger,
  Horse.Logger.Provider.Console,
  Horse.Jhonson,
  Horse.GBSwagger,
  Horse.HandleException,
  Config.Server in 'src\Config\Config.Server.pas',
  CEP.Controller in 'src\CEP\Controller\CEP.Controller.pas',
  CEP.Handler.Contract in 'src\CEP\Model\CEP.Handler.Contract.pas',
  CEP.Handler.ViaCEP in 'src\CEP\Model\CEP.Handler.ViaCEP.pas',
  CEP.Handler in 'src\CEP\Model\CEP.Handler.pas',
  CEP.Handler.ApiCEP in 'src\CEP\Model\CEP.Handler.ApiCEP.pas',
  CEP.Handler.AwesomeApiCEP in 'src\CEP\Model\CEP.Handler.AwesomeApiCEP.pas',
  CEP.Entity.ViaCEP in 'src\CEP\Model\CEP.Entity.ViaCEP.pas',
  CEP.Entity.Parse in 'src\CEP\Model\CEP.Entity.Parse.pas',
  CEP.Entity in 'src\CEP\Model\CEP.Entity.pas',
  CEP.Entity.ApiCEP in 'src\CEP\Model\CEP.Entity.ApiCEP.pas',
  CEP.Entity.AwesomeApiCEP in 'src\CEP\Model\CEP.Entity.AwesomeApiCEP.pas',
  CEP.HandleErrors in 'src\CEP\Model\CEP.HandleErrors.pas',
  CEP.Swagger in 'src\CEP\Doc\CEP.Swagger.pas';

begin
  ReportMemoryLeaksOnShutdown := True;

  THorseLoggerManager.RegisterProvider(
    THorseLoggerProviderConsole.New(
      THorseLoggerConsoleConfig.New
        .SetLogFormat('${request_clientip} [${time}] ${response_status}')
    )
  );

  THorse
    .Use(CORS)
    .Use(THorseLoggerManager.HorseCallback)
    .Use(Jhonson)
    .Use(HandleException)
    .Use(HorseSwagger);

  TSwagger.Initialize;
  TCEPController.Register;

  THorse.Listen(
    TServerConfig.Port,
    procedure(AHorse: THorse)
    begin
      WriteLn(Format( TServerConfig.ServerIsRunning, [THorse.Host, THorse.Port]));
    end);
end.
