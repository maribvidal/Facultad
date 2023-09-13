program factorialRecursivo;
function factorial(n: integer):integer;
    begin
        if (n = 0) then begin
            write(n,' = ');
            factorial:= 0
        end else begin
            write(n,' + '); factorial:= n + factorial(n - 1);
        end;
    end;
begin
    Randomize;
    writeln(factorial(Random(100)));
end.
