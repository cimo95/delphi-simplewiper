object f0: Tf0
  Left = 519
  Top = 321
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Simple Wiper'
  ClientHeight = 117
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object c0: TLabel
    Left = 8
    Top = 16
    Width = 55
    Height = 13
    Caption = 'Pilih drive : '
  end
  object c1: TDriveComboBox
    Left = 65
    Top = 14
    Width = 145
    Height = 19
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 0
  end
  object c2: TButton
    Left = 216
    Top = 13
    Width = 75
    Height = 21
    Caption = 'W I P E !'
    TabOrder = 1
    OnClick = c2Click
  end
  object c3: TGroupBox
    Left = 8
    Top = 40
    Width = 281
    Height = 65
    Caption = 'Proses : Siap '
    TabOrder = 2
    object c4: TLabel
      Left = 8
      Top = 16
      Width = 54
      Height = 13
      Caption = '0 b dari 0 b'
    end
    object c5: TProgressBar
      Left = 8
      Top = 40
      Width = 265
      Height = 17
      TabOrder = 0
    end
  end
end
