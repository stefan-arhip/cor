unit _About_;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ShellAPI, Dialogs, Menus;

type
  TAbout_ = class(TForm)
    OKButton: TButton;
    Panel2: TPanel;
    ProgramIcon: TImage;
    ProductName: TLabel;
    Version: TLabel;
    Copyright: TLabel;
    Comments: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Panel1: TPanel;
    Label3: TLabel;
    MainMenu1: TMainMenu;
    Iesire1: TMenuItem;
    procedure OKButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Label2Click(Sender: TObject);
    procedure ProgramIconClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Iesire1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  About_: TAbout_;

implementation

{$R *.DFM}

Procedure Executie (s:String);
  Var t:Array[0..79]Of Char;
  Begin
    StrPCopy(t,s);
    ShellExecute(0, Nil, t, Nil, Nil, SW_NORMAL);
  End;

procedure TAbout_.OKButtonClick(Sender: TObject);
begin
  About_.Close;
end;

procedure TAbout_.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OKButtonClick(Sender);
end;

procedure TAbout_.Label2Click(Sender: TObject);
begin
//  PermiteIesirea:=False;
  If MessageDlg('Se confirma descarcarea de pe Internet'+#13+
                'a ultimei versiuni Algogen?',mtInformation,
                [mbYes,mbNo],0)=mrYes Then
    Begin
      Executie ('http:\\'+Label2.Caption);
      Label2.Font.Color:=clRed;
    End;
//  PermiteIesirea:=True;
end;

procedure TAbout_.ProgramIconClick(Sender: TObject);
begin
//  PermiteIesirea:=False;
  If MessageDlg('Se confirma trimiterea unui mesaj autorului?',
                mtInformation,[mbYes,mbNo],0)=mrYes Then
    Executie ('mailto:stedanarh@go.ro');
//  PermiteIesirea:=True;
end;

procedure TAbout_.FormActivate(Sender: TObject);
begin
//  Setari_.FormActivate(Sender);
//  Label1.Caption:=Setari_.Edit7.Text;
  Width:=305;
  Height:=232;
end;

procedure TAbout_.Iesire1Click(Sender: TObject);
begin
//  If PermiteIesirea Then
    Close;
end;

end.

