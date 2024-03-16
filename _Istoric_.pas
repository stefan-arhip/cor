unit _Istoric_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Menus;

type
  TIstoric_ = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    MainMenu1: TMainMenu;
    Meniuascuns1: TMenuItem;
    Iesire1: TMenuItem;
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Iesire1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Istoric_: TIstoric_;

implementation

{$R *.DFM}

procedure TIstoric_.RadioButton1Click(Sender: TObject);
begin
  Memo1.Visible:=True;
  Memo2.Visible:=False;
end;

procedure TIstoric_.RadioButton2Click(Sender: TObject);
begin
  Memo1.Visible:=False;
  Memo2.Visible:=True;
end;

procedure TIstoric_.FormShow(Sender: TObject);
begin
  If RadioButton1.Checked Then
    RadioButton1Click(Sender); //selecteaza informatiile despre aplicatie
  If RadioButton2.Checked Then
    RadioButton2Click(Sender); //       sau istoricul realizarii acesteia
end;

procedure TIstoric_.Iesire1Click(Sender: TObject);
begin
  Istoric_.Close;
end;

end.
