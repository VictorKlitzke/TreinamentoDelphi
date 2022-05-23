unit TD.Factories.Task;

interface

uses
  BCrypt;

type
  iFactoryTask = interface
    ['{1592C510-8A28-408D-BD1A-F6430ADE3590}']
    function AddTask(ATArefa,ADescricao : string):iFactoryTask;
  end;

  TFactoryTask = class(TInterfacedObject,iFactoryTask)
    private

    public
      constructor Create;
      destructor Destroy; override;
      class function New: iFactoryTask;
      function AddTask(ATArefa,ADescricao : string):iFactoryTask;
      function Existe(ATarefa: string): Boolean;

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
    .Inserir
    .Editar
    .Apagar
    .Salvar
    .Filtrar;
end;

constructor TFactoryTask.create;
begin

end;

destructor TFactoryTask.Destroy;
begin

    inherited;
end;

function TFactoryTask.Existe(AUsuario: string): Boolean;
begin

  Result := TServiceQuery
    .New
    .SqlLimpar
    .SQL('SELECT')
    .SQL('  TF.ID_USUARIO')
    .SQL('  TF.TAREFA')
    .SQL('  TF.DESCRICAO')
    .SQL('  TF.STATUS')
    .SQL('  FROM')
    .SQL('  TB_TAREFAS TF')
    .SQL('  join')
    .SQL('  TB_USUARIOS TU ON TF.ID_USUARIO = TU.ID')
    .SQL('  where')
    .SQL('  TU.ID = :USUARIO')
end;
class function TFactoryTask.New: iFactoryTask;
begin
  Result := Self.Create;
end;

end.
