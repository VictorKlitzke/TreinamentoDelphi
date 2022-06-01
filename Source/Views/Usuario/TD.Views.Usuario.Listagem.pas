﻿unit TD.Views.Usuario.Listagem;

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
  cxGraphics,
  cxControls,
  cxLookAndFeels,
  cxLookAndFeelPainters,
  cxContainer,
  cxEdit,
  dxSkinsCore,
  dxSkinsDefaultPainters,
  cxTextEdit,
  cxDBEdit,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Param,
  FireDAC.Stan.Error,
  FireDAC.DatS,
  FireDAC.Phys.Intf,
  FireDAC.DApt.Intf,
  FireDAC.Stan.Async,
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
  cxButtons,
  TD.Factories.Usuario,
  TD.Views.Usuario.Editar;

type
  TTDViewsUsuarioListagem = class(TForm)
    PainellUser: TPanel;
    BtnUsuario: TLabel;
    Label1: TLabel;
    editBuscar: TEdit;
    edUsers: TcxGrid;
    edUsuariosViews: TcxGridDBTableView;
    edUsersLevel1: TcxGridLevel;
    BtnEdit: TcxButton;
    dsUsuarios: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edUsuariosViewsCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState;
      var AHandled: Boolean);
    procedure BtnEditClick(Sender: TObject);
    procedure editBuscarChange(Sender: TObject);
  private
    FUsuarioFactory: iFactoryUsuario;
  public
   procedure CarregarDados;
  end;

var
  TDViewsUsuarioListagem: TTDViewsUsuarioListagem;
  TDViewsUsuarioEditar: TTDViewsUsuarioEditar;

implementation

uses
  ConexaoDados,
  TD.Views.Principal,
  TD.Views.Usuario.Adicionar;

{$R *.dfm}

procedure TTDViewsUsuarioListagem.BtnEditClick(Sender: TObject);
begin
  MessageDlg('Clicar duas vezes no usuário!!!!', mtConfirmation, [mbOK], 1);
end;

procedure TTDViewsUsuarioListagem.CarregarDados;
begin
  FUsuarioFactory := TFactoryUsuario
    .New
    .DataSource(dsUsuarios)
    .ListUsuario;

    with edUsuariosViews do
      begin
        ClearItems;
        DataController.CreateAllItems();
        ApplyBestFit();
      end;

end;

procedure TTDViewsUsuarioListagem.editBuscarChange(Sender: TObject);
begin
  FUsuarioFactory := TFactoryUsuario
    .New
    .DataSource(dsUsuarios)
    .FiltarUsuario(editBuscar.Text);
end;

procedure TTDViewsUsuarioListagem.edUsuariosViewsCellDblClick(
  Sender: TcxCustomGridTableView; ACellViewInfo: TcxGridTableDataCellViewInfo;
  AButton: TMouseButton; AShift: TShiftState;
  var AHandled: Boolean
  );

begin
  if not Assigned(TDViewsUsuarioEditar) then
    Application.CreateForm(TTDViewsUsuarioEditar , TDViewsUsuarioEditar);


  TDViewsUsuarioEditar.Usuario(dsUsuarios.DataSet.FieldByName('USUARIO').AsString);
  TDViewsUsuarioEditar.ShowModal;
  FreeAndNil(TDViewsUsuarioEditar);
end;

//procedure TTDViewsUsuarioListagem.BtnExcluirClick(Sender: TObject);
//begin
//  with dsUsuarios do
//  begin
//    if editBuscar.Text = '' then
//    begin
//      ShowMessage('Nenhum usuario selecionado');
//    end
//    else
//    begin
//      if DataSet.RecordCount = 0 then
//      begin
//        ShowMessage('Usuario inexistente');
//      end
//      else
//      begin
//        if MessageDlg('Deseja realmente excluir esse usuario', mtConfirmation, mbYesNo, 1) = mrYes then
//        begin
//          DataSet.Delete;
//          ShowMessage('Usuario excluido com sucesso');
//          Dataset.Fields.Clear;
//          ModalResult := mrCancel;
//        end;
//      end;
//    end;
//    DataSet.Fields.Clear;
//  end;
//end;

procedure TTDViewsUsuarioListagem.FormCreate(Sender: TObject);
begin
  CarregarDados;
end;

procedure TTDViewsUsuarioListagem.FormShow(Sender: TObject);
begin
PainellUser.Top :=  Trunc((ClientHeight/2) - (PainellUser.Height/2));
PainellUser.Left:= Trunc((ClientWidth/2) - (PainellUser.Width/2));
end;

end.

