object TDViewsTaskListagem: TTDViewsTaskListagem
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object cxGrid1: TcxGrid
    Left = 0
    Top = 0
    Width = 1140
    Height = 664
    Align = alClient
    TabOrder = 0
    LevelTabs.Slants.Positions = [spLeft, spRight]
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
  object Panel1: TPanel
    Left = 0
    Top = 664
    Width = 1140
    Height = 54
    Align = alBottom
    Caption = 'Panel1'
    TabOrder = 1
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
