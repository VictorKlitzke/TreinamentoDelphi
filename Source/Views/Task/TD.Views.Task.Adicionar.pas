unit TD.Views.Task.Adicionar;

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
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  dxSkinsCore,
  dxSkinsDefaultPainters,
  cxClasses,
  dxLayoutLookAndFeels,
  dxLayoutContainer,
  dxLayoutControl,
  Vcl.ExtCtrls,
  Vcl.StdCtrls,
  dxGDIPlusClasses,
  Vcl.Menus,
  cxButtons,
  cxContainer,
  cxEdit,
  cxTextEdit,
  cxMemo,
  TD.Views.Base;

type
  TTDViewsTaskAdicionar = class(TTDViewsBase)
    pnl1: TPanel;
    btnClose: TcxButton;
    lbl1: TLabel;
    lbledit: TLabel;
    edtTarefa: TcxTextEdit;
    BtnAddTask: TcxButton;
    edtDescricao: TcxMemo;
    procedure BtnAddTaskClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure edtDescricaoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private

  public

  end;

var
  TDViewsTaskAdicionar: TTDViewsTaskAdicionar;

implementation

uses
  TD.Factories.Task;

{$R *.dfm}

procedure TTDViewsTaskAdicionar.BtnAddTaskClick(Sender: TObject);
begin
  inherited;
  edtTarefa.ValidateEdit();
  edtDescricao.ValidateEdit();

  try
    TFactoryTask
      .New
      .AddTask(
        edtTarefa.Text,
        edtDescricao.Lines.Text
      );

    MessageDlg('Tarefa cadastrada com sucesso' , mtInformation , [mbOk] , 0);
    Close;
  except
    on e: Exception do
    begin
      MessageDlg('Ops! , Falha ao fazer cadastro da tarefa.' + #13 + e.message , mtWarning , [mbOk] , 0);
      edtTarefa.SetFocus;
    end;
  end;
end;

procedure TTDViewsTaskAdicionar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    begin
      if MessageDlg('Deseja realmente sair' , mtConfirmation , mbYesNo , 1) = mrYes then
      Close;
    end;
end;

procedure TTDViewsTaskAdicionar.btnCloseClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente sair' , mtConfirmation , mbYesNo , 1) = mrYes then
    Close;
end;

procedure TTDViewsTaskAdicionar.edtDescricaoKeyDown(Sender: TObject;
  var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if Key = VK_RETURN then
    begin
      if edtDescricao.Text <> '' then
        BtnAddTask.Click;
    end;
end;

end.
