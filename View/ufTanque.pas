unit ufTanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ufConsultaBase, Data.DB, Vcl.Grids, TanqueController,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmTanque = class(TfrmConsultaBase)
    procedure btnNovoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEditarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    TanqueController : TTanqueController;
  public
    { Public declarations }
  end;

var
  frmTanque: TfrmTanque;

implementation

{$R *.dfm}
uses ufTanqueEditor;

procedure TfrmTanque.btnEditarClick(Sender: TObject);
begin
  TanqueController.Editar;
  TanqueController.Listar;
end;

procedure TfrmTanque.btnExcluirClick(Sender: TObject);
begin
  TanqueController.Excluir;
  TanqueController.Listar;
end;

procedure TfrmTanque.btnNovoClick(Sender: TObject);
begin
  TanqueController.Novo;
  TanqueController.Listar;
end;

procedure TfrmTanque.FormCreate(Sender: TObject);
begin
  inherited;
  TanqueController := TTanqueController.Create;
  TanqueController.SetDataSouceGrid(dsGrade);
end;

procedure TfrmTanque.FormShow(Sender: TObject);
begin
  inherited;
  TanqueController.Listar;
end;

end.
