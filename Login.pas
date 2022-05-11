unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages,
  System.SysUtils, System.Variants, System.Classes, System.UITypes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,Cadastro, Vcl.ExtCtrls,
  Config,conexaoDados,
  dxGDIPlusClasses, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxDBEdit, Tarefa, Vcl.Menus, cxButtons;

type
  TFlogin = class(TForm)
    QryLogin: TFDQuery;
    Label2: TLabel;
    Label3: TLabel;
    edUsuario: TcxTextEdit;
    edSenha: TcxTextEdit;
    Image1: TImage;
    btnLogin: TcxButton;
    btnCadastrar: TcxButton;
    btnClose: TcxButton;
    QryLoginID: TIntegerField;
    QryLoginUSUARIO: TWideStringField;
    QryLoginSENHA: TWideStringField;
    QryLoginNOME: TWideStringField;
    procedure btnCadastrarClick(Sender: TObject);
    procedure btnLoginClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure edUsuarioPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edSenhaPropertiesValidate(Sender: TObject;
      var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);
    procedure edSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    function getUsuario: Integer;
    function getNome: string;
    { Private declarations }
  public
    property Usuario: Integer read getUsuario;
    property Nome: string read getNome;
  end;

var
  Flogin: TFlogin;
  FCadastro: TFCadastro;
  FConfig: TFConfig;
  FTarefa: TFTarefa;
  DM: TDataModule1;

implementation

{$R *.dfm}

procedure TFlogin.btnCadastrarClick(Sender: TObject);
begin
 FCadastro := TFCadastro.Create(self);
 FCadastro.ShowModal;
 FCadastro.Free;
end;

procedure TFlogin.btnCloseClick(Sender: TObject);
begin
  if MessageDlg(
    'Deseja realmente sair?',
    mtConfirmation,
    mbYesNo,
    1
  ) = mrYes then
    ModalResult := mrCancel;
end;

procedure TFlogin.btnLoginClick(Sender: TObject);
var
  LMensagem: string;
begin
  LMensagem := 'Usu�rio ou senha incorretos.';

  edUsuario.ValidateEdit();
  edSenha.ValidateEdit();

  QryLogin.Close;
  QryLogin.ParamByName('USUARIO').AsString := edUsuario.Text;
  QryLogin.Open;

  // USUARIO N�O ENCONTRADO
  if QryLogin.RecordCount = 0 then
  begin
    MessageDlg(LMensagem, mtError, [mbOK], 0);
    Exit;
  end;

  // SENHA INCORRETA
  if edSenha.Text <> QryLogin.FieldByName('SENHA').AsString then
  begin
    MessageDlg(LMensagem, mtError, [mbOK], 0);
    Exit;
  end;

  ModalResult := mrOk;
end;

procedure TFlogin.edSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    if edSenha.Text <> '' then
      btnLogin.Click;
  end;
end;

procedure TFlogin.edSenhaPropertiesValidate(
  Sender: TObject;
  var DisplayValue: Variant;
  var ErrorText: TCaption;
  var Error: Boolean
);
begin
  Error := DisplayValue = '';
  ErrorText := 'A senha � obrigat�ria';
end;

procedure TFlogin.edUsuarioPropertiesValidate(
  Sender: TObject;
  var DisplayValue: Variant;
  var ErrorText: TCaption;
  var Error: Boolean
);
begin
  Error := DisplayValue = '';
  ErrorText := 'O usu�rio � obrigat�rio';
end;

procedure TFlogin.FormCreate(Sender: TObject);
begin
  DM := TDataModule1.Create(self);
  DM.Free;
end;

procedure TFlogin.FormDestroy(Sender: TObject);
begin
  DM.Free;
end;

function TFlogin.getNome: string;
begin
  Result := QryLogin.FieldByName('NOME').AsString;
end;

function TFlogin.getUsuario: Integer;
begin
  Result := QryLogin.FieldByName('ID').AsInteger;
end;

end.
