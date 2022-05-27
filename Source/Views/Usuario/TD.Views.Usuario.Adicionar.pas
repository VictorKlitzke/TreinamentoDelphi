unit TD.Views.Usuario.Adicionar;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.UITypes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  conexaoDados,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxContainer,
  cxEdit,
  dxSkinsCore,
  dxSkinsDefaultPainters,
  cxDBEdit,
  cxTextEdit,
  cxMaskEdit,
  cxSpinEdit,
  Vcl.ExtCtrls,
  dxGDIPlusClasses,
  Vcl.Menus,
  cxButtons,
  bcrypt,
  TD.Views.Base,
  dxLayoutContainer,
  dxLayoutcxEditAdapters,
  dxLayoutControlAdapters,
  cxClasses,
  dxLayoutControl,
  dxLayoutLookAndFeels;

type
  TTDViewsUsuarioAdicionar = class(TTDViewsBase)
    btncadastrar: TcxButton;
    btnClose: TcxButton;
    Image1: TImage;
    edNome: TcxTextEdit;
    edLogin: TcxTextEdit;
    edSenha: TcxTextEdit;
    dxLayoutControl1Group_Root: TdxLayoutGroup;
    dxLayoutControl1: TdxLayoutControl;
    dxLayoutGroup1: TdxLayoutGroup;
    dxLayoutItem1: TdxLayoutItem;
    dxLayoutItem2: TdxLayoutItem;
    dxLayoutItem3: TdxLayoutItem;
    dxLayoutItem4: TdxLayoutItem;
    dxLayoutItem5: TdxLayoutItem;
    dxLayoutGroup2: TdxLayoutGroup;
    dxLayoutItem6: TdxLayoutItem;
    dxLayoutLookAndFeelList1: TdxLayoutLookAndFeelList;
    lfCarVitLayout: TdxLayoutWebLookAndFeel;
    procedure btnCloseClick(Sender: TObject);
    procedure btncadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure validarLogin(Sender: TObject;
    var DisplayValue: Variant;
    var ErrorText: TCaption;
    var Error: Boolean);
  public
    { Public declarations }
  end;

var
  TDViewsUsuarioAdicionar: TTDViewsUsuarioAdicionar;

implementation

uses
  TD.Factories.Usuario;

{$R *.dfm}

procedure TTDViewsUsuarioAdicionar.btncadastrarClick(Sender: TObject);
begin
  inherited;
  edNome.ValidateEdit();
  edLogin.ValidateEdit();
  edSenha.ValidateEdit();

  try
    TFactoryUsuario
      .New
      .Adicionar(
        edNome.Text,
        edLogin.Text,
        edSenha.Text
      );

    MessageDlg('Parabéns. Você é o novo integrante do sistema de tarefas do CarVit', mtInformation, [mbOK], 0);
    Close;
  except
    on e: Exception do
    begin
      MessageDlg('Ops! Falha ao salvar o usuário.' + #13 + e.Message, mtWarning, [mbOK], 0);
      edNome.SetFocus;
    end;
  end;
end;

procedure TTDViewsUsuarioAdicionar.btnCloseClick(Sender: TObject);
begin
  if MessageDlg(
    'Deseja realmente sair',
    mtConfirmation,
    mbYesNo,
    1
  ) = mrYes then ModalResult := mrCancel;
end;

procedure TTDViewsUsuarioAdicionar.FormCreate(Sender: TObject);
begin
  inherited;
  edLogin.Properties.OnValidate := validarLogin;
end;

procedure TTDViewsUsuarioAdicionar.validarLogin(
  Sender: TObject;
  var DisplayValue: Variant;
  var ErrorText: TCaption;
  var Error: Boolean
);
var
  LTemUsuario: Boolean;
begin
  inherited;

  LTemUsuario := TFactoryUsuario.New.Existe(edLogin.Text);

  if LTemUsuario then
  begin
    Error := True;
    ErrorText := 'Já existe um usuário com esse login. Tenta outro';
    Exit;
  end;

  Error := DisplayValue = '';
  ErrorText := 'O campo é obrigatório';
end;

end.
