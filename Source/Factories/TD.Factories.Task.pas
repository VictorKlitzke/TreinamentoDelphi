unit TD.Factories.Task;

interface

uses
  Data.DB,
  TD.Services.Query,
  BCrypt,
  TD.Controllers.Sessao;

type
  TFactoryTaskLog = procedure(Value: string) of object;

  iFactoryTask = interface
    ['{1592C510-8A28-408D-BD1A-F6430ADE3590}']
    function AddTask(ATarefa,ADescricao : string): iFactoryTask;
    function DataSource(var ADatasource: TDataSource): iFactoryTask;
    function FinishTask(ATarefa: Integer): iFactoryTask;

    function ListTask: iFactoryTask;

    function Log(AValue: TFactoryTaskLog): iFactoryTask;
  end;

  TFactoryTask = class(TInterfacedObject, iFactoryTask)
  private
    FSessao: iControllerSessao;
    FTarefas: iServiceQuery;
    FLog: TFactoryTaskLog;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iFactoryTask;

    function AddTask(ATarefa,ADescricao : string): iFactoryTask;
    function FinishTask(ATarefa: Integer): iFactoryTask;
    function DataSource(var ADatasource: TDataSource): iFactoryTask;
    function Log(AValue: TFactoryTaskLog): iFactoryTask;

    function ListTask: iFactoryTask;
  end;


implementation
  { TFactoryTask }
uses
  TD.Models.Tarefa;

function TFactoryTask.AddTask(Atarefa, ADescricao: string): iFactoryTask;
begin
  Result := Self;

  TTarefa
    .New
    .Inserir
    .Tarefa(ATarefa)
    .Descricao(ADescricao)
    .Usuario(FSessao.Id)
    .Salvar;

  if Assigned(FLog) then
    FLog('Meu log ta funfando.');
end;

constructor TFactoryTask.Create;
begin
  FSessao := TControllerSessao.New;
  FTarefas := TServiceQuery
    .New
    .Apelido('ID', '#')
    .Apelido('TAREFA', 'Tarefa')
    .Apelido('DESCRICAO', 'Descrição')
    .Apelido('STATUS_DESCRICAO', 'Status')
    .SQL('  SELECT')
    .SQL('    T.ID,')
    .SQL('    T.TAREFA,')
    .SQL('    T.DESCRICAO,')
    .SQL('    DECODE(')
    .SQL('      T.STATUS,')
    .SQL('      0, ''ABERTA'',')
    .SQL('      1, ''FINALIZADA'',')
    .SQL('      ''NÃO FAÇO IDEIA''')
    .SQL('    ) AS STATUS_DESCRICAO,')
    .SQL('    T.STATUS')
    .SQL('  FROM')
    .SQL('    TB_TAREFAS T')
    .SQL('  WHERE')
    .SQL('    T.ID_USUARIO = :USUARIO');
end;

function TFactoryTask.DataSource(var ADatasource: TDataSource): iFactoryTask;
begin
  Result := Self;
  ADatasource.DataSet := FTarefas.DataSet;
end;

destructor TFactoryTask.Destroy;
begin

  inherited;
end;


function TFactoryTask.FinishTask(ATarefa: Integer): iFactoryTask;
begin
  Result := Self;

  TTarefa
    .New
    .Editar
    .Status(1)
    .Salvar
    .Filtrar('ID' , ATarefa);
end;

function TFactoryTask.ListTask: iFactoryTask;
begin
  Result := Self;

  FTarefas
    .Parametro('USUARIO', FSessao.Id)
    .Abrir;
end;

function TFactoryTask.Log(AValue: TFactoryTaskLog): iFactoryTask;
begin
  Result := Self;
  FLog := AValue;
end;

class function TFactoryTask.New: iFactoryTask;
begin
  Result := Self.Create;
end;

end.
