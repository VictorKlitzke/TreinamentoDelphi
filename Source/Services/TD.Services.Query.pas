unit TD.Services.Query;

interface

uses
  System.Classes,
  System.Generics.Collections,
  Uni,
  Data.DB;

type

  iServiceQuery = interface
    ['{82BF054D-FE9C-4A6F-9289-94285D34B2F0}']
    function CampoChave(AValue: string): iServiceQuery;
    function Tabela(AValue: string): iServiceQuery;
    function Gerador(AValue: string): iServiceQuery;

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
    function Filtrar(ACampo: string; AValor: Variant): iServiceQuery;
    function TemRegistros: Boolean;
    function DataSet: TDataSet;
    function Apelido(ACampo, AValor: string): iServiceQuery;
  end;

  TServiceQuery = class(TInterfacedObject, iServiceQuery)
  private
    FQuery: TUniQuery;
    FTabela: string;
    FCampoChave: string;

    FApelidos: TDictionary<string, string>;
    procedure MontarSQL;
    procedure AntesAbrir(Dataset: TDataSet);
  public
    constructor Create;
    destructor Destroy; override;
    class function New: iServiceQuery;

    function CampoChave(AValue: string): iServiceQuery;
    function Tabela(AValue: string): iServiceQuery;
    function Gerador(AValue: string): iServiceQuery;

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
    function Filtrar(ACampo: string; AValor: Variant): iServiceQuery;
    function TemRegistros: Boolean;
    function DataSet: TDataSet;
    function Apelido(ACampo, AValor: string): iServiceQuery;
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

procedure TServiceQuery.AntesAbrir(Dataset: TDataSet);
var
  i: Integer;
  LField: TField;
  LApelido: string;
begin
  Dataset.FieldDefs.Update;

  for i := 0 to Dataset.FieldDefs.Count - 1 do
    if Dataset.FindField(Dataset.FieldDefs[i].Name) = Nil then
      Dataset.FieldDefs.Items[i].CreateField(Dataset);


  if FCampoChave <> '' then
  begin
    TUniQuery(Dataset).KeyFields := FCampoChave;
    LField := Dataset.FindField(FCampoChave);
    LField.Required := False;
    LField.AutoGenerateValue := arAutoInc;
  end;

  for LField in Dataset.Fields do
    LField.Visible := False;

  for LApelido in FApelidos.Keys do
  begin
    LField := Dataset.FindField(LApelido);

    if Assigned(LField) then
    begin
      LField.Visible := True;
      LField.DisplayLabel := FApelidos[LApelido];
    end;
  end;

  for LField in Dataset.Fields do
  begin
    case LField.DataType of
      ftSmallint, ftInteger: TFloatField(LField).DisplayFormat := '#,##0';
      ftFloat, ftCurrency: TFloatField(LField).DisplayFormat := '#,##0.00';
    end;
  end;
end;

function TServiceQuery.Apelido(ACampo, AValor: string): iServiceQuery;
begin
  Result := Self;
  FApelidos.Add(ACampo, AValor);
end;

function TServiceQuery.Campo(ANome: String; AValor: Variant): iServiceQuery;
begin
  Result := Self;
  FQuery.FieldByName(ANome).Value := AValor;
end;

function TServiceQuery.CampoChave(AValue: string): iServiceQuery;
begin
  Result := Self;
  FCampoChave := AValue;
  MontarSQL;
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
  FApelidos := TDictionary<string, string>.Create;

  with FQuery do
  begin
    Connection := TServiceConexao.New.Conexao;
    DMLRefresh := True;
    Debug := False;
    CachedUpdates := True;
    BeforeOpen := AntesAbrir;
  end;
end;

function TServiceQuery.DataSet: TDataSet;
begin
  Result := FQuery;
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
  FApelidos.DisposeOf;
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

function TServiceQuery.Filtrar(ACampo: string; AValor: Variant): iServiceQuery;
begin
  Result := Self;
  FQuery.DeleteWhere;
  FQuery.AddWhere(ACampo + ' = :' + ACampo);
  FQuery.ParamByName(ACampo).Value := AValor;
end;

function TServiceQuery.Gerador(AValue: string): iServiceQuery;
begin
  Result := Self;
  FQuery.SpecificOptions.Values['KeyGenerator'] := AValue;
end;

function TServiceQuery.Inserir: iServiceQuery;
begin
  Result := Self;

  if not FQuery.Active then
    FQuery.Open;

  FQuery.Insert;
end;

procedure TServiceQuery.MontarSQL;
begin
  if FTabela = ''  then
    Exit;

  if FCampoChave = '' then
    Exit;

  with FQuery.SQL do
  begin
    Clear;
    Add('SELECT');
    Add('  *');
    Add('FROM');
    Add('  ' + FTabela);
    Add('WHERE');
    Add('  ' + FCampoChave + ' = :' + FCampoChave);
  end;
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

function TServiceQuery.Tabela(AValue: string): iServiceQuery;
begin
  Result := Self;
  FTabela := AValue;
  MontarSQL;
end;

function TServiceQuery.TemRegistros: Boolean;
begin
  Result := FQuery.RecordCount > 0;
end;

end.
