unit TD.Views.Usuario.Editar;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  cxGraphics,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  Vcl.Menus,
  dxSkinsCore,
  dxSkinsDefaultPainters,
  Vcl.StdCtrls,
  cxButtons,
  Vcl.Mask,
  TD.Models.Usuario,
  Uni,
  TD.Views.Base,
  TD.Factories.Usuario,
  cxControls,
  cxContainer,
  cxEdit,
  cxTextEdit,
  cxDBEdit, Data.DB;

type
  TTDViewsUsuarioEditar = class(TTDViewsBase)
    pnContent: TPanel;
    btnClose: TcxButton;
    btnExcluir: TcxButton;
    btnsalvar: TcxButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtUsuario: TcxDBTextEdit;
    edtSenha: TcxDBTextEdit;
    dsDados: TDataSource;
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure btnsalvarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
     FUsuarioModel: iUsuario;
  public
    FUsuarioFactory: TFactoryUsuario;
    function Usuario(UID: integer): Integer;
  end;

implementation

{$R *.dfm}

procedure TTDViewsUsuarioEditar.btnCloseClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente sair', mtConfirmation , mbYesNo , 0) = mrYes then
    Close;
end;

procedure TTDViewsUsuarioEditar.btnExcluirClick(Sender: TObject);
begin
  inherited;
  try
    FUsuarioModel.Apagar;
  finally
    MessageDlg('Dor, usuário deletado com sucesso', mtInformation, [mbOK], 0);
    Close;
  end;
end;

procedure TTDViewsUsuarioEditar.btnsalvarClick(Sender: TObject);
begin
  inherited;
  edtUsuario.ValidateEdit();
  edtSenha.ValidateEdit();

  try
    FUsuarioModel.Salvar;
  finally
    MessageDlg('Show, usuário atualizado com sucesso', mtInformation, [mbOK], 0);
    Close;
  end;
end;

procedure TTDViewsUsuarioEditar.FormCreate(Sender: TObject);
begin
  inherited;
  FUsuarioModel := TUsuario.New.DataSource(dsDados);
end;

procedure TTDViewsUsuarioEditar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    if MessageDlg('Deseja realmente sair', mtConfirmation , mbYesNo , 0) = mrYes then
      Close;
end;

function TTDViewsUsuarioEditar.Usuario(UID: integer): Integer;
begin
  FUsuarioModel.Filtrar('ID', UID).Editar;
end;

end.


