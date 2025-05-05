program main;
var
    j, m, i: integer;
procedure recibe(x:integer; y:integer);
    begin
        writeln('m:= m (',m,') + 1 + y (',y,')');
        m:= m + 1 + y;
        writeln('x:= i (',i,') + x (',x,') + j (',j,')');
        x:= i + x + j;
        writeln('y:= m (',m,') - 1');
        y:= m - 1;
        writeln('x = ',x,' / y = ',y,' / i = ',i,' / j = ',j,' / m = ',m);
    end;

Procedure Dos;
    var m:integer;
    begin
        m:= 5;
        recibe(i, j);
        writeln('i = ', i,' / j = ',j,' / m = ',m);
    end;
begin
    m:= 2;
    i:=1; j:=3;
    Dos;
    writeln('i = ', i,' / j = ',j,' / m = ',m);
end.
