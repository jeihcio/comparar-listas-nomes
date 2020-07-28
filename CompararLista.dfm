object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Comparar'
  ClientHeight = 318
  ClientWidth = 618
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object lblprimeira: TLabel
    Left = 8
    Top = 7
    Width = 56
    Height = 13
    Caption = 'Lista Parcial'
  end
  object Label1: TLabel
    Left = 315
    Top = 7
    Width = 70
    Height = 13
    Caption = 'Lista Completa'
  end
  object listaParcial: TMemo
    Left = 8
    Top = 26
    Width = 297
    Height = 255
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object listaCompleta: TMemo
    Left = 312
    Top = 26
    Width = 297
    Height = 255
    ScrollBars = ssBoth
    TabOrder = 1
    WordWrap = False
  end
  object btnLimpar: TButton
    Left = 454
    Top = 287
    Width = 75
    Height = 25
    Caption = 'Limpar'
    TabOrder = 2
    OnClick = btnLimparClick
  end
  object Button1: TButton
    Left = 535
    Top = 287
    Width = 75
    Height = 25
    Caption = 'Verificar'
    TabOrder = 3
    OnClick = Button1Click
  end
  object ProgressBar: TProgressBar
    Left = 8
    Top = 287
    Width = 440
    Height = 25
    TabOrder = 4
  end
end
