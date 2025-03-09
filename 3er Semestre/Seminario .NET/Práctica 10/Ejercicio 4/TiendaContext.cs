using Microsoft.EntityFrameworkCore;
namespace Tienda;

public class TiendaContext : DbContext
{
    #nullable disable
    public DbSet<Alquiler> Alquileres { get; set; }
    public DbSet<Cliente> Clientes { get; set; }
    public DbSet<Juego> Juegos { get; set; }
    #nullable restore

    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        optionsBuilder.UseSqlite("data source=Tienda.sqlite");
    }
}
