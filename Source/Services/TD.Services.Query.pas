unit TD.Services.Query;

interface

uses
  Uni,
  Data.DB;

type
  iServiceQuery = interface
    ['{82BF054D-FE9C-4A6F-9289-94285D34B2F0}']
    function SQL(AValue: string): iServiceQuery;
    function SQLLimpar: iServiceQuery;

    function Inserir: iServiceQuery;
    function Editar: iServiceQuery;
    function Deletar: iServiceQuery;
    function Salvar: iServiceQuery;
    function Cancelar: iServiceQuery;

    function Abrir: iServiceQuery;
    function Fechar: iServiceQuery;

    function Campo(AValue: String): TField; overload;
    function Campo(ANome: String; AValor: Variant): iServiceQuery; overload;
    function Parametro(ANome: String; AValue: Variant): iServiceQuery;
  end;

  TServiceQuery = class(TInterfacedObject, iServiceQuery)
  private
    FQuery: TUniQuery;
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iServiceQuery;

    function SQL(AValue: string): iServiceQuery;
    function SQLLimpar: iServiceQuery;
    function Inserir: iServiceQuery;
    function Editar: iServiceQuery;
    function Deletar: iServiceQuery;
    function Salvar: iServiceQuery;
    function Cancelar: iServiceQuery;
    function Abrir: iServiceQuery;
    function Fechar: iServiceQuery;
    function Campo(AValue: String): TField; overload;
    function Campo(ANome: String; AValor: Variant): iServiceQuery; overload;
    function Parametro(ANome: String; AValue: Variant): iServiceQuery;
  end;

implementation

uses
  TD.Services.Conexao;

{ TServiceQuery }

function TServiceQuery.Abrir: iServiceQuery;
begin
  Result := Self;
  FQuery.Open;
end;

function TServiceQuery.Campo(ANome: String; AValor: Variant): iServiceQuery;
begin
  Result := Self;
  FQuery.FieldByName(ANome).Value := AValor;
end;

function TServiceQuery.Campo(AValue: String): TField;
begin
  Result := FQuery.FieldByName(AValue);
end;

function TServiceQuery.Cancelar: iServiceQuery;
begin
  Result := Self;
  FQuery.Cancel;
end;

constructor TServiceQuery.Create;
begin
  FQuery := TUniQuery.Create(nil);
  with FQuery do
  begin
    Connection := TServiceConexao.New.Conexao;
    DMLRefresh := True;
    Debug := False;
    CachedUpdates := True;
  end;
end;

function TServiceQuery.Deletar: iServiceQuery;
begin
  Result := Self;

  FQuery.Delete;

  if FQuery.CachedUpdates then
    FQuery.ApplyUpdates();
end;

destructor TServiceQuery.Destroy;
begin
  FQuery.DisposeOf;
  inherited;
end;

function TServiceQuery.Editar: iServiceQuery;
begin
  Result := Self;
  FQuery.Edit;
end;

function TServiceQuery.Fechar: iServiceQuery;
begin
  Result := Self;
  FQuery.Close;
end;

function TServiceQuery.Inserir: iServiceQuery;
begin
  Result := Self;
  FQuery.Insert;
end;

class function TServiceQuery.New: iServiceQuery;
begin
  Result := Self.Create;
end;

function TServiceQuery.Parametro(ANome: String; AValue: Variant): iServiceQuery;
begin
  Result := Self;
  FQuery.ParamByName(ANome).Value := AValue;
end;

function TServiceQuery.Salvar: iServiceQuery;
begin
  Result := Self;
  if FQuery.State in dsEditModes then
  begin
    FQuery.Post;

    if FQuery.CachedUpdates then
      FQuery.ApplyUpdates();
  end;
end;

function TServiceQuery.SQL(AValue: string): iServiceQuery;
begin
  Result := Self;
  FQuery.SQL.Add(AValue);
end;

function TServiceQuery.SQLLimpar: iServiceQuery;
begin
  Result := Self;
  FQuery.SQL.Clear;
end;

end.
