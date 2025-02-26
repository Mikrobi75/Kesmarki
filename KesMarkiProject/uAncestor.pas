unit uAncestor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDM;

type
  TFrmAncestor = class(TForm)
  protected
    FDM: TDM;
  public
    procedure Init(aDM: TDM);virtual;
  end;

implementation

{$R *.dfm}

procedure TFrmAncestor.Init(aDM: TDM);
begin
  FDM := aDM;
end;

end.
