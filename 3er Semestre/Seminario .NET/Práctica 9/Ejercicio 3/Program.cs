//Ejercicio 3
string[] vector1 = CrearArreglo<string>("uno", "dos");
foreach (string st in vector1) Console.Write(st + " - ");
Console.WriteLine();
double[] vector2 = CrearArreglo<double>(1, 2.3, 4.1, 6.7);
foreach (double valor in vector2) Console.Write(valor + " - ");
Console.WriteLine();

var stb = new System.Text.StringBuilder();
var a = GetNuevoObjetoDelMismoTipo(stb);
var b = GetNuevoObjetoDelMismoTipo(17);
Console.WriteLine(a.GetType());
Console.WriteLine(b.GetType());

//Métodos a implementar
T[] CrearArreglo<T>(params T[] parametros)
{
    T[] nuevoVector = new T[parametros.Length];
    for (int i = 0; i < parametros.Length; i++)
        nuevoVector[i] = parametros[i];
    return nuevoVector;
}

T GetNuevoObjetoDelMismoTipo<T>(T dato)
{
    return dato;
}
