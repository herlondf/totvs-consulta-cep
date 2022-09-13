unit CEP.Handler;

interface

uses
  Horse,
  CEP.Handler.Contract,
  CEP.Handler.ViaCEP,
  CEP.Handler.ApiCEP,
  CEP.Handler.AwesomeApiCEP;

type
  TCEPHandler = class(TInterfacedObject, IParser)
    class function New: iParser;
  private
    function IsValidCEP(const ACEP: String): Boolean;
  public
    function GetCEP( const ACEP: string; ARes: THorseResponse ): iParser;
    function NextParser( ANextParser: iParser ): iParser;
  end;

implementation

uses
  System.SysUtils;

{ TCEPHandler }

class function TCEPHandler.New: iParser;
begin
  Result := Self.Create;
end;

function TCEPHandler.IsValidCEP(const ACEP: String): Boolean;
var
  LOutInt: Int64;
begin
  Result := ACEP.Trim.Length > 0;

  if not Result then
    raise EHorseException.New
      .Title ( 'Falha na pre validacao dos dados'   )
      .Error ( 'O CEP nao pode ser nulo.' )
      .Status( THTTPStatus.BadRequest );


  //CEP devera conter somente numeros
  Result := TryStrToInt64(ACEP, LOutInt);

  if not Result then
    raise EHorseException.New
      .Title ( 'Falha na pre validacao dos dados'   )
      .Error ( 'O CEP deve conter somente numeros.' )
      .Status( THTTPStatus.BadRequest );


  //CEP devera conter 8 digitos
  Result := Length(ACEP) = 8;

  if not Result then
    raise EHorseException.New
      .Title ( 'Falha na pre validacao dos dados'    )
      .Error ( 'O CEP deve conter 8 (oito) digitos.' )
      .Status( THTTPStatus.BadRequest );

end;

function TCEPHandler.GetCEP(const ACEP: string; ARes: THorseResponse ): iParser;
var
  LViaCEP        : iParser;
  LApiCEP        : iParser;
  LAwesomeApiCEP : iParser;
begin
  Result := Self;

  if IsValidCEP(ACEP) then
  begin
    LViaCEP        := TCEPHandlerViaCEP.New;
    LApiCEP        := TCEPHandlerApiCEP.New;
    LAwesomeApiCEP := TCEPHandlerAwesomeApiCEP.New;

    LViaCEP.NextParser       ( LApiCEP        );
    LApiCEP.NextParser       ( LAwesomeApiCEP );
    LAwesomeApiCEP.NextParser( nil            );

    LViaCEP.GetCEP( StringReplace( ACEP, '-', '', [rfReplaceAll] ), ARes );
  end;
end;

function TCEPHandler.NextParser(ANextParser: iParser): iParser;
begin

end;


end.
