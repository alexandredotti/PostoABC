unit BombaController;

interface

uses Bomba, BombaDAO, SysUtils, Data.DB, Vcl.Forms, Tanque, Conexao;

type
  TBombaController = class
  private
    { private declarations }
    FdsBomba: TDataSource;
    Bomba : TBomba;
    BombaDAO: iBomba;
    procedure GetDados;
  public
    procedure Salvar(aBomba: TBomba);
    procedure Excluir();
    procedure SetDataSouceGrid(ADataSource: TDataSource);
    procedure Listar();
    procedure Editar();
    procedure Novo();
    constructor Create;
    destructor Destroy;override;
  end;
implementation

uses ufBombaEditor;

constructor TBombaController.Create;
begin
  BombaDAO := TBombaDAO.Create;
  Bomba := TBomba.Create;
end;

destructor TBombaController.Destroy;
begin
  if (Assigned(Bomba)) then
    FreeAndNil(Bomba);
  inherited;
end;

procedure TBombaController.Editar;
begin
  if (not Assigned(frmBombaEditor)) then
    Application.CreateForm(TfrmBombaEditor, frmBombaEditor);
  GetDados;
  frmBombaEditor.SetDados(Bomba);
  frmBombaEditor.ShowModal;
end;

procedure TBombaController.Excluir();
begin
  try
    if (FdsBomba.DataSet.IsEmpty) then
      Exit;

    BombaDAO.Excluir(FdsBomba.DataSet.FieldByName('ID').AsInteger);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TBombaController.GetDados;
begin
  Bomba.ID := FdsBomba.DataSet.FieldByName('ID').AsInteger;
  Bomba.DS_BOMBA := FdsBomba.DataSet.FieldByName('DS_BOMBA').AsString;
  Bomba.ID_TANQUE := FdsBomba.DataSet.FieldByName('ID_TANQUE').AsInteger;
end;

procedure TBombaController.Listar;
begin
  try
    BombaDAO.Listar(FdsBomba);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TBombaController.Novo;
begin
  if (frmBombaEditor = nil) then
    Application.CreateForm(TfrmBombaEditor, frmBombaEditor);

  frmBombaEditor.EditCodigo.Text := '';
  frmBombaEditor.EditDS_BOMBA.Text := '';
  frmBombaEditor.SetIndexComboTanque;
  frmBombaEditor.ComboTanque.ItemIndex := 0;
  frmBombaEditor.ShowModal();
end;

procedure TBombaController.Salvar(aBomba: TBomba);
begin
  try
    BombaDAO.Salvar(aBomba);
  except on E: Exception do
    begin
      raise Exception.Create(E.Message);
    end;
  end;
end;

procedure TBombaController.SetDataSouceGrid(ADataSource: TDataSource);
begin
  FdsBomba := ADataSource;
end;

end.
