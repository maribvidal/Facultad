using System.Linq;
//EJERCICIO 1

//  a - Lista con todos los múltiplos de 5 entre 100 y 200

List<int> incisoA = Enumerable.Range(100, 100).Where(n => n % 5 == 0).ToList();

//  b - Lista con todos los números primos menores que 100

bool esPrimo(int n)
{
    //Devolver TRUE para el caso de 1
    if (n == 1)
        return true;
    
    //Si no, comprobar que el número SOLO tenga 2 divisores (ya que estamos lidiando con enteros)
    int dividores = 0;
    for (int i = 1; i <= n; i++)
        if (n % i == 0) {dividores++;}

    return (dividores == 2);
}
List<int> incisoB = Enumerable.Range(1, 100).Where(n => esPrimo(n)).ToList();

//  c - Lista con las potencias de 2, desde 2^0 a 2^10

List<double> incisoC = Enumerable.Range(0, 10).Select(n => Math.Pow(2, n)).ToList();

//  d - La suma y el promedio de los valors de la lista anterior

double incisoDSuma = incisoC.Sum();
double incisoDPromedio = incisoC.Average();

//  e - Lista de todos los n^2 que terminan con el dígito 6, para n entre 1 y 20

List<double> incisoE = Enumerable.Range(1, 20).Select(n => Math.Pow(n, 2)).Where(n => n % 10 == 6).ToList();

//  f - Lista con los nombres de los días de la semana en inglés que contengan una letra 'u'

List<string> incisoF = Enumerable.Range(1, 5).Select(numDia => ((DayOfWeek) numDia).ToString()).Where(str => str.Contains('u')).ToList();



//  PRUEBA

Mostrar("A", incisoA);
Mostrar("B", incisoB);
Mostrar("C", incisoC);
Console.WriteLine($"Inciso D - Suma: {incisoDSuma:N2}");
Console.WriteLine($"Inciso D - Promedio: {incisoDPromedio:N2}");
Console.WriteLine();
Mostrar("E", incisoE);
Mostrar("F", incisoF);

//Métodos auxiliares

void Mostrar<T>(string inciso, List<T> lista)
{
    Console.WriteLine($"Inciso {inciso}: ");
    lista.ForEach(num => Console.Write(num + " - "));
    Console.WriteLine("|\n");
}
