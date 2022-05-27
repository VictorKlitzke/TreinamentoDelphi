unit TD.Factories.Usuario;

interface

uses
  BCrypt,
  TD.Services.Query,
  Data.DB,
  TD.Models.Usuario,
  TD.Controllers.Sessao;

type
  iFactoryUsuario = interface
    ['{ACAD49B9-F8EF-4878-86FB-7B752CA29B4C}']
    function Existe(AUsuario: string): Boolean;
    function Adicionar(ANome, AUsuario, ASenha: string): iFactoryUsuario;
    function DataSource(var ADatasource: TDataSource): iFactoryUsuario;
    function DeleteUsuario(AUsuario: Integer): iFactoryUsuario;

    function ListUsuario: iFactoryUsuario;
  end;

  TFactoryUsuario = class(TInterfacedObject, iFactoryUsuario)
  private
    FUsuarios : iServiceQuery;
    FSessao : iControllerSessao;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iFactoryUsuario;

    function Existe(AUsuario: string): Boolean;
    function Adicionar(ANome, AUsuario, ASenha: string): iFactoryUsuario;
    function DeleteUsuario(AUsuario: Integer): iFactoryUsuario;
    function DataSource(var ADatasource: TDataSource): iFactoryUsuario;

    function ListUsuario: iFactoryUsuario;
  end;

implementation

{ TFactoryUsuario }

function TFactoryUsuario.Adicionar(ANome, AUsuario, ASenha: string): iFactoryUsuario;
begin
  Result := Self;
  TUsuario
    .New
    .Inserir
    .Nome(ANome)
    .Usuario(AUsuario)
    .Senha(ASenha)
    .Salvar;
end;

constructor TFactoryUsuario.Create;
begin
  FUsuarios := TServiceQuery
    .New
    .Apelido('ID', '#')
    .Apelido('NOME', 'Nome')
    .Apelido('USUARIO', 'Usuario')
    .SQL('SELECT')
    .SQL('  T.ID,')
    .SQL('  T.NOME,')
    .SQL('  T.USUARIO,')
    .SQL('  T.SENHA')
    .SQL('FROM')
    .SQL('  TB_USUARIOS T');
end;

function TFactoryUsuario.DataSource(var ADatasource: TDataSource): iFactoryUsuario;
begin
  Result := Self;
  ADatasource.DataSet := FUsuarios.DataSet;
end;

destructor TFactoryUsuario.Destroy;
begin

  inherited;
end;

function TFactoryUsuario.Existe(AUsuario: string): Boolean;
begin
  Result := TServiceQuery
    .New
    .SQLLimpar
    .SQL('SELECT')
    .SQL('  COUNT(*) AS QTD')
    .SQL('FROM')
    .SQL('  TB_USUARIOS U')
    .SQL('WHERE')
    .SQL('  UPPER(U.USUARIO) = UPPER(:USUARIO)')
    .Parametro('USUARIO', AUsuario)
    .Abrir
    .Campo('QTD')
    .AsInteger <> 0
end;

function TFactoryUsuario.DeleteUsuario(AUsuario: Integer): iFactoryUsuario;
begin
  Result := Self;
  TUsuario
    .New
    .Filtrar('ID' , AUsuario)
    .Apagar
    .Salvar;
end;

function TFactoryUsuario.ListUsuario: iFactoryUsuario;
begin
  Result := Self;
  FUsuarios
    .Abrir;
end;

class function TFactoryUsuario.New: iFactoryUsuario;
begin
  Result := Self.Create;
end;

end.
