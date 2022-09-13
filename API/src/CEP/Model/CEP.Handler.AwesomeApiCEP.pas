unit CEP.Handler.AwesomeApiCEP;

interface

uses
  Horse,
  CEP.Handler.Contract;

type
 { Concrete Handler - Consulta em https://docs.awesomeapi.com.br/api-cep }
  TCEPHandlerAwesomeApiCEP = class(TInterfacedObject, IParser)
    class function New: iParser;
  private
    FNextParser: IParser;
  public
    function GetCEP( const ACEP: string; ARes: THorseResponse ): iParser;
    function NextParser( ANextParser: iParser ): iParser;
  end;

implementation

uses
  System.SysUtils,
  RESTRequest4D,
  CEP.Entity.Parse,
  CEP.HandleErrors;

{ TCEPHandlerAwesomeApiCEP }

class function TCEPHandlerAwesomeApiCEP.New: iParser;
begin
  Result := Self.Create;
end;

function TCEPHandlerAwesomeApiCEP.GetCEP( const ACEP: string; ARes: THorseResponse ): iParser;
var
  LResponse: IResponse;

begin
  Result := Self;

  try
    LResponse :=
      TRequest.New
        .BaseURL  ( Format( 'https://cep.awesomeapi.com.br/json/%s', [ACEP] ) )
        .Accept   ( 'application/json' )
        .Timeout  ( 5000 )
        .Get;
  except

  end;

  if TCEFHandleErrors.AwesomeApiCEPError( LResponse.Content ) or ( LResponse.StatusCode <> 200 ) then
  begin
    raise EHorseException.New
      .Title ( 'Falha na consulta do CEP informado.' )
      .Error ( 'CEP nao encontrado.'                 )
      .Status( THTTPStatus.NotFound                  );
  end
  else
    ARes.Send( TCEPEntityParse.AwesomeApiCEPParseToJSONString( LResponse.Content ) );
end;

function TCEPHandlerAwesomeApiCEP.NextParser(ANextParser: iParser): iParser;
begin
  Result := Self;
  FNextParser := ANextParser;
end;

end.
