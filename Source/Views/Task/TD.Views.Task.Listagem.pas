unit TD.Views.Task.Listagem;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.UITypes,
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
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxEdit,
  cxNavigator,
  dxDateRanges,
  Data.DB,
  cxDBData,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGridLevel,
  cxClasses,
  cxGridCustomView,
  cxGrid,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  Vcl.Menus,
  cxButtons,
  TD.Factories.Task;

type
  TTDViewsTaskListagem = class(TForm)
    dsTarefas: TDataSource;
    pnContent: TPanel;
    edtBuscar: TEdit;
    lbl1: TLabel;
    gTarefas: TcxGrid;
    gTarefasView: TcxGridDBTableView;
    gTarefasLevel: TcxGridLevel;
    btnExcluir: TcxButton;
    btnAddTask: TcxButton;
    procedure btnAddTaskClick(Sender: TObject);
    procedure btncadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gTarefasViewDblClick(Sender: TObject);
  private
    FTaskFactory: iFactoryTask;
  public
    procedure CarregarDados;

  end;


var
  TDViewsTaskListagem: TTDViewsTaskListagem;

implementation

uses
  ConexaoDados,
  TD.Views.Task.Adicionar,
  TD.Views.Principal;

{$R *.dfm}

procedure TTDViewsTaskListagem.btnAddTaskClick(Sender: TObject);
begin
  try
    if not Assigned(TDViewsTaskAdicionar) then
      Application.CreateForm(TTDViewsTaskAdicionar , TDViewsTaskAdicionar);

    TDViewsTaskAdicionar.ShowModal;

    CarregarDados;
  finally
    FreeAndNil(TDViewsTaskAdicionar);
  end;
end;

procedure TTDViewsTaskListagem.btncadastrarClick(Sender: TObject);
begin
  if Assigned (TDViewsTaskAdicionar) then FreeAndNil(TDViewsTaskAdicionar);

  if not Assigned(TDViewsTaskAdicionar) then
    Application.CreateForm(TTDViewsTaskAdicionar , TDViewsTaskAdicionar);

  TDViewsTaskAdicionar.Parent := pnContent;
  TDViewsTaskAdicionar.Show;
end;

procedure TTDViewsTaskListagem.CarregarDados;
begin
  FTaskFactory := TFactoryTask
    .New
    .DataSource(dsTarefas)
    .ListTask;

  with gTarefasView do
  begin
    ClearItems;
    DataController.CreateAllItems();
    ApplyBestFit();
  end;
end;

procedure TTDViewsTaskListagem.FormCreate(Sender: TObject);
begin
  CarregarDados;
end;

procedure TTDViewsTaskListagem.gTarefasViewDblClick(Sender: TObject);
begin
  if MessageDlg('Tem certeza que quer finalizar essa tarefa?', mtConfirmation, mbYesNo, 0) = mrYes then
  begin
    if dsTarefas.DataSet.FieldByName('STATUS').AsInteger <> 0 then
    begin
      MessageDlg('Tarefa finalizada denovo!', mtInformation, [mbOK], 0);
      Exit;
    end;

    try
      FTaskFactory
        .FinishTask(dsTarefas.DataSet.FieldByName('ID').AsInteger);
      MessageDlg('Tarefa finalizada com sucesso!', mtInformation, [mbOK], 0);
    except
      MessageDlg('Erro ao finalizar tarefas.', mtError, [mbOK], 0);
    end;

    CarregarDados;
  end;
end;

end.
