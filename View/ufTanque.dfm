inherited frmTanque: TfrmTanque
  Caption = 'Tanque'
  ClientWidth = 557
  OnCreate = FormCreate
  ExplicitWidth = 573
  PixelsPerInch = 96
  TextHeight = 13
  inherited Panel1: TPanel
    Width = 557
    ExplicitWidth = 557
    inherited Panel2: TPanel
      Width = 555
      ExplicitWidth = 555
      inherited btnNovo: TButton
        OnClick = btnNovoClick
      end
      inherited btnEditar: TButton
        OnClick = btnEditarClick
      end
      inherited btnExcluir: TButton
        OnClick = btnExcluirClick
      end
    end
    inherited gdDados: TDBGrid
      Width = 555
      Columns = <
        item
          Expanded = False
          FieldName = 'ID'
          Title.Caption = 'C'#243'digo'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DS_TANQUE'
          Title.Caption = 'Descri'#231#227'o'
          Width = 300
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TP_TANQUE'
          Title.Caption = 'Tipo do Tanque'
          Width = 85
          Visible = True
        end>
    end
  end
end
