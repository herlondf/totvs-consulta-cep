unit CEP.Handler.ViaCEP;

interface

uses
  Horse,
  CEP.Handler.Contract;

type
 { Concrete Handler - Consulta em https://viacep.com.br/ }
  TCEPHandlerViaCEP = class(TInterfacedObject, IParser)
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
  CEP.HandleErrors,
  CEP.Entity.Parse;

{ TCEPHandlerViaCEP }

class function TCEPHandlerViaCEP.New: iParser;
begin
  Result := Self.Create;
end;

function TCEPHandlerViaCEP.GetCEP( const ACEP: string; ARes: THorseResponse ): iParser;
var
  LResponse: IResponse;

begin
  Result := Self;

  try
    LResponse :=
      TRequest.New
        .BaseURL  ( Format( 'http://viacep.com.br/ws/%s/json1', [ACEP] ) )
        .Accept   ( 'application/json' )
        .Timeout  ( 5000 )
        .Get;
  except

  end;

  if TCEFHandleErrors.ViaCEPError( LResponse.Content ) or ( LResponse.StatusCode <> 200 ) then
  begin
    if Assigned( FNextParser ) then
      FNextParser.GetCEP( ACEP, ARes );
  end
  else
  if ( LResponse.StatusCode = 200 ) then
    ARes.Send( TCEPEntityParse.ViaCEPParseToJSONString( LResponse.Content ) );
end;

function TCEPHandlerViaCEP.NextParser( ANextParser: iParser ): iParser;
begin
  Result := Self;
  FNextParser := ANextParser;
end;

end.
