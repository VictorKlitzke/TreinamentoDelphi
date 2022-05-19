program TreinamentoDelphi;

uses
  Vcl.Forms,
  Vcl.Controls,
  System.SysUtils,
  TD.Views.Usuario.Login in 'Source\Views\Usuario\TD.Views.Usuario.Login.pas' {TDViewsUsuarioLogin},
  ConexaoDados in 'ConexaoDados.pas' {DataModule1: TDataModule},
  TD.Views.Usuario.Adicionar in 'Source\Views\Usuario\TD.Views.Usuario.Adicionar.pas' {TDViewsUsuarioAdicionar},
  TD.Views.Task.Listagem in 'Source\Views\Task\TD.Views.Task.Listagem.pas' {TDViewsTaskListagem},
  TD.Views.Principal in 'Source\Views\TD.Views.Principal.pas' {TDViewsPrincipal},
  TD.Controllers.Sessao in 'Source\Controllers\TD.Controllers.Sessao.pas',
  TD.Views.Task.Adicionar in 'Source\Views\Task\TD.Views.Task.Adicionar.pas' {TDViewsTaskAdicionar},
  TD.Services.Conexao in 'Source\Services\TD.Services.Conexao.pas',
  TD.Views.Usuario.Listagem in 'Source\Views\Usuario\TD.Views.Usuario.Listagem.pas' {TDViewsUsuarioListagem};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TTDViewsPrincipal, TDViewsPrincipal);
  Application.CreateForm(TTDViewsUsuarioLogin, TDViewsUsuarioLogin);
  TDViewsUsuarioLogin.ShowModal;

  if TDViewsUsuarioLogin.ModalResult = mrCancel then
  begin
    TDViewsPrincipal.FSessao.DisposeOf;
    FreeAndNil(TDViewsUsuarioLogin);
    FreeAndNil(TDViewsPrincipal);
    Application.Terminate;
  end else
  begin
    TDViewsPrincipal.FSessao.Conectar(TDViewsUsuarioLogin.Usuario, TDViewsUsuarioLogin.Nome);
    Application.Run;
  end;
end.
