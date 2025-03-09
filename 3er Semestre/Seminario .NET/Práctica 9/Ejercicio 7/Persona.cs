namespace teoria9;

class Persona
{
    public string Nombre { get; set; }
    public int Edad { get; set; }

    public override string ToString() => $"{Nombre} de {Edad} años";
}
