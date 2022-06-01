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
  OnCreate = FormCreate
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
      object edUsuariosViews: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        FindPanel.DisplayMode = fpdmManual
        OnCellDblClick = edUsuariosViewsCellDblClick
        DataController.DataSource = dsUsuarios
        DataController.DetailKeyFieldNames = 'NOME'
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsSelection.CellSelect = False
        OptionsView.ColumnAutoWidth = True
        OptionsView.GroupByBox = False
      end
      object edUsersLevel1: TcxGridLevel
        GridView = edUsuariosViews
      end
    end
    object BtnEdit: TcxButton
      Left = 1
      Top = 706
      Width = 1055
      Height = 33
      Align = alBottom
      Colors.DefaultText = clWhite
      Colors.HotText = clWhite
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
        F80000000473424954080808087C0864880000000970485973000000B1000000
        B101C62D498D0000001974455874536F667477617265007777772E696E6B7363
        6170652E6F72679BEE3C1A00000222494441544889B5D44F4854411CC0F1EFCC
        DBA7ACAB99857F92109684588988DD3204EBB81E3A74A82E415D82ECD64108C2
        8B5087C0A06327A9A0E8625041872C22E91096974021FA639B857F5AFFACEBEE
        EABEF766A683254569BAEFF53BCE309FEF61861104341FBB6E1F9052DC056C10
        A7A3BD2707014410F8D8853BADC2300054FF582A60F491E8D553CF7D07269C4C
        424D64FBDCEB2F76084DDDEA86A1A01716BB2C3FB819EB6E95267FA958176B97
        2D0DD3FAF5170743250002DBCCE7932507CC58772B520E94B9DFF6582A3B50AC
        6DD96FC5EA67D4F0B8230C11339703CFD325054CAA278EE03150837653653323
        3B6D776E78A931B1CF8AD5A7D5D3B7B6595CB64D45F9994D074CAA270EEA09B0
        0DEDA6C8CE84817A7B79322CF3E9A1F9BAF6B86AACD572F4736773DFB99B9BBA
        E4B570204D2E93437BD1D986631F661B8F5FDE5D19BE059B78A6EBE3F359B4DA
        052C204C8738F460E8E7B90D054AC53714F083FF33E0175F371004BE662028FC
        AF8120F13F0241E3BF05FE070E20018AA96B3163D4B315DCFB1414BE1A300EE7
        85A01AE58D934D5704850384008A6ED55E5785093BEFB75B104130B5F2B7A866
        3F3880CC8DDE680071506B1B4F564694D8926731E3A0BC662003244BC501E495
        FEE9A3C012405136B1249A2268AFC918B1007488C3F75F958A03585376DBBD77
        5F9D89643C520584B0EC9750F648976F3D1B6AEB7BE307070809C1F0E04821D1
        DB9FEEBA78A2E661A4A573D22FFAEB7C074AED9157341FD4CB0000000049454E
        44AE426082}
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Flat = True
      TabOrder = 2
      OnClick = BtnEditClick
    end
  end
  object dsUsuarios: TDataSource
    Left = 923
    Top = 576
  end
end
