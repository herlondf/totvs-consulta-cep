unit CEP.Controller;

interface

uses
  Horse;

type
  TCEPController = class
  protected
    class procedure GetCEP(AReq: THorseRequest; ARes: THorseResponse);
    class procedure GetCEPErrorRoute(AReq: THorseRequest; ARes: THorseResponse);
  public
    class procedure Register;
  end;

implementation

uses
  System.SysUtils,
  Config.Server,
  CEP.Handler;

{ TCEPController }

class procedure TCEPController.Register;
begin
  THorse.GET( 'cep/'      , GetCEPErrorRoute );
  THorse.GET( 'cep/:cep' , GetCEP            );
end;

class procedure TCEPController.GetCEPErrorRoute(AReq: THorseRequest; ARes: THorseResponse);
begin
  TCEPHandler.New.GetCEP( AReq.Params[''], ARes );
end;

class procedure TCEPController.GetCEP(AReq: THorseRequest; ARes: THorseResponse);
begin
  TCEPHandler.New.GetCEP( AReq.Params['cep'], ARes );
end;

end.
