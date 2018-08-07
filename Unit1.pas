unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    procedure FormPaint(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
 r, r2: TRect;

 sNoteText:string;
 sNoteLeng:integer;
 I:Integer;
 RPitch:Integer;
begin

    Canvas.Font.Size := 12;
    Canvas.Font.Name := '標楷體';
    Canvas.Font.Style := Canvas.Font.Style + [fsBold];
    Canvas.Pen.Width := 2;
    RPitch := 3;
    r := Rect(100, 50, 200, 200);
   for I := 0 to 5 do  begin
       sNoteLeng := r.Left;
       sNoteText := sNoteText +'加冰';
       DrawText(Canvas.Handle,PChar(sNoteText),Length(sNoteText),r, DT_LEFT  or DT_CALCRECT); //計算畫框範圍
       sNoteLeng := r.Right -sNoteLeng;
       r2 := Rect(r.Left - RPitch, r.Top - RPitch, r.Right + RPitch, r.Bottom + RPitch);
       Canvas.RoundRect(r2, (r2.Bottom - r2.Top)  div 3, (r2.Right  - r2.Left) div 3); //畫框
       //X, Y, X + DX, Y + DY, DX div 2, DY div 2
       DrawText(Canvas.Handle,PChar(sNoteText),Length(sNoteText),r,DT_LEFT ); //畫字
       r.Left := r.Left + sNoteLeng + RPitch*2 +4;
   end;

    sNoteText := '';
    Canvas.Font.Size := 12;
    Canvas.Font.Name := '標楷體';
    Canvas.Font.Style := Canvas.Font.Style + [fsBold];
    Canvas.Pen.Width := 2;
    RPitch := 3;
    r := Rect(100, r.Bottom + RPitch*2+10, 200, 200);
   for I := 0 to 5 do  begin
       sNoteLeng := r.Left;
       sNoteText := sNoteText +'加冰';
       DrawText(Canvas.Handle,PChar(sNoteText),Length(sNoteText),r, DT_LEFT  or DT_CALCRECT); //計算畫框範圍
       sNoteLeng := r.Right -sNoteLeng;
       r2 := Rect(r.Left - RPitch, r.Top - RPitch, r.Right + RPitch, r.Bottom + RPitch);
       Canvas.RoundRect(r2, 7, 7); //畫框
       DrawText(Canvas.Handle,PChar(sNoteText),Length(sNoteText),r,DT_LEFT ); //畫字
       r.Left := r.Left + sNoteLeng +RPitch*2 +4;
   end;

end;

procedure TForm1.Button2Click(Sender: TObject);
var
  X, Y, DX, DY: Integer;
begin
X := Random(Screen.Width - 10);
  Y := Random(Screen.Height - 10);
  Canvas.Pen.Color := Random(65535);
  Canvas.Pen.Width := Random(7);
  DX := Random(400);
  DY := Random(400);
  Canvas.RoundRect(X, Y, X + DX, Y + DY, DX div 2, DY div 2);
end;

procedure TForm1.FormPaint(Sender: TObject);
const
    S: array[0..3] of string = ('Hi! How are you?',
       'I am fine, thanks. How are you? How are your kids?',
       'Fine!',
       'Glad to hear that!');
      Colors: array[boolean] of TColor = (clMoneyGreen, clSkyBlue);
      Aligns: array[boolean] of integer = (DT_RIGHT, DT_LEFT);
var
  i, y, MaxWidth, RectWidth: integer;
  r, r2: TRect;
begin
  exit;
  y := 10;
  MaxWidth := ClientWidth div 2;

  for i := low(S) to high(S) do begin

    Canvas.Brush.Color := Colors[Odd(i)];
    r := Rect(10, y, MaxWidth, 16);
    DrawText(Canvas.Handle,PChar(S[i]),Length(S[i]),r, Aligns[Odd(i)] or DT_WORDBREAK or DT_CALCRECT);

    if not Odd(i) then
    begin
      RectWidth := r.Right - r.Left;
      r.Right := ClientWidth - 10;
      r.Left := r.Right - RectWidth;
    end;

    r2 := Rect(r.Left - 4, r.Top - 4, r.Right + 4, r.Bottom + 4);
    Canvas.RoundRect(r2, 5, 5);

    DrawText(Canvas.Handle,PChar(S[i]),Length(S[i]),r,Aligns[Odd(i)] or DT_WORDBREAK);

    y := r.Bottom + 10;

  end;
end;

end.
