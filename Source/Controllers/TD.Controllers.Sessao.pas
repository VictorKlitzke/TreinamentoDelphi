unit TD.Controllers.Sessao;

interface

uses
  System.SysUtils;

type
  TSessao = class

  private
    FUsuario: Integer;
    FID: Integer;
    FData: TDateTime;
    FNome: string;
    function getUsuario: Boolean;

  public
    constructor Create;
    destructor Destroy; override;

    property Conectado: Boolean read getUsuario;
    property Usuario: Integer read FUsuario write FUsuario;
    property ID: Integer read FID write FID;
    property Nome: string read FNome write FNome;
    property Data: TDateTime read FData write FData;

    function Conectar(AUsuario: integer; ANome: string): Boolean;
    function Desconectar: Boolean;
  end;

implementation


{ TSessao }

function TSessao.Conectar(AUsuario: integer; ANome: string): Boolean;
begin
  FUsuario := AUsuario;
  FNome := ANome;
  FData := Now;
  Result := True;
end;

constructor TSessao.Create;
begin

end;

function TSessao.Desconectar: Boolean;
begin
  FUsuario := 0;
  Result := True;
end;

destructor TSessao.Destroy;
begin
  inherited;
end;

function TSessao.getUsuario: Boolean;
begin
  Result := FUsuario <> 0;
end;

end.
