object frmEditorBase: TfrmEditorBase
  Left = 0
  Top = 0
  ClientHeight = 282
  ClientWidth = 529
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 529
    Height = 282
    Align = alClient
    TabOrder = 0
    ExplicitLeft = 208
    ExplicitTop = 104
    ExplicitWidth = 185
    ExplicitHeight = 41
    object LabelCodigo: TLabel
      Left = 28
      Top = 16
      Width = 33
      Height = 15
      Caption = 'C'#243'digo'
    end
    object Panel2: TPanel
      Left = 1
      Top = 240
      Width = 527
      Height = 41
      Align = alBottom
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 241
      object btnSalvar: TButton
        Left = 350
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Salvar'
        TabOrder = 0
        OnClick = btnSalvarClick
      end
      object btnCancelar: TButton
        Left = 431
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 1
        OnClick = btnCancelarClick
      end
    end
    object EditCodigo: TEdit
      Left = 63
      Top = 13
      Width = 81
      Height = 24
      Color = clWhite
      Enabled = False
      TabOrder = 1
    end
  end
end
