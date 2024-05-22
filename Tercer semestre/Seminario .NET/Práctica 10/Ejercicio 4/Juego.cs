namespace Tienda;

public class Juego
{
    public int Id { get; set; }
    public string? Nombre { get; set; }
    public string? Descripcion { get; set; }
    public string? Estado { get; set; }
    public double PrecioPorDia { get; set; }

    public override string ToString()
    {
        return "{ Id = " + Id + ", Nombre = " + Nombre +", Descripcion = " + Descripcion +", Estado = " + Estado + ", PrecioPorDia = " + PrecioPorDia + " }";
    }
}
