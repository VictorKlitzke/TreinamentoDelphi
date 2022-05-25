unit ConexaoDados;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Phys.IBBase, Data.DB, DASQLMonitor, UniSQLMonitor;

type
  TDataModule1 = class(TDataModule)
    Connection: TFDConnection;
    DataSource: TDataSource;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    Transaction: TFDTransaction;
    UniSQLMonitor1: TUniSQLMonitor;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDataModule1.DataModuleCreate(Sender: TObject);
begin
  Connection.Connected := true;
end;

procedure TDataModule1.DataModuleDestroy(Sender: TObject);
begin
  Connection.Connected := false;
end;

end.
