unit SETIstatsU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IniFiles, ComCtrls, ExtCtrls, DateUtils, TrayIcon,
  Menus, Math, jpeg;

type
  TMainForm = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    SETIdir: TEdit;
    name: TEdit;
    email: TEdit;
    url: TEdit;
    Showname: TCheckBox;
    Showemail: TCheckBox;
    country: TEdit;
    postalcode: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    wur: TEdit;
    Label3: TLabel;
    wus: TEdit;
    lwur: TEdit;
    lwus: TEdit;
    regged: TEdit;
    cputime: TEdit;
    Label4: TLabel;
    Timer1: TTimer;
    Label5: TLabel;
    clive: TEdit;
    id: TEdit;
    GroupBox3: TGroupBox;
    wuname: TEdit;
    timerec: TEdit;
    receiver: TEdit;
    CheckBox1: TCheckBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    positions: TListBox;
    Timer2: TTimer;
    SETIdirn: TComboBox;
    AddPathButton: TButton;
    DelPathButton: TButton;
    Label10: TLabel;
    PageControl1: TPageControl;
    AnalSheet: TTabSheet;
    MultiWUSheet: TTabSheet;
    cliru: TLabel;
    prog: TProgressBar;
    progn: TEdit;
    prog2: TProgressBar;
    Label9: TLabel;
    ccputime: TEdit;
    Mark25: TLabel;
    Mark100: TLabel;
    Mark50: TLabel;
    Mark75: TLabel;
    ShiftRate: TEdit;
    FFTlen: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    PrefsSheet: TTabSheet;
    TrayIcon: TTrayIcon;
    PopupMenu: TPopupMenu;
    ShowHideItem: TMenuItem;
    ExitItem: TMenuItem;
    N1: TMenuItem;
    WUdld: TEdit;
    Label13: TLabel;
    Label14: TLabel;
    TimeGone: TEdit;
    Label15: TLabel;
    Refresh: TEdit;
    Label16: TLabel;
    UpDown1: TUpDown;
    Label17: TLabel;
    SETIsap: TEdit;
    SETIsax: TEdit;
    Label18: TLabel;
    Label19: TLabel;
    AddParams: TEdit;
    Label20: TLabel;
    DebugLB: TListBox;
    Label21: TLabel;
    SkyCoord: TEdit;
    Label22: TLabel;
    SkyCoord2: TEdit;
    BaseFreq: TEdit;
    Label23: TLabel;
    CenterFreq: TEdit;
    Label24: TLabel;
    SampleRate: TEdit;
    Label25: TLabel;
    AngleRange: TEdit;
    Label26: TLabel;
    SkyMapSheet: TTabSheet;
    AnalButton: TButton;
    PID: TEdit;
    SkyMapButton: TButton;
    GroupBox4: TGroupBox;
    CuWU: TCheckBox;
    CWUwhat: TRadioButton;
    CWUwhat2: TRadioButton;
    CWUwhat3: TRadioButton;
    DMscroll: TCheckBox;
    DMallc: TCheckBox;
    GroupBox5: TGroupBox;
    HistWU: TCheckBox;
    HistShow1: TRadioButton;
    HistShow2: TRadioButton;
    HistShow3: TRadioButton;
    Crosses: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ShowemailClick(Sender: TObject);
    procedure ShownameClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure SETIdirnChange(Sender: TObject);
    procedure AddPathButtonClick(Sender: TObject);
    procedure DelPathButtonClick(Sender: TObject);
    procedure ExitItemClick(Sender: TObject);
    procedure ShowHideItemClick(Sender: TObject);
    procedure RefreshChange(Sender: TObject);
    procedure AnalButtonClick(Sender: TObject);
    procedure SkyMapButtonClick(Sender: TObject);
    procedure CuWUClick(Sender: TObject);
    procedure DMallcClick(Sender: TObject);
    procedure HistWUClick(Sender: TObject);
    procedure CWUwhatClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

type
  Tpath = record
    name: string;
    path: string;
  end;
  TOld = record
    wuname: string;
  end;

const
  ver: string = '1.0';
  fns: array[0..11] of string[20] = ('user_info.sah','version.sah','work_unit.sah',
                                     'state.sah','result_header.sah','outfile.sah',
                                     'pid.sah','lock.sah','key.sah','temp.sah',
                                     'result.sah','wtemp.sah');
  F_UI = 0;
  F_VE = 1;
  F_WU = 2;
  F_ST = 3;
  F_RH = 4;
  F_OU = 5;
  F_PI = 6;
  F_LO = 7;
  F_KE = 8;
  F_TE = 9;
  F_RE = 10;
  F_WT = 11;
  exitnow: boolean = false;
  exitinfoshown: boolean = false;
  dmsub: integer = 0;

var
  MainForm: TMainForm;
  paths: array[1..250] of Tpath;
  old: TOld;
  selpath: integer;
  showwin: boolean;
  dmsubn: array[0..250] of string[20];
  dmall: boolean;

  procedure DM(x: string);
  procedure DMin(x: string);
  procedure DMout;

implementation

uses SkymapU;

{$R *.dfm}

procedure DM(x: string);
var i,j: integer;
    y: string;
begin
  j := MainForm.DebugLB.TopIndex;
  y := '['+IntToStr(dmsub)+'] ';
  if (MainForm.DebugLB.Count>500) then begin
    MainForm.DebugLB.Items.Delete(0);
    if j>0 then Dec(j);
  end;
  if (dmsubn[dmsub]<>'') then y := y + dmsubn[dmsub]+': ';
  y := y + x;
  i := MainForm.DebugLB.Items.Add(y);
  if MainForm.DMscroll.Checked then MainForm.DebugLB.TopIndex := i else MainForm.DebugLB.TopIndex := j;
end;

procedure DMin(x: string);
var i: integer;
begin
  Inc(dmsub);
  DM(x+' called...');
  dmsubn[dmsub] := x;
  for i:=1 to Length(x) do begin
    if (x[i]=' ') or (x[i]='(') then begin
      dmsubn[dmsub] := Copy(x,0,i-1);
      Break;
    end;
  end;
end;

procedure DMout;
var x: string;
begin
  x := dmsubn[dmsub];
  dmsubn[dmsub] := '';
  DM(x+' done.');
  Dec(dmsub);
end;

procedure ReadINI;
var f: TIniFile;
    t: string;
    e,i: integer;
begin
  DMin('ReadINI');
  f := TIniFile.Create('.\SETIstats.ini');
  DM('reading general settings...');
  MainForm.CheckBox1.Checked := f.ReadBool('SETIstats','Alpha',false);
  showwin := f.ReadBool('SETIstats','Show',true);
  MainForm.Top := f.ReadInteger('SETIstats','WinTop',20);
  MainForm.Left := f.ReadInteger('SETIstats','WinLeft',20);
  MainForm.PageControl1.ActivePageIndex := f.ReadInteger('SETIstats','ActiveTab',0);
  i := f.ReadInteger('SETIstats','Refresh',10000);
  if (i>0) then begin
    MainForm.Timer1.Interval := i;
    MainForm.UpDown1.Position := Trunc(MainForm.Timer1.Interval / 1000);
    MainForm.Timer1.Enabled := true;
  end else begin
    MainForm.Timer1.Enabled := false;
    MainForm.UpDown1.Position := 0;
  end;
  MainForm.SETIsap.Text := f.ReadString('SETIstats','SETIsap','-stop_after_process');
  MainForm.SETIsax.Text := f.ReadString('SETIstats','SETIsax','-stop_after_xfer');
  MainForm.AddParams.Text := f.ReadString('SETIstats','SETIap','-verbose');
  exitinfoshown := f.ReadBool('SETIstats','ExitInfoShown',false);
  MainForm.DMscroll.Checked := f.ReadBool('SETIstats','DMscroll',true);
  MainForm.DMallc.Checked := f.ReadBool('SETIstats','DMall',false);
  DMall := MainForm.DMallc.Checked;
  DM('reading SkyMap settings...');
  MainForm.CuWU.Checked := f.ReadBool('SkyMap','ShowCurrent',true);
  i := f.ReadInteger('SkyMap','ShowCurrentOptions',1);
  if i=0 then MainForm.CWUwhat.Checked := true
    else if i=1 then MainForm.CWUwhat2.Checked := true
    else if i=2 then MainForm.CWUwhat3.Checked := true;
  MainForm.Crosses.Checked := f.ReadBool('SkyMap','ShowCrosses',true);
  MainForm.HistWU.Checked := f.ReadBool('SkyMap','ShowHistory',false);
  i := f.ReadInteger('SkyMap','ShowHistoryOptions',1);
  if i=0 then MainForm.HistShow1.Checked := true
    else if i=1 then MainForm.HistShow2.Checked := true
    else if i=2 then MainForm.HistShow3.Checked := true;
  DM('reading paths...');
  e := f.ReadInteger('Paths','Paths',0);
  MainForm.SETIdirn.Clear;
  for i:=1 to 250 do begin
    paths[i].name := '---';
    paths[i].path := '';
  end;
  for i:=1 to e do begin
    paths[i].name := f.ReadString('Paths','Path'+IntToStr(i)+'Name','---');
    paths[i].path := f.ReadString('Paths','Path'+IntToStr(i),'');
    MainForm.SETIdirn.Items.Add(paths[i].name);
  end;
  selpath := f.ReadInteger('Paths','Selected',0);
  if (paths[1].path <> '') AND (selpath<=0) then i:=1 else i:=selpath;
  MainForm.SETIdir.Text := paths[i].path;
  MainForm.SETIdirn.Text := paths[i].name;
  selpath := i;
  t := f.ReadString('SETIstats','Version',ver);
  if t<>ver then begin
    DM('Old INI realized. Trying to convert input...');
    ShowMessage('INI-file is from old version '+t+'. Migrating settings to '+ver+'...');
    DM('Old INI settings migrated.');
  end;
  DMout;
end;

procedure WriteINI;
var f: TIniFile;
    e,i: integer;
begin
  DMin('WriteINI');
  DM('writing general settings...');
  f := TIniFile.Create('.\SETIstats.ini');
  f.WriteString('SETIstats','Version',ver);
  f.WriteInteger('SETIstats','Refresh',MainForm.Timer1.Interval);
  f.WriteBool('SETIstats','Show',showwin);
  f.WriteInteger('SETIstats','WinTop',MainForm.Top);
  f.WriteInteger('SETIstats','WinLeft',MainForm.Left);
  f.WriteBool('SETIstats','Alpha',MainForm.CheckBox1.Checked);
  f.WriteInteger('SETIstats','ActiveTab',MainForm.PageControl1.ActivePageIndex);
  f.WriteString('SETIstats','SETIsap',MainForm.SETIsap.Text);
  f.WriteString('SETIstats','SETIsax',MainForm.SETIsax.Text);
  f.WriteString('SETIstats','SETIap',MainForm.AddParams.Text);
  f.WriteBool('SETIstats','ExitInfoShown',exitinfoshown);
  f.WriteBool('SETIstats','DMscroll', MainForm.DMscroll.Checked);
  f.WriteBool('SETIstats','DMall', DMall);
  DM('writing SkyMap settings...');
  f.WriteBool('SkyMap','ShowCurrent', MainForm.CuWU.Checked);
  i := 1;
  if MainForm.CWUwhat.Checked then i := 0
    else if MainForm.CWUwhat2.Checked then i := 1
    else if MainForm.CWUwhat3.Checked then i := 2;
  f.WriteInteger('SkyMap','ShowCurrentOptions',i);
  f.WriteBool('SkyMap','ShowCrosses', MainForm.Crosses.Checked);
  f.WriteBool('SkyMap','ShowHistory', MainForm.HistWU.Checked);
  i := 1;
  if MainForm.HistShow1.Checked then i := 0
    else if MainForm.HistShow2.Checked then i := 1
    else if MainForm.HistShow3.Checked then i := 2;
  f.WriteInteger('SkyMap','ShowHistoryOptions',i);
  DM('writing paths...');
  e := 0;
  f.EraseSection('Paths');
  for i:=1 to 250 do begin
    if (paths[i].path <> '') then begin
      Inc(e);
      f.WriteString('Paths','Path'+IntToStr(e)+'Name',paths[i].name);
      f.WriteString('Paths','Path'+IntToStr(e),paths[i].path);
      if (i=selpath) then begin
        f.WriteInteger('Paths','Selected',e);
      end;
    end;
  end;
  f.WriteInteger('Paths','Paths',e);
  DMout;
end;

function GFn(p,i:integer): string;
var t: string;
begin
  if DMall then DMin(Format('GFn(%d, %d)', [p,i]));
  t := paths[p].path + '\' + fns[i];
  GFn := t;
  if DMall then DMout;
end;

function GetKey(x: string): string;
var i: integer;
begin
  if DMall then DMin(Format('GetKey(''%s'')', [x]));
  for i:=1 to Length(x) do begin
    if x[i]='=' then Break;
  end;
  GetKey := Copy(x,1,i-1);
  if DMall then DMout;
end;

function GetValue(x: string): string;
var i: integer;
begin
  if DMall then DMin(Format('GetValue(''%s'')', [x]));
  for i:=1 to Length(x) do begin
    if x[i]='=' then Break;
  end;
  GetValue := Copy(x,i+1,Length(x)-i);
  if DMall then DMout;
end;

function GetData(g,x: string): string;
var f: TextFile;
    y: string;
begin
  if DMall then DMin(Format('GetData(''%s'', ''%s'')', [g,x]));
  if FileExists(g) then begin
    AssignFile(f,g);
    Reset(f);
    while not Eof(f) do begin
      ReadLn(f,y);
      if GetKey(y)=x then Break;
    end;
    CloseFile(f);
    GetData := GetValue(y);
  end else begin
    GetData := '##ERR##';
    if DMall then DM('Break!');
    if DMall then DMout;
    Exit;
  end;
  if DMall then DMout;
end;

function time2HMS(x: string): string;
var tim,s: extended;
    shms: string;
    ec,d,h,m: integer;
begin
  if DMall then DMin(Format('time2HMS(''%s'')', [x]));
  while Length(x)<2 do x := '0'+x;
  if (x[1]+x[2]<>'##') then begin
    Val(x,tim,ec);
    d := Trunc(tim) DIV 86400;
    h := Trunc(tim - d*86400) DIV 3600;
    m := Trunc(tim - d*86400 - h*3600) DIV 60;
    s := SimpleRoundTo(tim - d*86400 - h*3600 - m*60, -3);
    shms := Format('%.2ud %.2uh %.2um %.2u', [d, h, m, Trunc(s)]);
    if (Frac(s)<>0) then shms := shms + Format('.%.3u', [Round(Frac(s)*1000)]);
    shms := shms + 's';
    time2HMS := shms;
  end else time2HMS := x;
  if DMall then DMout;
end;

function JD2HMS(x: string; timeonly: boolean = false): string;
var jul: extended;
    sjul, shms: string;
    i,ec: integer;
    hms: TDateTime;
begin
  if DMall then DM(Format('JD2HMS(''%s'')',[x]));
  if (x[1]+x[2]<>'##') then begin
    for i:=2 to Length(x) do if x[i]=' ' then Break;
    sjul := Copy(x,1,i-1);
    shms := Copy(x,i+1,Length(x)-i);
    Val(sjul,jul,ec);
    hms := JulianDateToDateTime(jul);
    if NOT timeonly then DateTimeToString(shms,'ddd dd-mmm-yyyy hh:nn:ss',hms) else DateTimeToString(shms,'hh:nn:ss',hms);
    JD2HMS := shms;
  end else JD2HMS := x;
  if DMall then DMout;
end;

function FileLocked(x: integer): boolean;
var f: TextFile;
begin
  if DMall then DMin(Format('FileLocked(%d)', [x]));
  Assign(f,GFn(selpath,x));
  {$I-}
  Reset(f);
  Close(f);
  if (IOResult=103) AND (FileExists(GFn(selpath,F_VE))) then FileLocked := true else FileLocked := false;
  {$I+}
  if DMall then DMout;
end;

procedure SetState(tit: string; f,b: TColor);
begin
  if DMall then DMin(Format('SetState(''%s'', %d, %d)', [tit,f,b]));
  if (MainForm.cliru.Caption<>tit) then begin
    if DMall then DM('New state differs from current, setting new...');
    MainForm.cliru.Caption := tit;
    MainForm.cliru.Font.Color := f;
    MainForm.cliru.Color := b;
  end;
  if DMall then DMout;
end;

function GetPID: LongWord;
var f: TextFile;
    x: string;
    i,e: integer;
begin
  if DMall then DMin('GetPID');
  AssignFile(f,GFn(selpath, F_PI));
  {$I-}
  Reset(f);
  ReadLn(f,x);
  Close(f);
  if IOResult<>0 then x := '0';
  {$I+}
  Val(x,i,e);
  GetPID := i;
  if DMall then DM(Format('PID is %d', [i]));
  if DMall then DMout;
end;

procedure UpdateClientState;
var x: string;
begin
  if DMall then DMin('UpdateClientState');
  if (FileLocked(F_LO)) then begin
    MainForm.AnalButton.Caption := 'Stop client';
    Str(GetPID:0,x);
    MainForm.PID.Text := x;
    if (FileExists(GFn(selpath, F_RE))) then SetState('Sending WU',clBlack,clYellow)
      else if (FileExists(GFn(selpath, F_WT))) then SetState('Fetching new WU',clBlack,clYellow)
      else SetState('Client running',clBlack,clLime);
  end else begin
    MainForm.AnalButton.Caption := 'Start client';
    MainForm.PID.Text := '##ERR##';
    if (FileExists(GFn(selpath, F_RE))) then SetState('Workunit done',clBlack,clYellow)
      else if (FileExists(GFn(selpath, F_WT))) then SetState('New WU needed',clBlack,clYellow)
      else SetState('Client NOT running',clWhite,clRed);
  end;
  if DMall then DMout;
end;

procedure SetProg(x: string);
var r: real;
    k: string;
    i: integer;
begin
  if DMall then DMin(Format('SetProg(''%s'')',[x]));
  Val(x,r,i);
  r := r * 100;
  Str(r:7:3,k);
  MainForm.progn.Text := k + '%';
  if (r>=25) then MainForm.Mark25.Color := clLime else MainForm.Mark25.Color := clMedGray;
  if (r>=50) then MainForm.Mark50.Color := clLime else MainForm.Mark50.Color := clMedGray;
  if (r>=75) then MainForm.Mark75.Color := clLime else MainForm.Mark75.Color := clMedGray;
  if (r>=99) then MainForm.Mark100.Color := clLime else MainForm.Mark100.Color := clMedGray;
  i := Trunc(r * 100);
  MainForm.prog.Position := i;
  MainForm.prog2.Position := i;
  if DMall then DMout;
end;

procedure ReadStats;
var h,i,j: integer;
    k,l: string;
    fusr, fver, fwun: string;
begin
  DMin('ReadStats');
  fusr := GFn(selpath, F_UI);
  fver := GFn(selpath, F_VE);
  fwun := GFn(selpath, F_WU);

  MainForm.clive.Text := GetData(fver,'major_version')+'.'+GetData(fver,'minor_version');

  MainForm.id.Text := GetData(fusr,'id');
  MainForm.name.Text := GetData(fusr,'name');
  MainForm.email.Text := GetData(fusr,'email_addr');
  MainForm.url.Text := GetData(fusr,'url');
  MainForm.country.Text := GetData(fusr,'country');
  MainForm.postalcode.Text := GetData(fusr,'postal_code');
  if GetData(fusr,'show_name')='yes' then MainForm.Showname.Checked := true;
  if GetData(fusr,'show_email')='yes' then MainForm.Showemail.Checked := true;
  MainForm.regged.Text := JD2HMS(GetData(fusr,'register_time'));
  MainForm.wur.Text := GetData(fusr,'nwus');
  MainForm.wus.Text := GetData(fusr,'nresults');
  MainForm.lwur.Text := JD2HMS(GetData(fusr,'last_wu_time'));
  MainForm.lwus.Text := JD2HMS(GetData(fusr,'last_result_time'));
  MainForm.cputime.Text := time2HMS(GetData(fusr,'total_cpu'));

  MainForm.wuname.Text := GetData(fwun,'name');
  if (MainForm.wuname.Text<>old.wuname) then begin
    MainForm.timerec.Text := JD2HMS(GetData(fwun, 'time_recorded'));
    MainForm.receiver.Text := GetData(fwun, 'receiver');
    MainForm.positions.Clear;
    MainForm.positions.Items.Add(' Time        R.A.     Dec');
    Val(GetData(fwun, 'num_positions'),j,i);
    for i:=0 to j-1 do begin
      Str(i:0,k);
      k := GetData(fwun, 'coord'+k);
      l := JD2HMS(k,true)+' ';
      for h:=3 to Length(k) do if k[h]=' ' then Break;
      l := l + Copy(k,h+1,Length(k)-h);
      MainForm.positions.Items.Add(l);
    end;
    if (FileAge(fwun)>0) then DateTimeToString(k,'ddd dd-mmm-yyyy hh:nn:ss',FileDateToDateTime(FileAge(fwun))) else k := '##ERR##';
    MainForm.WUdld.Text := k;
    k := GetData(fwun, 'start_ra');
    if (k[1]+k[2]<>'##') then MainForm.SkyCoord.Text := k+' R.A., '+GetData(fwun, 'start_dec')+' Dec' else MainForm.SkyCoord.Text := k;
    k := GetData(fwun, 'end_ra');
    if (k[1]+k[2]<>'##') then MainForm.SkyCoord2.Text := GetData(fwun, 'end_ra')+' R.A., '+GetData(fwun, 'end_dec')+' Dec' else MainForm.SkyCoord2.Text := k;
    k := GetData(fwun, 'subband_base');
    if (k[1]+k[2]<>'##') then begin
      MainForm.SkyMapButton.Enabled := true;
      MainForm.BaseFreq.Text := k+' Hz';
      MainForm.CenterFreq.Text := GetData(fwun, 'subband_center')+' Hz';
      MainForm.SampleRate.Text := GetData(fwun, 'subband_sample_rate');
      MainForm.AngleRange.Text := GetData(fwun, 'angle_range');
    end else begin
      MainForm.SkyMapButton.Enabled := false;
      MainForm.BaseFreq.Text := k;
      MainForm.CenterFreq.Text := k;
      MainForm.SampleRate.Text := k;
      MainForm.AngleRange.Text := k;
    end;
  end;
  old.wuname := MainForm.wuname.Text;
  DMout;
end;

function SRS(x: string): string;
var r: real;
    ec: integer;
begin
  if DMall then DMin(Format('SRS(''%s'')', [x]));
  while Length(x)<2 do x := '0'+x;
  if x[1]+x[2]<>'##' then begin
    Val(x,r,ec);
    Str(r:0:6,x);
    SRS := x;
    if DMall then DM(Format('Result: ''%s''', [x]));
  end else SRS := x;
  if DMall then DMout;
end;

procedure ReadCState;
var fsta, fwun: string;
    k: string;
begin
  DMin('ReadCState');
  fsta := GFn(selpath, F_ST);
  fwun := GFn(selpath, F_WU);

  MainForm.wuname.Text := GetData(fwun,'name');
  if (MainForm.wuname.Text<>old.wuname) then begin
    ReadStats;
  end;
  MainForm.ccputime.Text := time2HMS(GetData(fsta, 'cpu'));
  SetProg(GetData(fsta, 'prog'));
  UpdateClientState;
  MainForm.ShiftRate.Text := SRS(GetData(fsta, 'cr'));
  MainForm.FFTlen.Text := GetData(fsta,'fl');
  if (FileAge(fwun)>0) then begin
    Str(SecondsBetween(now,FileDateToDateTime(FileAge(fwun))):0,k);
    MainForm.TimeGone.Text := time2HMS(k);
  end else begin
    MainForm.TimeGone.Text := '##ERR##';
  end;
  old.wuname := MainForm.wuname.Text;
  DMout;
end;

procedure TMainForm.FormCreate(Sender: TObject);
begin
  DMin('FormCreate');
  ReadINI;
  MainForm.CuWUClick(Sender);
  MainForm.HistWUClick(Sender);
  MainForm.Caption := 'SETI@home Statistics v'+ver+' --- (c)2002 by Markus Birth <mbirth@webwriters.de>';
  MainForm.AlphaBlend := MainForm.CheckBox1.Checked;
  ReadCState;
  if (showwin) then MainForm.Show;
  DMout;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DMin('FormClose');
  DM('saving INI...');
  WriteINI;
  DM('hideonly?...');
  if not exitnow then begin
    Action := caNone;
    if (showwin) then begin
      MainForm.Hide;
      DM('Window hidden.');
      showwin := false;
      DM('exitinfo?...');
      if not exitinfoshown then begin
        ShowMessage('Window hidden! To quit this application, select ''Exit'' in the tray icon menu.');
        exitinfoshown := true;
        DM('exitinfo shown.');
      end;
    end;
  end;
  DMout;
end;

procedure TMainForm.ShowemailClick(Sender: TObject);
begin
  Showemail.Checked := GetData(GFn(selpath,F_UI),'show_email')='yes';
end;

procedure TMainForm.ShownameClick(Sender: TObject);
begin
  Showname.Checked := GetData(GFn(selpath,F_UI),'show_name')='yes';
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
begin
  ReadCState;
end;

procedure TMainForm.CheckBox1Click(Sender: TObject);
begin
  DMin('SwitchAlphaBlend');
  MainForm.AlphaBlend := MainForm.CheckBox1.Checked;
  SkyMap.AlphaBlend := MainForm.CheckBox1.Checked;
  DMout;
end;

procedure TMainForm.Label1Click(Sender: TObject);
begin
  DMin('Note');
  Application.MessageBox('Don''t click here!','Erwischt!', MB_OK);
  DM('Please don''t click there again!');
  DMout;
end;

procedure TMainForm.Timer2Timer(Sender: TObject);
begin
  if MainForm.cliru.Color=clRed then MainForm.cliru.Color := clMaroon
    else if MainForm.cliru.Color=clMaroon then MainForm.cliru.Color := clRed;
  if MainForm.cliru.Color=clLime then MainForm.cliru.Color := clGreen
    else if MainForm.cliru.Color=clGreen then MainForm.cliru.Color := clLime;
  if MainForm.cliru.Color=clYellow then MainForm.cliru.Color := clOlive
    else if MainForm.cliru.Color=clOlive then MainForm.cliru.Color := clYellow;
end;

procedure TMainForm.SETIdirnChange(Sender: TObject);
var i: integer;
begin
  DMin('SETIdirnChanged');
  Timer1.Enabled := false;
  for i:=1 to 250 do if paths[i].name=MainForm.SETIdirn.Text then Break;
  if i<=250 then begin
    MainForm.SETIdir.Text := paths[i].path;
    selpath := i;
    ReadCState;
  end;
  Timer1.Enabled := true;
  DMout;
end;

procedure TMainForm.AddPathButtonClick(Sender: TObject);
var c,i: integer;
    t: string;
begin
  DMin('Add/EditPath');
  Timer1.Enabled := false;
  for i:=1 to 250 do begin
    if (paths[i].path=paths[selpath].path) AND (paths[i].name<>MainForm.SETIdirn.Text) then begin
      c := Application.MessageBox('Rename this entry? (Choose NO to create a new one.)','Confirm rename', MB_YESNO);
      if c=IDYES then begin
        DM(Format('Renaming ''%s'' to ''%s''...', [paths[i].name,MainForm.SETIdirn.Text]));
        paths[i].name := MainForm.SETIdirn.Text;
        selpath := i;
        WriteINI;
        ReadINI;
        ReadCState;
        DM('Rename done.');
        Break;
      end;
    end;
    if ((paths[i].path='') AND (paths[i].name='---')) OR (paths[i].name=MainForm.SETIdirn.Text) then begin
      t := paths[i].path;
      if InputQuery('Enter/Change directory','Enter the SETI@home path:',paths[i].path) then begin
        if (paths[i].path<>t) then begin
          paths[i].name := MainForm.SETIdirn.Text;
          selpath := i;
          WriteINI;
          ReadINI;
          ReadCState;
          Break;
        end else Break;
      end else Break;
    end;
  end;
  Timer1.Enabled := true;
  DMout;
end;

procedure TMainForm.DelPathButtonClick(Sender: TObject);
var j: integer;
begin
  DMin('DelButtonClick');
  Timer1.Enabled := false;
  j := Application.MessageBox('Do you really want to delete the currently selected entry?','Confirm deletion',MB_YESNO);
  if (j=IDYES) then begin
    DM(Format('Deleting ''%s''...', [paths[selpath].name]));
    paths[selpath].name := '---';
    paths[selpath].path := '';
    selpath := selpath-1;
    WriteINI;
    ReadINI;
    ReadCState;
    DM('Delete done.');
  end;
  Timer1.Enabled := true;
  DMout;
end;

procedure TMainForm.ExitItemClick(Sender: TObject);
begin
  DMin('Exit');
  exitnow := true;
  DM('Bye bye.');
  DMout;
  MainForm.Close;
end;

procedure TMainForm.ShowHideItemClick(Sender: TObject);
begin
  DMin('Show/HideClick');
  if (showwin) then begin
    DM('Window shown, hiding...');
    MainForm.Hide;
    showwin := false;
  end else begin
    DM('Window hidden, showing...');
    MainForm.Show;
    showwin := true;
    MainForm.BringToFront;
    MainForm.SetFocus;
  end;
  DMout;
end;

procedure TMainForm.RefreshChange(Sender: TObject);
var i,e: integer;
begin
  DMin('RefreshChanged');
  if (MainForm.Refresh.Text<>'0') then begin
    Val(MainForm.Refresh.Text, i, e);
    MainForm.Timer1.Interval := i * 1000;
    MainForm.Timer1.Enabled := true;
    DM(Format('New refresh rate set to %d.', [i*1000]));
  end else MainForm.Timer1.Enabled := false;
  DMout;
end;

procedure TMainForm.AnalButtonClick(Sender: TObject);
begin
  DMin('Start/StopClientClick');
  if (FileLocked(F_LO)) then begin
    // Stop client
    // TerminateProcess();
  end else begin
    // Start client
    // OpenProcess(, false,);
  end;
  DMout;
end;

procedure TMainForm.SkyMapButtonClick(Sender: TObject);
begin
  DMin('SkyMapButtonClicked');
  Application.CreateForm(TSkymap, Skymap);
  Skymap.Show;
  DMout;
end;

procedure TMainForm.CuWUClick(Sender: TObject);
begin
  DMin('CuWUClick');
  if CuWU.checked then begin
    DM('Now checked, activating sub-entries...');
    CWUwhat.Enabled := true;
    CWUwhat2.Enabled := true;
    CWUwhat3.Enabled := true;
  end else begin
    DM('Now unchecked, deactivating sub-entries...');
    CWUwhat.Enabled := false;
    CWUwhat2.Enabled := false;
    CWUwhat3.Enabled := false;
  end;
  DMout;
end;

procedure TMainForm.DMallcClick(Sender: TObject);
begin
  DMall := MainForm.DMallc.Checked;
end;

procedure TMainForm.HistWUClick(Sender: TObject);
begin
  DMin('HistWUClick');
  if HistWU.checked then begin
    DM('Now checked, activating sub-entries...');
    HistShow1.Enabled := true;
    HistShow2.Enabled := true;
    HistShow3.Enabled := true;
  end else begin
    DM('Now unchecked, deactivating sub-entries...');
    HistShow1.Enabled := false;
    HistShow2.Enabled := false;
    HistShow3.Enabled := false;
  end;
  DMout;
end;

procedure TMainForm.CWUwhatClick(Sender: TObject);
begin
  DMin('CWUwhatClick');
  if (CWUwhat.Checked) OR (CWUwhat2.Checked) then begin
    DM('Activating cross-checkbox...');
    Crosses.Enabled := true;
  end else begin
    DM('Deactivating cross-checkbox...');
    Crosses.Enabled := false;
  end;
  DMout;
end;

end.

