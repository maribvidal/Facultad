using teoria13;

class Program
{
    static void Main(string[] args)
    {
        //  INCISO A
        Task tareaSaludo = new Task(Metodos.Saludar);

        // Ejecutar la tarea y esperar a que termine
        tareaSaludo.Start();

        //  INCISO B
        // El método .Run invoca métodos de manera asíncrona facilmente
        Task.Run(Metodos.Saludar);

        //Tarea que va a ocupar tiempo porque sí
        Metodos.RecorrerIntervalo(1, 100);

        //  INCISO C
        // Tenemos que usar una expresión lambda y hacer que se espere a que se complete la tarea
        Task.Run(() => Console.WriteLine("Hola Mundo!")).Wait();

        //  INCISO D
        // Lo mismo que arriba pero ahora usando métodos anónimos
        Task.Run(delegate {Console.WriteLine("Hola Mundo!");}).Wait();
    }
}
