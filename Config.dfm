object FConfig: TFConfig
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Config'
  ClientHeight = 737
  ClientWidth = 650
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
  object StatusBar1: TStatusBar
    Left = 0
    Top = 718
    Width = 650
    Height = 19
    Panels = <>
  end
  object PainellUser: TPanel
    Left = 163
    Top = 114
    Width = 343
    Height = 438
    Color = 9590329
    ParentBackground = False
    TabOrder = 1
    DesignSize = (
      343
      438)
    object BtnUsuario: TLabel
      Left = 126
      Top = 48
      Width = 91
      Height = 29
      Caption = 'Usu'#225'rios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 16
      Top = 109
      Width = 91
      Height = 16
      Caption = 'Buscar Us'#250'arios'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Buscar: TEdit
      Left = 16
      Top = 131
      Width = 305
      Height = 21
      TabOrder = 0
      Text = 'Buscar'
      OnChange = BuscarChange
    end
    object edUsers: TcxGrid
      Left = 16
      Top = 158
      Width = 303
      Height = 171
      Touch.ParentTabletOptions = False
      Touch.TabletOptions = [toPressAndHold]
      Anchors = []
      TabOrder = 1
      object edUsersDBTableView1: TcxGridDBTableView
        Navigator.Buttons.CustomButtons = <>
        DataController.DataSource = DTSUsuarios
        DataController.Summary.DefaultGroupSummaryItems = <>
        DataController.Summary.FooterSummaryItems = <>
        DataController.Summary.SummaryGroups = <>
        OptionsView.GroupByBox = False
        object edUsersDBTableView1NOME: TcxGridDBColumn
          DataBinding.FieldName = 'NOME'
          IsCaptionAssigned = True
        end
      end
      object edUsersLevel1: TcxGridLevel
        GridView = edUsersDBTableView1
      end
    end
    object edExcluir: TcxButtonEdit
      Left = 112
      Top = 369
      Properties.Buttons = <
        item
          Default = True
          Kind = bkEllipsis
        end>
      Properties.OnChange = cxButtonEdit1PropertiesChange
      StyleHot.Color = clWhite
      StyleHot.TextColor = 9590329
      TabOrder = 2
      Text = 'edExcluir'
      Width = 121
    end
  end
  object QryConfig: TFDQuery
    Connection = DataModule1.Connection
    SQL.Strings = (
      'SELECT * FROM TB_USUARIOS')
    Left = 16
    Top = 144
    object QryConfigNOME: TWideStringField
      FieldName = 'NOME'
      Origin = 'NOME'
      Required = True
      Size = 50
    end
  end
  object DtsConfig: TDataSource
    DataSet = QryConfig
    Left = 16
    Top = 96
  end
  object DTSUsuarios: TDataSource
    DataSet = QryConfig
    Left = 16
    Top = 48
  end
end
