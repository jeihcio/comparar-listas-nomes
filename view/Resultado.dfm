object FrmResultado: TFrmResultado
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Resultado'
  ClientHeight = 288
  ClientWidth = 918
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
    Width = 298
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Nome da lista parcial que cont'#233'm na lista completa'
  end
  object Label1: TLabel
    Left = 315
    Top = 7
    Width = 294
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Nome da lista parcial que N'#195'O cont'#233'm na lista completa'
  end
  object Label2: TLabel
    Left = 619
    Top = 8
    Width = 294
    Height = 13
    Alignment = taCenter
    AutoSize = False
    Caption = 'Nome da lista completa que N'#195'O cont'#233'm na lista parcial'
  end
  object listaParcialContemListaCompleta: TMemo
    Left = 8
    Top = 26
    Width = 297
    Height = 255
    ScrollBars = ssBoth
    TabOrder = 0
    WordWrap = False
  end
  object listaParcialNaoContemListaCompleta: TMemo
    Left = 312
    Top = 26
    Width = 297
    Height = 255
    ScrollBars = ssBoth
    TabOrder = 1
    WordWrap = False
  end
  object listaCompletaNaoContemListaParcial: TMemo
    Left = 616
    Top = 26
    Width = 297
    Height = 255
    ScrollBars = ssBoth
    TabOrder = 2
    WordWrap = False
  end
end
