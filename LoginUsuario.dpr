program LoginUsuario;

uses
  Vcl.Forms,
  Login in 'Login.pas' {Flogin},
  ConexaoDados in 'ConexaoDados.pas' {DataModule1: TDataModule},
  Cadastro in 'Cadastro.pas' {Fcadastro},
  Tarefa in 'Tarefa.pas' {FTarefa};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFlogin, Flogin);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TFcadastro, Fcadastro);
  Application.CreateForm(TFTarefa, FTarefa);
  Application.Run;
end.
