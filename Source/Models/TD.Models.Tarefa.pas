unit TD.Models.Tarefa;

interface

uses
  TD.Services.Query;

type
  iTarefa = interface
    ['{AE2B68B5-54CD-43B8-8F3E-F531E7A2C335}']
    //CONFIGURA�OES
    function CampoChave(AValue: string): iTarefa;

    // GETs
    function ID: Integer; overload;
    function Tarefa: string; overload;
    function Descricao: string; overload;
    function Status: Integer; overload;
    function Usuario: Integer; overload;

    // SETs
    function ID(AValue: Integer): iTarefa; overload;
    function Tarefa(AValue: string): iTarefa; overload;
    function Descricao(AValue: string): iTarefa; overload;
    function Status(AValue: Integer): iTarefa; overload;
    function Usuario(AValue: Integer): iTarefa; overload;

    // A��ES
    function Inserir: iTarefa;
    function Editar: iTarefa;
    function Apagar: iTarefa;
    function Salvar: iTarefa;
    function Filtrar(ACampo: string; AValor: Variant): iTarefa;
  end;


  TTarefa = class(TInterfacedObject, iTarefa)
  private
    FTarefaQuery: iServiceQuery;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iTarefa;

    // CONFIGURA�OES
    function CampoChave(AValue: string): iTarefa;

    // GETs
    function ID: Integer; overload;
    function Tarefa: string; overload;
    function Descricao: string; overload;
    function Status: Integer; overload;
    function Usuario: Integer; overload;

    // SETs
    function ID(AValue: Integer): iTarefa; overload;
    function Tarefa(AValue: string): iTarefa; overload;
    function Descricao(AValue: string): iTarefa; overload;
    function Status(AValue: Integer): iTarefa; overload;
    function Usuario(AValue: Integer): iTarefa; overload;

    // A��ES
    function Inserir: iTarefa;
    function Editar: iTarefa;
    function Apagar: iTarefa;
    function Salvar: iTarefa;
    function Filtrar(ACampo: string; AValor: Variant): iTarefa;
  end;

implementation

{ TTarefa }

function TTarefa.Apagar: iTarefa;
begin
  Result := Self;
  FTarefaQuery.Deletar;
end;

function TTarefa.CampoChave(AValue: string): iTarefa;
begin
  Result := Self;
  FTarefaQuery.CampoChave(AValue);
end;

constructor TTarefa.Create;
begin
  FTarefaQuery := TServiceQuery
    .New
    .Gerador('GEN_TB_TAREFA_ID')
    .CampoChave('ID')
    .Tabela('TB_TAREFA');
end;

function TTarefa.Descricao(AValue: string): iTarefa;
begin
  Result := Self;
  FTarefaQuery.Campo('DESCRICAO', AValue);
end;

function TTarefa.Descricao: string;
begin
  Result := FTarefaQuery.Campo('DESCRICAO').AsString;
end;

destructor TTarefa.Destroy;
begin

  inherited;
end;

function TTarefa.Editar: iTarefa;
begin
  Result := Self;
  FTarefaQuery.Editar;
end;

function TTarefa.Filtrar(ACampo: string; AValor: Variant): iTarefa;
begin
  FTarefaQuery
    .Filtrar(ACampo, AValor)
    .Abrir;
end;

function TTarefa.ID: Integer;
begin
  Result := FTarefaQuery.Campo('ID').AsInteger;
end;

function TTarefa.ID(AValue: Integer): iTarefa;
begin
  Result := Self;
  FTarefaQuery.Campo('ID', AValue);
end;

function TTarefa.Inserir: iTarefa;
begin
  Result := Self;
  FTarefaQuery.Inserir;
end;

class function TTarefa.New: iTarefa;
begin
  Result := Self.Create;
end;

function TTarefa.Salvar: iTarefa;
begin
  Result := Self;
  FTarefaQuery.Salvar;
end;

function TTarefa.Status(AValue: Integer): iTarefa;
begin
  Result := Self;
  FTarefaQuery.Campo('STATUS', AValue);
end;

function TTarefa.Status: Integer;
begin
  Result := FTarefaQuery.Campo('STATUS').AsInteger;
end;

function TTarefa.Tarefa: string;
begin
  Result := FTarefaQuery.Campo('TAREFA').AsInteger;
end;

function TTarefa.Tarefa(AValue: string): iTarefa;
begin
  Result := Self;
  FTarefaQuery.Campo('TAREFA', AValue);
end;

function TTarefa.Usuario: Integer;
begin
  Result := FTarefaQuery.Campo('USUARIO').AsInteger;
end;

function TTarefa.Usuario(AValue: Integer): iTarefa;
begin
  Result := Self;
  FTarefaQuery.Campo('USUARIO', AValue);
end;

end.
