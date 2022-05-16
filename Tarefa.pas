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
    btnAdd: TcxButton;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1DBTableView1TAREFA: TcxGridDBColumn;
    cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn;
    cxGrid1DBTableView1STATUS: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  FTarefa: TFTarefa;

implementation

{$R *.dfm}

uses ConexaoDados, Sessao, Principal;

procedure TFTarefa.FormCreate(Sender: TObject);
begin
FTarefa.Top :=  Trunc((ClientHeight/2) - (FTarefa.Height/2));
FTarefa.Left:= Trunc((ClientWidth/2) - (FTarefa.Width/2));
end;

procedure TFTarefa.FormShow(Sender: TObject);
begin

QryTarefas.Close;
QryTarefas.ParamByName('USUARIO').AsInteger := FPrincipal.FSessao.Usuario;
QryTarefas.Open;
end;

end.
