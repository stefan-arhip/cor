program COR;

uses
  Forms,
  _COR_ in '_COR_.pas' {COR_},
  _About_ in '_About_.pas' {About_},
  _Istoric_ in '_Istoric_.pas' {Istoric_},
  _Cautari_ in '_Cautari_.pas' {Cautari_};

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TCOR_, COR_);
  Application.CreateForm(TAbout_, About_);
  Application.CreateForm(TIstoric_, Istoric_);
  Application.CreateForm(TCautari_, Cautari_);
  Application.Run;
end.
