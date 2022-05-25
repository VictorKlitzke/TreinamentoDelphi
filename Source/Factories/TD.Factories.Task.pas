unit TD.Factories.Task;

interface

uses
  BCrypt;

type
  iFactoryTask = interface
    ['{1592C510-8A28-408D-BD1A-F6430ADE3590}']
    function AddTask(ATarefa,ADescricao : string):iFactoryTask;
    function ListTask(AUsuario): iFactoryTask;
  end;

  TFactoryTask = class(TInterfacedObject,iFactoryTask)
    private

    public
      constructor Create;
      destructor Destroy; override;

      class function New: iFactoryTask;
      function AddTask(ATarefa,ADescricao : string):iFactoryTask;
      function ListTask(AUsuario): iFactoryTask;
  end;


implementation

uses
  TD.Services.Query,
  TD.Models.Tarefa;

  { TFactoryTask }

function TFactoryTask.AddTask(Atarefa, ADescricao: string): iFactoryTask;
begin
  Result := Self;
  TTarefa
    .New
    .Inserir
    .Tarefa(ATarefa)
    .Descricao(ADescricao)
    .Salvar;
end;

constructor TFactoryTask.create;
begin

end;

destructor TFactoryTask.Destroy;
begin

    inherited;
end;


function TFactoryTask.ListTask(AUsuario): iFactoryTask;
begin
  Result := Self;
  TTarefa
    .New
    .
    .Filtrar('ID_USUARIO', AUsuario)
end;

class function TFactoryTask.New: iFactoryTask;
begin
  Result := Self.Create;
end;

end.
