unit TD.Services.Conexao;

interface

uses
  System.SysUtils,
  InterBaseUniProvider,
  Uni,
  UniSQLMonitor;

type
  TConexaoError = class(Exception);

  iServiceConexao = interface
    ['{E8E79C4E-A870-4012-AD51-5966959D8DC0}']

    function Conectar: iServiceConexao;
    function Conexao: TUniConnection;
  end;

  TServiceConexao = class(TInterfacedObject, iServiceConexao)
  private
    FConexao: TUniConnection;
    FProvider: TInterBaseUniProvider;
    FMonitor: TUniSQLMonitor;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iServiceConexao;

    function Conectar: iServiceConexao;
    function Conexao: TUniConnection;
  end;

implementation

var
  GServiceConexao: iServiceConexao;

{ TServiceConexao }

function TServiceConexao.Conectar: iServiceConexao;
begin
  Result := Self;

  try
    FConexao.Connect;
  except
    on e: Exception do
      raise TConexaoError.Create('Falha ao conectar-se ao banco de dados.' + #13 + e.Message);
  end;
end;

function TServiceConexao.Conexao: TUniConnection;
begin
  Result := FConexao;
end;

constructor TServiceConexao.Create;
begin
  FProvider := TInterBaseUniProvider.Create(nil);
  FConexao := TUniConnection.Create(nil);
  FMonitor := TUniSQLMonitor.Create(nil);

  with FConexao do
  begin
    LoginPrompt := False;

    Server := 'localhost';
    Username := 'SYSDBA';
    Password := 'masterkey';
    ProviderName := 'InterBase';
    Port := 3050;
    Database := 'D:\dados.fdb';
    SpecificOptions.Values['ClientLibrary'] := 'fbclient.dll';
  end;
end;

destructor TServiceConexao.Destroy;
begin
  FConexao.DisposeOf;
  FProvider.DisposeOf;
  FMonitor.DisposeOf;
  inherited;
end;

class function TServiceConexao.New: iServiceConexao;
begin
  if not Assigned(GServiceConexao) then
    GServiceConexao := Self.Create;

  Result := GServiceConexao;
end;

end.
