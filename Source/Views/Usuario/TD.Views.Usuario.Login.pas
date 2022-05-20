unit TD.Views.Usuario.Login;

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
  TD.Views.Usuario.Adicionar,
  Vcl.ExtCtrls,
  TD.Views.Usuario.Listagem,
  conexaoDados,
  dxGDIPlusClasses,
  Data.DB,
  cxGraphics,
  cxControls,
  bcrypt,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxContainer,
  cxEdit,
  dxSkinsCore,
  dxSkinsDefaultPainters,
  Vcl.Menus,
  cxButtons,
  cxTextEdit,
  TD.Views.Task.Listagem;

type
  TTDViewsUsuarioLogin = class(TForm)
    Label2: TLabel;
    Label3: TLabel;
    edUsuario: TcxTextEdit;
    edSenha: TcxTextEdit;
    Image1: TImage;
    btnLogin: TcxButton;
    btnCadastrar: TcxButton;
    btnClose: TcxButton;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edUsuarioPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edSenhaPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
  public
  end;

var
  TDViewsUsuarioLogin: TTDViewsUsuarioLogin;
  FCadastro: TTDViewsUsuarioAdicionar;
  FConfig: TTDViewsTaskListagem;
  FTarefa: TTDViewsTaskListagem;
  DM: TDataModule1;

implementation

uses
  TD.Factories.Autenticacao;

{$R *.dfm}

procedure TTDViewsUsuarioLogin.btnCadastrarClick(Sender: TObject);
begin
  FCadastro := TTDViewsUsuarioAdicionar.Create(self);
  FCadastro.ShowModal;
  FCadastro.Free;
end;

procedure TTDViewsUsuarioLogin.btnCloseClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente sair?', mtConfirmation, mbYesNo, 1) = mrYes then
    Close;
end;

procedure TTDViewsUsuarioLogin.btnLoginClick(Sender: TObject);
begin
  edUsuario.ValidateEdit();
  edSenha.ValidateEdit();

  try
    TFactoryAutenticacao
      .New
      .Login(edUsuario.Text, edSenha.Text);

      ModalResult := mrOk;
  except
    on e: Exception do
      MessageDlg('Falha no login!', mtWarning, [mbOK], 0);
  end;
end;

procedure TTDViewsUsuarioLogin.edSenhaKeyDown(
  Sender: TObject;
  var Key: Word;
  Shift: TShiftState
);
begin
  if Key = VK_RETURN then
  begin
    if edSenha.Text <> '' then
      btnLogin.Click;
  end;
end;

procedure TTDViewsUsuarioLogin.edSenhaPropertiesValidate(Sender: TObject;
  var DisplayValue: Variant;
  var ErrorText: TCaption;
  var Error: Boolean
);
begin
  Error := DisplayValue = '';
  ErrorText := 'A senha é obrigatória';
end;

procedure TTDViewsUsuarioLogin.edUsuarioPropertiesValidate(
  Sender: TObject;
  var DisplayValue: Variant;
  var ErrorText: TCaption;
  var Error: Boolean
);
begin
  Error := DisplayValue = '';
  ErrorText := 'O usuário é obrigatório';
end;

procedure TTDViewsUsuarioLogin.FormKeyDown(
  Sender: TObject;
  var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_ESCAPE) then
    if MessageDlg('Deseja realmente sair', mtConfirmation , mbYesNo , 0) = mrYes then Close;
end;

end.
