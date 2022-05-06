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
  Vcl.ExtCtrls, dxGDIPlusClasses;

type
  TFcadastro = class(TForm)
    Label2: TLabel;
    btnCadastrar: TButton;
    QryCadastro: TFDQuery;
    dtsCadastro: TDataSource;
    Img: TImage;
    QryCadastroNOME: TWideStringField;
    QryCadastroUSUARIO: TWideStringField;
    QryCadastroSENHA: TWideStringField;
    Label1: TLabel;
    edNome: TcxDBTextEdit;
    Label3: TLabel;
    edUsuario: TcxDBTextEdit;
    Label4: TLabel;
    edsenha: TcxDBTextEdit;
    Button1: TButton;
    QryLogin: TFDQuery;
    QryLoginUSUARIO: TWideStringField;
    QryLoginSENHA: TWideStringField;
    procedure btnFecharClick(Sender: TObject);
    procedure btnCadastrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Fcadastro: TFcadastro;

implementation

{$R *.dfm}

procedure TFcadastro.btnCadastrarClick(Sender: TObject);

var

usuario: String;

begin


  try

    QryCadastro.Post; // VAI CRIAR O USUARIO

  except

  begin

    ShowMessage('Erro ao fazer Cadastro');
    Exit; //  COMANDO REALIZADO PARA NÃO CHEGAR NO PROXIMO COMANDO

  end;

  end;

  ShowMessage('Cadastro efetuado com Sucesso!');

end;

procedure TFcadastro.btnFecharClick(Sender: TObject);
begin
  Close
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
