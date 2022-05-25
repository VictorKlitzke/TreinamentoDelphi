object TDViewsUsuarioListagem: TTDViewsUsuarioListagem
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Config'
  ClientHeight = 740
  ClientWidth = 1057
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PainellUser: TPanel
    Left = 0
    Top = 0
    Width = 1057
    Height = 740
    Align = alClient
    Color = 9590329
    ParentBackground = False
    TabOrder = 0
    object BtnUsuario: TLabel
      Left = 1
      Top = 1
      Width = 1055
      Height = 29
      Align = alTop
      Alignment = taCenter
      Caption = 'Usu'#225'rios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 91
    end
    object Label1: TLabel
      Left = 1
      Top = 30
      Width = 1055
      Height = 16
      Align = alTop
      Caption = 'Buscar Us'#250'arios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitWidth = 91
    end
    object editBuscar: TEdit
      Left = 1
      Top = 46
      Width = 1055
      Height = 21
      Align = alTop
      TabOrder = 0
      OnChange = editBuscarChange
    end
    object edUsers: TcxGrid
      Left = 1
      Top = 67
      Width = 1055
      Height = 639
      Touch.ParentTabletOptions = False
      Touch.TabletOptions = [toPressAndHold]
      Align = alClient
      BorderStyle = cxcbsNone
      TabOrder = 1
      object edUsersDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        FindPanel.DisplayMode = fpdmManual
        DataController.DataSource = DtsUsuarios
        DataController.DetailKeyFieldNames = 'NOME'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
        object edUsersDBTableView1ID: TcxGridDBColumn
          Caption = '#'
          DataBinding.FieldName = 'ID'
        end
        object edUsersDBTableView1USUARIO: TcxGridDBColumn
          Caption = 'Usu'#225'rio'
          DataBinding.FieldName = 'USUARIO'
        end
        object edUsersDBTableView1NOME: TcxGridDBColumn
          Caption = 'Nome'
          DataBinding.FieldName = 'NOME'
        end
      end
      object edUsersLevel1: TcxGridLevel
        GridView = edUsersDBTableView1
      end
    end
    object BtnExcluir: TcxButton
      Left = 1
      Top = 706
      Width = 1055
      Height = 33
      Align = alBottom
      Caption = 'Excluir'
      Colors.DefaultText = clWhite
      Colors.HotText = clWhite
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000180000001810040000001AEE29
        300000000467414D410000B18F0BFC6105000000206348524D00007A26000080
        840000FA00000080E8000075300000EA6000003A98000017709CBA513C000000
        02624B47440000AA8D23320000000970485973000000600000006000F06B42CF
        0000000774494D4507E6050C0C23356FFF28D1000002CC4944415448C7A5554D
        28B451147EEECB18FFBF29A6081B0B94A42C154916561A49518A0D0B4953D859
        12618105D95AF8895062E4A7A45958D8314D8408D1300B66FCDCE75BDC6F7ABF
        313366C6F76CEEDB3DCF39CF3DE7BDF71C2008286B6A181003038800D12A5874
        34445292AF293151ADEBEBC0ED2D6030006D6D406C2C9996E6CB7D7B13C2ED0E
        AA425657F3BFD0D7F76306BAD2EC2C84C3117E018C46607030244DCFA0BA3A92
        FA522627479601AC56321289D05002743820262680EE6E607E1E3839097DFC8C
        0C088B05585A02F6F6C2285341014952B6B787551E9696AAF23436FEC4D3F44F
        A753ADDFAF6030FCE5D1EB1752E0E50590326201842920849480CB0511AE406A
        AA72FCFC0C8F0F803C3F27E7E77FE6D4D5515AADA4C7A33F34BB9DECEF27E3E2
        42081C1F939B9B816D9A464E4FAB805757942323646727D9DF4FB9BBABF64F4F
        C98282E002726787B4D902DB86875590B1314AA3D1DF5E5B4B3E3D91763B654A
        4A900C1617C9B3337FE7E262F2EB8B9C9B53BC8404CAE464DD2F3B5BAD95958A
        37341424839919F2E1C15F787C9CF478283333492128B7B7298F8E54ABE8ED25
        5D2ECA9212156369897C7C24A3A28294E1FDDD5FC066230F0E749ED94C7E7C90
        1717AA6CCBCB940683E2B6B5A9BDA222C0E71D0010CFCF80C140E99D055EA4A4
        007A66425B58502D252F0F70B9808E0EA17D7C28EBFDBD3A85BAEEBE02415FF3
        ED2D9093A367D4DB0BB4B4004747407C3CB8BEAEFF93DCDC7F85C214D8DF07CA
        CBC9FC7C5208A0AC0C5C5E062B2BC1E666089309223353A99BCDC0F5B577AE7C
        1B384E27040061B1903737BAC16402340D9C9C84A8AF075A5B014D5365595820
        D7D68470BBC9A626A0AA0AB4588416A0F1535654841E8F2B2B645696EF25888A
        22BBBA48B79B3C3CA48C89C16F40F6F490EFEFE4EB2BB9BA4A393A4ACECD9197
        97AAD56F6D91E9E9BF0AAE8B1416925353940E87EA477777E4C606D9D0A0FE8F
        2FFE0024245550D1B7C5CB0000002574455874646174653A6372656174650032
        3032322D30352D31325431323A33353A35332B30303A3030E7D0216900000025
        74455874646174653A6D6F6469667900323032322D30352D31325431323A3335
        3A35332B30303A3030968D99D50000000049454E44AE426082}
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Flat = True
      TabOrder = 2
      OnClick = BtnExcluirClick
    end
  end
  object Qryusuarios: TFDQuery
    Connection = DataModule1.Connection
    Transaction = DataModule1.Transaction
    SQL.Strings = (
      'SELECT * FROM TB_USUARIOS TU')
    Left = 312
    Top = 72
    object QryusuariosUSUARIO: TWideStringField
      FieldName = 'USUARIO'
      Origin = 'USUARIO'
      Required = True
      Size = 100
    end
    object QryusuariosID: TIntegerField
      FieldName = 'ID'
      Origin = 'ID'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object QryusuariosNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
    object QryusuariosSENHA: TWideStringField
      FieldName = 'SENHA'
      Origin = 'SENHA'
      Required = True
      Size = 139
    end
  end
  object DtsUsuarios: TDataSource
    DataSet = Qryusuarios
    Left = 251
    Top = 56
  end
end
