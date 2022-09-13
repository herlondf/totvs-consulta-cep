unit CEP.Handler.ApiCEP;

interface

uses
  Horse,
  CEP.Handler.Contract;

type
 { Concrete Handler - Consulta em https://apicep.com/api-de-consulta/ }
  TCEPHandlerApiCEP = class(TInterfacedObject, IParser)
    class function New: iParser;
  private
    FNextParser: IParser;

    function CheckHifen(const ACEP: String): String;
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

{ TCEPHandlerApiCEP }

class function TCEPHandlerApiCEP.New: iParser;
begin
  Result := Self.Create;
end;

function TCEPHandlerApiCEP.CheckHifen(const ACEP: String): String;
var
  I: Integer;
  LCEP: String;
begin
  LCEP := '';
  for I := Low(ACEP) to High(ACEP) do
  begin
    if I = 6 then
    begin
      if ACEP[I] <> '-' then
      begin
        LCEP := Concat( LCEP, '-'     );
        LCEP := Concat( LCEP, ACEP[I] );
      end;
    end
    else
      LCEP := Concat( LCEP, ACEP[I] );
  end;

  Result := LCEP;
end;

function TCEPHandlerApiCEP.GetCEP( const ACEP: string; ARes: THorseResponse ): iParser;
var
  LResponse: IResponse;
begin
  Result := Self;

  try
    LResponse :=
      TRequest.New
        .BaseURL  ( Format( 'https://cdn.apicep.com/file/apicep/%s.json', [ CheckHifen( ACEP ) ] ) )
        .Accept   ( 'application/json' )
        .Timeout  ( 5000 )
        .Get;
  except

  end;

  if TCEFHandleErrors.ApiCEPError( LResponse.Content ) or ( LResponse.StatusCode <> 200 ) then
  begin
    if Assigned(FNextParser) then
      FNextParser.GetCEP( ACEP, ARes );
  end
  else
  if LResponse.StatusCode = 200 then
    ARes.Send( TCEPEntityParse.ApiCEPParseToJSONString( LResponse.Content ) );
end;

function TCEPHandlerApiCEP.NextParser(ANextParser: iParser): iParser;
begin
  Result := Self;
  FNextParser := ANextParser;
end;

end.
