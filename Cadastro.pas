unit Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,conexaoDados,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxDBEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  Vcl.ExtCtrls, dxGDIPlusClasses, Vcl.Menus, cxButtons;

type
  TFcadastro = class(TForm)
    QryCadastro: TFDQuery;
    dtsCadastro: TDataSource;
    QryLogin: TFDQuery;
    QryLoginUSUARIO: TWideStringField;
    QryLoginSENHA: TWideStringField;
    btncadastrar: TcxButton;
    btnClose: TcxButton;
    Image1: TImage;
    BtnUsuario: TcxDBTextEdit;
    Label3: TLabel;
    BtnSenha: TcxDBTextEdit;
    QryCadastroUSUARIO: TWideStringField;
    QryCadastroSENHA: TWideStringField;
    Label2: TLabel;
    QryCadastroNOME: TWideStringField;
    Label4: TLabel;
    BtnNome: TcxDBTextEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btncadastrarClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fcadastro: TFcadastro;

implementation

{$R *.dfm}

procedure TFcadastro.btncadastrarClick(Sender: TObject);

var
  usuario : String;
  LMensagem : string;
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

procedure TFcadastro.btnCloseClick(Sender: TObject);

begin

  if MessageDlg(
       'Deseja realmente sair',
       mtConfirmation,
       mbYesNo,
       1
  ) = mrYes then
    ModalResult := mrCancel;
end;

procedure TFcadastro.FormCreate(Sender: TObject);
begin
  QryCadastro.Open;
  QryCadastro.Insert; // VAI INICIAR MODE INSERÇÃO O CADASTRO NO BANCO DE DADOS
end;

procedure TFcadastro.FormDestroy(Sender: TObject);
begin
  QryCadastro.Close;
end;

end.
