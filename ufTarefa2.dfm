object fTarefa2: TfTarefa2
  Left = 0
  Top = 0
  Caption = 'fTarefa2'
  ClientHeight = 177
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 25
    Width = 48
    Height = 13
    Caption = 'Intervalo:'
  end
  object Label2: TLabel
    Left = 62
    Top = 27
    Width = 58
    Height = 11
    Caption = '(Milisegundos)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 81
    Width = 48
    Height = 13
    Caption = 'Intervalo:'
  end
  object Label4: TLabel
    Left = 62
    Top = 83
    Width = 58
    Height = 11
    Caption = '(Milisegundos)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ProgressBar1: TProgressBar
    Left = 126
    Top = 44
    Width = 501
    Height = 21
    TabOrder = 0
  end
  object edIntervalo1: TEdit
    Left = 8
    Top = 44
    Width = 112
    Height = 21
    NumbersOnly = True
    TabOrder = 1
  end
  object ProgressBar2: TProgressBar
    Left = 126
    Top = 100
    Width = 501
    Height = 21
    TabOrder = 2
  end
  object edIntervalo2: TEdit
    Left = 8
    Top = 100
    Width = 112
    Height = 21
    NumbersOnly = True
    TabOrder = 3
  end
  object Button1: TButton
    Left = 552
    Top = 127
    Width = 75
    Height = 25
    Caption = 'Executar'
    TabOrder = 4
    OnClick = Button1Click
  end
end
