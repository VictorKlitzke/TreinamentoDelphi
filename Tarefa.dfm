object FTarefa: TFTarefa
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Tarefas'
  ClientHeight = 718
  ClientWidth = 1140
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnAdd: TcxButton
    Left = 0
    Top = 623
    Width = 3
    Height = 1138
    Caption = 'Add'
    Colors.DefaultText = clBlack
    Colors.HotText = clBlue
    OptionsImage.Glyph.SourceDPI = 96
    OptionsImage.Glyph.Data = {
      89504E470D0A1A0A0000000D49484452000000180000001810040000001AEE29
      300000000467414D410000B18F0BFC6105000000206348524D00007A26000080
      840000FA00000080E8000075300000EA6000003A98000017709CBA513C000000
      02624B47440000AA8D23320000000970485973000000600000006000F06B42CF
      0000000774494D4507E6050C0D310C49CCBA3D0000015E4944415448C7DD964D
      6AC2501485BFFB52B2802A94428314ACAEC14EEDC02E4CEC3841B7A23B700715
      15A1F5770F0EDEE9E0F517B46D88A1D03BBCBC9C73EEC94DCE0340BE5A950603
      69B753E1DA6EA57E5FAA54004CBE5AC5C663A8D761B944B31945CA9A4D481298
      CFA1D5222897A46E5772AE1038203927F57A0133CB4CDAED60BF87EB6B33EF8B
      12BC91C0D3134491838B0B984C4E050E10B01E1FE1F2D281193A1DF8C718DE83
      592ECFE5E3583E8EF33C73964FD6700812DCDD9543604992D7A9C26BF9E70447
      2D928F636C3442B5DA47375824BF58BCB7ECF919753AE6F6FBFC1348FA51E20F
      678E4E1014B5DB5FB1C27FCA5CA3F15B8BFEF14B3E585AADC287561601F7F7A5
      4E706C15BF2B0712563C680EA87120951438511402C73942404B21E64E119951
      243D3C04CC34B590FEE331DCDCC06A15423FDFA67CF2C542E85F5DC1740AB7B7
      AFAC958A9465D26653FCDAB25E4B692A9D9F03BC007FF7404FB02BB9A1000000
      2574455874646174653A63726561746500323032322D30352D31325431333A34
      393A31322B30303A30302B7C08AF0000002574455874646174653A6D6F646966
      7900323032322D30352D31325431333A34393A31322B30303A30305A21B01300
      00000049454E44AE426082}
    PopupAlignment = paCenter
    SpeedButtonOptions.CanBeFocused = False
    SpeedButtonOptions.Flat = True
    TabOrder = 0
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenuHighlight
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 1140
    Height = 718
    Align = alClient
    TabOrder = 1
    LevelTabs.Slants.Positions = [spLeft, spRight]
    ExplicitWidth = 1105
    object cxGrid1DBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DataSource1
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object cxGrid1DBTableView1TAREFA: TcxGridDBColumn
        DataBinding.FieldName = 'TAREFA'
        Width = 495
      end
      object cxGrid1DBTableView1DESCRICAO: TcxGridDBColumn
        DataBinding.FieldName = 'DESCRICAO'
        Width = 1201
      end
      object cxGrid1DBTableView1STATUS: TcxGridDBColumn
        DataBinding.FieldName = 'STATUS'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = cxGrid1DBTableView1
    end
  end
  object DataSource1: TDataSource
    DataSet = QryTarefas
    Left = 344
    Top = 64
  end
  object QryTarefas: TFDQuery
    Connection = DataModule1.Connection
    SQL.Strings = (
      'SELECT'
      '  TF.ID_USUARIO,'
      '  TF.TAREFA,'
      '  TF.DESCRICAO,'
      '  TF.STATUS,'
      '  TU.USUARIO'
      'FROM TB_TAREFAS TF'
      'join TB_USUARIOS TU ON TF.ID_USUARIO = TU.ID'
      'where'
      'TU.ID = :USUARIO')
    Left = 344
    Top = 120
    ParamData = <
      item
        Name = 'USUARIO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
end
