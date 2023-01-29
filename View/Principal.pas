unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.SqlExpr, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Cadastros1: TMenuItem;
    Abastecimentos1: TMenuItem;
    Relatrios1: TMenuItem;
    mTanque: TMenuItem;
    mBombas: TMenuItem;
    mAbastecidas: TMenuItem;
    Abastecimentos2: TMenuItem;
    procedure mTanqueClick(Sender: TObject);
    procedure mBombasClick(Sender: TObject);
    procedure mAbastecidasClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}
uses ufTanque, ufBomba, ufAbastecimento;

procedure TfrmPrincipal.mAbastecidasClick(Sender: TObject);
begin

  Application.CreateForm(TfrmAbastecimento, frmAbastecimento);
  frmAbastecimento.Show();
end;

procedure TfrmPrincipal.mBombasClick(Sender: TObject);
begin

  Application.CreateForm(TfrmBomba, frmBomba);
  frmBomba.Show();
end;

procedure TfrmPrincipal.mTanqueClick(Sender: TObject);
begin

  Application.CreateForm(TfrmTanque, frmTanque);
  frmTanque.Show();
end;

end.
