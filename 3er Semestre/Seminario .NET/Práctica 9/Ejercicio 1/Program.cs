//Ejercicio 1
List<object> lista = [ "hola", 7, 'A' ];
string st = Get<string>(lista, 0);
int i = Get<int>(lista, 1);
char c = Get<char>(lista, 2);
Console.WriteLine($"{st} {i} {c}");

//Método a implementar
T Get<T>(List<object> miLista, int numElem) => (T) miLista[numElem];
