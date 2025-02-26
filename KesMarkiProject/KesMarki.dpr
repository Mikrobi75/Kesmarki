program KesMarki;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FrmMain},
  uImport in 'uImport.pas' {FrmImport},
  uDM in 'uDM.pas' {DM: TDataModule},
  uAncestor in 'uAncestor.pas' {FrmAncestor},
  uAdatKarb in 'uAdatKarb.pas' {FrmAdatKarb};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
