namespace teoria7;

public class Libro : IAlquilable, IReciclable
{
    //IAlquilable
    public void SeAlquilaA(Persona p)
    {
        Console.WriteLine("Alquilando libro a persona");
    }
    public void SeDevuelvePor(Persona p)
    {
        Console.WriteLine("Libro devuelto por persona");
    }
    //IReciclable
    public void SeRecicla()
    {
        Console.WriteLine("Reciclando libro");
    }
}
