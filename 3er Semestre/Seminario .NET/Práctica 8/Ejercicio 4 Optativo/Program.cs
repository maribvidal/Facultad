using teoria8;
Ingresador ingresador = new Ingresador();
ingresador.LineaVaciaIngresada += (sender, e) => { Console.WriteLine("Se ingresó una línea en blanco"); };
ingresador.NroIngresado += (sender, e) => { Console.WriteLine($"Se ingresó el número {e.Valor}"); };
ingresador.Ingresar();
