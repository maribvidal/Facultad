namespace teoria7;

public class Pelicula : IAlquilable
{
    //IAlquilable
    public void SeAlquilaA(Persona p)
    {
        Console.WriteLine("Alquilando película a persona");
    }
    public void SeDevuelvePor(Persona p)
    {
        Console.WriteLine("Película devuelta por persona");
    }
}
