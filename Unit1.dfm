object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'json checker'
  ClientHeight = 482
  ClientWidth = 900
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -23
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 28
  object Memo1: TMemo
    Left = 0
    Top = 25
    Width = 625
    Height = 287
    Align = alClient
    PopupMenu = PopupMenu1
    TabOrder = 0
    OnChange = Memo1Change
    OnKeyDown = Memo1KeyDown
    OnKeyPress = Memo1KeyPress
    OnKeyUp = Memo1KeyUp
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 0
    Width = 900
    Height = 25
    Caption = 'ToolBar1'
    Images = ImageList1
    TabOrder = 1
    object ToolButton1: TToolButton
      Left = 0
      Top = 0
      Width = 17
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object ToolButton3: TToolButton
      Left = 17
      Top = 0
      Width = 8
      Caption = 'ToolButton3'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton2: TToolButton
      Left = 25
      Top = 0
      Hint = 'Exequte'
      Caption = 'ToolButton2'
      ImageIndex = 0
      OnClick = ToolButton2Click
    end
    object ToolButton9: TToolButton
      Left = 48
      Top = 0
      Width = 8
      Caption = 'ToolButton9'
      ImageIndex = 3
      Style = tbsSeparator
    end
    object ToolButton8: TToolButton
      Left = 56
      Top = 0
      Action = Action3
      ImageIndex = 2
    end
    object ToolButton10: TToolButton
      Left = 79
      Top = 0
      Width = 8
      Caption = 'ToolButton10'
      ImageIndex = 4
      Style = tbsSeparator
    end
    object ToolButton4: TToolButton
      Left = 87
      Top = 0
      Width = 33
      Caption = 'ToolButton4'
      ImageIndex = 1
      Style = tbsSeparator
    end
    object ToolButton6: TToolButton
      Left = 120
      Top = 0
      Width = 8
      Caption = 'ToolButton6'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object ToolButton5: TToolButton
      Left = 128
      Top = 0
      Hint = 'Help'
      Caption = 'ToolButton5'
      ImageIndex = 1
      OnClick = ToolButton5Click
    end
    object ToolButton7: TToolButton
      Left = 151
      Top = 0
      Width = 8
      Caption = 'ToolButton7'
      ImageIndex = 2
      Style = tbsSeparator
    end
  end
  object TreeView1: TTreeView
    Left = 625
    Top = 25
    Width = 275
    Height = 287
    Align = alRight
    Color = clInfoBk
    Indent = 19
    ReadOnly = True
    TabOrder = 2
    Items.NodeData = {
      0301000000320000000000000000000000FFFFFFFFFFFFFFFF00000000000000
      0000000000010A4A0053004F004E0020006900740065006D007300}
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 463
    Width = 900
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
  object TabControl1: TTabControl
    Left = 0
    Top = 312
    Width = 900
    Height = 151
    Align = alBottom
    TabOrder = 4
    Tabs.Strings = (
      #12504#12523#12503
      #12496#12540#12472#12519#12531#24773#22577
      #12498#12531#12488)
    TabIndex = 0
    Visible = False
    OnChange = TabControl1Change
    object Memo2: TMemo
      Left = 4
      Top = 39
      Width = 892
      Height = 108
      Align = alClient
      Lines.Strings = (
        '')
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object Memo3: TMemo
      Left = 360
      Top = 32
      Width = 185
      Height = 89
      Lines.Strings = (
        'json'#25991#23383#21015#12434#20837#21147#12375#12390#12367#12384#12373#12356#12290
        #35299#26512#32080#26524#12364#21491#12395#12290#12463#12522#12483#12503#12508#12540#12489#12395#32232#38598#20013#12398#20869#23481#12364#12467#12500#12540#12373#12428#12414#12377#12290)
      TabOrder = 1
      Visible = False
      WordWrap = False
    end
    object Memo4: TMemo
      Left = 448
      Top = 56
      Width = 185
      Height = 89
      Lines.Strings = (
        #22806#35251#12434#22793#26356
        'TJSONArray '#12395#23550#24540#12375#12414#12375#12383' '
        ' --------------------'
        #21021#20844#38283)
      TabOrder = 2
      Visible = False
      WordWrap = False
    end
    object Memo5: TMemo
      Left = 600
      Top = 24
      Width = 185
      Height = 89
      Lines.Strings = (
        'JSONObject'#12434#12493#12473#12488#12377#12427#38555#12395#12399#37197#21015#20869#12395#20837#12428#12390#12367#12384#12373#12356#12290)
      TabOrder = 3
      Visible = False
      WordWrap = False
    end
  end
  object ImageList1: TImageList
    Left = 200
    Top = 88
    Bitmap = {
      494C010104000800600010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000002000000001002000000000000020
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000000000000000000000000000000000000000000FF00000080000000FFFF
      FF0000000000FFFFFF0080000000800000008000000000000000000000000000
      0000000000008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF008080800080808000808080008080800080808000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000FF000000FF0000000000
      0000FFFFFF0000000000800000000000000000000000BFBFBF00BFBFBF00BFBF
      BF00BFBFBF000000000000000000000000008000000080000000FFFFFF000000
      00000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000008080
      8000808080008080800000000000000000000000000080808000808080008080
      8000FFFFFF00FFFFFF00000000000000000000000000FF000000FF0000000000
      0000FFFFFF000000000000000000BFBFBF00BFBFBF00BFBFBF00BFBFBF000000
      0000000000000000000000000000000000008000000080000000FFFFFF000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000808080008080
      8000FFFFFF00FFFFFF0000000000000000000000000000000000000000008080
      800080808000FFFFFF00FFFFFF000000000000000000FF000000FF000000FFFF
      FF000000000000000000BFBFBF00BFBFBF00BFBFBF0000000000000000007F7F
      7F00BFBFBF00BFBFBF0000000000000000008000000080000000FFFFFF000000
      0000FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF00000000000000000000000000000000000000FF000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF0000000000000000000000000080808000808080008080
      800080808000FFFFFF00FFFFFF00000000000000000000000000000000000000
      00008080800080808000FFFFFF000000000000000000FF000000FF000000FF00
      000000000000BFBFBF00BFBFBF00BFBFBF00000000007F7F7F007F7F7F007F7F
      7F00BFBFBF000000000080000000000000008000000080000000FFFFFF000000
      000000FFFF00FFFFFF0000FFFF00FFFFFF000000000000000000000000000000
      000000000000000000000000000000000000000000000000FF00000000000000
      FF000000FF000000FF0000000000000000000000000000000000000000000000
      00000000FF000000FF0000000000000000000000000080808000FFFFFF008080
      80008080800080808000FFFFFF00FFFFFF000000000000000000000000000000
      00000000000080808000FFFFFF00FFFFFF0000000000FF000000FF0000000000
      0000FFFFFF00FFFFFF00BFBFBF00000000007F7F7F007F7F7F007F7F7F00BFBF
      BF00BFBFBF000000000080000000000000008000000080000000FFFFFF000000
      0000FFFFFF00000000000000000000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF00FFFFFF000000000000000000000000000000FF000000FF00000000000000
      00000000FF000000FF000000FF00000000000000000000000000000000000000
      0000000000000000FF000000FF00000000008080800080808000FFFFFF000000
      0000808080008080800080808000FFFFFF00FFFFFF0000000000000000000000
      0000000000008080800080808000FFFFFF0000000000FF000000FF0000000000
      0000FFFFFF00FFFFFF000000000000000000BFBFBF007F7F7F007F7F7F00BFBF
      BF00000000008000000080000000000000008000000080000000FFFFFF000000
      000000FFFF000000000000FFFF00000000000000000000000000000000000000
      000000000000FFFFFF0000000000000000000000FF000000FF00000000000000
      0000000000000000FF000000FF000000FF000000000000000000000000000000
      0000000000000000FF000000FF00000000008080800080808000FFFFFF000000
      000000000000808080008080800080808000FFFFFF00FFFFFF00000000000000
      0000000000008080800080808000FFFFFF0000000000FF00000000000000FFFF
      FF00FFFFFF00000000007F7F7F007F7F7F00FFFFFF00BFBFBF007F7F7F000000
      0000800000008000000080000000000000000000000000000000000000000000
      0000FFFFFF0000000000FFFFFF00000000000000000000000000FFFFFF0000FF
      FF00FFFFFF0000FFFF0000000000FFFFFF000000FF000000FF00000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000FF000000FF00000000008080800080808000FFFFFF000000
      00000000000000000000808080008080800080808000FFFFFF00FFFFFF000000
      0000000000008080800080808000FFFFFF0000000000FF00000000000000FFFF
      FF00FFFFFF00000000007F7F7F007F7F7F007F7F7F00FFFFFF00BFBFBF008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000000000000000000000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFF
      FF0000FFFF0000000000FFFFFF00800000000000FF000000FF00000000000000
      00000000000000000000000000000000FF000000FF000000FF00000000000000
      0000000000000000FF000000FF00000000008080800080808000FFFFFF000000
      0000000000000000000000000000808080008080800080808000FFFFFF00FFFF
      FF00000000008080800080808000FFFFFF0000000000FF00000000000000FFFF
      FF00000000007F7F7F007F7F7F007F7F7F007F7F7F0000000000FFFFFF00BFBF
      BF00FFFFFF008000000080000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF0000FFFF00FFFFFF0000FF
      FF0000000000FFFFFF0080000000800000000000FF000000FF00000000000000
      0000000000000000000000000000000000000000FF000000FF000000FF000000
      0000000000000000FF000000FF00000000008080800080808000FFFFFF00FFFF
      FF0000000000000000000000000000000000808080008080800080808000FFFF
      FF00FFFFFF0080808000808080000000000000000000FF00000000000000FFFF
      FF00000000007F7F7F007F7F7F007F7F7F0000000000FF000000FF0000000000
      0000BFBFBF008000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00800000008000000080000000000000000000FF000000FF000000
      000000000000000000000000000000000000000000000000FF000000FF000000
      FF00000000000000FF000000000000000000000000008080800000000000FFFF
      FF00FFFFFF000000000000000000000000000000000080808000808080008080
      8000FFFFFF0080808000FFFFFF000000000000000000FF000000000000000000
      00007F7F7F007F7F7F000000000000000000FF000000FF000000FFFFFF00BFBF
      BF00FFFFFF008000000080000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF0080000000800000008000000080000000000000000000FF000000FF000000
      FF000000000000000000000000000000000000000000000000000000FF000000
      FF000000FF000000FF0000000000000000000000000080808000808080000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000808080008080
      80008080800080808000000000000000000000000000FF000000FF0000000000
      00000000000000000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF00000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000080000000800000008000000000000000000000000000FF000000
      FF000000FF000000000000000000000000000000000000000000000000000000
      FF000000FF000000000000000000000000000000000000000000808080008080
      800000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF008080
      80008080800000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000008080
      8000808080008080800000000000000000000000000080808000808080008080
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008080800080808000808080008080800080808000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000200000000100010000000000000100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFC1F8001081FF83FF007
      8001000FE00FE38380010007CFC7C3E18001000387E381F180010001A3F380F8
      8001000131F910788001000038F91838800100003C791C188001F0003E391E08
      8001FC003F190F018001FF009F8BA7818001FFC08FC393C38001FFE0C7E7C807
      8001FFF8E00FE38FFFFFFFFEF83FF83F00000000000000000000000000000000
      000000000000}
  end
  object ActionList1: TActionList
    Left = 368
    Top = 176
    object EditCopy1: TEditCopy
      Category = #32232#38598
      Caption = #12467#12500#12540'(&C)'
      Hint = #12467#12500#12540'|'#36984#25246#37096#20998#12434#12467#12500#12540#12375#12390#12463#12522#12483#12503#12508#12540#12489#12395#20837#12428#12414#12377
      ImageIndex = 1
      ShortCut = 16451
    end
    object EditCut1: TEditCut
      Category = #32232#38598
      Caption = #20999#12426#21462#12426'(&T)'
      Hint = #20999#12426#21462#12426'|'#36984#25246#37096#20998#12434#20999#12426#21462#12387#12390#12463#12522#12483#12503#12508#12540#12489#12395#20837#12428#12414#12377
      ImageIndex = 0
      ShortCut = 16472
    end
    object EditSelectAll1: TEditSelectAll
      Category = #32232#38598
      Caption = #12377#12409#12390#36984#25246'(&A)'
      Hint = #12377#12409#12390#36984#25246'|'#12489#12461#12517#12513#12531#12488#20840#20307#12434#36984#25246#12375#12414#12377
      ShortCut = 16449
    end
    object Action1: TAction
      Caption = #23455#34892
      OnExecute = ToolButton2Click
    end
    object Action2: TAction
      Caption = #12504#12523#12503
      OnExecute = ToolButton5Click
    end
    object FileExit1: TFileExit
      Category = #12501#12449#12452#12523
      Caption = #32066#20102'(&X)'
      Hint = #32066#20102'|'#12450#12503#12522#12465#12540#12471#12519#12531#12434#32066#20102#12375#12414#12377
      ImageIndex = 43
    end
    object Action3: TAction
      Category = #32232#38598
      Caption = 'Undo'
      OnExecute = Action3Execute
    end
    object Action4: TAction
      Category = #32232#38598
      Caption = 'Past'
      ShortCut = 16470
      OnExecute = Action4Execute
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 368
    Top = 232
    object C1: TMenuItem
      Action = EditCopy1
    end
    object T1: TMenuItem
      Action = EditCut1
    end
    object P1: TMenuItem
      Action = Action4
    end
    object A1: TMenuItem
      Action = EditSelectAll1
    end
    object U1: TMenuItem
      Action = Action3
    end
  end
  object MainMenu1: TMainMenu
    Left = 256
    Top = 232
    object N1: TMenuItem
      Caption = #12501#12449#12452#12523
      object N4: TMenuItem
        Action = Action1
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object X1: TMenuItem
        Action = FileExit1
      end
    end
    object N2: TMenuItem
      Caption = #26360#24335
      object C2: TMenuItem
        Action = EditCopy1
      end
      object T2: TMenuItem
        Action = EditCut1
      end
      object P2: TMenuItem
        Action = Action4
      end
      object A2: TMenuItem
        Action = EditSelectAll1
      end
      object U2: TMenuItem
        Action = Action3
      end
    end
    object N3: TMenuItem
      Caption = #12504#12523#12503
      object N6: TMenuItem
        Action = Action2
      end
    end
  end
end
