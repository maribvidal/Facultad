namespace teoria7;

public class Perro : IVendible, IAtendible
{
    //Métodos implantados por la interfaz IVendible
    public void SeVendeA(Persona p)
    {
        Console.WriteLine("Vendiendo perro a persona");
    }

    //Métodos implantados por la interfaz IAtendible
    public void SeAtiende()
    {
        Console.WriteLine("Atendiendo perro");
    }
}
