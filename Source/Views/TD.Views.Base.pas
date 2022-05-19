unit TD.Views.Base;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit;

type
  TTDViewsBase = class(TForm)
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
  private
    procedure DefinirCamposObrigatorios;
  public
    procedure CampoObrigatorio(Sender: TObject; var DisplayValue: Variant; var ErrorText: TCaption; var Error: Boolean);

  end;

var
  TDViewsBase: TTDViewsBase;

implementation

{$R *.dfm}

procedure TTDViewsBase.CampoObrigatorio(
  Sender: TObject;
  var DisplayValue: Variant;
  var ErrorText: TCaption;
  var Error: Boolean
);
begin
  inherited;
  Error := DisplayValue = '';
  ErrorText := 'O campo é obrigatório';
end;

procedure TTDViewsBase.DefinirCamposObrigatorios;
var
  i: Integer;
  LComponent: TcxTextEdit;
begin
  for i := 0 to Pred(ComponentCount) do
  begin
    if Components[i] is TcxTextEdit then
    begin
      LComponent := TcxTextEdit(Components[i]);
      if LComponent.Tag = 1 then
      begin
        LComponent.Properties.ValidateOnEnter := True;
        LComponent.Properties.ValidationOptions := [
          evoShowErrorIcon,
          evoRaiseException
        ];

        LComponent.Properties.OnValidate := CampoObrigatorio;
      end;
    end;
  end;
end;

procedure TTDViewsBase.FormCreate(Sender: TObject);
begin
  DefinirCamposObrigatorios;
end;

procedure TTDViewsBase.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
