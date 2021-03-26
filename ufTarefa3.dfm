object fTarefa3: TfTarefa3
  Left = 0
  Top = 0
  Caption = 'fTarefa3'
  ClientHeight = 368
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 583
    Top = 258
    Width = 44
    Height = 13
    Caption = 'Total R$:'
  end
  object Label2: TLabel
    Left = 542
    Top = 304
    Width = 85
    Height = 13
    Caption = 'Total divis'#245'es R$:'
  end
  object Label3: TLabel
    Left = 8
    Top = 16
    Width = 96
    Height = 13
    Caption = 'Valores por projeto:'
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 35
    Width = 619
    Height = 217
    DataSource = dataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'idProjeto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NomeProjeto'
        Width = 415
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Width = 98
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 392
    Top = 277
    Width = 108
    Height = 21
    Caption = 'Obter Total'
    TabOrder = 1
    OnClick = Button1Click
  end
  object edValorTotal: TEdit
    Left = 506
    Top = 277
    Width = 121
    Height = 21
    Alignment = taRightJustify
    NumbersOnly = True
    TabOrder = 2
    Text = '0'
  end
  object edTotalDivisoes: TEdit
    Left = 506
    Top = 323
    Width = 121
    Height = 21
    Alignment = taRightJustify
    DoubleBuffered = False
    NumbersOnly = True
    ParentDoubleBuffered = False
    TabOrder = 3
    Text = '0'
  end
  object Button2: TButton
    Left = 392
    Top = 323
    Width = 108
    Height = 21
    Caption = 'Obter Total Divis'#245'es'
    TabOrder = 4
    OnClick = Button2Click
  end
  object clienteDataSet: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 112
    Top = 296
    object clienteDataSetidProjeto: TIntegerField
      FieldName = 'idProjeto'
    end
    object clienteDataSetNomeProjeto: TStringField
      FieldName = 'NomeProjeto'
      Size = 100
    end
    object clienteDataSetValor: TCurrencyField
      FieldName = 'Valor'
    end
  end
  object dataSource: TDataSource
    DataSet = clienteDataSet
    Left = 208
    Top = 296
  end
end
