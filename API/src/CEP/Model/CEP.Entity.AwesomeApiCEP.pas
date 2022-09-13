unit CEP.Entity.AwesomeApiCEP;

interface

type
  TCEPEntityAwesomeApiCEP = class
  private
    Fprovider    : String;
    Fcep         : String;
    Faddress     : String;
    Fstate       : String;
    Fdistrict    : String;
    Fcity        : String;
    Fcity_ibge   : String;
    Fddd         : String;
  public
    property provider    : String read Fprovider    write Fprovider;
    property cep         : String read FCep         write Fcep;
    property address     : String read Faddress     write Faddress;
    property state       : String read Fstate       write Fstate;
    property district    : String read Fdistrict    write Fdistrict;
    property city        : String read Fcity        write Fcity;
    property city_ibge   : String read Fcity_ibge   write Fcity_ibge;
    property ddd         : String read Fddd         write Fddd;
  end;

  TCEPEntityAwesomeApiCEPError = class
  private
    Fstatus  : Integer;
    Fcode    : String;
    Fmessage : String;
  public
    property status   : Integer read Fstatus  write Fstatus;
    property code     : String  read Fcode    write Fcode;
    property message  : String  read Fmessage write Fmessage;
  end;

implementation

end.
