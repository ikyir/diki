object Form1: TForm1
  Left = 264
  Top = 170
  Width = 928
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 449
    Height = 353
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 41
      Height = 13
      Caption = 'No. Urut'
    end
    object Label2: TLabel
      Left = 24
      Top = 64
      Width = 42
      Height = 13
      Caption = 'No Surat'
    end
    object Label3: TLabel
      Left = 24
      Top = 112
      Width = 53
      Height = 13
      Caption = 'Jenis Surat'
    end
    object Label4: TLabel
      Left = 24
      Top = 160
      Width = 67
      Height = 13
      Caption = 'Tanggal Surat'
    end
    object Label5: TLabel
      Left = 240
      Top = 16
      Width = 73
      Height = 13
      Caption = 'Tanggal Terima'
    end
    object Label6: TLabel
      Left = 240
      Top = 64
      Width = 40
      Height = 13
      Caption = 'Pengirim'
    end
    object Label7: TLabel
      Left = 240
      Top = 112
      Width = 62
      Height = 13
      Caption = 'Nama Berkas'
    end
    object Label8: TLabel
      Left = 240
      Top = 160
      Width = 31
      Height = 13
      Caption = 'Label8'
    end
    object Edit1: TEdit
      Left = 24
      Top = 32
      Width = 185
      Height = 21
      TabOrder = 0
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 24
      Top = 80
      Width = 185
      Height = 21
      TabOrder = 1
      Text = 'Edit2'
    end
    object Edit3: TEdit
      Left = 24
      Top = 128
      Width = 185
      Height = 21
      TabOrder = 2
      Text = 'Edit3'
    end
    object Edit4: TEdit
      Left = 240
      Top = 80
      Width = 185
      Height = 21
      TabOrder = 3
      Text = 'Edit4'
    end
    object Edit5: TEdit
      Left = 240
      Top = 128
      Width = 185
      Height = 21
      TabOrder = 4
      Text = 'Edit5'
    end
    object DateTimePicker1: TDateTimePicker
      Left = 24
      Top = 176
      Width = 186
      Height = 21
      Date = 43064.555743229170000000
      Time = 43064.555743229170000000
      TabOrder = 5
    end
    object DateTimePicker2: TDateTimePicker
      Left = 240
      Top = 32
      Width = 186
      Height = 21
      Date = 43064.555829456020000000
      Time = 43064.555829456020000000
      TabOrder = 6
    end
    object Button1: TButton
      Left = 24
      Top = 224
      Width = 75
      Height = 25
      Caption = 'Pindai'
      TabOrder = 7
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 136
      Top = 224
      Width = 75
      Height = 25
      Caption = 'Lihat'
      TabOrder = 8
    end
  end
  object Panel2: TPanel
    Left = 448
    Top = 0
    Width = 441
    Height = 353
    TabOrder = 1
  end
end
