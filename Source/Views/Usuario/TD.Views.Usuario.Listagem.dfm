object TDViewsUsuarioListagem: TTDViewsUsuarioListagem
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Config'
  ClientHeight = 750
  ClientWidth = 1087
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
    Width = 1087
    Height = 73
    Align = alTop
    Color = 9590329
    ParentBackground = False
    TabOrder = 0
    object BtnUsuario: TLabel
      Left = 1
      Top = 1
      Width = 1085
      Height = 30
      Align = alTop
      Alignment = taCenter
      Caption = 'Usu'#225'rios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitTop = 0
    end
    object Label1: TLabel
      Left = 1
      Top = 31
      Width = 1085
      Height = 16
      Align = alTop
      Caption = 'Buscar Us'#250'arios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      ExplicitLeft = 2
      ExplicitTop = 37
    end
    object btnAtualizar: TcxButton
      AlignWithMargins = True
      Left = 1048
      Top = 50
      Width = 35
      Height = 19
      Align = alRight
      Colors.Default = 9590329
      Colors.DefaultText = clWhite
      Colors.HotText = clWhite
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
        610000000473424954080808087C0864880000000970485973000000B0000000
        B001146AAB690000001974455874536F667477617265007777772E696E6B7363
        6170652E6F72679BEE3C1A0000011249444154388D95D3BD2E845110C6F1DFBC
        88A834B2895EA310240A8D462B1A9DCE2D2829347A7103B800954425F48A4D28
        45A87C44A315E263140E5E2BD6EE939C9CE4649EFF4CE6CC4466AA2B22022398
        C2282ED1C45966BE6A55667E1D4CE30C892B1C16C01B6E30578FCF4C75F33A9E
        B189A116F02056F1842DF4FC0060110F986DCDD0029AC01D566A6F86718FE576
        E69A61BE5432F60958C329AA4E00C5B48BEDCC54956E1F65E6DBAF0EFFAD83E2
        03B758EC347BA960122F18A8BAC85A571F5E91958F21996A1FFFAD8898C30C4E
        32F3B1B7001622A2FAAF0F11D1C03ECECB8DEEBFB1E96352AFB1D7D52095D825
        5C6003E31D8D725BE03FCBB483FE7680DE7A9332F33822467DAF73A354F5A7DE
        011FEF682B83A677670000000049454E44AE426082}
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Flat = True
      TabOrder = 0
      OnClick = btnAtualizarClick
      ExplicitTop = 53
      ExplicitHeight = 16
    end
    object editBuscar: TEdit
      AlignWithMargins = True
      Left = 4
      Top = 50
      Width = 1042
      Height = 19
      Align = alLeft
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 1
      OnChange = editBuscarChange
      ExplicitLeft = 1
      ExplicitTop = 47
      ExplicitWidth = 1048
      ExplicitHeight = 21
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 1087
    Height = 677
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 1
    ExplicitTop = 0
    ExplicitHeight = 750
    object edUsers: TcxGrid
      Left = 1
      Top = 1
      Width = 1085
      Height = 675
      Touch.ParentTabletOptions = False
      Touch.TabletOptions = [toPressAndHold]
      Align = alClient
      BorderStyle = cxcbsNone
      TabOrder = 0
      ExplicitLeft = 0
      ExplicitTop = 6
      ExplicitWidth = 1086
      ExplicitHeight = 633
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
  end
  object dsUsuarios: TDataSource
    Left = 528
    Top = 360
  end
end
