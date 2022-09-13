unit Main.View;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmMain = class(TForm)
    edtHost: TEdit;
    lblHost: TLabel;
    cmbEndpoint: TComboBox;
    lblEndpoint: TLabel;
    edtValue: TEdit;
    lblValue: TLabel;
    btnRequest: TButton;
    pgcResponse: TPageControl;
    tsCEP: TTabSheet;
    lblProvider: TLabel;
    edtProvider: TEdit;
    lblCEP: TLabel;
    edtCEP: TEdit;
    lblLogradouro: TLabel;
    edtLogradouro: TEdit;
    lblComplemento: TLabel;
    edtComplemento: TEdit;
    lblBairro: TLabel;
    edtBairro: TEdit;
    lblLocalidade: TLabel;
    edtLocalidade: TEdit;
    lblUF: TLabel;
    edtUF: TEdit;
    lblIBGE: TLabel;
    edtIBGE: TEdit;
    lblGIA: TLabel;
    edtGIA: TEdit;
    lblDDD: TLabel;
    edtDDD: TEdit;
    lblSIAFI: TLabel;
    edtSIAFI: TEdit;
    lblError: TLabel;
    lblMessageError: TLabel;
    edtError: TEdit;
    edtMessageError: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure cmbEndpointChange(Sender: TObject);
    procedure btnRequestClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure FillEndpoints;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  Endpoints.Enum,
  Main.Controller;

{$R *.dfm}

{ TfrmMain }

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  FillEndpoints;
end;

procedure TfrmMain.btnRequestClick(Sender: TObject);
begin
  case StrToEndpointEnum( cmbEndpoint.Text ) of
    eeCEP: TMainController.New(Self).GetCEP;
  end;
end;

procedure TfrmMain.cmbEndpointChange(Sender: TObject);
begin
  case StrToEndpointEnum( cmbEndpoint.Text ) of
    eeCEP: pgcResponse.ActivePageIndex := 0;
  end;
end;

procedure TfrmMain.FillEndpoints;
var
  LEnum: TEndpointEnum;
begin
  cmbEndpoint.Items.Clear;

  for LEnum := Low(TEndpointEnum) to High(TEndpointEnum) do
    cmbEndpoint.Items.Add( EndpointEnumToStr(LEnum) );

  cmbEndpoint.ItemIndex := 0;
end;



end.
