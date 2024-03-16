unit _Numedit_;

interface

uses
    StdCtrls, Classes, SysUtils;

type
  TNumEdit = class(TEdit)
  private
    PreviousText: string;
  public
    HasValidNumber: boolean;
    Value         : Longint;
    constructor Create(AOwner: TComponent); override;
    procedure Change; override;
    procedure KeyPress(var Key: Char); override;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TNumEdit]);
end;

constructor TNumEdit.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Text:= '';
  PreviousText:= '';
end;

procedure TNumEdit.KeyPress(var Key: Char);
begin
   PreviousText:= Text;
   inherited KeyPress(Key);
end;

procedure TNumEdit.Change;
begin
   HasValidNumber:=  True;
   try
     Value:= Abs(StrToInt(Text));
   except
     Value:= 0;
     HasValidNumber:=  False;
//     if (*(Text <> '-') and*) (Length(Text) > 0) then
       Text:= PreviousText;
   end;
   inherited Change;
end;

end.
