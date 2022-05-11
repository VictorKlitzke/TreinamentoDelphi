unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  System.UITypes,
  Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, cxGraphics,
  cxLookAndFeels, cxLookAndFeelPainters, Vcl.Menus, dxSkinsCore,
  dxSkinsDefaultPainters, Vcl.StdCtrls, cxButtons, dxGDIPlusClasses, Sessao;

type
  TFPrincipal = class(TForm)
    pnHeader: TPanel;
    pnMenu: TPanel;
    pnContent: TPanel;
    Image1: TImage;
    btnSair: TcxButton;
    btnTarefas: TcxButton;
    btnUsuarios: TcxButton;
    lblUsuario: TLabel;
    procedure btnSairClick(Sender: TObject);
    procedure btnTarefasClick(Sender: TObject);
    procedure btnUsuariosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
  public
        FSessao: TSessao;
  end;

var
  FPrincipal: TFPrincipal;

implementation

uses
  Cadastro, Tarefa, Config, Login;

{$R *.dfm}

procedure TFPrincipal.btnSairClick(Sender: TObject);
begin
  if MessageDlg(
    'Você tem certeza que deseja sair?',
    mtConfirmation,
    mbYesNo,
    0
  ) = mrYes then Close;
end;

procedure TFPrincipal.btnTarefasClick(Sender: TObject);
begin
  if not Assigned(FTarefa) then
    Application.CreateForm(TFTarefa, FTarefa);

  FTarefa.Parent := pnContent;
  FTarefa.Show;
end;

procedure TFPrincipal.btnUsuariosClick(Sender: TObject);
begin
  if not Assigned(FConfig) then
    Application.CreateForm(TFConfig, FConfig);

  FConfig.Parent := pnContent;
  FConfig.Show;
end;

procedure TFPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FSessao.DisposeOf;
end;

procedure TFPrincipal.FormCreate(Sender: TObject);
begin
  FSessao := TSessao.Create;
end;

procedure TFPrincipal.FormShow(Sender: TObject);
begin
  if not FSessao.Conectado then
  begin
    if not Assigned(FLogin) then
      Application.CreateForm(TFLogin, FLogin);

    Flogin.ShowModal;

    if Flogin.ModalResult = mrCancel then
      Close;

    FSessao.Conectar(Flogin.Usuario, Flogin.Nome);

    lblUsuario.Caption := FSessao.Nome;
  end;
end;

end.
