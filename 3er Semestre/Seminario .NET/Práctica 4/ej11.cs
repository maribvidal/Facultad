using teoria1;

string? st;
string? st1 = null;
string? st2 = null;
string? st3 = "a";
string? st4 = null;

//Operador null-coalescing
st = st1 ?? st2 ?? st3; //Es posible encadenarlo

//Asignación null-coalescing (pregunta si la primera variable tiene valor null, y si lo tiene, asignarle otro valor)
st4 ??= "valor por defecto";

Console.WriteLine(st);
Console.WriteLine(st4);
