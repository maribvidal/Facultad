class Persona
{
    //MIEMBROS
    //Atributos
    public String? Nombre;
    public int Edad;
    public String? DNI;

    //Comportamiento - Métodos de instancia
    //Punto 2
    public void Imprimir()
    {
        Console.Write(this.Nombre + " ");
        Console.Write(this.Edad + " ");
        Console.WriteLine(this.DNI);
    }

    //Punto 3
    public bool EsMayorQue(Persona p)
    {
        return (this.Edad > p.Edad);
    }
}
