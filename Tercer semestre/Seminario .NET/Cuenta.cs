using System.Data.Common;
using System.IO;

public class Cuenta
{
    private int _id {get; set;} //Propiedad de solo lectura
    private string? _username {get; set;}
    private string? _password {get; set;}
    private int _age = -1;
    public int age
    {
        get => _age;
        set
        {
            if (value < 13)
                Console.WriteLine("Tiene que ser mayor de 13 para poder crearse una cuenta en este sitio");
            else
                _age = value;
        }
    }

    private static int s_nextId = 0;
    private static int s_cantCuentas = 0;
    private readonly static List<Cuenta> s_listaCuentas = new List<Cuenta>();
    private readonly static List<Cuenta> s_listaCargada = new List<Cuenta>();

    //Método constructor
    private Cuenta(string username, string password, int age)
    {
        _id = s_nextId++;
        _username = username;
        _password = password;
        _age = age;
        s_cantCuentas++;
        s_listaCuentas.Add(this);
    }
    private Cuenta(int id, string username, string password, int age) //Para cargar cuentas
    {
        _id = id;
        _username = username;
        _password = password;
        _age = age;
        s_cantCuentas++;
    }

    public static Cuenta CrearCuenta(string username, string password, int age)
    {
        if (age < 13)
            throw new Exception("La cuenta no cumple con el requisito de edad");
        return new Cuenta(username, password, age);
    }

    //Métodos estáticos
    public static void ExportarDB()
    {
        //Abrir archivo
        string curPath = Directory.GetCurrentDirectory();
        string newPath = curPath + "\\cuentas_db.txt";
        StreamWriter sw = new StreamWriter(newPath, true);

        //Escribir información (4 lineas por cuenta)
        foreach (Cuenta cuenta in s_listaCuentas)
        {
            //Si la cuenta ya existía...
            if (s_listaCargada.IndexOf(cuenta) == -1)
            {
                sw.WriteLine(cuenta._id);
                sw.WriteLine(cuenta._username.Replace(" ", String.Empty));
                sw.WriteLine(cuenta._password.Replace(" ", String.Empty)); 
                sw.WriteLine(cuenta._age);
            }
        }

        //Cerrar archivo
        sw.Close();
    }

    public static void CargarDB()
    {
        //Abrir archivo
        string curPath = Directory.GetCurrentDirectory();
        string newPath = curPath + "\\cuentas_db.txt";
        StreamReader sr = new StreamReader(newPath);
        String line = sr.ReadLine();
        int contadorLineas = 0;
        string[] infoCuenta = new string[4];
        Cuenta nuevaCuenta;

        //Leer la información del archivo hasta llegar al final
        while (line != null)
        {
            infoCuenta[contadorLineas] = line;
            line = sr.ReadLine();
            contadorLineas++;
            if (contadorLineas > 3) {
                nuevaCuenta = new Cuenta(int.Parse(infoCuenta[0]), infoCuenta[1], infoCuenta[2], int.Parse(infoCuenta[3]));
                s_listaCuentas.Add(nuevaCuenta);
                s_listaCargada.Add(nuevaCuenta);
                contadorLineas = 0;
            }
        }
        s_nextId = int.Parse(infoCuenta[0]);
        s_nextId++;

        //Cerrar archivo
        sr.Close();
    }

    public static void ImprimirGeneral()
    {
        Console.WriteLine($" -- INFORMACIÓN DE LA BASE DE DATOS -- ");
        Console.WriteLine($" -- Número de cuentas existentes: {s_cantCuentas} -- \n");
    }

    //Métodos de instancia
    public void Imprimir()
    {
        Console.WriteLine($" -- INFORMACIÓN CUENTA ID {_id} -- ");
        Console.WriteLine($" -- Nombre de usuario: {_username} / Edad: {_age} -- \n");
    }
}
