unit Config;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Vcl.StdCtrls,cxGraphics,cxControls,
  cxLookAndFeels, cxLookAndFeelPainters,cxContainer,cxEdit,dxSkinsCore,
  dxSkinsDefaultPainters,cxTextEdit,cxDBEdit,conexaoDados, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxNavigator, dxDateRanges, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGridLevel,
  cxClasses, cxGridCustomView, cxGrid, Vcl.ExtCtrls, Vcl.ComCtrls, cxMaskEdit,
  cxButtonEdit;

type
  TFConfig = class(TForm)
    QryConfig: TFDQuery;
    DtsConfig: TDataSource;
    QryConfigNOME: TWideStringField;
    DTSUsuarios: TDataSource;
    StatusBar1: TStatusBar;
    PainellUser: TPanel;
    BtnUsuario: TLabel;
    Label1: TLabel;
    Buscar: TEdit;
    edUsers: TcxGrid;
    edUsersDBTableView1: TcxGridDBTableView;
    edUsersDBTableView1NOME: TcxGridDBColumn;
    edUsersLevel1: TcxGridLevel;
    edExcluir: TcxButtonEdit;
    procedure BuscarChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxButtonEdit1PropertiesChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConfig: TFConfig;
  DM: TDataModule1;

implementation

{$R *.dfm}

procedure TFConfig.BuscarChange(Sender: TObject);

begin

with QryConfig do
    begin

          //BUSCANDO USUARIOS JÁ EXISTENTE
          Close;
          Sql.Clear;
          SQL.Add('SELECT * FROM TB_USUARIOS WHERE NOME =:NOME');
          ParamByName('NOME').AsString := Buscar.Text;
          Open;

    end;

end;

procedure TFConfig.cxButtonEdit1PropertiesChange(Sender: TObject);

var
  LMensagem : string;
begin

    with DtsConfig do
    begin
      DataSet.Delete;
    end;

      begin
        if MessageDlg('Deseja realmente excluir esse usuário',
             mtConfirmation,
             mbYesNo,
             0
          ) = mrYes then
            ModalResult := mrCancel;

          if QryConfig.RecordCount = 0 then
             begin
               MessageDlg(LMensagem, mtError, [mbOK], 0);
               Exit;
             end;
              ModalResult := mrOk;
      end;
        ShowMessage('Usuário excluido com sucesso');
end;

procedure TFConfig.FormShow(Sender: TObject);
begin

PainellUser.Top :=  Trunc((ClientHeight/2) - (PainellUser.Height/2));
PainellUser.Left:= Trunc((ClientWidth/2) - (PainellUser.Width/2));

end;

end.

