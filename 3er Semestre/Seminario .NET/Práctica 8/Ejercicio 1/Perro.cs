namespace teoria7;

public class Perro : IVendible, IAtendible, ILavable, INombrable
{
    //(INombrable)
    public string? Nombre { get; set; }

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
    //ILavable
    public void SeLava()
    {
        Console.WriteLine("Lavando perro");
    }
    public void SeSeca()
    {
        Console.WriteLine("Secando perro");
    }

    //INombrable
    public int CompareTo(object? obj)
    {
        int result = 0;
        if (obj is Perro pr)
        {
            string nombre = pr.Nombre;
            result = this.Nombre.CompareTo(nombre);
        }
        return result;
    }

    //Sobreescribir método ToString
    public override string ToString()
    {
        return $"{Nombre} es un perro";
    }
}
