object DM: TDM
  OldCreateOrder = False
  OnDestroy = DataModuleDestroy
  Height = 315
  Width = 665
  object ADOConnection: TADOConnection
    LoginPrompt = False
    Provider = 'SQLOLEDB.1'
    Left = 64
    Top = 32
  end
  object tblSzemelyiAdatok: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'SzemelyiAdatok'
    Left = 64
    Top = 96
    object tblSzemelyiAdatokId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
      Visible = False
    end
    object tblSzemelyiAdatokVezeteknev: TWideStringField
      DisplayLabel = 'Vezet'#233'kn'#233'v'
      FieldName = 'Vezeteknev'
      Size = 50
    end
    object tblSzemelyiAdatokKeresztnev: TWideStringField
      DisplayLabel = 'Keresztn'#233'v'
      FieldName = 'Keresztnev'
      Size = 50
    end
    object tblSzemelyiAdatokSzemelyiAzon: TWideStringField
      DisplayLabel = 'Szem. Azon.'
      FieldName = 'SzemelyiAzon'
    end
    object tblSzemelyiAdatokLakcimAzon: TWideStringField
      DisplayLabel = 'Lakc'#237'm. azon.'
      FieldName = 'LakcimAzon'
    end
  end
  object tblLakcimek: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'Lakcimek'
    Left = 64
    Top = 152
    object tblLakcimekId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object tblLakcimekCimTipus: TWordField
      FieldName = 'CimTipus'
    end
    object tblLakcimekIranyitoSzam: TIntegerField
      FieldName = 'IranyitoSzam'
    end
    object tblLakcimekTelepules: TWideStringField
      FieldName = 'Telepules'
      Size = 80
    end
    object tblLakcimekUtca: TWideStringField
      FieldName = 'Utca'
      Size = 60
    end
    object tblLakcimekHazszam: TWideStringField
      FieldName = 'Hazszam'
      Size = 10
    end
    object tblLakcimekSzemelyiAdat_Id: TIntegerField
      FieldName = 'SzemelyiAdat_Id'
    end
  end
  object tblElerhetosegek: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    TableName = 'Elerhetosegek'
    Left = 64
    Top = 208
    object tblElerhetosegekId: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object tblElerhetosegekElerhetosegTipus: TWordField
      FieldName = 'ElerhetosegTipus'
    end
    object tblElerhetosegekElerhetoseg: TWideStringField
      FieldName = 'Elerhetoseg'
      Size = 320
    end
    object tblElerhetosegekSzemelyiAdat_Id: TIntegerField
      FieldName = 'SzemelyiAdat_Id'
    end
  end
  object dsSzemelyiAdatok: TDataSource
    DataSet = tblSzemelyiAdatok
    Left = 176
    Top = 96
  end
  object tblLakcimekMastDet: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    BeforePost = tblLakcimekMastDetBeforePost
    AfterScroll = tblLakcimekMastDetAfterScroll
    OnCalcFields = tblLakcimekMastDetCalcFields
    IndexFieldNames = 'SzemelyiAdat_Id'
    MasterFields = 'Id'
    MasterSource = dsSzemelyiAdatok
    TableName = 'Lakcimek'
    Left = 176
    Top = 152
    object AutoIncField1: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object WordField1: TWordField
      FieldName = 'CimTipus'
    end
    object IntegerField1: TIntegerField
      DisplayLabel = 'Ir'#225'ny'#237't'#243'sz'#225'm'
      FieldName = 'IranyitoSzam'
    end
    object WideStringField1: TWideStringField
      DisplayLabel = 'Telep'#252'l'#233's'
      FieldName = 'Telepules'
      Size = 80
    end
    object WideStringField2: TWideStringField
      FieldName = 'Utca'
      Size = 60
    end
    object WideStringField3: TWideStringField
      DisplayLabel = 'H'#225'zsz'#225'm'
      FieldName = 'Hazszam'
      Size = 10
    end
    object IntegerField2: TIntegerField
      FieldName = 'SzemelyiAdat_Id'
    end
    object tblLakcimekMastDetCimTipusTxt: TStringField
      DisplayLabel = 'C'#237'm t'#237'pus'
      FieldKind = fkCalculated
      FieldName = 'CimTipusTxt'
      Size = 40
      Calculated = True
    end
  end
  object dsLakcimekMastDet: TDataSource
    DataSet = tblLakcimekMastDet
    Left = 304
    Top = 152
  end
  object tblElerhetosegekMastDet: TADOTable
    Connection = ADOConnection
    CursorType = ctStatic
    BeforePost = tblElerhetosegekMastDetBeforePost
    AfterScroll = tblElerhetosegekMastDetAfterScroll
    OnCalcFields = tblElerhetosegekMastDetCalcFields
    IndexFieldNames = 'SzemelyiAdat_Id'
    MasterFields = 'Id'
    MasterSource = dsSzemelyiAdatok
    TableName = 'Elerhetosegek'
    Left = 176
    Top = 208
    object AutoIncField2: TAutoIncField
      FieldName = 'Id'
      ReadOnly = True
    end
    object WordField2: TWordField
      FieldName = 'ElerhetosegTipus'
    end
    object WideStringField4: TWideStringField
      DisplayLabel = 'El'#233'rhet'#337's'#233'g'
      FieldName = 'Elerhetoseg'
      Size = 320
    end
    object IntegerField3: TIntegerField
      FieldName = 'SzemelyiAdat_Id'
    end
    object tblElerhetosegekMastDetElerhetosegTipusTxt: TStringField
      DisplayLabel = 'El'#233'rhet'#337's'#233'g t'#237'pus'
      FieldKind = fkCalculated
      FieldName = 'ElerhetosegTipusTxt'
      Size = 50
      Calculated = True
    end
  end
  object dsElerhetosegekMastDet: TDataSource
    DataSet = tblElerhetosegekMastDet
    Left = 304
    Top = 208
  end
end
