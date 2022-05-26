unit TD.Controllers.Sessao;

interface

uses
  System.SysUtils,
  TD.Services.Query;

type
  iControllerSessao = interface
    ['{B54B148C-2591-4E24-962C-02684CC91B9A}']
    function Id : Integer;
    function Nome : string;

    function Entrar(Aid : Integer; ANome : string) : iControllerSessao;
  end;

  TControllerSessao = class(TInterfacedObject,iControllerSessao)
  private
    FId : Integer;
    FNome : string;
  public
    constructor Create;
    destructor Destroy; override;

    class function New : iControllerSessao;

    function Id : Integer;
    function Nome : string;
    function Entrar(Aid : Integer; ANome : string) : iControllerSessao;
  end;

implementation

var
  GControllerSessao: iControllerSessao;

{ TControllerSessao }

constructor TControllerSessao.Create;
begin

end;

destructor TControllerSessao.Destroy;
begin
  inherited;
end;

function TControllerSessao.Entrar(Aid: Integer;
  ANome: string): iControllerSessao;
begin
  Result := Self;
  FId := Aid;
  FNome := ANome;
end;

function TControllerSessao.Id: Integer;
begin
  Result := FId;
end;

class function TControllerSessao.New: iControllerSessao;
begin
  if not Assigned(GControllerSessao) then
    GControllerSessao := Self.Create;

  Result := GControllerSessao;
end;

function TControllerSessao.Nome: string;
begin
  Result := FNome;
end;

end.
