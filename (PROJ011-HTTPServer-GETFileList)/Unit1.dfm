object Form1: TForm1
  Left = 278
  Top = 179
  Width = 448
  Height = 534
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object FLB: TFileListBox
    Left = 152
    Top = 32
    Width = 233
    Height = 345
    ItemHeight = 13
    TabOrder = 0
  end
  object Button1: TButton
    Left = 24
    Top = 120
    Width = 73
    Height = 33
    Caption = #19978#20659
    TabOrder = 1
  end
  object Button2: TButton
    Left = 24
    Top = 168
    Width = 73
    Height = 33
    Caption = #19979#36617
    TabOrder = 2
  end
  object Button3: TButton
    Left = 24
    Top = 216
    Width = 73
    Height = 33
    Caption = #37325#26032#25972#29702
    TabOrder = 3
  end
  object ListBox1: TListBox
    Left = 8
    Top = 280
    Width = 137
    Height = 185
    ItemHeight = 13
    TabOrder = 4
  end
  object TCPS: TIdTCPServer
    Active = True
    Bindings = <>
    CommandHandlers = <>
    DefaultPort = 7002
    Greeting.NumericCode = 0
    MaxConnectionReply.NumericCode = 0
    OnExecute = TCPSExecute
    ReplyExceptionCode = 0
    ReplyTexts = <>
    ReplyUnknownCommand.NumericCode = 0
    Left = 24
    Top = 56
  end
end
