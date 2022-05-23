unit TD.Models.Tarefa;

interface

uses
  TD.Services.Query;

type
  iUsuario = interface
    ['{AE2B68B5-54CD-43B8-8F3E-F531E7A2C335}']
    //CONFIGURA�OES
    function CampoChave(AValue: string): iUsuario;

    // GETs
    function ID: Integer; overload;
    function Nome: string; overload;
    function Usuario: string; overload;
    function Senha: string; overload;

    // SETs
    function ID(AValue: Integer): iUsuario; overload;
    function Nome(AValue: string): iUsuario; overload;
    function Usuario(AValue: string): iUsuario; overload;
    function Senha(AValue: string): iUsuario; overload;

    // A��ES
    function Inserir: iUsuario;
    function Editar: iUsuario;
    function Apagar: iUsuario;
    function Salvar: iUsuario;
    function Filtrar(ACampo: string; AValor: Variant): iUsuario;

    // Operadores
    function TemRegistros: Boolean;
  end;


  TUsuario = class(TInterfacedObject, iUsuario)
  private
    FUsuarioQuery: iServiceQuery;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iUsuario;

    // CONFIGURA�OES
    function CampoChave(AValue: string): iUsuario;

    // GETs
    function ID: Integer; overload;
    function Nome: string; overload;
    function Usuario: string; overload;
    function Senha: string; overload;

    // SETs
    function ID(AValue: Integer): iUsuario; overload;
    function Nome(AValue: string): iUsuario; overload;
    function Usuario(AValue: string): iUsuario; overload;
    function Senha(AValue: string): iUsuario; overload;

    // A��ES
    function Inserir: iUsuario;
    function Editar: iUsuario;
    function Apagar: iUsuario;
    function Salvar: iUsuario;
    function Filtrar(ACampo: string; AValor: Variant): iUsuario;

    // Operadores
    function TemRegistros: Boolean;
  end;

implementation

uses
  BCrypt;

{ TUsuario }

function TUsuario.Apagar: iUsuario;
begin
  Result := Self;
  FUsuarioQuery.Deletar;
end;

function TUsuario.CampoChave(AValue: string): iUsuario;
begin
  Result := Self;
  FUsuarioQuery.CampoChave(AValue);
end;

constructor TUsuario.Create;
begin
  FUsuarioQuery := TServiceQuery
    .New
    .Gerador('GEN_TB_USUARIOS_ID')
    .CampoChave('ID')
    .Tabela('TB_USUARIOS');
end;

destructor TUsuario.Destroy;
begin

  inherited;
end;

function TUsuario.Editar: iUsuario;
begin
  Result := Self;
  FUsuarioQuery.Editar;
end;

function TUsuario.Filtrar(ACampo: string; AValor: Variant): iUsuario;
begin
  Result := Self;
  FUsuarioQuery
    .Filtrar(ACampo, AValor)
    .Abrir;
end;

function TUsuario.ID(AValue: Integer): iUsuario;
begin
  Result := Self;
  FUsuarioQuery.Campo('ID', AValue);
end;

function TUsuario.ID: Integer;
begin
  Result := FUsuarioQuery.Campo('ID').AsInteger;
end;

function TUsuario.Inserir: iUsuario;
begin
  Result := Self;
  FUsuarioQuery.Inserir;
end;

class function TUsuario.New: iUsuario;
begin
  Result := Self.Create;
end;

function TUsuario.Nome(AValue: string): iUsuario;
begin
  Result := Self;
  FUsuarioQuery.Campo('NOME', AValue);
end;

function TUsuario.Nome: string;
begin
  Result := FUsuarioQuery.Campo('NOME').AsString;
end;

function TUsuario.Salvar: iUsuario;
begin
  Result := Self;
  FUsuarioQuery.Salvar;
end;

function TUsuario.Senha: string;
begin
  Result := FUsuarioQuery.Campo('SENHA').AsString;
end;

function TUsuario.Senha(AValue: string): iUsuario;
begin
  Result := Self;
  FUsuarioQuery.Campo('SENHA', TBCrypt.GenerateHash(AValue));
end;

function TUsuario.TemRegistros: Boolean;
begin
  Result := FUsuarioQuery.TemRegistros;
end;

function TUsuario.Usuario: string;
begin
  Result := FUsuarioQuery.Campo('USUARIO').AsString;
end;

function TUsuario.Usuario(AValue: string): iUsuario;
begin
  Result := Self;
  FUsuarioQuery.Campo('USUARIO', AValue);
end;

end.
