unit SkymapU;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, jpeg, ExtCtrls, ComCtrls, ImgList, StdCtrls;

type
  TSkymap = class(TForm)
    Map: TImage;
    SkyStatus: TStatusBar;
    ClearButton: TButton;
    Blinker: TTimer;
    procedure MapMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ClearButtonClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

const
  MapWidthPx=964;
  MapHeightPx=478;

var
  Skymap: TSkymap;

implementation

uses SETIstatsU;

{$R *.dfm}

const
  Circleno: integer=0;

var
  Backup: TBitmap;

procedure SkyToXY(r,d: double; var x,y: integer);
begin
  if (r>12) then r:= r - 24;
  x := Round( (12-r) * MapWidthPx / 24);
  y := Round( (90-d) * MapHeightPx / 180);
end;

procedure XYToSky(x,y: integer; var r,d: double);
begin
  r := - ( x / MapWidthPx *  24 - 12 );
  if (r<0) then r := r + 24;
  d := - ( y / MapHeightPx * 180 - 90 );
end;

procedure MakeCircle(x,y: integer; c: TColor);
begin
  DMin(Format('MakeCircle(%d,%d)',[x,y]));
  with Skymap.Map.Canvas do begin
    Pen.Color := c;
    Brush.Style := bsClear;
    Ellipse(x-2,y-2,x+2,y+2);
  end;
  DMout;
end;

procedure MakeCross(x,y: integer; c: TColor);
begin
  DMin(Format('MakeCross(%d,%d)',[x,y]));
  with Skymap.Map.Canvas do begin
    Pen.Color := c;
    Pen.Width := 1;
    MoveTo(x,0);
    LineTo(x,MapHeightPx);
    MoveTo(0,y);
    LineTo(MapWidthPx,y);
  end;
  DMout;
end;

procedure TSkymap.MapMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var r,d: double;
begin
  XYToSky(x,y,r,d);
  SkyToXY(r,d,x,y);
  SkyStatus.Panels.Items[0].Text := FloatToStrF(r,ffFixed,5,3)+' R.A., '+FloatToStrF(d,ffFixed,5,3)+' Dec. ('+IntToStr(x)+';'+IntToStr(y)+')';
end;

procedure TSkymap.ClearButtonClick(Sender: TObject);
begin
  Skymap.Map.Picture.Assign(Backup);
end;

procedure Replace(var x: string; i,o: char);
var j: integer;
begin
  DMin(Format('Replace(''%s'', ''%s'', ''%s'')',[x,i,o]));
  for j:=1 to Length(x) do if x[j]=i then x[j]:=o;
  DMout;
end;

procedure ExtractRD(x: string; var r,d: double);
var i,j: integer;
begin
  DMin(Format('ExtractRD(''%s'')',[x]));
  Replace(x,'.',',');
  j := 0;
  for i:=1 to Length(x) do begin
    if x[i]='R' then begin
      r := StrToFloat(Copy(x,0,i-1));
      DM(Format('R.A.: %f',[r]));
      j := i+5;
    end;
    if x[i]='D' then begin
      d := StrToFloat(Copy(x,j,i-j-1));
      DM(Format('Dec: %f',[d]));
    end;
  end;
  DMout;
end;

procedure ExtractRD2(x: string; var r,d: double);
var i,j: integer;
begin
  DMin(Format('ExtractRD2(''%s'')',[x]));
  Replace(x,'.',',');
  j := 0;
  for i:=3 to Length(x)-1 do begin
    if (x[i]=' ') AND (x[i+1]<>' ') AND (j>0) then begin
      r := StrToFloat(Copy(x,j,i-j));
      j := i;
    end;
    if (x[i]=' ') AND (x[i+1]<>' ') AND (j=0) then j:=i;
  end;
  d := StrToFloat(Copy(x,j,Length(x)-j));
  DM(Format('Result: %f, %f', [r,d]));
  DMout;
end;

procedure TSkymap.FormCreate(Sender: TObject);
var r,d: double;
    i,x,y: integer;
begin
  DMin('Skymap.FormCreate');
  Backup := TBitmap.Create;
  Backup.Assign(Skymap.Map.Picture.Bitmap);
  if MainForm.HistWU.Checked then begin
    DMin('HistoryWUs is checked...');

    DMout;
  end;
  if MainForm.CuWU.Checked then begin
    DMin('CurrentWU is checked...');
    if MainForm.CWUwhat.Checked then begin
      ExtractRD(MainForm.SkyCoord.Text,r,d);
      SkyToXY(r,d,x,y);
      if MainForm.Crosses.Checked then MakeCross(x,y,clYellow) else MakeCircle(x,y,clLime);
    end else if MainForm.CWUwhat2.Checked then begin
      ExtractRD(MainForm.SkyCoord2.Text,r,d);
      SkyToXY(r,d,x,y);
      if MainForm.Crosses.Checked then MakeCross(x,y,clRed) else MakeCircle(x,y,clRed);
      ExtractRD(MainForm.SkyCoord.Text,r,d);
      SkyToXY(r,d,x,y);
      if MainForm.Crosses.Checked then MakeCross(x,y,clLime) else MakeCircle(x,y,clLime);
    end else if MainForm.CWUwhat3.Checked then begin
      with Skymap.Map.Canvas do begin
        Pen.Color := clYellow;
        Pen.Width := 2;
      end;
      for i:=1 to MainForm.positions.Items.Count-1 do begin
        ExtractRD2(MainForm.positions.Items.Strings[i],r,d);
        SkyToXY(r,d,x,y);
        // SkyMap.Map.Canvas.Pixels[x,y] := clYellow;
        if i=1 then Skymap.Map.Canvas.MoveTo(x,y) else Skymap.Map.Canvas.LineTo(x,y);
        // MakeCircle(x,y,clYellow);
      end;
    end;
    DMout;
  end;
  DMout;
end;

end.
