object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Main'
  ClientHeight = 325
  ClientWidth = 562
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblHost: TLabel
    Left = 10
    Top = 13
    Width = 22
    Height = 13
    Caption = 'Host'
  end
  object lblEndpoint: TLabel
    Left = 143
    Top = 13
    Width = 42
    Height = 13
    Caption = 'Endpoint'
  end
  object lblValue: TLabel
    Left = 294
    Top = 13
    Width = 26
    Height = 13
    Caption = 'Value'
  end
  object edtHost: TEdit
    Left = 10
    Top = 32
    Width = 127
    Height = 21
    TabOrder = 0
    Text = 'http://127.0.0.1:9000'
    TextHint = 'http://127.0.0.1:9000'
  end
  object cmbEndpoint: TComboBox
    Left = 143
    Top = 32
    Width = 145
    Height = 22
    Style = csOwnerDrawVariable
    TabOrder = 1
    OnChange = cmbEndpointChange
    Items.Strings = (
      'cep')
  end
  object edtValue: TEdit
    Left = 294
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btnRequest: TButton
    Left = 421
    Top = 30
    Width = 87
    Height = 25
    Caption = 'Request'
    TabOrder = 3
    OnClick = btnRequestClick
  end
  object pgcResponse: TPageControl
    AlignWithMargins = True
    Left = 10
    Top = 73
    Width = 542
    Height = 242
    Margins.Left = 10
    Margins.Top = 0
    Margins.Right = 10
    Margins.Bottom = 10
    ActivePage = tsCEP
    Align = alBottom
    TabOrder = 4
    ExplicitTop = 71
    object tsCEP: TTabSheet
      Caption = 'CEP'
      ExplicitWidth = 582
      ExplicitHeight = 253
      object lblProvider: TLabel
        Left = 14
        Top = 5
        Width = 40
        Height = 13
        Caption = 'Provider'
      end
      object lblCEP: TLabel
        Left = 141
        Top = 5
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object lblLogradouro: TLabel
        Left = 268
        Top = 5
        Width = 55
        Height = 13
        Caption = 'Logradouro'
      end
      object lblComplemento: TLabel
        Left = 395
        Top = 5
        Width = 65
        Height = 13
        Caption = 'Complemento'
      end
      object lblBairro: TLabel
        Left = 14
        Top = 55
        Width = 28
        Height = 13
        Caption = 'Bairro'
      end
      object lblLocalidade: TLabel
        Left = 141
        Top = 55
        Width = 50
        Height = 13
        Caption = 'Localidade'
      end
      object lblUF: TLabel
        Left = 268
        Top = 55
        Width = 13
        Height = 13
        Caption = 'UF'
      end
      object lblIBGE: TLabel
        Left = 395
        Top = 55
        Width = 23
        Height = 13
        Caption = 'IBGE'
      end
      object lblGIA: TLabel
        Left = 14
        Top = 103
        Width = 18
        Height = 13
        Caption = 'GIA'
      end
      object lblDDD: TLabel
        Left = 141
        Top = 103
        Width = 21
        Height = 13
        Caption = 'DDD'
      end
      object lblSIAFI: TLabel
        Left = 268
        Top = 103
        Width = 27
        Height = 13
        Caption = 'SIAFI'
      end
      object lblError: TLabel
        Left = 14
        Top = 149
        Width = 24
        Height = 13
        Caption = 'Error'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8947967
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object lblMessageError: TLabel
        Left = 268
        Top = 149
        Width = 66
        Height = 13
        Caption = 'MessageError'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = 8947967
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object edtProvider: TEdit
        Left = 14
        Top = 24
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object edtCEP: TEdit
        Left = 141
        Top = 24
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      object edtLogradouro: TEdit
        Left = 268
        Top = 24
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 2
      end
      object edtComplemento: TEdit
        Left = 395
        Top = 24
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 3
      end
      object edtBairro: TEdit
        Left = 14
        Top = 74
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 4
      end
      object edtLocalidade: TEdit
        Left = 141
        Top = 74
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 5
      end
      object edtUF: TEdit
        Left = 268
        Top = 74
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 6
      end
      object edtIBGE: TEdit
        Left = 395
        Top = 74
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 7
      end
      object edtGIA: TEdit
        Left = 14
        Top = 122
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 8
      end
      object edtDDD: TEdit
        Left = 141
        Top = 122
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 9
      end
      object edtSIAFI: TEdit
        Left = 268
        Top = 122
        Width = 121
        Height = 21
        Enabled = False
        TabOrder = 10
      end
      object edtError: TEdit
        Left = 14
        Top = 168
        Width = 248
        Height = 21
        Enabled = False
        TabOrder = 11
      end
      object edtMessageError: TEdit
        Left = 268
        Top = 168
        Width = 248
        Height = 21
        Enabled = False
        TabOrder = 12
      end
    end
  end
end
