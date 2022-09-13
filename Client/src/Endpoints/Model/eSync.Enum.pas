unit eSync.Enum;

interface

type
  TOperation = ( opDelete, opInsert, opUpdate, opDeleteInsert, opStructure );
                                          {rmConsolidation}
  TReplicationModel = ( rmUnidirectional, rmBidirectional, rmConsolidation, rmDataProvider, rmDataCapture );

  function IntToReplicationModel(AIndex: Integer): TReplicationModel;
  function StrToReplicationModel(AReplicationMode: String): TReplicationModel;
  function ReplicationModelToInt(AReplicationMode: TReplicationModel): Integer;
  function ReplicationModelToStr(AReplicationMode: TReplicationModel): String;
  function ReplicationModeltoSQL(AReplicationMode: TReplicationModel): String;
  function SQLtoReplicationModel(AReplicationMode: String): TReplicationModel;

implementation

function IntToReplicationModel(AIndex: Integer): TReplicationModel;

  function IntToEnumerado(const s: integer; const AInteger: array of Integer; const AEnumerados: array of variant): variant;
  var
    i: integer;
  begin
    result := -1;
    for i := Low(AInteger) to High(AInteger) do
      if s = AInteger[i] then
      begin
        result := AEnumerados[i];
        exit;
      end;

    if result <> -1 then
      result := AEnumerados[0];
  end;
begin
  result := IntToEnumerado(AIndex, [0,1,2,3, 4], [rmUnidirectional, rmBidirectional, rmConsolidation, rmDataProvider, rmDataCapture]);
end;

function StrToReplicationModel(AReplicationMode: String): TReplicationModel;

  function StrToEnumerado(const s: string; const AString: array of String; const AEnumerados: array of variant): variant;
  var
    i: integer;
  begin
    result := -1;
    for i := Low(AString) to High(AString) do
      if s = AString[i] then
      begin
        result := AEnumerados[i];
        exit;
      end;

    if result <> -1 then
      result := AEnumerados[0];
  end;

begin
  result := StrToEnumerado(
    AReplicationMode,
    [ 'Unidirecional', 'Bidirecional', 'Consolidacao', 'Provedor de Dados', 'Captura de Dados' ],
    [ rmUnidirectional, rmBidirectional, rmConsolidation, rmDataProvider, rmDataCapture ]
  );
end;

function ReplicationModelToInt(AReplicationMode: TReplicationModel): Integer;

  function EnumeradoToInt(const t: variant; const AInteger: array of integer; const AEnumerados: array of variant): variant;
  var
    i: integer;
  begin
    result := '';
    for i := Low(AEnumerados) to High(AEnumerados) do
      if t = AEnumerados[i] then
        result := AInteger[i];
  end;

begin
  result := EnumeradoToInt(AReplicationMode, [0,1,2,3,4], [rmUnidirectional, rmBidirectional, rmConsolidation, rmDataProvider, rmDataCapture]);
end;

function ReplicationModelToStr(AReplicationMode: TReplicationModel): String;

  function EnumeradoToInt(const t: variant; const AMode: array of TReplicationModel; const AEnumerados: array of String): variant;
  var
    i: integer;
  begin
    result := '';
    for i := Low(AMode) to High(AMode) do
      if t = AMode[i] then
      begin
        result := AEnumerados[i];
        Break;
      end;
  end;

begin
  result := EnumeradoToInt(AReplicationMode, [rmUnidirectional, rmBidirectional, rmConsolidation, rmDataProvider, rmDataCapture], ['Unidirecional', 'Bidirecional', 'Consolidacao', 'Provedor de Dados', 'Captura de Dados']);
end;

function ReplicationModeltoSQL(AReplicationMode: TReplicationModel): String;

  function EnumeradoToInt(const t: variant; const AMode: array of TReplicationModel; const AEnumerados: array of String): variant;
  var
    i: integer;
  begin
    result := '';
    for i := Low(AMode) to High(AMode) do
      if t = AMode[i] then
      begin
        result := AEnumerados[i];
        Break;
      end;
  end;

begin
  result := EnumeradoToInt(AReplicationMode, [rmUnidirectional, rmBidirectional, rmConsolidation, rmDataProvider, rmDataCapture], ['rmUnidirectional', 'rmBidirectional', 'rmConsolidation', 'rmDataProvider', 'rmDataCapture']);
end;

function SQLtoReplicationModel(AReplicationMode: String): TReplicationModel;

  function StrToEnumerado(const s: string; const AString: array of String; const AEnumerados: array of variant): variant;
  var
    i: integer;
  begin
    result := -1;
    for i := Low(AString) to High(AString) do
      if s = AString[i] then
      begin
        result := AEnumerados[i];
        exit;
      end;

    if result <> -1 then
      result := AEnumerados[0];
  end;

begin
  result := StrToEnumerado(
    AReplicationMode,
    ['rmUnidirectional', 'rmBidirectional', 'rmConsolidation', 'rmDataProvider', 'rmDataCapture'],
    [rmUnidirectional, rmBidirectional, rmConsolidation, rmDataProvider, rmDataCapture]
  );

end;

end.
