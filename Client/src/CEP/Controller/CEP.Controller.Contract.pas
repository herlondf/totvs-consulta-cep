unit CEP.Controller.Contract;

interface

uses
    CEP.Entity;

type
  iCEPController = interface
    ['{66AE2B29-0816-4C16-9C13-D8FCD8BB86E0}']
    function GetCEP(const AEndpoint: String; const ACEP: String): TCEPEntity;
  end;

implementation

end.
