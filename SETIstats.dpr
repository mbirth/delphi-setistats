program SETIstats;

uses
  Forms,
  SETIstatsU in 'SETIstatsU.pas' {MainForm},
  SkymapU in 'SkymapU.pas' {Skymap};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SETI@home Statistics';
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TSkymap, Skymap);
  Application.ShowMainForm := false;
  Application.Run;
end.
