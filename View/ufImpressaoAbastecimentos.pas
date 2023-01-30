unit ufImpressaoAbastecimentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Conexao, Data.DB, RLReport;

type
  TfrmImpressaoAbastecimentos = class(TForm)
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    DataInicial: TDateTimePicker;
    DataFinal: TDateTimePicker;
    btnImprimir: TButton;
    dtsRelatorio: TDataSource;
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLBand2: TRLBand;
    RLBand3: TRLBand;
    RLBand4: TRLBand;
    RLBand5: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    LabelPeriodo: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    lbLitros: TRLLabel;
    lbTotal: TRLLabel;
    lbImposto: TRLLabel;
    lbperiodo: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure RLBand5BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand4BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    FQuery : iQuery;
    nr_litros : Extended;
    vl_total : Extended;
    vl_imposto : Extended;
    function ValidarImpressao: Boolean;
    procedure DefinirCaptionFiltro;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmImpressaoAbastecimentos: TfrmImpressaoAbastecimentos;

implementation

{$R *.dfm}
uses
  FactoryConexao;

procedure TfrmImpressaoAbastecimentos.btnImprimirClick(Sender: TObject);
var
  s: string;
begin
  if not ValidarImpressao then
    Exit;

  FQuery := TFactoryConexao.New.Query;

  s := 'SELECT BOMBA.DS_BOMBA'
    +', ABASTECIMENTO.DT_ABASTECIMENTO'
    +', ABASTECIMENTO.NR_LITROS'
    +', ABASTECIMENTO.VL_TOTAL'
    +', ABASTECIMENTO.VL_IMPOSTO'
    +', TANQUE.DS_TANQUE'
    +' FROM ABASTECIMENTO'
    +' INNER JOIN BOMBA ON (BOMBA.ID = ABASTECIMENTO.ID_BOMBA)'
    +' INNER JOIN TANQUE ON (TANQUE.ID = BOMBA.ID_TANQUE)'
    +' WHERE ABASTECIMENTO.DT_ABASTECIMENTO >= '+QuotedStr(FormatDateTime('yyyy/mm/dd',DataInicial.Date))
    +' AND ABASTECIMENTO.DT_ABASTECIMENTO <= '+QuotedStr(FormatDateTime('yyyy/mm/dd',DataFinal.Date))
    +' ORDER BY ABASTECIMENTO.DT_ABASTECIMENTO';

  FQuery.Open(s);

  if ((FQuery.Query as TDataSet).IsEmpty) then
  begin
    Application.MessageBox(PWideChar('Nenhum registro encontrado no per�odo.'),
      'Abastecimentos por Per�odo',MB_OK + MB_ICONINFORMATION);
    Exit;
  end
  else
  begin
    nr_litros := 0;
    vl_total := 0;
    vl_imposto := 0;
    dtsRelatorio.DataSet := (FQuery.Query as TDataSet);
    DefinirCaptionFiltro;
    RLReport1.Preview();
  end;
end;

procedure TfrmImpressaoAbastecimentos.DefinirCaptionFiltro;
begin
  LabelPeriodo.Caption := 'DE ' + FormatDateTime('dd/MM/yyyy', DataInicial.Date)
                       + ' AT� ' + FormatDateTime('dd/MM/yyyy', DataFinal.Date);
end;

procedure TfrmImpressaoAbastecimentos.FormShow(Sender: TObject);
begin
  DataInicial.Date := Date();
  DataFinal.Date := Date();
  DataInicial.SetFocus();
end;

procedure TfrmImpressaoAbastecimentos.RLBand4BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  nr_litros := nr_litros + dtsRelatorio.DataSet.FieldByName('NR_LITROS').AsExtended;
  vl_total  := vl_total + dtsRelatorio.DataSet.FieldByName('VL_TOTAL').AsExtended;
  vl_imposto:= vl_imposto + dtsRelatorio.DataSet.FieldByName('VL_IMPOSTO').AsExtended;
end;

procedure TfrmImpressaoAbastecimentos.RLBand5BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  lbLitros.Caption := FormatFloat('0.00 L', nr_litros);
  lbTotal.Caption := FormatFloat('R$ ,0.00', vl_total);
  lbImposto.Caption := FormatFloat('R$ ,0.00', vl_imposto);
end;

function TfrmImpressaoAbastecimentos.ValidarImpressao: Boolean;
begin
  Result := False;
  if (DataInicial.Date > DataFinal.Date) then
  begin
    Application.MessageBox(PWideChar('A data inicial n�o pode ser maior que a data final.'),
      'Abastecimentos por Per�odo',MB_OK + MB_ICONINFORMATION);
    Exit;
  end;
  Result := True;
end;

end.
