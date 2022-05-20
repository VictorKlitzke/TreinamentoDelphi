unit TD.Factories.Usuario;

interface

uses
  BCrypt;

type
  iFactoryUsuario = interface
    ['{ACAD49B9-F8EF-4878-86FB-7B752CA29B4C}']
    function Existe(AUsuario: string): Boolean;
    function Adicionar(ANome, AUsuario, ASenha: string): iFactoryUsuario;
  end;

  TFactoryUsuario = class(TInterfacedObject, iFactoryUsuario)
  private

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iFactoryUsuario;

    function Existe(AUsuario: string): Boolean;
    function Adicionar(ANome, AUsuario, ASenha: string): iFactoryUsuario;
  end;

implementation

uses
  TD.Services.Query,
  TD.Models.Usuario;

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

class function TFactoryUsuario.New: iFactoryUsuario;
begin
  Result := Self.Create;
end;

end.
