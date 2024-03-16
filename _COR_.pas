unit _COR_;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, Buttons, Spin, Gauges, Menus, ComCtrls, _Numedit_;

type
  TCOR_ = class(TForm)
    Panel1: TPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    Edit1: TEdit;
    Panel2: TPanel;
    CheckBox1: TCheckBox;
    CheckBox3: TCheckBox;
    SpinEdit1: TSpinEdit;
    Label1: TLabel;
    Panel3: TPanel;
    Panel6: TPanel;
    Panel8: TPanel;
    Panel7: TPanel;
    ListBox1: TListBox;
    Panel9: TPanel;
    ListBox2: TListBox;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Panel10: TPanel;
    Gauge1: TGauge;
    GroupBox1: TGroupBox;
    Splitter2: TSplitter;
    ListBox3: TListBox;
    ListBox4: TListBox;
    Panel4: TPanel;
    Panel5: TPanel;
    MainMenu1: TMainMenu;
    Cautare1: TMenuItem;
    Meserii1: TMenuItem;
    Coduri1: TMenuItem;
    N1: TMenuItem;
    Cautare2: TMenuItem;
    N2: TMenuItem;
    Iesire1: TMenuItem;
    CheckBox2: TCheckBox;
    Label2: TLabel;
    Label3: TLabel;
    Editare1: TMenuItem;
    Moddecautare1: TMenuItem;
    Cheiedecautare1: TMenuItem;
    N3: TMenuItem;
    Cod1: TMenuItem;
    Ocupatie1: TMenuItem;
    N4: TMenuItem;
    Literemarimici1: TMenuItem;
    Cuvantinfraza1: TMenuItem;
    Restrictionarecautare1: TMenuItem;
    Panel11: TPanel;
    BitBtn1: TBitBtn;
    StatusBar1: TStatusBar;
    NumEdit1: TNumEdit;
    Informatii1: TMenuItem;
    Ajutor1: TMenuItem;
    Versiune1: TMenuItem;
    N5: TMenuItem;
    Dreptdeautor1: TMenuItem;
    Vizualizare1: TMenuItem;
    Istoric1: TMenuItem;
    procedure RadioButton1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure Meserii1Click(Sender: TObject);
    procedure Coduri1Click(Sender: TObject);
    procedure Iesire1Click(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure Moddecautare1Click(Sender: TObject);
    procedure Cheiedecautare1Click(Sender: TObject);
    procedure Cod1Click(Sender: TObject);
    procedure Ocupatie1Click(Sender: TObject);
    procedure Literemarimici1Click(Sender: TObject);
    procedure Cuvantinfraza1Click(Sender: TObject);
    procedure Restrictionarecautare1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Dreptdeautor1Click(Sender: TObject);
    procedure Ajutor1Click(Sender: TObject);
    procedure Versiune1Click(Sender: TObject);
    procedure Istoric1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  COR_: TCOR_;

implementation

uses _About_, _Istoric_, _Cautari_;

{$R *.DFM}

Function AddSpace(s:String;i:Integer;AliniereDreapta:Boolean):String;
Begin
  If Length(s)<i Then
    Begin
      While Length(s)<i Do
        Begin
          If AliniereDreapta Then
            s:=' '+s
          Else
            s:=s+' ';
        End;
    End;
  Result:=s;
End;

Function VerificareNumere(Cuvant,SirCautat:String;c:Char):Boolean;
Begin
  Result:=((c='<') And (StrToInt(Cuvant)<StrToInt(SirCautat))) Or
          ((c='=') And (StrToInt(Cuvant)=StrToInt(SirCautat))) Or
          ((c='>') And (StrToInt(Cuvant)>StrToInt(SirCautat)));
End;

Function Extragere(t:String;i:Integer;b:Boolean):String;
Var s:string;
Begin
  s:=t;
  If b Then
    Delete(s,Length(s)-i+1,Length(s))
  Else
    Delete(s,1,Length(s)-i);
  Extragere:=s;
End;

Function LaInceputLaSfarsit(Cuvant,SirCautat:String;CaseSensitive,LaInceput:Boolean):Boolean;
Begin
  If Length(Cuvant)<Length(SirCautat) Then
    Result:=False
  Else
    Begin
      If Not CaseSensitive Then
        Begin
          Cuvant:=UpperCase(Cuvant);
          SirCautat:=UpperCase(SirCautat);
        End;
      If LaInceput Then
        If Extragere(Cuvant,Length(Cuvant)-Length(SirCautat),LaInceput)=SirCautat Then
          Result:=True
        Else
          Result:=False
      Else
        If Extragere(Cuvant,Length(SirCautat),LaInceput)=SirCautat Then
          Result:=True
        Else
          Result:=False;
    End;
End;

Function ContineSirul(Cuvant,SirCautat:String;CaseSensitive,EntireWord:Boolean):Boolean;
Var i,j,k:Integer;
Begin
  If EntireWord Then
    Begin
      Cuvant   :=' '+Cuvant   +' ';
      SirCautat:=' '+SirCautat+' ';
    End;
  If Not CaseSensitive Then
    Begin
      Cuvant:=UpperCase(Cuvant);
      SirCautat:=UpperCase(SirCautat);
    End;
  j:=1;
  k:=1;
  Result:=False;
  If (Cuvant='') And (SirCautat='') Then
    Result:=False
  Else
    Begin
      If Cuvant='' Then
        Result:=False
      Else
        If SirCautat='' Then
          Result:=True
        Else
          For i:=1 To Length(Cuvant) Do
            Begin
              If Cuvant[i]=SirCautat[j] Then
                Begin
                  If j=1 Then
                    k:=i;
                  If i<>j+k-1 Then
                    j:=0;
                  Inc(j);
                  If j>Length(SirCautat) Then
                    Begin
                      Result:=True;
                      Break;
                    End;
                End
              Else
                j:=1;
            End;
    End;
End;

procedure TCOR_.RadioButton1Click(Sender: TObject);
begin
  Edit1    .Enabled:=RadioButton1.Checked;
  ComboBox1.Enabled:=RadioButton1.Checked;
  If RadioButton1.Checked Then
    Begin
      Edit1    .Color:=clWindow;
      ComboBox1.Color:=clWindow;
      Try ComboBox1.SetFocus Except End;
    End
  Else
    Begin
      Edit1    .Color:=clBtnFace;
      ComboBox1.Color:=clBtnFace;
    End;
  NumEdit1 .Enabled:=RadioButton2.Checked;
  ComboBox2.Enabled:=RadioButton2.Checked;
  If RadioButton2.Checked Then
    Begin
      NumEdit1 .Color:=clWindow;
      ComboBox2.Color:=clWindow;
      Try ComboBox2.SetFocus Except End;
    End
  Else
    Begin
      NumEdit1 .Color:=clBtnFace;
      ComboBox2.Color:=clBtnFace;
    End;
  CheckBox1.Enabled:=RadioButton1.Checked;    
  CheckBox2.Enabled:=RadioButton1.Checked;  
  BitBtn1.Enabled:=(RadioButton1.Checked And (Edit1   .Text<>'')) Or
                   (RadioButton2.Checked And (NumEdit1.Text<>''));
  Cautare2.Enabled:=BitBtn1.Enabled;
end;

procedure TCOR_.CheckBox3Click(Sender: TObject);
begin
  SpinEdit1.Enabled:=CheckBox3.Checked;
  If SpinEdit1.Enabled Then
    Try SpinEdit1.SetFocus Except End;
end;

procedure TCOR_.FormCreate(Sender: TObject);
begin
  Gauge1.Progress:=100;
  Panel4.Caption:=IntToStr(ListBox3.Items.Capacity)+' coduri si '+
                  IntToStr(ListBox4.Items.Capacity)+' meserii';
  RadioButton1Click(Sender);
  ComboBox1.ItemIndex:=0;
  ComboBox2.ItemIndex:=0;
  ListBox3 .ItemIndex:=0;
  ListBox4 .ItemIndex:=0;
  ListBox3Click(Sender);
  StatusBar1.Panels[0].Text:='   Clasificarea Ocupatiilor din Romania';
  StatusBar1.Panels[1].Text:='   '+IntToStr(ListBox3.Items.Capacity)+' coduri de meserii';
  StatusBar1.Panels[2].Text:='   26 septembrie 2007, linii cod sursa: 482';
end;

procedure TCOR_.ListBox3Click(Sender: TObject);
begin
  Panel5.Caption:=IntToStr(ListBox3.ItemIndex+1)+' - '+IntToStr(ListBox4.ItemIndex+1);
end;

procedure TCOR_.Edit1Change(Sender: TObject);
begin
  BitBtn1.Enabled:=(RadioButton1.Checked And (Edit1   .Text<>'')) Or
                   (RadioButton2.Checked And (StrToInt(NumEdit1.Text)>=0));
  Cautare2.Enabled:=BitBtn1.Enabled;                 
end;

procedure TCOR_.BitBtn1Click(Sender: TObject);
Var i:Integer;
begin
  Gauge1.Progress:=100;                                                         ///***
  Gauge1.BackColor:=clActiveCaption;                                            ///***
  ListBox1.Clear;
  ListBox2.Clear;
  For i:=1 To ListBox3.Items.Capacity Do
    Begin
      Gauge1.Progress:=100-Round(i*100/ListBox3.Items.Capacity);                ///***
      //  CAUTARE MESERII
      If (RadioButton1.Checked) And (ComboBox1.ItemIndex=0) Then //meseria contine sirul
        If (ContineSirul(ListBox4.Items[i-1],Edit1.Text,Not CheckBox1.Checked,CheckBox2.Checked)) Then
          Begin
            ListBox1.Items.Add(ListBox3.Items[i-1]);
            ListBox2.Items.Add(ListBox4.Items[i-1]);
            If (CheckBox3.Checked) And (ListBox1.Items.Capacity>=SpinEdit1.Value) Then
              Break;
          End;
      If (RadioButton1.Checked) And ((ComboBox1.ItemIndex=1) Or (ComboBox1.ItemIndex=2)) Then //meseria incepe/se termina cu sirul
        Begin
          //case sensitive
          If LaInceputLaSfarsit(ListBox4.Items[i-1],Edit1.Text,Not CheckBox1.Checked,ComboBox1.ItemIndex=1) Then
            Begin
              ListBox1.Items.Add(ListBox3.Items[i-1]);
              ListBox2.Items.Add(ListBox4.Items[i-1]);
              If (CheckBox3.Checked) And (ListBox1.Items.Capacity>=SpinEdit1.Value) Then
                Break;
            End;
        End;
      // CAUTARE COD
      If (RadioButton2.Checked) And (ComboBox2.ItemIndex=0) Then //codul contine sirul
        If (ContineSirul(ListBox3.Items[i-1],NumEdit1.Text,Not CheckBox1.Checked,CheckBox2.Checked)) Then
          Begin
            ListBox1.Items.Add(ListBox3.Items[i-1]);
            ListBox2.Items.Add(ListBox4.Items[i-1]);
            If (CheckBox3.Checked) And (ListBox1.Items.Capacity>=SpinEdit1.Value) Then
              Break;
          End;
      If (RadioButton2.Checked) And ((ComboBox2.ItemIndex=1) Or (ComboBox2.ItemIndex=2)) Then //codul incepe/se termina cu sirul
        Begin
          //case sensitive
          If LaInceputLaSfarsit(ListBox3.Items[i-1],NumEdit1.Text,Not CheckBox1.Checked,ComboBox2.ItemIndex=1) Then
            Begin
              ListBox1.Items.Add(ListBox3.Items[i-1]);
              ListBox2.Items.Add(ListBox4.Items[i-1]);
              If (CheckBox3.Checked) And (ListBox1.Items.Capacity>=SpinEdit1.Value) Then
                Break;
            End;
        End;
      If (RadioButton2.Checked) And (ComboBox2.ItemIndex>=3) Then
        If (VerificareNumere(ListBox3.Items[i-1],NumEdit1.Text,'<') And (ComboBox2.ItemIndex=3)) Or
           (VerificareNumere(ListBox3.Items[i-1],NumEdit1.Text,'=') And (ComboBox2.ItemIndex=4)) Or
           (VerificareNumere(ListBox3.Items[i-1],NumEdit1.Text,'>') And (ComboBox2.ItemIndex=5)) Then
          Begin
            ListBox1.Items.Add(ListBox3.Items[i-1]);
            ListBox2.Items.Add(ListBox4.Items[i-1]);
            If (CheckBox3.Checked) And (ListBox1.Items.Capacity>=SpinEdit1.Value) Then
              Break;
          End;
    End;
  Panel7.Caption:='   [F6] - Cod - '+IntToStr(ListBox1.Items.Capacity);
  Panel9.Caption:='   [F7] - Ocupatie - '+IntToStr(ListBox2.Items.Capacity);
  ListBox1.ItemIndex:=0;
  ListBox1Click(Sender);
  Gauge1.BackColor:=clBtnFace;                                                  ///***
  If Edit1.Enabled Then
    Cautari_.ListBox1.Items.Add(AddSpace(IntToStr(ListBox1.Items.Capacity),4,True)+' = '+
                                AddSpace(ComboBox1.Items[ComboBox1.ItemIndex],25,False)+
                                ': "'+Edit1.Text+'"');
  If NumEdit1.Enabled Then
    Cautari_.ListBox1.Items.Add(AddSpace(IntToStr(ListBox1.Items.Capacity),4,True)+' = '+
                                AddSpace(ComboBox2.Items[ComboBox2.ItemIndex],25,False)+
                                ': "'+NumEdit1.Text+'"');
end;

procedure TCOR_.Meserii1Click(Sender: TObject);
begin
  RadioButton1.Checked:=True;
  RadioButton1Click(Sender);
end;

procedure TCOR_.Coduri1Click(Sender: TObject);
begin
  RadioButton2.Checked:=True;
  RadioButton1Click(Sender);
end;

procedure TCOR_.Iesire1Click(Sender: TObject);
begin
  Close;
end;

procedure TCOR_.ListBox1Click(Sender: TObject);
begin
  ListBox2.ItemIndex:=ListBox1.ItemIndex;
  ListBox2.TopIndex :=ListBox1.TopIndex;
end;

procedure TCOR_.ListBox2Click(Sender: TObject);
begin
  ListBox1.ItemIndex:=ListBox2.ItemIndex;
  ListBox1.TopIndex :=ListBox2.TopIndex;
end;

procedure TCOR_.Moddecautare1Click(Sender: TObject);
begin
  If ComboBox1.Enabled Then
    ComboBox1.SetFocus;
  If ComboBox2.Enabled Then
    ComboBox2.SetFocus;
end;

procedure TCOR_.Cheiedecautare1Click(Sender: TObject);
begin
  If Edit1.Enabled Then
    Edit1.SetFocus;
  If NumEdit1.Enabled Then
    NumEdit1.SetFocus;
end;

procedure TCOR_.Cod1Click(Sender: TObject);
begin
  ListBox1.SetFocus;
end;

procedure TCOR_.Ocupatie1Click(Sender: TObject);
begin
  ListBox2.SetFocus;
end;

procedure TCOR_.Literemarimici1Click(Sender: TObject);
begin
  CheckBox1.Checked:=Not CheckBox1.Checked;
  CheckBox1.SetFocus;
end;

procedure TCOR_.Cuvantinfraza1Click(Sender: TObject);
begin
  CheckBox2.Checked:=Not CheckBox2.Checked;
  CheckBox2.SetFocus;
end;

procedure TCOR_.Restrictionarecautare1Click(Sender: TObject);
begin
  CheckBox3.Checked:=Not CheckBox3.Checked;
  CheckBox3Click(Sender);
  CheckBox3.SetFocus;
end;

procedure TCOR_.FormResize(Sender: TObject);
begin
  If Width <=640 Then Width :=640;
  If Height<=480 Then Height:=480;
  Edit1.Width:=Panel11.Left-Edit1.Left;    //238=511-272
  NumEdit1.Width:=Edit1.Width;
end;

procedure TCOR_.CheckBox2Click(Sender: TObject);
begin
//  MessageDlg('Nedisponibil deocamdata!',mtInformation,[mbOk],0);
//  deocamdata l-am facut sa mearga, dar fara semne de punctuatie
//  distinge cuvant in fraza daca e incadrat de spatii: " "
end;

procedure TCOR_.Dreptdeautor1Click(Sender: TObject);
begin
  About_.ShowModal;
end;

procedure TCOR_.Ajutor1Click(Sender: TObject);
begin
  Istoric_.RadioButton2.Checked:=True;
  Istoric_.ShowModal;
end;

procedure TCOR_.Versiune1Click(Sender: TObject);
begin
  Istoric_.RadioButton1.Checked:=True;
  Istoric_.ShowModal;
end;

procedure TCOR_.Istoric1Click(Sender: TObject);
begin
  Cautari_.ShowModal;
end;

end.
