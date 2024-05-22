namespace Tienda;

public class TiendaSQLite
{
    public static void Inicializar()
    {
        using var context = new TiendaContext();
        if (context.Database.EnsureCreated())
        {
            Console.WriteLine("\t* Se creó la base de datos");
        }
    }
}
