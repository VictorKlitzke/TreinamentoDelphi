unit TD.Views.Usuario.Listagem;

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
  Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls,cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxContainer,
  cxEdit,
  dxSkinsCore,
  dxSkinsDefaultPainters,
  cxTextEdit,
  cxDBEdit,
  conexaoDados,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt,
  Data.DB,
  FireDAC.Comp.DataSet,
  FireDAC.Comp.Client,
  cxStyles,
  cxCustomData,
  cxFilter,
  cxData,
  cxDataStorage,
  cxNavigator,
  dxDateRanges,
  cxDBData,
  cxGridCustomTableView,
  cxGridTableView,
  cxGridDBTableView,
  cxGridLevel,
  cxClasses,
  cxGridCustomView,
  cxGrid,
  Vcl.ExtCtrls,
  Vcl.ComCtrls,
  cxMaskEdit,
  cxButtonEdit,
  Vcl.Menus,
  cxButtons;

type
  TTDViewsUsuarioListagem = class(TForm)
    PainellUser: TPanel;
    BtnUsuario: TLabel;
    Label1: TLabel;
    editBuscar: TEdit;
    edUsers: TcxGrid;
    edUsersDBTableView1: TcxGridDBTableView;
    edUsersLevel1: TcxGridLevel;
    BtnExcluir: TcxButton;
    Qryusuarios: TFDQuery;
    DtsUsuarios: TDataSource;
    QryusuariosUSUARIO: TWideStringField;
    edUsersDBTableView1USUARIO: TcxGridDBColumn;
    procedure editBuscarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TDViewsUsuarioListagem: TTDViewsUsuarioListagem;
  DM: TDataModule1;

implementation

{$R *.dfm}

procedure TTDViewsUsuarioListagem.editBuscarChange(Sender: TObject);

begin

with Qryusuarios do
  begin
    //BUSCANDO USUARIOS JÁ EXISTENTE
    Close;
    Sql.Clear;
    SQL.Add('SELECT * FROM TB_USUARIOS WHERE UPPER(USUARIO) = UPPER(:USUARIO)');
    ParamByName('USUARIO').AsString := editBuscar.Text;
    Open;
  end;
end;

procedure TTDViewsUsuarioListagem.BtnExcluirClick(Sender: TObject);
begin
  with DtsUsuarios do
  begin
    if editBuscar.Text = '' then
    begin
      ShowMessage('Nenhum usuário selecionado');
    end
    else
    begin
      if DataSet.RecordCount = 0 then
      begin
        ShowMessage('Usuário inexistente');
      end
      else
      begin
        if MessageDlg('Deseja realmente excluir esse usuário', mtConfirmation, mbYesNo, 1) = mrYes then
        begin
          DataSet.Delete;
          ShowMessage('Usuário excluido com sucesso');
          Dataset.Fields.Clear;
          ModalResult := mrCancel;
        end;
      end;
    end;
    DataSet.Fields.Clear;
  end;
end;

procedure TTDViewsUsuarioListagem.FormShow(Sender: TObject);
begin

PainellUser.Top :=  Trunc((ClientHeight/2) - (PainellUser.Height/2));
PainellUser.Left:= Trunc((ClientWidth/2) - (PainellUser.Width/2));

end;

end.

