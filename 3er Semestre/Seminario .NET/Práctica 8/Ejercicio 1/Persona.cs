namespace teoria7;

public class Persona : IAtendible, INombrable
{
    //INombrable
    public string Nombre { get; set; }

    //IAtendible
    public void SeAtiende()
    {
        Console.WriteLine("Atendiendo persona");
    }

    //INombrable
    public int CompareTo(object? obj)
    {
        int result = 0;
        if (obj is Persona pe)
        {
            string nombre = pe.Nombre;
            result = this.Nombre.CompareTo(nombre);
        }
        return result;
    }

    //Sobreescribir método ToString
    public override string ToString()
    {
        return $"{Nombre} es una persona";
    }
}
