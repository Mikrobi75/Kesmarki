unit uAdatKarb;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uAncestor, uDM, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TFrmAdatKarb = class(TFrmAncestor)
    gridSzemelyiAdatok: TDBGrid;
    dbnavSzemAdat: TDBNavigator;
    edtVezetekNev: TDBEdit;
    edtKeresztnev: TDBEdit;
    edtSzemelyiAzon: TDBEdit;
    edtLakcimAzon: TDBEdit;
    pgLakCimElerhet: TPageControl;
    tsLakcim: TTabSheet;
    tsElerhetoseg: TTabSheet;
    gridLakcimek: TDBGrid;
    dbnavLakcim: TDBNavigator;
    cmbCimTip: TComboBox;
    lblVezetekNev: TLabel;
    lblKeresztnev: TLabel;
    lblSzemelyiAzon: TLabel;
    lblLakCimAzon: TLabel;
    lblCimTip: TLabel;
    lblIrszam: TLabel;
    edtIrszam: TDBEdit;
    lblTelepules: TLabel;
    edtTelepules: TDBEdit;
    lblUtca: TLabel;
    edtUtca: TDBEdit;
    lblHazszam: TLabel;
    edtHazszam: TDBEdit;
    dbnavElerhetoseg: TDBNavigator;
    gridElerhetosegek: TDBGrid;
    lblElerhetosegTip: TLabel;
    cmbElerhetosegTip: TComboBox;
    lblElerhetoseg: TLabel;
    edtElerhetoseg: TDBEdit;
    procedure FormCreate(Sender: TObject);
  private
    procedure LakCimScroll(Sender: TObject);
    function GetCimTip: String;
    procedure ElerhetScroll(Sender: TObject);
    function GetElerhetTip: String;
  public
    procedure Init(aDM: TDM);override;
  end;

implementation

{$R *.dfm}

procedure TFrmAdatKarb.FormCreate(Sender: TObject);
begin
  inherited;
  pgLakCimElerhet.ActivePageIndex := 0;
end;

procedure TFrmAdatKarb.LakCimScroll(Sender: TObject);
begin
  cmbCimTip.ItemIndex := FDM.GetLakcimTip;
end;

procedure TFrmAdatKarb.Init(aDM: TDM);
begin
  inherited Init(aDM);
  FDM.CloseOpen;
  FDM.FLakcimScroll := LakCimScroll;
  FDM.FGetCimType := GetCimTip;
  FDM.FElerhetScroll := ElerhetScroll;
  FDM.FGetElerhetType := GetElerhetTip;
  LakCimScroll(Self);
  ElerhetScroll(Self);
end;

function TFrmAdatKarb.GetCimTip: String;
begin
  Result := cmbCimTip.Text;
end;

procedure TFrmAdatKarb.ElerhetScroll(Sender: TObject);
begin
  cmbElerhetosegTip.ItemIndex := FDM.GetElerhetTip;
end;

function TFrmAdatKarb.GetElerhetTip: String;
begin
  Result := cmbElerhetosegTip.Text;
end;

end.
