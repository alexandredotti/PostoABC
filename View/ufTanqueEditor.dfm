inherited frmTanqueEditor: TfrmTanqueEditor
  Caption = 'Tanque'
  ClientHeight = 268
  ClientWidth = 430
  ExplicitWidth = 446
  ExplicitHeight = 307
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 430
    Height = 268
    ExplicitWidth = 430
    ExplicitHeight = 268
    inherited LabelCodigo: TLabel
      Left = 73
      Top = 17
      ExplicitLeft = 73
      ExplicitTop = 17
    end
    object Label1: TLabel [1]
      Left = 60
      Top = 43
      Width = 46
      Height = 13
      Caption = 'Descri'#231#227'o'
    end
    object Label3: TLabel [2]
      Left = 10
      Top = 70
      Width = 96
      Height = 13
      Caption = 'Tipo de Combust'#237'vel'
    end
    inherited Panel2: TPanel
      Top = 226
      Width = 428
      TabOrder = 3
      ExplicitTop = 226
      ExplicitWidth = 428
      inherited btnSalvar: TButton
        Left = 188
        OnClick = btnSalvarClick
        ExplicitLeft = 188
      end
      inherited btnCancelar: TButton
        Left = 269
        ExplicitLeft = 269
      end
    end
    inherited EditCodigo: TEdit
      Left = 109
      TabOrder = 2
      ExplicitLeft = 109
    end
    object EditDS_TANQUE: TEdit
      Left = 109
      Top = 40
      Width = 278
      Height = 21
      Color = clWhite
      TabOrder = 0
    end
    object ComboTipoComb: TComboBox
      Left = 109
      Top = 67
      Width = 113
      Height = 21
      Style = csDropDownList
      TabOrder = 1
      Items.Strings = (
        '[ Selecione ]'
        'Gasolina'
        'Diesel')
    end
  end
end
