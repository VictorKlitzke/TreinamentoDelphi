unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Cadastro, Vcl.ExtCtrls,Config,conexaoDados,
  dxGDIPlusClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxDBEdit, Tarefa;

type
  TFlogin = class(TForm)
    btnLogar: TButton;
    btnCadastrar: TButton;
    Label1: TLabel;
    btnFechar: TButton;
    BtnCofig: TButton;
    Image1: TImage;
    QryLogin: TFDQuery;
    Label2: TLabel;
    Label3: TLabel;
    edUsuario: TEdit;
    edSenha: TEdit;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure BtnCofigClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnLogarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Flogin: TFlogin;
  Fcadastro: TFcadastro;
  FConfig: TFConfig;
  FTarefa: TFTarefa;
  DM: TDataModule1;

implementation

{$R *.dfm}

procedure TFlogin.btnCadastrarClick(Sender: TObject);
begin

  Fcadastro := TFcadastro.Create(self);
  Fcadastro.ShowModal;
  Fcadastro.Free;

end;

procedure TFlogin.BtnCofigClick(Sender: TObject);
begin
  FConfig := TFConfig.Create(self);
  FConfig.ShowModal;
  FConfig.Free;
end;

procedure TFlogin.btnFecharClick(Sender: TObject);
begin
  Close;
end;

procedure TFlogin.btnLogarClick(Sender: TObject);

var

usuario: String;
senha: String;
S : String;

begin

  usuario := edUsuario.Text;
  senha := edSenha.Text;
  QryLogin.SQL.Clear;
  S:= 'SELECT SENHA FROM TB_USUARIOS ' +
   ' WHERE USUARIO = :USUARIO ';
  QryLogin.SQL.Text := S;
  QryLogin.ParamByName('USUARIO').AsString := usuario;

  QryLogin.Open;

  if (senha = VarToStr(QryLogin.FieldByName('SENHA').Value)) then
  begin
    ShowMessage('Logado');
    FTarefa := TFTarefa.Create(self);
    FTarefa.ShowModal;
    FTarefa.Free;
    Exit;
  end;

  ShowMessage('Erro Ao Logar');

end;

procedure TFlogin.FormCreate(Sender: TObject);
begin
  DM := TDataModule1.Create(self);
end;

procedure TFlogin.FormDestroy(Sender: TObject);
begin
  DM.Free;
end;

end.
