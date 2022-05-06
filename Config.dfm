object FConfig: TFConfig
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Config'
  ClientHeight = 571
  ClientWidth = 511
  Color = clCream
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object BtnUsuario: TLabel
    Left = 214
    Top = 16
    Width = 91
    Height = 29
    Caption = 'Us'#250'arios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 104
    Top = 93
    Width = 91
    Height = 16
    Caption = 'Buscar Us'#250'arios'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsItalic]
    ParentFont = False
  end
  object edExcluirClick: TButton
    Left = 296
    Top = 383
    Width = 121
    Height = 25
    Caption = 'Excluir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edGrid: TcxGrid
    Left = 104
    Top = 142
    Width = 313
    Height = 187
    TabOrder = 1
    object edGridDBTableView1: TcxGridDBTableView
      Navigator.Buttons.CustomButtons = <>
      DataController.DataSource = DTSUsuarios
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      OptionsView.GroupByBox = False
      object edGridDBTableView1NOME: TcxGridDBColumn
        DataBinding.FieldName = 'NOME'
      end
    end
    object edGridLevel1: TcxGridLevel
      GridView = edGridDBTableView1
    end
  end
  object edBuscar: TEdit
    Left = 104
    Top = 115
    Width = 313
    Height = 21
    TabOrder = 2
    Text = 'edBuscar'
    OnChange = edBuscarChange
  end
  object edEditarClick: TButton
    Left = 104
    Top = 383
    Width = 113
    Height = 25
    Caption = 'Editar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
  end
  object QryConfig: TFDQuery
    Active = True
    Connection = DataModule1.Connection
    SQL.Strings = (
      'SELECT NOME FROM TB_USUARIOS TU')
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
    Left = 16
    Top = 96
  end
  object DTSUsuarios: TDataSource
    DataSet = QryConfig
    Left = 16
    Top = 48
  end
end
