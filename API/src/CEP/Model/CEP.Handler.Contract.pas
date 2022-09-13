unit CEP.Handler.Contract;

interface

uses
  Horse;

type
  { Handler }
  IParser = interface
    function GetCEP( const ACEP: string; ARes: THorseResponse ): iParser;
    function NextParser( ANextParser: iParser ): iParser;
  end;

implementation

end.
