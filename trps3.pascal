program Project5;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
type

  tpo = ^tn;



  tn = record

    x: real;

    p1, p2: tpo;

  end;

var

  s, b: tpo;

  f, k: pointer;

  i, n, x, dd: integer;

  z: real;
    P1,P2: TDateTime;  // вспомогательные переменные
       H1,M1,S1,Ms1,H2,M2,S2,Ms2:word;
begin

   P1:= Now; // фиксация времени начала
   DecodeTime(P1, H1, M1, S1, Ms1);
  n := 6;

  dd := 9;

  {Создание списка}

  new(s);

  randomize;
               Writeln('Прямой вывод: ');
  z := random(100) - 50;

  s^.x := z;

  writeln(s^.x: 1: 1);

  f := s;

  s^.p2 := nil;

  for i := 1 to n - 1 do

  begin

    new(b);

    z := random(100) - 50;

    b^.x := z;

    writeln(b^.x: 1: 1);

    s^.p1 := b;

    b^.p2 := s;

    s := b;

  end;

  s^.p1 := nil;

  k := s;
  writeln;

  Writeln('Обратный вывод: ');

  b := k;

  while b <> nil do

  begin

    writeln(b^.x: 1: 1);

    b := b^.p2;

  end;

  writeln;

  Writeln('     Результат: ');

  s := f;

  b := k;

  while s <> nil do

  begin

    z := s^.x + b^.x;

    writeln(z: 1: 1);

    s := s^.p1;

    b := b^.p2;

  end;

   P2:= Now; // фиксация  времени окончания
   DecodeTime(P2, H2, M2, S2, Ms2);
   Writeln(H1,':',M1,':',S1,':',Ms1); //  время начала выполнения
   Writeln(H2,':',M2,':',S2,':',Ms2); //время окончания

  readln;

end.
