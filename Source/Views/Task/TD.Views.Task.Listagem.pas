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
  cxButtons;

type
  TTDViewsTaskListagem = class(TForm)
    DtsTarefa: TDataSource;
    QryTarefas: TFDQuery;
    pnContent: TPanel;
    edtBuscar: TEdit;
    lbl1: TLabel;
    cxGrid1: TcxGrid;
    cxgrdbtblvwGrid1DBTableView1: TcxGridDBTableView;
    cxgrdbtblvwGrid1DBTableView1TAREFA: TcxGridDBColumn;
    cxgrdbtblvwGrid1DBTableView1DESCRICAO: TcxGridDBColumn;
    cxgrdbtblvwGrid1DBTableView1STATUS: TcxGridDBColumn;
    cxgrdlvlGrid1Level1: TcxGridLevel;
    btnExcluir: TcxButton;
    btnAddTask: TcxButton;
    procedure FormShow(Sender: TObject);
    procedure btnAddTaskClick(Sender: TObject);
    procedure pnContentClick(Sender: TObject);
    procedure edtBuscarChange(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btncadastrarClick(Sender: TObject);

  private
    { Private declarations }
  public

  end;


var
  TDViewsTaskListagem: TTDViewsTaskListagem;

implementation

uses
  ConexaoDados,
  TD.Controllers.Sessao,
  TD.Views.Task.Adicionar,
  TD.Views.Principal,
  TD.Factories.Task;

{$R *.dfm}

procedure TTDViewsTaskListagem.btnAddTaskClick(Sender: TObject);
begin
  if Assigned (TDViewsTaskAdicionar) then FreeAndNil(TDViewsTaskAdicionar);
  if not Assigned(TDViewsTaskAdicionar) then
    Application.CreateForm(TTDViewsTaskAdicionar , TDViewsTaskAdicionar);

    TDViewsTaskAdicionar.Parent := pnContent;
    TDViewsTaskAdicionar.Show;
end;

procedure TTDViewsTaskListagem.btncadastrarClick(Sender: TObject);
begin
if Assigned (TDViewsTaskAdicionar) then FreeAndNil(TDViewsTaskAdicionar);
  if not Assigned(TDViewsTaskAdicionar) then
    Application.CreateForm(TTDViewsTaskAdicionar , TDViewsTaskAdicionar);

    TDViewsTaskAdicionar.Parent := pnContent;
    TDViewsTaskAdicionar.Show;
end;

procedure TTDViewsTaskListagem.btnExcluirClick(Sender: TObject);
begin
  with DtsTarefa do
    if edtBuscar.Text = '' then
      begin
        if edtBuscar.Text = '' then
           begin
            ShowMessage('Nenhuma tarefa selecionada');
           end
           else
           begin
             if DataSet.RecordCount = 0 then
              begin
                ShowMessage('Tarefa Inexistente');
              end
              else
              begin
                if MessageDlg('Deseja realmente excluir essa tarefa' , mtConfirmation , mbYesNo , 0) = mrYes then
                  begin
                    DataSet.Delete;
                    ShowMessage('Tarefa Exculida com sucesso');
                    DataSet.Fields.Clear;
                    ModalResult := mrCancel;
                  end;
              end;
           end;
      end;
end;

procedure TTDViewsTaskListagem.edtBuscarChange(Sender: TObject);
begin
  with QryTarefas do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM TB_TAREFAS WHERE UPPER(TAREFA) = UPPER(:TAREFA)');
    ParamByName('TAREFA').AsString := edtBuscar.Text;
    Open;
  end;
end;

procedure TTDViewsTaskListagem.FormShow(Sender: TObject);
begin
  with QryTarefas do
  begin
    Close;
    SQL.Clear;
    SQL.Add('SELECT * FROM TB_TAREFAS WHERE UPPER(TAREFA) = UPPER(:TAREFA)');
    ParamByName('TAREFA').AsString := edtBuscar.Text;
    Open;
  end;
end;

procedure TTDViewsTaskListagem.pnContentClick(Sender: TObject);
begin
  cxGrid1.Top :=  Trunc((ClientHeight/2) - (cxGrid1.Height/2));
  cxGrid1.Left:= Trunc((ClientWidth/2) - (cxGrid1.Width/2));
end;

end.
