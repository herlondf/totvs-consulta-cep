unit CEP.Entity.Parse;

interface

uses
  CEP.Entity,
  CEP.Entity.ViaCEP,
  CEP.Entity.ApiCEP,
  CEP.Entity.AwesomeApiCEP;

type
  TCEPEntityParse = class
    class function ViaCEPParse(const AEntity: String): TCEPEntity;
    class function ApiCEPParse(const AEntity: String): TCEPEntity;
    class function AwesomeApiCEPParse(const AEntity: String): TCEPEntity;

    class function ViaCEPParseToJSONString(const AEntity: String): String;
    class function ApiCEPParseToJSONString(const AEntity: String): String;
    class function AwesomeApiCEPParseToJSONString(const AEntity: String): String;
  end;

implementation

uses
  System.SysUtils,
  GBJSON.Helper,
  GBJSON.Config;

{ TCEPEntityParse }

class function TCEPEntityParse.ViaCEPParse(const AEntity: String): TCEPEntity;
var
  LEntity: TCEPEntityViaCEP;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);

  LEntity := TCEPEntityViaCEP.Create;
  LEntity.fromJSONString( AEntity );

  Result := TCEPEntity.Create;

  Result.provider    := 'viacep';
  Result.cep         := LEntity.cep;
  Result.logradouro  := LEntity.logradouro;
  Result.complemento := LEntity.complemento;
  Result.bairro      := LEntity.bairro;
  Result.localidade  := LEntity.localidade;
  Result.uf          := LEntity.uf;
  Result.ibge        := LEntity.ibge;
  Result.gia         := LEntity.gia;
  Result.ddd         := LEntity.ddd;
  Result.siafi       := LEntity.siafi;

  LEntity.Free;
end;

class function TCEPEntityParse.ApiCEPParse(const AEntity: String): TCEPEntity;
var
  LEntity: TCEPEntityApiCEP;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);

  LEntity := TCEPEntityApiCEP.Create;
  LEntity.fromJSONString( AEntity );

  Result := TCEPEntity.Create;

  Result.provider    := 'apicep';
  Result.cep         := StringReplace( LEntity.code, '-', '', [rfReplaceAll, rfIgnoreCase] );
  Result.logradouro  := LEntity.address;
  Result.bairro      := LEntity.district;
  Result.localidade  := LEntity.city;
  Result.uf          := LEntity.state;

  LEntity.Free;
end;

class function TCEPEntityParse.AwesomeApiCEPParse(const AEntity: String): TCEPEntity;
var
  LEntity: TCEPEntityAwesomeApiCEP;
begin
  TGBJSONConfig.GetInstance.CaseDefinition(TCaseDefinition.cdLower);

  LEntity := TCEPEntityAwesomeApiCEP.Create;
  LEntity.fromJSONString( AEntity );

  Result := TCEPEntity.Create;

  Result.provider    := 'awesomeapicep';
  Result.cep         := LEntity.cep;
  Result.logradouro  := LEntity.address;
  Result.bairro      := LEntity.district;
  Result.localidade  := LEntity.city;
  Result.uf          := LEntity.state;
  Result.ibge        := LEntity.city_ibge;
  Result.ddd         := LEntity.ddd;

  LEntity.Free;
end;

class function TCEPEntityParse.ViaCEPParseToJSONString(const AEntity: String): String;
var
  LEntity : TCEPEntity;
begin
  LEntity := ViaCEPParse(AEntity);
  Result  := LEntity.ToJSONString;
  LEntity.Free;
end;

class function TCEPEntityParse.ApiCEPParseToJSONString(const AEntity: String): String;
var
  LEntity : TCEPEntity;
begin
  LEntity := ApiCEPParse(AEntity);
  Result  := LEntity.ToJSONString;
  LEntity.Free;
end;

class function TCEPEntityParse.AwesomeApiCEPParseToJSONString(const AEntity: String): String;
var
  LEntity : TCEPEntity;
begin
  LEntity := AwesomeApiCEPParse(AEntity);
  Result  := LEntity.ToJSONString;
  LEntity.Free;
end;

end.
