program Tarefas;

uses
  Vcl.Forms,
  Vcl.Controls,
  Login in 'Login.pas' {Flogin},
  ConexaoDados in 'ConexaoDados.pas' {DataModule1: TDataModule},
  Cadastro in 'Cadastro.pas' {Fcadastro},
  Tarefa in 'Tarefa.pas' {FTarefa},
  Principal in 'Principal.pas' {FPrincipal},
  Sessao in 'Sessao.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFPrincipal, FPrincipal);
  FPrincipal.Show;
  Application.Run;
end.
