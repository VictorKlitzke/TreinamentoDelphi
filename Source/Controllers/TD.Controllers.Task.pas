unit TD.Controllers.Task;

interface

uses
  System.SysUtils,
  BCrypt,
  TD.Services.Query;

type
  TUTaskSessao = record
    Id : Integer;
    Tarefa : string;
    Descricao : string;
    status : Integer;
    Id_Usuario : integer;
  end;

  IControllerTask = interface
    ['{DCAF7BD5-77BF-4337-BC72-A56AC6921CBC}']
  end;

  TControllerTask = class
  private

  public
  constructor Create;
  destructor Destroy; override;

  end;

implementation

 { TControllerTask }

constructor TControllerTask.Create;
begin

end;

destructor TControllerTask.Destroy;
begin
    inherited
end;

end.
