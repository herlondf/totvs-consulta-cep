unit Config.Server;

interface

type
  TServerConfig = class
    class function Port: Word;
    class function ServerIsRunning: String;
    class function Version: String;
  end;

implementation

{ TServerConfig }

class function TServerConfig.Port: Word;
begin
  Result := 9000;
end;

class function TServerConfig.ServerIsRunning: String;
begin
  Result := 'Server is running on %s:%d';
end;

class function TServerConfig.Version: String;
begin
  Result := 'v1';
end;

end.
