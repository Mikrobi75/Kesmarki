object FrmImport: TFrmImport
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Adatok import'#225'l'#225'sa(CSV)'
  ClientHeight = 310
  ClientWidth = 679
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object btnOpen: TBitBtn
    Left = 16
    Top = 8
    Width = 113
    Height = 25
    Caption = 'F'#225'jl kiv'#225'laszt'#225'sa'
    TabOrder = 0
    OnClick = btnOpenClick
  end
  object btnImport: TBitBtn
    Left = 144
    Top = 8
    Width = 113
    Height = 25
    Caption = 'F'#225'jl import'#225'l'#225'sa'
    TabOrder = 1
    OnClick = btnImportClick
  end
  object MemoFile: TMemo
    Left = 8
    Top = 39
    Width = 663
    Height = 263
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object OpenDialog: TOpenDialog
    FileName = '*.csv'
    Left = 536
    Top = 96
  end
end
