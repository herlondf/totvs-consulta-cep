unit Endpoints.Enum;

interface

type
  TEndpointEnum = ( eeCEP );

  function IntToEndpointEnum( AIndex: Integer              ): TEndpointEnum;
  function StrToEndpointEnum( AEndpointEnum: String        ): TEndpointEnum;
  function EndpointEnumToInt( AEndpointEnum: TEndpointEnum ): Integer;
  function EndpointEnumToStr( AEndpointEnum: TEndpointEnum ): String;

implementation

function IntToEndpointEnum( AIndex: Integer ): TEndpointEnum;

  function IntToEnumerado( const s: integer; const AInteger: array of Integer; const AEnumerados: array of variant ): variant;
  var
    i: integer;
  begin
    result := -1;
    for i := Low( AInteger ) to High( AInteger ) do
      if s = AInteger[ i ] then
      begin
        result := AEnumerados[ i ];
        exit;
      end;

    if result <> -1 then
      result := AEnumerados[ 0 ];
  end;
begin
  result := IntToEnumerado( AIndex, [ 0 ], [ eeCEP ] );
end;

function StrToEndpointEnum( AEndpointEnum: String ): TEndpointEnum;

  function StrToEnumerado( const s: string; const AString: array of String; const AEnumerados: array of variant ): variant;
  var
    i: integer;
  begin
    result := -1;
    for i := Low( AString ) to High( AString ) do
      if s = AString[i] then
      begin
        result := AEnumerados[ i ];
        exit;
      end;

    if result <> -1 then
      result := AEnumerados[0];
  end;

begin
  result := StrToEnumerado(
    AEndpointEnum,
    [ 'cep' ],
    [ eeCEP ]
  );
end;

function EndpointEnumToInt( AEndpointEnum: TEndpointEnum ): Integer;

  function EnumeradoToInt( const t: variant; const AInteger: array of integer; const AEnumerados: array of variant ): variant;
  var
    i: integer;
  begin
    result := '';
    for i := Low( AEnumerados ) to High( AEnumerados ) do
      if t = AEnumerados[ i ] then
        result := AInteger[ i ];
  end;

begin
  result := EnumeradoToInt( AEndpointEnum, [0], [ eeCEP ] );
end;

function EndpointEnumToStr( AEndpointEnum: TEndpointEnum ): String;

  function EnumeradoToInt( const t: variant; const AMode: array of TEndpointEnum; const AEnumerados: array of String ): variant;
  var
    i: integer;
  begin
    result := '';
    for i := Low(AMode) to High( AMode ) do
      if t = AMode[ i ] then
      begin
        result := AEnumerados[ i ];
        Break;
      end;
  end;

begin
  result := EnumeradoToInt( AEndpointEnum, [ eeCEP ], [ 'cep' ] );
end;

end.
