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
  TD.Factories.Usuario;

type
  TTDViewsUsuarioEditar = class(TTDViewsBase)
    pnContent: TPanel;
    btnClose: TcxButton;
    edtUsuario: TMaskEdit;
    edtSenha: TMaskEdit;
    btnExcluir: TcxButton;
    btnsalvar: TcxButton;
    Label1: TLabel;
    procedure btnCloseClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure btnsalvarClick(Sender: TObject);
  private
     TUsuarioModel: iUsuario;
  public
    FUsuarioFactory: TFactoryUsuario;
    function Usuario(UID: string): Integer;
  end;

implementation

{$R *.dfm}

procedure TTDViewsUsuarioEditar.btnCloseClick(Sender: TObject);
begin
  if MessageDlg('Deseja realmente sair', mtConfirmation , mbYesNo , 0) = mrYes then
    Close;
end;

procedure TTDViewsUsuarioEditar.btnsalvarClick(Sender: TObject);
begin
  inherited;
  edtUsuario.ValidateEdit();
  edtSenha.ValidateEdit();

  try
    // Factory
  except

    MessageDlg('Parabéns. Usuário atualizado com sucesso', mtInformation, [mbOK], 0);
    Close;
  end;
end;

procedure TTDViewsUsuarioEditar.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    if MessageDlg('Deseja realmente sair', mtConfirmation , mbYesNo , 0) = mrYes then
      Close;
end;

function TTDViewsUsuarioEditar.Usuario(UID: string): Integer;
var
  UsuarioData: iUsuario;
begin
  UsuarioData := TUsuarioModel.Filtrar('USUARIO', UID);
//  FUsuarioFactory.AtualizarUsuario('USUARIO' , UID);
  MessageDlg(UsuarioData.Nome, mtInformation, [mbOK], 0);
end;

end.
