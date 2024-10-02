using cifrador;

public class Program 
{
    // VARIABLES GLOBALES
    public static Queue<int> MASCARA;
    public static int LIMITE;

    public static void Main(string[] args)
    {
        try
        {
            Console.Clear();
            Console.WriteLine("> CIFRADOR CESARIANO");
            Console.WriteLine("> Programa escrito por Mariano B. Vidal");
            Console.WriteLine(">");

            UtilityClass.TimedWriteLine("> Primero, especifique si quiere cifrar/descifrar una cadena o un archivo de texto");
            UtilityClass.TimedWriteLine("> 1 - ESCOJER CADENA");
            UtilityClass.TimedWriteLine("> 2 - ESCOJER ARCHIVO DE TEXTO");
            UtilityClass.TimedWrite(">: ");

            string opcion;
            bool opcionElegida = false;

            while (!opcionElegida)
            {
                opcion = Console.ReadLine();

                switch (opcion)
                {
                    // MANIPULAR CADENAS
                    case "1":
                        opcionElegida = true;
                        UtilityClass.TimedWriteLine("> Ingrese la cadena a manipular: ");
                        CifrarDescifrar();
                        break;

                    // MANIPULAR ARCHIVOS DE TEXTO
                    case "2":
                        UtilityClass.TimedWriteLine("> Introduzca la ruta del archivo de texto: ");
                        opcionElegida = true;
                        break;
                    default:
                        Console.WriteLine("> Esa no es una opción válida");
                        break;
                }
            }
        }
        catch (Exception ex)
        {
            Console.Clear();
            Console.WriteLine("> ERROR");
            Console.WriteLine(ex.Message);
        }
    }

    public static void CifrarDescifrar()
    {
        string cadena = UtilityClass.GetInput();
        var adaptador = new Adaptador();
        bool cifrar = false;

        cadena = adaptador.adaptarCadena(cadena);

        UtilityClass.TimedWriteLine("> Responda con un S si quiere cifrar la cadena, caso contrario, se interpretará como que quiere descifrarla: ");
        
        if (UtilityClass.GetInput() == "S")
        {
            ObtenerMascara();
            cifrar = true;
        }
        else
        {
            ObtenerMascara(false);
        }

        var cifrador = new Cifrador(MASCARA);
        Console.WriteLine(cifrador.traducir(cadena, cifrar));
    }

    public static void ObtenerMascara(bool cifrar = true)
    {
        var enmascarador = new Enmascarador();
        if (cifrar)
        {
            UtilityClass.TimedWriteLine("> Responda con un S si quiere que el sistema le genere una mascara, caso contrario, se interpretará como que quiere ingresarla: ");
            if (UtilityClass.GetInput() == "S")
            {
                ObtenerLimite();
                MASCARA = enmascarador.generarMascara(LIMITE);
                return;
            }
        }
        // Ingresar máscara
        ObtenerLimite();
        MASCARA = enmascarador.ingresarMascara(LIMITE);
    }

    public static void ObtenerLimite()
    {
        UtilityClass.TimedWriteLine("> Ingrese la cantidad de digitos que tendrá su mascara: ");
        LIMITE = UtilityClass.GetNumber(1, 32);
    }
}