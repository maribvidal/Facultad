namespace textShuffler;

using System;
using System.IO;

public class Program
{
    static FileInfo? curFile = null;

    public static void Main(string[] args)
    {
        bool RUNTIME = true;
        string opcion;

        while (RUNTIME)
        {
            try 
            {
                Console.Clear();

                Console.WriteLine("* <<MENU DE OPCIONES>> ");
                Console.WriteLine("* 1. Cargar archivo");
                Console.WriteLine("* 2. Modificar archivo");
                Console.WriteLine("* 3. Leer archivo");
                Console.WriteLine("* 4. Cerrar programa");

                opcion = UtilityClass.GetInput();

                switch (opcion)
                {
                    case "1":
                        MenuCargarArchivo();
                        break;
                    case "2":
                        MenuModificarArchivo();
                        break;
                    case "3":
                        MenuLeerArchivo();
                        break;
                    case "4":
                        RUNTIME = false;
                        break;
                    default:
                        Console.WriteLine("* Opción inválida");
                        break;
                }
            }
            catch (Exception ex)
            {
                Console.Clear();
                Console.WriteLine($"* ERROR: {ex.Message}");
                UtilityClass.WaitUser(); // Esperar el input del usuario antes de proceder
            }
        }
    }

    // * MÉTODOS DEL MENÚ

    public static void MenuCargarArchivo()
    {
        Console.Clear();
        Console.WriteLine("* <<CARGAR ARCHIVO>>");

        if (curFile != null)
        {
            Console.WriteLine("* Ya se encuentra cargado un archivo:");
            Console.WriteLine($"* {curFile.FullName}.{curFile.Extension}");
            Console.WriteLine("* ¿Desea cargar otro?: (Y/N)");

            char opcion = UtilityClass.GetLetter();

            // Si la respuesta es negativa, regresar al menú
            if (opcion == 'N')
                return;
        }

        CargadorArchivo cargadorArchivo = new CargadorArchivo();
        curFile = cargadorArchivo.Cargar(".txt");

        Console.WriteLine("* ARCHIVO CARGADO CON ÉXITO");
        UtilityClass.WaitUser();
    }

    public static void MenuLeerArchivo()
    {
        Console.Clear();
        Console.WriteLine("* <<LEER ARCHIVO>>");

        if (curFile == null)
        {
            Console.WriteLine("* Se necesita cargar un archivo primero");
            UtilityClass.WaitUser();
            return;
        }

        LectorArchivo lectorArchivo = new LectorArchivo();
        lectorArchivo.Leer(curFile);

        UtilityClass.WaitUser();
    }

    public static void MenuModificarArchivo()
    {
        Console.Clear();
        Console.WriteLine("* <<MODIFICAR ARCHIVO>>");

        if (curFile == null)
        {
            Console.WriteLine("* Se necesita cargar un archivo primero");
            UtilityClass.WaitUser();
            return;
        }

        ModificadorArchivo modificadorArchivo = new ModificadorArchivo();
        modificadorArchivo.Modificar(curFile);

        UtilityClass.WaitUser();
    }
}