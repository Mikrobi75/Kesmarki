inherited FrmAdatKarb: TFrmAdatKarb
  Caption = 'Adatok karbantart'#225'sa'
  ClientHeight = 590
  ClientWidth = 817
  OnCreate = FormCreate
  ExplicitWidth = 823
  ExplicitHeight = 618
  PixelsPerInch = 96
  TextHeight = 13
  object lblVezetekNev: TLabel
    Left = 656
    Top = 48
    Width = 60
    Height = 13
    Caption = 'Vezet'#233'kn'#233'v:'
  end
  object lblKeresztnev: TLabel
    Left = 656
    Top = 94
    Width = 58
    Height = 13
    Caption = 'Keresztn'#233'v:'
  end
  object lblSzemelyiAzon: TLabel
    Left = 656
    Top = 139
    Width = 60
    Height = 13
    Caption = 'Szem. Azon:'
  end
  object lblLakCimAzon: TLabel
    Left = 656
    Top = 185
    Width = 69
    Height = 13
    Caption = 'Lakc'#237'm. azon.:'
  end
  object gridSzemelyiAdatok: TDBGrid
    Left = 16
    Top = 40
    Width = 627
    Height = 185
    DataSource = DM.dsSzemelyiAdatok
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Vezeteknev'
        Width = 131
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Keresztnev'
        Width = 129
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'SzemelyiAzon'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LakcimAzon'
        Visible = True
      end>
  end
  object dbnavSzemAdat: TDBNavigator
    Left = 16
    Top = 8
    Width = 240
    Height = 25
    DataSource = DM.dsSzemelyiAdatok
    TabOrder = 1
  end
  object edtVezetekNev: TDBEdit
    Left = 656
    Top = 67
    Width = 121
    Height = 21
    DataField = 'Vezeteknev'
    DataSource = DM.dsSzemelyiAdatok
    TabOrder = 2
  end
  object edtKeresztnev: TDBEdit
    Left = 656
    Top = 112
    Width = 121
    Height = 21
    DataField = 'Keresztnev'
    DataSource = DM.dsSzemelyiAdatok
    TabOrder = 3
  end
  object edtSzemelyiAzon: TDBEdit
    Left = 656
    Top = 158
    Width = 121
    Height = 21
    DataField = 'SzemelyiAzon'
    DataSource = DM.dsSzemelyiAdatok
    TabOrder = 4
  end
  object edtLakcimAzon: TDBEdit
    Left = 656
    Top = 204
    Width = 121
    Height = 21
    DataField = 'LakcimAzon'
    DataSource = DM.dsSzemelyiAdatok
    TabOrder = 5
  end
  object pgLakCimElerhet: TPageControl
    Left = 16
    Top = 240
    Width = 785
    Height = 329
    ActivePage = tsElerhetoseg
    TabOrder = 6
    object tsLakcim: TTabSheet
      Caption = 'Lakc'#237'm'
      ExplicitLeft = 0
      ExplicitWidth = 929
      object lblCimTip: TLabel
        Left = 636
        Top = 45
        Width = 47
        Height = 13
        Caption = 'C'#237'm t'#237'pus:'
      end
      object lblIrszam: TLabel
        Left = 636
        Top = 94
        Width = 66
        Height = 13
        Caption = 'Ir'#225'ny'#237't'#243'sz'#225'm:'
      end
      object lblTelepules: TLabel
        Left = 636
        Top = 142
        Width = 49
        Height = 13
        Caption = 'Telep'#252'l'#233's:'
      end
      object lblUtca: TLabel
        Left = 636
        Top = 185
        Width = 26
        Height = 13
        Caption = 'Utca:'
      end
      object lblHazszam: TLabel
        Left = 636
        Top = 230
        Width = 46
        Height = 13
        Caption = 'H'#225'zsz'#225'm:'
      end
      object gridLakcimek: TDBGrid
        Left = 3
        Top = 48
        Width = 620
        Height = 233
        DataSource = DM.dsLakcimekMastDet
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CimTipusTxt'
            Width = 159
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IranyitoSzam'
            Width = 86
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Telepules'
            Width = 96
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Utca'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Hazszam'
            Visible = True
          end>
      end
      object dbnavLakcim: TDBNavigator
        Left = 3
        Top = 3
        Width = 240
        Height = 25
        DataSource = DM.dsLakcimekMastDet
        TabOrder = 1
      end
      object cmbCimTip: TComboBox
        Left = 636
        Top = 64
        Width = 121
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 2
        Items.Strings = (
          #193'lland'#243
          'Tart'#243'zkod'#225'si')
      end
      object edtIrszam: TDBEdit
        Left = 636
        Top = 112
        Width = 121
        Height = 21
        DataField = 'IranyitoSzam'
        DataSource = DM.dsLakcimekMastDet
        TabOrder = 3
      end
      object edtTelepules: TDBEdit
        Left = 636
        Top = 160
        Width = 121
        Height = 21
        DataField = 'Telepules'
        DataSource = DM.dsLakcimekMastDet
        TabOrder = 4
      end
      object edtUtca: TDBEdit
        Left = 636
        Top = 204
        Width = 121
        Height = 21
        DataField = 'Utca'
        DataSource = DM.dsLakcimekMastDet
        TabOrder = 5
      end
      object edtHazszam: TDBEdit
        Left = 636
        Top = 248
        Width = 121
        Height = 21
        DataField = 'Hazszam'
        DataSource = DM.dsLakcimekMastDet
        TabOrder = 6
      end
    end
    object tsElerhetoseg: TTabSheet
      Caption = 'El'#233'rhet'#337's'#233'g'
      ImageIndex = 1
      ExplicitWidth = 281
      ExplicitHeight = 165
      object lblElerhetosegTip: TLabel
        Left = 644
        Top = 53
        Width = 87
        Height = 13
        Caption = 'El'#233'rhet'#337's'#233'g t'#237'pus:'
      end
      object lblElerhetoseg: TLabel
        Left = 644
        Top = 102
        Width = 61
        Height = 13
        Caption = 'El'#233'rhet'#337's'#233'g:'
      end
      object dbnavElerhetoseg: TDBNavigator
        Left = 11
        Top = 11
        Width = 240
        Height = 25
        DataSource = DM.dsElerhetosegekMastDet
        TabOrder = 0
      end
      object gridElerhetosegek: TDBGrid
        Left = 11
        Top = 56
        Width = 620
        Height = 233
        DataSource = DM.dsElerhetosegekMastDet
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'ElerhetosegTipusTxt'
            Width = 226
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Elerhetoseg'
            Width = 230
            Visible = True
          end>
      end
      object cmbElerhetosegTip: TComboBox
        Left = 644
        Top = 72
        Width = 121
        Height = 22
        Style = csOwnerDrawFixed
        TabOrder = 2
        Items.Strings = (
          'Vezet'#233'kes telefon'
          'Mobil'
          'Email')
      end
      object edtElerhetoseg: TDBEdit
        Left = 644
        Top = 120
        Width = 121
        Height = 21
        DataField = 'Elerhetoseg'
        DataSource = DM.dsElerhetosegekMastDet
        TabOrder = 3
      end
    end
  end
end
