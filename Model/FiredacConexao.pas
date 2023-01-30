unit FiredacConexao;

interface

uses Conexao, FireDAC.Comp.Client, System.SysUtils, System.IOUtils,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDac.DApt,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.Stan.ExprFuncs, FireDAC.VCLUI.Wait;

type
  TFiredacConexao = class(TInterfacedObject, iConexao)
  private
    FConexao : TFDConnection;
    function GetCaminhoBanco: string;
  public
    constructor Create;
    destructor Destroy; override;
    class function New : iConexao;
    function Connection : TObject;
  end;

implementation

{ TFiredacConexao }

function TFiredacConexao.Connection: TObject;
begin
  Result := FConexao;
end;

constructor TFiredacConexao.Create;
begin
  FConexao := TFDConnection.Create(nil);
  FConexao.Params.DriverID := 'FB';
  FConexao.Params.Database := GetCaminhoBanco;
  FConexao.Params.UserName := 'SYSDBA';
  FConexao.Params.Password := 'root';
  FConexao.Connected := true;
end;

destructor TFiredacConexao.Destroy;
begin
  FreeAndNil(FConexao);
  inherited;
end;

function TFiredacConexao.GetCaminhoBanco: string;
var
  sPath: string;
begin
  sPath := System.SysUtils.GetCurrentDir;
  sPath := System.IOUtils.TPath.Combine(sPath, 'POSTOABC.FDB');
  if not(FileExists(sPath)) then
  begin
    //nao existe banco
  end;
  Result := sPath;
end;

class function TFiredacConexao.New: iConexao;
begin
  Result := Self.Create;
end;

end.
