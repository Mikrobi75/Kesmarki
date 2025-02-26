unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, IniFiles, Vcl.Forms,
  System.Variants, Vcl.Dialogs;

type
  TTxtType = function: String of object;

  TDM = class(TDataModule)
    ADOConnection: TADOConnection;
    tblSzemelyiAdatok: TADOTable;
    tblLakcimek: TADOTable;
    tblElerhetosegek: TADOTable;
    tblSzemelyiAdatokId: TAutoIncField;
    tblSzemelyiAdatokVezeteknev: TWideStringField;
    tblSzemelyiAdatokKeresztnev: TWideStringField;
    tblSzemelyiAdatokSzemelyiAzon: TWideStringField;
    tblSzemelyiAdatokLakcimAzon: TWideStringField;
    tblLakcimekId: TAutoIncField;
    tblLakcimekCimTipus: TWordField;
    tblLakcimekIranyitoSzam: TIntegerField;
    tblLakcimekTelepules: TWideStringField;
    tblLakcimekUtca: TWideStringField;
    tblLakcimekHazszam: TWideStringField;
    tblLakcimekSzemelyiAdat_Id: TIntegerField;
    tblElerhetosegekId: TAutoIncField;
    tblElerhetosegekElerhetosegTipus: TWordField;
    tblElerhetosegekElerhetoseg: TWideStringField;
    tblElerhetosegekSzemelyiAdat_Id: TIntegerField;
    dsSzemelyiAdatok: TDataSource;
    tblLakcimekMastDet: TADOTable;
    AutoIncField1: TAutoIncField;
    WordField1: TWordField;
    IntegerField1: TIntegerField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    IntegerField2: TIntegerField;
    dsLakcimekMastDet: TDataSource;
    tblLakcimekMastDetCimTipusTxt: TStringField;
    tblElerhetosegekMastDet: TADOTable;
    AutoIncField2: TAutoIncField;
    WordField2: TWordField;
    WideStringField4: TWideStringField;
    IntegerField3: TIntegerField;
    dsElerhetosegekMastDet: TDataSource;
    tblElerhetosegekMastDetElerhetosegTipusTxt: TStringField;
    procedure DataModuleDestroy(Sender: TObject);
    procedure tblLakcimekMastDetCalcFields(DataSet: TDataSet);
    procedure tblLakcimekMastDetBeforePost(DataSet: TDataSet);
    procedure tblLakcimekMastDetAfterScroll(DataSet: TDataSet);
    procedure tblElerhetosegekMastDetCalcFields(DataSet: TDataSet);
    procedure tblElerhetosegekMastDetAfterScroll(DataSet: TDataSet);
    procedure tblElerhetosegekMastDetBeforePost(DataSet: TDataSet);
  private
    function GetCSVData(asSzoveg: String;
                        aiMezo: Byte;
                        asDelimiter: String): String;
  public
    FLakcimScroll: TNotifyEvent;
    FGetCimType: TTxtType;
    FElerhetScroll: TNotifyEvent;
    FGetElerhetType: TTxtType;
    function SetConnection: String;
    procedure DataImport(asFile: String);
    procedure DataSetOpen;
    function GetLakcimTip: Integer;
    function GetElerhetTip: Integer;
    procedure CloseOpen;
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  tblSzemelyiAdatok.Close;
  tblLakcimek.Close;
  tblElerhetosegek.Close;
  tblLakcimekMastDet.Close;
end;

function TDM.GetCSVData(asSzoveg: String;
                        aiMezo: Byte;
                        asDelimiter: String): String;
var i,j : Integer;
    ResultStr: String;
begin
  j := 1;
  ResultStr := '';
  for i := 1 to Length(asSzoveg) do
  begin
    if asSzoveg[i] = asDelimiter then
      inc(j)
    else
      if j = aiMezo then
        ResultStr := ResultStr + asSzoveg[i];
  end;
  Result := ResultStr;
end;

function TDM.SetConnection: String;
var
  lIni: TIniFile;
  lsConnectionString: String;
begin
  try
    Result := '';
    ADOConnection.Connected := False;
    lsConnectionString := '';
    lIni := TIniFile.Create( extractFilePath( Application.ExeName ) + 'setup.ini' );
    lsConnectionString := lsConnectionString + 'Provider=' + lIni.ReadString('database','Provider','') + ';';
    lsConnectionString := lsConnectionString + 'Password=' + lIni.ReadString('database','Password','') + ';';
    lsConnectionString := lsConnectionString + 'Persist Security Info=' + lIni.ReadString('database','Persist Security Info','') + ';';
    lsConnectionString := lsConnectionString + 'User ID=' + lIni.ReadString('database','User ID','') + ';';
    lsConnectionString := lsConnectionString + 'Initial Catalog=' + lIni.ReadString('database','Initial Catalog','') + ';';
    lsConnectionString := lsConnectionString + 'Data Source=' + lIni.ReadString('database','Data Source','');
    ADOConnection.ConnectionString := lsConnectionString;
    ADOConnection.Connected := True;
    lIni.Free;
  except
    on e: Exception do
    begin
      Result := e.Message;
    end;
  end;
end;

procedure TDM.tblElerhetosegekMastDetAfterScroll(DataSet: TDataSet);
begin
  if Assigned(FElerhetScroll) then
    FElerhetScroll(Self);
end;

procedure TDM.tblElerhetosegekMastDetBeforePost(DataSet: TDataSet);
begin
  if FGetElerhetType = 'Vezetékes telefon' then
    DataSet.FieldByName('ElerhetosegTipus').AsInteger := 0
  else
    if FGetElerhetType = 'Mobil' then
      DataSet.FieldByName('ElerhetosegTipus').AsInteger := 1
    else
      DataSet.FieldByName('ElerhetosegTipus').AsInteger := 2;
end;

procedure TDM.tblElerhetosegekMastDetCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('ElerhetosegTipus').AsInteger = 0 then
    DataSet.FieldByName('ElerhetosegTipusTxt').AsString := 'Vezetékes telefon'
  else
    if DataSet.FieldByName('ElerhetosegTipus').AsInteger = 1 then
      DataSet.FieldByName('ElerhetosegTipusTxt').AsString := 'Mobil'
    else
      DataSet.FieldByName('ElerhetosegTipusTxt').AsString := 'Email';
end;

procedure TDM.tblLakcimekMastDetAfterScroll(DataSet: TDataSet);
begin
  if Assigned(FLakcimScroll) then
    FLakcimScroll(Self);
end;

procedure TDM.tblLakcimekMastDetBeforePost(DataSet: TDataSet);
begin
  if FGetCimType = 'Állandó' then
    DataSet.FieldByName('CimTipus').AsInteger := 0
  else
    DataSet.FieldByName('CimTipus').AsInteger := 1;
end;

procedure TDM.tblLakcimekMastDetCalcFields(DataSet: TDataSet);
begin
  if DataSet.FieldByName('CimTipus').AsInteger = 0 then
    DataSet.FieldByName('CimTipusTxt').AsString := 'Állandó'
  else
    DataSet.FieldByName('CimTipusTxt').AsString := 'Tartózkodási';
end;

procedure TDM.DataImport(asFile: String);
var
  lTSFileData: TStringList;
  i: Integer;
  lsVezeteknev: String;
  lsKeresztnev: String;
  lsSzemelyiAzon: String;
  lsLakcimAzon: String;
  lsCimTipus: String;
  liCimTipus: Byte;
  lsIranyitoSzam: String;
  lsTelepules: String;
  lsUtca: String;
  lsHazszam: String;
  lsElerhetosegTipus: String;
  liElerhetosegTipus: Byte;
  lsElerhetoseg: String;
begin
  CloseOpen;
  lTSFileData := TStringList.Create;
  lTSFileData.LoadFromFile(asFile);

  for i := 1 to lTSFileData.Count - 1 do
  begin
    lsVezeteknev := GetCSVData(lTSFileData.Strings[i],1,';');
    lsKeresztnev := GetCSVData(lTSFileData.Strings[i],2,';');
    lsSzemelyiAzon := GetCSVData(lTSFileData.Strings[i],3,';');
    lsLakcimAzon := GetCSVData(lTSFileData.Strings[i],4,';');
    if not tblSzemelyiAdatok.Locate('Vezeteknev;Keresztnev;SzemelyiAzon;LakcimAzon',
                                    VarArrayOf([lsVezeteknev,lsKeresztnev,lsSzemelyiAzon,lsLakcimAzon]),[]) then
    begin
      tblSzemelyiAdatok.Append;
      tblSzemelyiAdatok.FieldByName('Vezeteknev').AsString := lsVezeteknev;
      tblSzemelyiAdatok.FieldByName('Keresztnev').AsString := lsKeresztnev;
      tblSzemelyiAdatok.FieldByName('SzemelyiAzon').AsString := lsSzemelyiAzon;
      tblSzemelyiAdatok.FieldByName('LakcimAzon').AsString := lsLakcimAzon;
      tblSzemelyiAdatok.Post;
    end;

    lsCimTipus := GetCSVData(lTSFileData.Strings[i],5,';');
    lsIranyitoSzam := GetCSVData(lTSFileData.Strings[i],6,';');
    lsTelepules := GetCSVData(lTSFileData.Strings[i],7,';');
    lsUtca := GetCSVData(lTSFileData.Strings[i],8,';');
    lsHazszam := GetCSVData(lTSFileData.Strings[i],9,';');
    if lsCimTipus = 'ALLANDO' then
      liCimTipus := 0
    else
      liCimTipus := 1;

    if not tblLakcimek.Locate('CimTipus;IranyitoSzam;Telepules;Utca;Hazszam;SzemelyiAdat_Id',
                              VarArrayOf([liCimTipus,
                                          lsIranyitoSzam,
                                          lsTelepules,
                                          lsUtca,
                                          lsHazszam,
                                          tblLakcimek.FieldByName('SzemelyiAdat_Id').AsInteger]),[]) then
    begin
      tblLakcimek.Append;
      tblLakcimek.FieldByName('CimTipus').AsInteger := liCimTipus;
      tblLakcimek.FieldByName('IranyitoSzam').AsString := lsIranyitoSzam;
      tblLakcimek.FieldByName('Telepules').AsString := lsTelepules;
      tblLakcimek.FieldByName('Utca').AsString := lsUtca;
      tblLakcimek.FieldByName('Hazszam').AsString := lsHazszam;
      tblLakcimek.FieldByName('SzemelyiAdat_Id').AsInteger := tblSzemelyiAdatok.FieldByName('Id').AsInteger;
      tblLakcimek.Post;
    end;

    lsElerhetosegTipus := GetCSVData(lTSFileData.Strings[i],10,';');
    lsElerhetoseg := GetCSVData(lTSFileData.Strings[i],11,';');

    if lsElerhetosegTipus = 'VEZETEKES' then
      liElerhetosegTipus := 0
    else
      if lsElerhetosegTipus = 'MOBIL' then
        liElerhetosegTipus := 1
      else
        liElerhetosegTipus := 2;

    if not tblElerhetosegek.Locate('ElerhetosegTipus;Elerhetoseg;SzemelyiAdat_Id',
                                    VarArrayOf([liElerhetosegTipus,lsElerhetoseg,tblLakcimek.FieldByName('SzemelyiAdat_Id').AsInteger]),[]) then
    begin
      tblElerhetosegek.Append;
      tblElerhetosegek.FieldByName('ElerhetosegTipus').AsInteger := liElerhetosegTipus;
      tblElerhetosegek.FieldByName('Elerhetoseg').AsString := lsElerhetoseg;
      tblElerhetosegek.FieldByName('SzemelyiAdat_Id').AsInteger := tblSzemelyiAdatok.FieldByName('Id').AsInteger;
      tblElerhetosegek.Post;
    end;

  end;

  lTSFileData.Free;
end;

procedure TDM.DataSetOpen;
begin
  tblSzemelyiAdatok.Open;
  tblLakcimek.Open;
  tblElerhetosegek.Open;
  tblLakcimekMastDet.Open;
  tblElerhetosegekMastDet.Open;
end;

function TDM.GetLakcimTip: Integer;
begin
  Result :=
  tblLakcimekMastDet.FieldByName('CimTipus').AsInteger;
end;

function TDM.GetElerhetTip: Integer;
begin
  Result :=
  tblElerhetosegekMastDet.FieldByName('ElerhetosegTipus').AsInteger;
end;

procedure TDM.CloseOpen;
begin
  tblSzemelyiAdatok.Close;
  tblLakcimek.Close;
  tblElerhetosegek.Close;
  tblLakcimekMastDet.Close;
  tblElerhetosegekMastDet.Close;

  tblSzemelyiAdatok.Open;
  tblLakcimek.Open;
  tblElerhetosegek.Open;
  tblLakcimekMastDet.Open;
  tblElerhetosegekMastDet.Open;
end;

end.
