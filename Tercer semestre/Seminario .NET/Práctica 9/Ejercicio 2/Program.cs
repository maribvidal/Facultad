//Ejercicio 2
int[] vector1 = [1, 2, 3];
bool[] vector2 = [true, true, true];
string[] vector3 = ["uno", "dos", "tres"];
Set<int>(vector1, 110, 2);
Set<bool>(vector2, false, 1);
Set<string>(vector3, "Hola Mundo!", 0);
Imprimir(vector1); //Como el tipo del argumento pasado se puede inferir, no hace falta marcar su tipo
Imprimir(vector2);
Imprimir(vector3);

//Métodos a implementar
void Set<T>(T[] miVector, T miElemento, int numElem)
{
    miVector[numElem] = miElemento;
}

void Imprimir<T>(T[] miVector)
{
    foreach (T elem in miVector)
        Console.Write(elem + " ");
    Console.WriteLine();
}
