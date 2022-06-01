unit TD.Factories.Autenticacao;

interface

uses
  System.SysUtils;

type
  AutenticacaoError = class(Exception);

  iFactoryAutenticacao = interface
    ['{F34EBE29-0585-4700-B5EB-199C56E3F6B7}']
    function Login(AUsuario, ASenha: string): iFactoryAutenticacao;
  end;

  TFactoryAutenticacao = class (TInterfacedObject, iFactoryAutenticacao)
  private

  public
    constructor Create;
    destructor Destroy; override;
    class function New: iFactoryAutenticacao;

    function Login(AUsuario, ASenha: string): iFactoryAutenticacao;
  end;

implementation

uses
  BCrypt,
  TD.Models.Usuario, TD.Controllers.Sessao;

{ TFactoryAutenticacao }

constructor TFactoryAutenticacao.Create;
begin

end;

destructor TFactoryAutenticacao.Destroy;
begin

  inherited;
end;

function TFactoryAutenticacao.Login(AUsuario, ASenha: string): iFactoryAutenticacao;
var
  LModel: iUsuario;
begin
  Result := Self;

  LModel := TUsuario
    .New
    .Filtrar('USUARIO', AUsuario);

  if not LModel.TemRegistros then
    raise AutenticacaoError.Create('Usuário não encontrado');

  if not TBCrypt.CompareHash(ASenha, LModel.Senha) then
    raise AutenticacaoError.Create('Senha inválida');

  TControllerSessao.New.Entrar(LModel.ID , LModel.Nome);
end;

class function TFactoryAutenticacao.New: iFactoryAutenticacao;
begin
  Result := Self.Create;
end;

end.
