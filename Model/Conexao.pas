unit Conexao;

interface

uses Data.DB, Tanque, Bomba, Abastecimento;

type

  iConexao = interface
    ['{5B0A0EFF-9BBA-4FD1-A62C-3D52F44BBA2B}']
    function Connection : TObject;
  end;

  iQuery = interface
    ['{68136E13-F733-49B7-AA39-4B32D9F45CEF}']
    function Query : TObject;
    function Open(aSQL : String) : iQuery;
    function ExecSQL(aSQL : String) : iQuery;
  end;

  iConexaoFactory = interface
    ['{A2291619-F2FC-4208-8055-136E202FB91F}']
    function Conexao : iConexao;
    function Query : iQuery;
  end;

  iTanque = interface
    ['{1EC1F575-3E5D-4066-972A-D657D954F812}']
    procedure Salvar(aTanque: TTAnque);
    procedure Excluir(aID_Tanque: Integer);
    function Listar(ADataSource: TDataSource): iTanque;
  end;

  iBomba = interface
    ['{A4498E1B-A4BD-4FF9-925F-2A97BF66BA1D}']
    procedure Salvar(aBomba: TBomba);
    procedure Excluir(aBomba: Integer);
    function Listar(ADataSource: TDataSource): iBomba;
  end;

  iAbastecimento = interface
    ['{10F3F7CE-8008-4C11-80D6-7A8274BA63B9}']
    procedure Salvar(aAbastecimento: TAbastecimento);
    procedure Excluir(aAbastecimento: Integer);
    function Listar(ADataSource: TDataSource): iAbastecimento;
  end;

implementation

end.
