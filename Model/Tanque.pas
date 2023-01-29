unit Tanque;

interface

uses System.SysUtils;

type
  TTanque = class
  private
    FDS_TANQUE: String;
    FID: Integer;
    FTP_TANQUE: Integer;
    procedure SetDS_TANQUE(const aValue: String);
    procedure SetID(const aValue: Integer);
    procedure SetTP_TANQUE(const aValue: Integer);
  public
    property ID: Integer read FID write SetID;
    property DS_TANQUE: String read FDS_TANQUE write SetDS_TANQUE;
    property TP_TANQUE: Integer read FTP_TANQUE write SetTP_TANQUE;
    function ToString: String;
  end;
implementation
{ TTanque }
procedure TTanque.SetDS_TANQUE(const aValue: String);
begin
  FDS_TANQUE := aValue;
end;
procedure TTanque.SetID(const aValue: Integer);
begin
  FID := aValue;
end;
procedure TTanque.SetTP_TANQUE(const aValue: Integer);
begin
  FTP_TANQUE := aValue;
end;

function TTanque.ToString: String;
begin
  Result := Format('%d - %s', [Self.ID, Self.DS_TANQUE]);
end;

end.
