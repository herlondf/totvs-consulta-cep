unit CEP.Entity.ApiCEP;

interface

type
  TCEPEntityApiCEP = class
  private
    Fstatus      : Integer;
    Fcode        : String;
    Fstate       : String;
    Fcity        : String;
    Fdistrict    : String;
    Faddress     : String;
  public
    property status      : Integer read Fstatus      write Fstatus;
    property code        : String  read Fcode        write Fcode;
    property state       : String  read Fstate       write Fstate;
    property city        : String  read Fcity        write Fcity;
    property district    : String  read Fdistrict    write Fdistrict;
    property address     : String  read Faddress     write Faddress;
  end;

  TCEPEntityApiCEPError = class
  private
    Fcode    : String;
    Fmessage : String;
    Fstatus  : Integer;
  public
    property code    : String  read Fcode    write Fcode;
    property message : String  read Fmessage write Fmessage;
    property status  : Integer read Fstatus  write Fstatus;
  end;

implementation

end.
