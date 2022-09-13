unit CEP.HandleErrors;

interface

uses
  CEP.Entity.ViaCEP,
  CEP.Entity.ApiCEP,
  CEP.Entity.AwesomeApiCEP;

type
  TCEFHandleErrors = class
    class function ViaCEPError(const AContent: String): boolean;
    class function ApiCEPError(const AContent: String): boolean;
    class function AwesomeApiCEPError(const AContent: String): boolean;
  end;

implementation

uses
  System.SysUtils,
  GBJSON.Helper;

{ TCEFHandleErrors }

class function TCEFHandleErrors.ViaCEPError(const AContent: String): boolean;
var
  LEntity: TCEPEntityViaCEPError;
begin
  Result := False;

  LEntity := TCEPEntityViaCEPError.Create;

  try
    LEntity.fromJSONString(AContent);
  except

  end;

  Result := LEntity.error.Trim.Length <> 0;

  LEntity.Free;
end;

class function TCEFHandleErrors.ApiCEPError(const AContent: String): boolean;
var
  LEntity: TCEPEntityApiCEPError;
begin
  Result := False;

  LEntity := TCEPEntityApiCEPError.Create;

  try
    LEntity.fromJSONString( AContent );
  except

  end;

  Result := LEntity.message.Trim.Length <> 0;

  LEntity.Free;
end;

class function TCEFHandleErrors.AwesomeApiCEPError(const AContent: String): boolean;
var
  LEntity: TCEPEntityAwesomeApiCEPError;
begin
  Result  := False;
  LEntity := TCEPEntityAwesomeApiCEPError.Create;

  try
    LEntity.fromJSONString(AContent);
  except

  end;

  Result := LEntity.message.Trim.Length <> 0;

  LEntity.Free;
end;

end.
