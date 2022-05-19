unit TD.Controllers.Sessao;

interface

uses
  System.SysUtils;

type
  TUsuarioSessao = record
    ID: Integer;
    Nome: string;
  end;

  iControllerSessao = interface
    ['{B54B148C-2591-4E24-962C-02684CC91B9A}']
//    function Conectado: Boolean;
//    function Usuario: TUsuarioSessao;
//    function Conectar(AUsuario: Integer): iControllerSessao;
//    function Desconectar: iControllerSessao;
  end;

  TControllerSessao = class
  private

  public
    constructor Create;
    destructor Destroy; override;

  end;

implementation



{ TControllerSessao }

constructor TControllerSessao.Create;
begin

end;

destructor TControllerSessao.Destroy;
begin

  inherited;
end;

end.
