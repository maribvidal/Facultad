namespace teoria13;

public static class Metodos 
{
    public static void Saludar() => Console.WriteLine("Hola Mundo!");
    public static void RecorrerIntervalo(int inicio, int final) => Enumerable.Range(inicio, final).ToList().ForEach(num => Console.Write(num + " - "));
}
