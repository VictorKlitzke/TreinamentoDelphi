unit TD.Views.Task.Listagem;

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
  TTDViewsTaskListagem = class(TForm)
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
  TDViewsTaskListagem: TTDViewsTaskListagem;

implementation

uses ConexaoDados, TD.Controllers.Sessao, TD.Views.Principal;

{$R *.dfm}

procedure TTDViewsTaskListagem.FormShow(Sender: TObject);
begin
QryTarefas.Close;
QryTarefas.ParamByName('USUARIO').AsInteger := TDViewsPrincipal.FSessao.Usuario;
QryTarefas.Open;
end;

end.
