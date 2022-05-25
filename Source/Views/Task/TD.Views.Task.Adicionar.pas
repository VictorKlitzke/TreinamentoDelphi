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
  cxTextEdit;

type
  TTDViewsTaskAdicionar = class(TForm)
    pnl1: TPanel;
    btnClose: TcxButton;
    lbl1: TLabel;
    lbledit: TLabel;
    edtTarefa: TcxTextEdit;
    BtnAddTask: TcxButton;
    edtDescricao: TcxTextEdit;
    procedure BtnAddTaskClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject;
    var Key: Word; Shift: TShiftState);
    procedure edtTarefaPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant;
      var ErrorText: TCaption;
      var Error: Boolean);
    procedure edtDescricaoPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);

  private
     procedure validarTask(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
  public
    { Public declarations }
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
  edtDescricao.Text;

    try
      TFactoryTask
        .New
        .AddTask(
          edtTarefa.Text,
          edtDescricao.Text
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

procedure TTDViewsTaskAdicionar.FormCreate(Sender: TObject);
begin
  //inherited
  //edtTarefa.Properties.OnValidate := validarTask;
end;

procedure TTDViewsTaskAdicionar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_SPACE then
  if MessageDlg('Deseja realmente sair' , mtConfirmation , mbYesNo , 1) = mrYes then Close;
end;

procedure TTDViewsTaskAdicionar.edtTarefaPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant;
  var ErrorText: TCaption;
  var Error: Boolean);
begin
  Error := DisplayValue = '';
  ErrorText := 'Titulo tarefa obrigatório';
end;

procedure TTDViewsTaskAdicionar.FormShow(Sender: TObject);
begin
  pnl1.Top :=  Trunc((ClientHeight/2) - (pnl1.Height/2));
  pnl1.Left:= Trunc((ClientWidth/2) - (pnl1.Width/2));
end;

procedure TTDViewsTaskAdicionar.validarTask(
  Sender: TObject;
  var DisplayValue: Variant;
  var ErrorText: TCaption;
  var Error: Boolean
);
begin
   edtTarefa.SetFocus;
   Error := DisplayValue = '';
   errorText := 'O campo é obrigatório';
end;

procedure TTDViewsTaskAdicionar.btnCloseClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente sair' , mtConfirmation , mbYesNo , 1) = mrYes then Close;
end;

procedure TTDViewsTaskAdicionar.edtDescricaoPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
begin
  Error := DisplayValue = '';
  ErrorText := 'Descrição da tarefa obrigatório';
end;

end.
