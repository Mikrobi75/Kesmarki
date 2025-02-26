unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, uImport, uDM, uAdatKarb;

type
  TFrmMain = class(TForm)
    MainMenu: TMainMenu;
    mAdatok: TMenuItem;
    mAdatkarb: TMenuItem;
    mAdatImp: TMenuItem;
    mSzep: TMenuItem;
    mKilep: TMenuItem;
    Image: TImage;
    procedure mKilepClick(Sender: TObject);
    procedure mAdatImpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure mAdatkarbClick(Sender: TObject);
  private
    { Private declarations }
    FDM: TDM;
    FFrmImport: TFrmImport;
    FFrmAdatKarb: TFrmAdatKarb;
  public
    { Public declarations }
  end;

var
  FrmMain: TFrmMain;

implementation

{$R *.dfm}

procedure TFrmMain.FormCreate(Sender: TObject);
var
  lsConnText: String;
begin
  FDM := TDM.Create(Self);
  lsConnText := FDM.SetConnection;
  if lsConnText <> '' then
    Showmessage('Adatbázis csatlakozási hiba lépett fel. Hibaüzenet: ' + lsConnText)
  else
    FDM.DataSetOpen;
end;

procedure TFrmMain.mAdatImpClick(Sender: TObject);
begin
  FFrmImport := TFrmImport.Create(Self);
  FFrmImport.Init(FDM);
  FFrmImport.ShowModal;
  FFrmImport.Free;
end;

procedure TFrmMain.mAdatkarbClick(Sender: TObject);
begin
  FFrmAdatKarb := TFrmAdatKarb.Create(Self);
  FFrmAdatKarb.Init(FDM);
  FFrmAdatKarb.ShowModal;
  FFrmAdatKarb.Free;
end;

procedure TFrmMain.mKilepClick(Sender: TObject);
begin
  Close;
end;

end.
