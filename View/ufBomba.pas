unit ufBomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufConsultaBase, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, BombaController;

type
  TfrmBomba = class(TfrmConsultaBase)
    procedure btnNovoClick(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    BombaController : TBombaController;
  public
    { Public declarations }
  end;

var
  frmBomba: TfrmBomba;

implementation

{$R *.dfm}
uses ufBombaEditor;

procedure TfrmBomba.btnEditarClick(Sender: TObject);
begin
  inherited;
  BombaController.Editar;
end;

procedure TfrmBomba.btnExcluirClick(Sender: TObject);
begin
  inherited;
  BombaController.Excluir;
end;

procedure TfrmBomba.btnNovoClick(Sender: TObject);
begin
  inherited;
  if (frmBombaEditor = nil) then
  begin
    Application.CreateForm(TfrmBombaEditor, frmBombaEditor);
  end;
  frmBombaEditor.Show();
end;

procedure TfrmBomba.FormCreate(Sender: TObject);
begin
  inherited;
  BombaController := TBombaController.Create;
  BombaController.SetDataSouceGrid(dsGrade);
  BombaController.Listar;
end;

end.
