unit CEP.Swagger;

interface

uses
  Horse.GBSwagger,
  GBSwagger.Model.Types;

type
  TSwagger = class
    class procedure Initialize;
  end;

implementation

uses
  Horse.Exception,
  CEP.Entity;

{ TCEPSwagger }

class procedure TSwagger.Initialize;
begin
  Swagger
    .Info
      .Title('Totvs Consulta CEP')
      .Description('Api para consulta de CEP')
      .&End
    .AddProtocol( TGBSwaggerProtocol.gbHttp )
    .Path('cep')
      .Tag('CEP')
      .GET('Consultar CEP', 'Retorna JSON com dados pertinentes ao CEP')
        .AddParamPath('cep', 'valor do cep')
          .Required(True)
        .&End
        .AddResponse(200, 'Sucesso')
          .Schema( TCEPEntity )
        .&End
        .AddResponse(400)
          .Description('Falha na requisicao')
          .Schema( TCEPEntityError )
        .&End
        .AddResponse(404)
          .Description('Dados nao encontrados')
          .Schema( TCEPEntityError )
        .&End
        .AddResponse(500)
          .Description('Erro interno')
          .Schema( TCEPEntityError )
        .&End
    .&End
  .&End;
end;

end.
