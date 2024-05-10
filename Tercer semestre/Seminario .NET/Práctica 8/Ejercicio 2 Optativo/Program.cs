using teoria8;
Trabajador t1 = new Trabajador();
t1.Trabajando += (object? sender, EventArgs e) => Console.WriteLine("Se inició el trabajo");
