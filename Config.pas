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
  cxClasses, cxGridCustomView, cxGrid;

type
  TFConfig = class(TForm)
    edExcluirClick: TButton;
    BtnUsuario: TLabel;
    QryConfig: TFDQuery;
    DtsConfig: TDataSource;
    QryConfigNOME: TWideStringField;
    edGridDBTableView1: TcxGridDBTableView;
    edGridLevel1: TcxGridLevel;
    edGrid: TcxGrid;
    Label1: TLabel;
    edBuscar: TEdit;
    DTSUsuarios: TDataSource;
    edGridDBTableView1NOME: TcxGridDBColumn;
    edEditarClick: TButton;
    procedure edBuscarChange(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FConfig: TFConfig;

implementation

{$R *.dfm}

procedure TFConfig.edBuscarChange(Sender: TObject);
begin

with QryConfig do
    begin
          //BUSCANDO USUARIOS JÁ EXISTENTE
          Close;
          Sql.Clear;
          SQL.Add('SELECT * FROM TB_USUARIOS WHERE NOME =:NOME');
          ParamByName('NOME').AsString := edBuscar.Text;
          Open;

    end;

end;


end.

