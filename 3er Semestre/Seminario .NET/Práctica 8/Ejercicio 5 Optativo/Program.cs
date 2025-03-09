using teoria8;

Temporizador t = new Temporizador();
t.Tic += (sender, e) =>
{
    Console.WriteLine(DateTime.Now.ToString("HH:mm:ss") + " ");
    if (e.Tics == 5)
    {
        t.Habilitado = false;
    }
};
t.Intervalo = 2000;
t.Habilitado = true;

t.Comenzar();
