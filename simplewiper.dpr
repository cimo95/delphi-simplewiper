program simplewiper;

uses
  Forms,
  uutama in 'uutama.pas' {f0};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Simple Wiper';
  Application.CreateForm(Tf0, f0);
  Application.Run;
end.
