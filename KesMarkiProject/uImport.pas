unit uImport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, uDM, uAncestor;

type
  TFrmImport = class(TFrmAncestor)
    OpenDialog: TOpenDialog;
    btnOpen: TBitBtn;
    btnImport: TBitBtn;
    MemoFile: TMemo;
    procedure btnOpenClick(Sender: TObject);
    procedure btnImportClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    FFile: String;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TFrmImport.btnImportClick(Sender: TObject);
begin
  if FFile <> '' then
  begin
    FDM.DataImport(FFile);
    ShowMessage('Importálás befejezõdött');
  end
  else
    ShowMessage('Kérem válasszon fájlt az importhoz.');
end;

procedure TFrmImport.btnOpenClick(Sender: TObject);
begin
  OpenDialog.InitialDir := ExtractFilePath(Application.ExeName);
  OpenDialog.Execute();
  FFile := OpenDialog.FileName;
  MemoFile.Lines.LoadFromFile(FFile);
end;

procedure TFrmImport.FormCreate(Sender: TObject);
begin
  FFile := '';
end;

end.
