namespace Tienda;

public class Cliente
{
    public int Id { get; set; }
    public string? DNI { get; set; }
    public string? ApellidoYNombre { get; set; }
    public string? Direccion { get; set; }
    public string? Mail { get; set; }
    public string? Telefono { get; set; }

    public override string ToString()
    {
        return "{ Id = " + Id + ", DNI = " + DNI +", Nombre = " + ApellidoYNombre +", Direccion = " + Direccion + ", Tel = " + Telefono + " }";
    }
}
