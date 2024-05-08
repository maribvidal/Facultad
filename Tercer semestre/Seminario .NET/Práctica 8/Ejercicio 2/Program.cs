using teoria7;

INombrable[] vector = [
    new Persona() {Nombre = "Ana María"},
    new Perro() {Nombre = "Sultán"},
    new Persona() {Nombre = "Ana"},
    new Persona() {Nombre = "José Carlos"},
    new Perro() {Nombre = "Chopper"},
];

Array.Sort(vector, new ComparadorLongitudNombre()); // debe ordenar por Nombre alfabéticamente
foreach (INombrable n in vector)
{
    Console.WriteLine($"{n.Nombre.Length}: {n.Nombre}");
}
