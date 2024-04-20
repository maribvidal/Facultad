int vidaHeroe = 10;
int vidaMonstruo = 10;
int ataqueHeroe = 0;
int ataqueMonstruo = 0;

Random ataque = new Random();

do
{
    //El héroe atacará primero
    ataqueHeroe = ataque.Next(1, 10);
    vidaMonstruo -= ataqueHeroe;
    Console.WriteLine($"Monster was damaged and lost {ataqueHeroe} health and now has {vidaMonstruo} health.");

    //Luego es el turno del Monstruo
    if (vidaMonstruo > 0)
    {
        ataqueMonstruo = ataque.Next(1, 10);
        vidaHeroe -= ataqueMonstruo;
        Console.WriteLine($"Hero was damaged and lost {ataqueMonstruo} health and now has {vidaHeroe} health.");
    }
} while (vidaHeroe > 0 && vidaMonstruo > 0);

Console.WriteLine(vidaHeroe > vidaMonstruo ? "Hero wins!" : "Monster wins!");
