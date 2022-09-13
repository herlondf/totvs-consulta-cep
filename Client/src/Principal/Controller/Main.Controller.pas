unit Main.Controller;

interface

uses
  Main.View,
  Main.Controller.Contract,
  CEP.Entity;

type
  TMainController = class(TInterfacedObject, iMainController)
    constructor Create(const AForm: TfrmMain);
    destructor Destroy; override;
    class function New(const AForm: TfrmMain): iMainController;
  private
    FForm: TfrmMain;

    procedure ClearFields;
    procedure FillCEPFields(const AEntity: TCEPEntity);
    procedure FillCEPErrorFields(const AEntity: TCEPEntity);
  public
   procedure GetCEP;
  end;

implementation

uses
  RestRequest4D,
  System.SysUtils,
  CEP.Controller;

{ TMainController }

procedure TMainController.ClearFields;
begin
  with FForm do
  begin
    edtProvider.Text     := '';
    edtCEP.Text          := '';
    edtLogradouro.Text   := '';
    edtComplemento.Text  := '';
    edtBairro.Text       := '';
    edtLocalidade.Text   := '';
    edtUF.Text           := '';
    edtIBGE.Text         := '';
    edtGIA.Text          := '';
    edtDDD.Text          := '';
    edtSIAFI.Text        := '';
    edtError.Text        := '';
    edtMessageError.Text := '';
  end;
end;

constructor TMainController.Create(const AForm: TfrmMain);
begin
  FForm := AForm;
end;

destructor TMainController.Destroy;
begin

  inherited;
end;

class function TMainController.New(const AForm: TfrmMain): iMainController;
begin
  Result := Self.Create(AForm);
end;

procedure TMainController.FillCEPErrorFields(const AEntity: TCEPEntity);
begin
  with FForm do
  begin
    edtError.Text        := AEntity.title;
    edtMessageError.Text := AEntity.error;
  end;
end;

procedure TMainController.FillCEPFields(const AEntity: TCEPEntity);
begin
  with FForm do
  begin
    edtProvider.Text    := AEntity.provider;
    edtCEP.Text         := AEntity.cep;
    edtLogradouro.Text  := AEntity.logradouro;
    edtComplemento.Text := AEntity.complemento;
    edtBairro.Text      := AEntity.bairro;
    edtLocalidade.Text  := AEntity.localidade;
    edtUF.Text          := AEntity.uf;
    edtIBGE.Text        := AEntity.ibge;
    edtGIA.Text         := AEntity.gia;
    edtDDD.Text         := AEntity.ddd;
    edtSIAFI.Text       := AEntity.siafi;
  end;
end;

procedure TMainController.GetCEP;
var
  LEntity: TCEPEntity;
begin
  LEntity := TCEPController.New.GetCEP( Concat( FForm.edtHost.Text, '/', FForm.cmbEndpoint.Text ), FForm.edtValue.Text );

  ClearFields;

  if LEntity.error.Trim.Length = 0 then
  begin
    FillCEPFields(LEntity);
    LEntity.Free;
  end
  else
  begin
    FillCEPErrorFields(LEntity);
    LEntity.Free;
  end;
end;

end.
