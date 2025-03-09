using teoria7;

INombrable[] vector = [
    new Persona() {Nombre = "Zulema"},
    new Perro() {Nombre = "Sultán"},
    new Persona() {Nombre = "Claudia"},
    new Persona() {Nombre = "Carlos"},
    new Perro() {Nombre = "Chopper"},
];

Array.Sort(vector); // debe ordenar por Nombre alfabéticamente
foreach (INombrable n in vector)
{
    Console.WriteLine($"{n.Nombre}: {n}");
}
