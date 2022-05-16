unit Tarefa;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Vcl.ExtCtrls,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxStyles,
  dxSkinsCore,
  dxSkinsDefaultPainters,
  cxCustomData, cxFilter,
  cxData,
  cxDataStorage,
  cxEdit,
  cxNavigator,
  dxDateRanges, Data.DB,
  cxDBData,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGridLevel,
  cxClasses, cxGridCustomView,
  cxGrid,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.Menus, cxButtons;

type
  TFTarefa = class(TForm)
    DataSource1: TDataSource;
    QryTarefas: TFDQuery;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1TAREFA: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1STATUS: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel1: TPanel;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public

  end;


var
  FTarefa: TFTarefa;

implementation

uses ConexaoDados, Sessao, Principal;

{$R *.dfm}

procedure TFTarefa.FormShow(Sender: TObject);
begin
QryTarefas.Close;
QryTarefas.ParamByName('USUARIO').AsInteger := FPrincipal.FSessao.Usuario;
QryTarefas.Open;
end;

end.
