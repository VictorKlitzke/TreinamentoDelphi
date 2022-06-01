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
  TD.Views.Usuario.Listagem in 'Source\Views\Usuario\TD.Views.Usuario.Listagem.pas' {TDViewsUsuarioListagem},
  TD.Services.Query in 'Source\Services\TD.Services.Query.pas',
  TD.Views.Base in 'Source\Views\TD.Views.Base.pas' {TDViewsBase},
  TD.Factories.Usuario in 'Source\Factories\TD.Factories.Usuario.pas',
  TD.Models.Usuario in 'Source\Models\TD.Models.Usuario.pas',
  TD.Factories.Autenticacao in 'Source\Factories\TD.Factories.Autenticacao.pas',
  TD.Models.Tarefa in 'Source\Models\TD.Models.Tarefa.pas',
  TD.Controllers.Task in 'Source\Controllers\TD.Controllers.Task.pas',
  TD.Factories.Task in 'Source\Factories\TD.Factories.Task.pas',
  TD.Views.Usuario.Editar in 'Source\Views\Usuario\TD.Views.Usuario.Editar.pas' {TDViewsUsuarioEditar};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TTDViewsPrincipal, TDViewsPrincipal);
  Application.CreateForm(TTDViewsUsuarioLogin, TDViewsUsuarioLogin);
  Application.CreateForm(TTDViewsBase, TDViewsBase);
  Application.CreateForm(TTDViewsUsuarioEditar, TDViewsUsuarioEditar);
  TDViewsUsuarioLogin.ShowModal;

  if TDViewsUsuarioLogin.ModalResult = mrCancel then
  begin
//    TDViewsPrincipal.FSessao.DisposeOf;
    FreeAndNil(TDViewsUsuarioLogin);
    FreeAndNil(TDViewsPrincipal);
    Application.Terminate;
  end else
  begin
//    TDViewsPrincipal.FSessao.Conectar(TDViewsUsuarioLogin.Usuario, TDViewsUsuarioLogin.Nome);
    Application.Run;
  end;
end.
