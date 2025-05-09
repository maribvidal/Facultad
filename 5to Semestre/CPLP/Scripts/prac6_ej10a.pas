Program Uno;

var 
    x: integer;
    
Function Dos(x: integer):integer;
  begin
    x := x + 1;
    Dos:= x;
  end;

Procedure Tres(var x: integer);
  begin
    x := x + 5; // 13
    //x := Dos + 10; // 24
  end;

// Con esto simulamos el pasaje por valor-resultado de la siguiente forma:
// 1. La conexión inicial entre el parámetro actual y formal se hace por copia local
// 2. La conexión al final se hace por medio de asignarle a la variable x el resultado
//    de la función TresP
// 3. En el medio no hay ningún tipo de vinculación
Function TresP(x: integer): integer;
    begin
        x:= x + 5; // 13
        TresP:= Dos(x) + 10; // 24
    end;

begin
  x := 8;
  //Tres(x);
  x:= TresP(x);
  write(x);
end.
