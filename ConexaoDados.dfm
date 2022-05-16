object DataModule1: TDataModule1
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 928
  Width = 1144
  object Connection: TFDConnection
    Params.Strings = (
      'Database=C:\Hifuzion\Projeto\LOGINUSUARIOS.FDB'
      'Password=masterkey'
      'User_Name=SYSDBA'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Transaction = Transaction
    Left = 224
    Top = 16
  end
  object DataSource: TDataSource
    Left = 224
    Top = 64
  end
  object FDPhysFBDriverLink: TFDPhysFBDriverLink
    VendorLib = ' '
    Left = 224
    Top = 200
  end
  object Transaction: TFDTransaction
    Connection = Connection
    Left = 224
    Top = 136
  end
end
