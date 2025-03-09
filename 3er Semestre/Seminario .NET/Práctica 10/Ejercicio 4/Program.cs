using System.Data.Common;
using Tienda;

TiendaSQLite.Inicializar();

var juego1 = new Juego()
{
    Nombre = "Cama Elástica",
    Descripcion = "Medida de 2 x 2",
    Estado = "Bueno",
    PrecioPorDia = 1000
};
var juego2 = new Juego()
{
    Nombre = "Castillo",
    Descripcion = "Hasta 10 personas",
    Estado = "Nuevo",
    PrecioPorDia = 1200
};

AgregarJuego(juego1);
AgregarJuego(juego2);
ListarJuegos();

var cliente1 = new Cliente()
{
    DNI = "20569784",
    ApellidoYNombre = "Perez, Juan",
    Direccion = "48 e/ 5 y 6 N°520"
};
var cliente2 = new Cliente()
{
    DNI = "10569784",
    ApellidoYNombre = "Gonzalez, Alejandra",
    Direccion = "25 e/ 9 y 10 N°520",
    Mail = "gale@gmail.com",
    Telefono = "221-15-569874"
};

AgregarCliente(cliente1);
AgregarCliente(cliente2);
ListarClientes();

var alquiler1 = new Alquiler()
{
    IdCliente = 1,
    IdJuego = 1,
    Fecha = DateTime.Now
};
var alquiler2 = new Alquiler()
{
    IdCliente = 1,
    IdJuego = 2,
    Fecha = DateTime.Now
};

AgregarAlquiler(alquiler1);
AgregarAlquiler(alquiler2);
ListarAlquileres();

ModificarCliente("10569784", "Gonzalez, Alejandra", "52 e/ 9 y 10 N°520", "gale@gmail.com", "221-15-569874");
ListarClientes();
EliminarCliente("10569784");
ListarClientes();
ModificarJuego(1, "Cama Elastica", "Medida de 2 x 2", "Roto", 1500);
ListarJuegos();
ModificarAlquiler(1, 1562.25, new DateTime(2021, 11, 12));
ListarAlquileres();


//  MÉTODOS
void AgregarJuego(Juego unJuego)
{
    using var db = new TiendaContext();
    db.Juegos.Add(unJuego);
    db.SaveChanges();
    Console.WriteLine($"-- Se agregó el juego \"{unJuego.Nombre}\" al que se le asignó el Id {unJuego.Id}");
}
void AgregarCliente(Cliente unCliente)
{
    using var db = new TiendaContext();
    db.Clientes.Add(unCliente);
    db.SaveChanges();
    Console.WriteLine($"-- Se agregó el cliente \"{unCliente.ApellidoYNombre}\" al que se le asignó el Id {unCliente.Id}");
}
void AgregarAlquiler(Alquiler unAlquiler)
{
    using var db = new TiendaContext();
    db.Alquileres.Add(unAlquiler);
    db.SaveChanges();
    Console.WriteLine($"-- Se agregó un Alquiler al que se le asignó el Id {unAlquiler.Id}");
}

void ModificarJuego(int unaId, string unNombre, string unaDescripcion, string unEstado, double unPrecio)
{
    using var db = new TiendaContext();
    var consultaJuego = db.Juegos.Where(juego => juego.Id == unaId).SingleOrDefault();
    if (consultaJuego != null)
    {
        consultaJuego.Nombre = unNombre;
        consultaJuego.Descripcion = unaDescripcion;
        consultaJuego.Estado = unEstado;
        consultaJuego.PrecioPorDia = unPrecio;
        db.SaveChanges();

        Console.WriteLine($"-- Se modificó el juego con id {unaId} --");
    }
}
void ModificarCliente(string unDNI, string unApellidoYNombre, string unaDireccion, string unMail, string unTelefono)
{
    using var db = new TiendaContext();
    var consultaCliente = db.Clientes.Where(cliente => cliente.DNI == unDNI).SingleOrDefault();
    if (consultaCliente != null)
    {
        consultaCliente.ApellidoYNombre = unApellidoYNombre;
        consultaCliente.Direccion = unaDireccion;
        consultaCliente.Mail = unMail;
        consultaCliente.Telefono = unTelefono;
        db.SaveChanges();
        
        Console.WriteLine($"-- Se modificó cliente con dni {consultaCliente.DNI} --");
    }
}
void ModificarAlquiler(int unaId, double unCosto, DateTime unaFecha)
{
    using var db = new TiendaContext();
    var consultaAlquiler = db.Alquileres.Where(alquiler => alquiler.Id == unaId).SingleOrDefault();
    if (consultaAlquiler != null)
    {
        consultaAlquiler.CostoTotal = unCosto;
        consultaAlquiler.FechaDevolucion = unaFecha;
        db.SaveChanges();
        
        Console.WriteLine($"-- Se modificó el alquiler id {consultaAlquiler.Id} --");
    }
}

void ListarJuegos()
{
    Console.WriteLine();
    using var db = new TiendaContext();
    var consulta = db.Juegos.ToList();
    Console.WriteLine("-- Listado de Juegos --");
    consulta.ForEach(juego => Console.WriteLine(juego));
    Console.WriteLine();
}
void ListarClientes()
{
    Console.WriteLine();
    using var db = new TiendaContext();
    var consulta = db.Clientes.ToList();
    Console.WriteLine("-- Listado de Clientes --");
    consulta.ForEach(cliente => Console.WriteLine(cliente));
    Console.WriteLine();
}
void ListarAlquileres()
{
    Console.WriteLine();
    using var db = new TiendaContext();
    var consulta = db.Alquileres;
    Console.WriteLine("-- Listado de Alquileres --");
    foreach (Alquiler alq in consulta)
    {
        var consultaJuego = db.Juegos.Where(juego => juego.Id == alq.IdJuego).SingleOrDefault();
        var consultaCliente = db.Clientes.Where(cliente => cliente.Id == alq.IdCliente).SingleOrDefault();
        Console.WriteLine("{ Id = " + alq.Id + ", Fecha = " + alq.Fecha +", FechaDevolucion = " + (alq.FechaDevolucion != null ? alq.FechaDevolucion : "  /  /     ") +", Cliente = " + consultaCliente.ApellidoYNombre + ", Juego = " + consultaJuego.Nombre + ", Monto = " + alq.CostoTotal + " }");
    }
    Console.WriteLine();
}

void EliminarCliente(string unDNI)
{
    using var db = new TiendaContext();
    var consultaCliente = db.Clientes.Where(cliente => cliente.DNI == unDNI).SingleOrDefault();
    if (consultaCliente != null)
    {
        db.Clientes.Remove(consultaCliente);
        Console.WriteLine("-- Se eliminó el cliente con DNI = " + unDNI + " --");
        db.SaveChanges();
    }
}
