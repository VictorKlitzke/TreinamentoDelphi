object TDViewsUsuarioEditar: TTDViewsUsuarioEditar
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'TDViewsUsuarioEditar'
  ClientHeight = 182
  ClientWidth = 311
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object pnContent: TPanel
    Left = 0
    Top = 0
    Width = 311
    Height = 182
    Align = alClient
    Color = 9590329
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 309
      Height = 21
      Align = alTop
      Alignment = taCenter
      Caption = 'Editar Usu'#225'rio'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      ExplicitWidth = 108
    end
    object Label2: TLabel
      Left = 24
      Top = 119
      Width = 35
      Height = 34
      Caption = 'Senha'#13#10
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 36
      Width = 45
      Height = 17
      Caption = 'Usuario'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object btnClose: TcxButton
      Left = 275
      Top = 2
      Width = 35
      Height = 25
      Colors.Default = 9590329
      Colors.DefaultText = clWhite
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D4948445200000010000000101004000000E56AEB
        A90000000467414D410000B18F0BFC6105000000206348524D00007A26000080
        840000FA00000080E8000075300000EA6000003A98000017709CBA513C000000
        02624B47440000AA8D23320000000970485973000000600000006000F06B42CF
        0000000774494D4507E605061332157F8F2F200000008C4944415438CB9D9331
        0E80200C45C1FB2F043524782516BD8FCFA1C66802A5C8D490BE37F4B70E4A81
        10C07B677CE0BD30A538290052B248044E499810EE8F79968F6D8369D2E16501
        E0CCF9E9B5489AF0B7A12EE9C29AC40CB725EB6A86EB127DB88AF115E9C08E54
        0676D79D889BD336EF8936EDAEC4125553329273550231FE3FA6181D1CC7FF73
        DEF70B9CDE7E8F4BCB869F0000002574455874646174653A6372656174650032
        3032322D30352D30365431393A35303A32312B30303A3030C048003900000025
        74455874646174653A6D6F6469667900323032322D30352D30365431393A3530
        3A32312B30303A3030B115B8850000000049454E44AE426082}
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Flat = True
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object btnExcluir: TcxButton
      Left = 240
      Top = 129
      Width = 49
      Height = 39
      Colors.Default = 9590329
      Colors.DefaultText = clWhite
      Colors.HotText = clWhite
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
        F80000000473424954080808087C086488000000097048597300000085000000
        8501E2ECFFC10000001974455874536F667477617265007777772E696E6B7363
        6170652E6F72679BEE3C1A000002C1494441544889AD954B6854491486BF53F7
        6EC64EB45BDCC5904C441CF7DA9A45167644888A8E1B37BA5111F195E8427C80
        62107C20080E83A8CCC02C6696C38C9A80A2698333BE3AB816055B1BA3711363
        6C1304ABEAB8486C3A49DFDB1AF3AF8A53A7BEFF9CAABAB784188DAE5A5AEFAC
        AC17610D2A8D88D603A0F212E1B94277E0B832ABF7617F14432A8233CD754EEC
        3141B602615C118017E16FE3C3033F64EF15AA1A8CAC58BE4E8DFF13A8AD029E
        ACA2A86E4A64FBAE9507CD848C95E9BD6AFC3FD38003D4AAC8BFC54C7A4F79B0
        D4C14866499B8AB90604D38097CB8B371B12B71F5C2D198C669AEBBCB8C74CAF
        F24A7A2FA1FB2971E3D18019B3749D33080798EDAD390E20A3AB96D67B27CFA9
        B03526DD8C69C9E07EBF80BE1B9A3027C914C1B65DF8FFB2F8DCFD4A26D668D0
        183A2F3F4BC4BE9B960C66651BB27011F65047C9449229C2D3E7918626508D32
        089DD8F54654DAA2FA74BF5D405FE4918626C2B3BF2273E721735284A7C6E0DA
        5FC0FD71296A3982AC960FADE9A7C0C2C8A4B26AB5901F8B8D8FCBBB8AD01319
        694D17156AE2B264CEB849631300DA5FC01E6C47DF0EC62D43E08351D0D8ACB8
        E555A4E00D30108B49A608CF8C55AF853C5AC823F31B084F9E4392A96A1EAF0C
        C8B348F8A403B547F6630F764C39F818E58D4277D46CB07D77A9727B600FFA76
        101D1EC21EEE2875126CD911DDBDD2151C6D983FA0867626FDF800B09FC05ADC
        D913136FCBC78FE8FFBD483285BF93455F577C0EAC21D82500C5CCB2CB22BA3D
        AED76F950A176B6FE5761A001384C781E20CF287C56A278C6F4BE2E6DDD7A01B
        013703702FB0B9A6B7EF4DC900A0A6A7EFBA2AFB00FF3D7045DA133DB9AE2F81
        A94F666B7AADC25FC0EC6F840F8BB029712B37E1564EB939899E5C97776E01C8
        2F80FD0AB055F4B2846EF1643854F9DE4733CD75CED87582AC45F951A01E40E1
        259057D1EEC087576765EFBF8A627C068C321AD6892E28C60000000049454E44
        AE426082}
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Flat = True
      TabOrder = 1
      OnClick = btnExcluirClick
    end
    object btnsalvar: TcxButton
      Left = 240
      Top = 46
      Width = 49
      Height = 39
      Colors.Default = 9590329
      Colors.DefaultText = clWhite
      Colors.HotText = clWhite
      OptionsImage.Glyph.SourceDPI = 96
      OptionsImage.Glyph.Data = {
        89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
        F80000000473424954080808087C0864880000000970485973000000B1000000
        B101C62D498D0000001974455874536F667477617265007777772E696E6B7363
        6170652E6F72679BEE3C1A000002DA494441544889AD964B48545118C77FDF39
        77C699292572A864469AA085646594AB1E44D1C69A9A42B0D72E7A53D0A6458B
        52838CF6AD5A47D148F4B4C7A2080B0A0C9A342B17652FCA861EA496A573EF69
        A1A357BBA3A2FD57F77EDF39BFFFF79D7BEF395718458996F3C5B6D109817546
        8801C503A9F708ED601A6CDBBA72B3ACF2432E867805E3A964442C8E19C30EC0
        1AAD08C011E1A2ADF4E11BF32ADF8E69B0AE35B9411CCE02F9638047AA0B31DB
        AFCFDF7CCD1D54C3E02DF507C5E1D204E000F918B91C6F4E1E7007073B58DF5C
        5F61C45C03F404E06E3946B1A9A1B4EAEAA0413C958CA079C1C42AF752679FD6
        25B7E7557E520046533B5978580598AD0BB2B7057EC7AE019044CBF9621BDDCE
        249666860A521B5B4175CB5D5E4B37534301800C363195C1DA385978CDEC15D4
        B536F220FD8E8FE96F74FFFA0D6089250925622A260B3FF9BC913B1DAFFB8386
        211363D62A0C73FF1B3CAB0193CE9F3D8B14503421782C07DC65D291FE1E51FD
        97432A0FCCA4D43F7D54786DAC7FCD73C2B352CA28844FEED8BBBE4E0E44CB59
        E02FCC093FD1DAC8DDB1E080569251C02B77306DF750FDE63EFBA34B28CB0B0F
        83D70C543E1E3880CFD2DF1598869189B4D343F5DBFBEC8D2CA6CC1F1E7AA0E3
        5916972CAD1AA5E2E9C5A856763B1EDBF20C15A236B61C2D8AE3CFEE8DBB7200
        1161DAB45079FF5ED45C7F0631BBBC0616AA00A6AB9747E99C678AA742A1BCB6
        D49A7D250A40F933354097D7C0AFCE6F3EFB7BB1F4F83F76A595F105F5161838
        0FAE966CFDE828AA00DB6B82CF67112D2AC4B294577A9844203F9477AA69D9EE
        D4A001C08DD2AA5B180E018ED744BFCF223A2B3CA649C194E085A6557B8E0C76
        E34E5E5F58755A9004D099CBA4B8C8DB4429650AA606EB9A56EFD932AC232FD0
        FAB67361D3EB3B0A663F1E6F576F5F86F71D5FB1333602848281977A8AB5EDF1
        D29D4F468EF534C82A9E4A468C6683401C9883EBB7E5CF9FCCE76F3FBABFF82D
        55F770E5BFE0ACFE022DBE000A772005820000000049454E44AE426082}
      SpeedButtonOptions.CanBeFocused = False
      SpeedButtonOptions.Flat = True
      TabOrder = 2
      OnClick = btnsalvarClick
    end
    object edtUsuario: TcxDBTextEdit
      Left = 24
      Top = 64
      DataBinding.DataField = 'USUARIO'
      DataBinding.DataSource = dsDados
      TabOrder = 3
      Width = 185
    end
    object edtSenha: TcxDBTextEdit
      Left = 24
      Top = 147
      DataBinding.DataField = 'SENHA'
      DataBinding.DataSource = dsDados
      TabOrder = 4
      Width = 185
    end
  end
  object dsDados: TDataSource
    Left = 200
    Top = 104
  end
end
