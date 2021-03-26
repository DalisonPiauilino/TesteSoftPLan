object fTarefa1: TfTarefa1
  Left = 0
  Top = 0
  Caption = 'fTarefa1'
  ClientHeight = 306
  ClientWidth = 663
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 38
    Height = 13
    Caption = 'Colunas'
  end
  object Label2: TLabel
    Left = 199
    Top = 8
    Width = 37
    Height = 13
    Caption = 'Tabelas'
  end
  object Label3: TLabel
    Left = 390
    Top = 8
    Width = 49
    Height = 13
    Caption = 'Condi'#231#245'es'
  end
  object Label4: TLabel
    Left = 8
    Top = 154
    Width = 57
    Height = 13
    Caption = 'SQL Gerado'
  end
  object memoColunas: TMemo
    Left = 8
    Top = 27
    Width = 185
    Height = 121
    TabOrder = 0
  end
  object memoTabelas: TMemo
    Left = 199
    Top = 27
    Width = 185
    Height = 121
    TabOrder = 1
  end
  object memoCondicoes: TMemo
    Left = 390
    Top = 27
    Width = 185
    Height = 121
    TabOrder = 2
  end
  object memoSQLgerado: TMemo
    Left = 8
    Top = 173
    Width = 648
    Height = 124
    TabOrder = 3
  end
  object Button1: TButton
    Left = 581
    Top = 73
    Width = 75
    Height = 25
    Caption = 'Gerar SQL'
    TabOrder = 4
    OnClick = Button1Click
  end
end
