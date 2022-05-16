program LoginUsuario;

uses
  Vcl.Forms,
  Vcl.Controls,
  System.SysUtils,
  Login in 'Login.pas' {Flogin},
  ConexaoDados in 'ConexaoDados.pas' {DataModule1: TDataModule},
  Cadastro in 'Cadastro.pas' {Fcadastro},
  Tarefa in 'Tarefa.pas' {FTarefa},
  Principal in 'Principal.pas' {FPrincipal},
  Sessao in 'Sessao.pas',
  Addtask in 'Addtask.pas' {Form1};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;

  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFPrincipal, FPrincipal);
  Application.CreateForm(TFLogin, FLogin);

  Flogin.ShowModal;

  if Flogin.ModalResult = mrCancel then
  begin
    FPrincipal.FSessao.DisposeOf;
    FreeAndNil(FLogin);
    FreeAndNil(FPrincipal);
    Application.Terminate;
  end else
  begin
    FPrincipal.FSessao.Conectar(Flogin.Usuario, Flogin.Nome);
    Application.Run;
  end;
end.
