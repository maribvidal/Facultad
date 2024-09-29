namespace textShuffler;

public class ModificadorArchivo
{
    public void Modificar(FileInfo file)
    {
        bool menuAbierto = true;

        while (menuAbierto)
        {
            Console.WriteLine("* <<OPCIONES DE MODIFICACIÓN DE ARCHIVO>> ");
            Console.WriteLine("** 1. Invertir orden de las líneas");
            Console.WriteLine("** 2. Invertir contenido de las líneas");
            Console.WriteLine("** 3. Darle un nuevo orden a las líneas");
            Console.WriteLine("** 4. Cerrar menú");

            string opcion = UtilityClass.GetInput();

            switch (opcion)
            {
                case "1":
                    InvertirOrdenLineas(file);
                    break;
                case "2":
                    InvertirContenidoLineas(file);
                    break;
                case "3":
                    ManipularOrdenLineas(file);
                    break;
                case "4":
                    menuAbierto = false;
                    break;
                default:
                    Console.WriteLine("** Opción inválida");
                    break;
            }
        }
    }

    public void InvertirOrdenLineas(FileInfo file)
    {
        // Leer archivo
        string[] lineasArchivo = File.ReadAllLines(file.FullName);

        // Invertir líneas
        for (int i = 0; i < lineasArchivo.Length / 2; i++)
        {
            // Hacemos un intercambio sencillo
            string tmp = lineasArchivo[i];
            lineasArchivo[i] = lineasArchivo[lineasArchivo.Length - 1 - i];
            lineasArchivo[lineasArchivo.Length - 1 - i] = tmp;
        }

        // Sobreescribir archivo
        File.WriteAllLines(file.FullName, lineasArchivo);
    }

    public void InvertirContenidoLineas(FileInfo file)
    {
        string[] lineasArchivo = File.ReadAllLines(file.FullName);

        for (int i = 0; i < lineasArchivo.Length; i++)
        {
            // Hacemos un intercambio sencillo
            char[] tmp = lineasArchivo[i].ToCharArray();
            Array.Reverse(tmp);
            lineasArchivo[i] = new string(tmp);
        }

        File.WriteAllLines(file.FullName, lineasArchivo);
    }

    public void ManipularOrdenLineas(FileInfo file)
    {
        string[] lineasArchivo = File.ReadAllLines(file.FullName);
        List<int> lineasPosicion = new List<int>();
        int posMax = lineasArchivo.Length - 1;

        Console.WriteLine();
        Console.WriteLine($"** Ingrese números que vayan del 0 al {posMax}");
        Console.WriteLine("** Cada número representa la posición de una línea en el archivo original");
        Console.WriteLine("** Termine de ingresar líneas con un número menor a 0");
        Console.WriteLine();

        bool seguirIngresando = true;

        while (seguirIngresando)
        {
            var numInput = UtilityClass.GetNumber(posMax);

            if (numInput < 0) 
            {
                seguirIngresando = false;
            } 
            else
            {
                lineasPosicion.Add(numInput);
            }
        }

        // Crear nuevo vector de líneas
        string[] nuevasLineasArchivo = new string[lineasPosicion.Count];
        for (int i = 0; i < nuevasLineasArchivo.Length; i++)
            nuevasLineasArchivo[i] = lineasArchivo[lineasPosicion.ElementAt(i)];

        File.WriteAllLines(file.FullName, nuevasLineasArchivo);
    }
}
