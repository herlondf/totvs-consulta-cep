unit CEP.Controller;

interface

uses
  RestRequest4D,
  CEP.Entity,
  CEP.Controller.Contract;

type
  iCEPController = CEP.Controller.Contract.iCEPController;

  TCEPController = class(TInterfacedObject, iCEPController)
    constructor Create;
    destructor Destroy; override;
    class function New: iCEPController;
  private

  public
    function GetCEP(const AEndpoint: String; const ACEP: String): TCEPEntity;
  end;


implementation

uses
  GBJSON.Helper,
  System.SysUtils;

{ TCEPController }

constructor TCEPController.Create;
begin

end;

destructor TCEPController.Destroy;
begin

  inherited;
end;

class function TCEPController.New: iCEPController;
begin
  Result := Self.Create;
end;

function TCEPController.GetCEP(const AEndpoint: String; const ACEP: String): TCEPEntity;
var
  LResponse: IResponse;
  LEntity  : TCEPEntity;
begin
  try
    LResponse :=
      TRequest.New
        .BaseURL  ( Concat( AEndpoint, '/', ACEP ) )
        .Accept   ( 'application/json' )
        .Get;
  finally
    LEntity := TCEPEntity.Create;
    LEntity.fromJSONString( LResponse.Content );
    Result := LEntity;
  end;
end;

end.
