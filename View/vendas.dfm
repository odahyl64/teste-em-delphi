object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Cadastro de Vendas'
  ClientHeight = 423
  ClientWidth = 538
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 33
    Top = 8
    Width = 33
    Height = 13
    Caption = 'C'#243'digo'
  end
  object Label2: TLabel
    Left = 33
    Top = 38
    Width = 56
    Height = 13
    Caption = 'Quantidade'
  end
  object Label3: TLabel
    Left = 32
    Top = 71
    Width = 59
    Height = 13
    Caption = 'Pc de Venda'
  end
  object edtCodigo: TEdit
    Left = 97
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtQuantidade: TEdit
    Left = 97
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button4: TButton
    Left = 53
    Top = 146
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 2
    OnClick = Button4Click
  end
  object Button1: TButton
    Left = 134
    Top = 146
    Width = 75
    Height = 25
    Caption = 'Incluir'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 215
    Top = 146
    Width = 75
    Height = 25
    Caption = 'Alterar'
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 296
    Top = 146
    Width = 75
    Height = 25
    Caption = 'Excluir'
    TabOrder = 5
    OnClick = Button3Click
  end
  object DBGrid1: TDBGrid
    Left = -7
    Top = 208
    Width = 545
    Height = 193
    DataSource = DSVenda
    DrawingStyle = gdsGradient
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnKeyUp = DBGrid1KeyUp
    OnMouseUp = DBGrid1MouseUp
    Columns = <
      item
        Expanded = False
        FieldName = 'CODIGO'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cliente'
        Width = 135
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Produto'
        Width = 183
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PrecoVenda'
        Width = 262
        Visible = True
      end>
  end
  object EdtPcVenda: TEdit
    Left = 96
    Top = 68
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object Connection: TFDConnection
    Params.Strings = (
      'Database=conexao vendas'
      'User_Name=root'
      'Password=carol0910'
      'Server=127.0.0.1'
      'DriverID=MySQL')
    LoginPrompt = False
    Left = 272
    Top = 16
  end
  object DriverLink: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Program Files\MySQL\MySQL Server 8.0\lib\libmysql.dll'
    Left = 344
    Top = 16
  end
  object DSVenda: TDataSource
    DataSet = Query
    Left = 464
    Top = 16
  end
  object Query: TFDQuery
    Connection = Connection
    Left = 400
    Top = 16
  end
end
