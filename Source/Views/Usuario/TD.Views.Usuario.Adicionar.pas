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
  FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  cxGraphics, cxControls,
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
  bcrypt;

type
  TTDViewsUsuarioAdicionar = class(TForm)
    QryCadastro: TFDQuery;
    dtsCadastro: TDataSource;
    QryLogin: TFDQuery;
    btncadastrar: TcxButton;
    btnClose: TcxButton;
    Image1: TImage;
    edUsuario: TcxDBTextEdit;
    Label3: TLabel;
    edSenha: TcxDBTextEdit;
    Label2: TLabel;
    Label4: TLabel;
    edNome: TcxDBTextEdit;
    QryLoginUSUARIO: TWideStringField;
    QryLoginSENHA: TWideStringField;
    QryCadastroNOME: TWideStringField;
    QryCadastroUSUARIO: TWideStringField;
    QryCadastroSENHA: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btncadastrarClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure QryCadastroBeforePost(DataSet: TDataSet);
    procedure edSenhaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TDViewsUsuarioAdicionar: TTDViewsUsuarioAdicionar;

implementation

{$R *.dfm}

procedure TTDViewsUsuarioAdicionar.btncadastrarClick(Sender: TObject);
begin
  try
    QryCadastro.Post; // CRIAR USUARIO
  except
  begin
    ShowMessage('Erro ao fazer Cadastro!');
    Exit;
  end;
  end;
  ShowMessage('Cadastro realizado com sucesso');

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

procedure TTDViewsUsuarioAdicionar.edSenhaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_RETURN then
    begin
      if edSenha.Text <> '' then
          BtnCadastrar.Click;
    end;
end;

procedure TTDViewsUsuarioAdicionar.FormCreate(Sender: TObject);
begin
  QryCadastro.Open;
  QryCadastro.Insert; // VAI INICIAR MODE INSERÇÃO O CADASTRO NO BANCO DE DADOS
  KeyPreview := true;
end;

procedure TTDViewsUsuarioAdicionar.FormDestroy(Sender: TObject);
begin
  QryCadastro.Close;
end;

procedure TTDViewsUsuarioAdicionar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
      if MessageDlg('Deseja realmente sair' , mtConfirmation , mbYesNo , 0) = mrYes then
          Close;
end;

procedure TTDViewsUsuarioAdicionar.FormShow(Sender: TObject);
begin
edNome.SetFocus;
end;

procedure TTDViewsUsuarioAdicionar.QryCadastroBeforePost(DataSet: TDataSet);
begin
  DataSet.FieldByName('SENHA').Value := TBCrypt.GenerateHash(DataSet.FieldByName('SENHA').AsString);
  DataSet.Fields.Clear;
  ModalResult := mrCancel;
end;

end.
