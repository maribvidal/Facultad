namespace teoria5;

public class Persona
{
    private string _Nombre {get;set;}
    private char _Sexo {get;set;}
    private int _DNI {get;set;}
    private DateTime _FechaNacimiento {get;set;} = new DateTime(0);
    private int _Edad 
    {
        get
        {
            if (_FechaNacimiento.Year != 0001) return DateTime.Now.Year - _FechaNacimiento.Year;
            else return -1;
        }
    }

    //Indizador
    public object this[int i]
    {
        get
        {
            return i switch
            {
                1 => _Nombre, 2 => _Sexo,
                3 => _DNI, 4 => _FechaNacimiento,
                5 => _Edad, _ =>null
            };
        }
        set
        {
            if (i == 0 && value.GetType() == typeof(string)) _Nombre = (string)value;
            else if (i == 1 && value.GetType() == typeof(char)) _Sexo = (char)value;
            else if (i == 2 && value.GetType() == typeof(int)) _DNI = (int)value;
            else if (i == 3 && value.GetType() == typeof(DateTime)) _FechaNacimiento = (DateTime)value;
            else
                Console.WriteLine("ERROR");
        }
    }

    public void Imprimir()
    {
        Console.WriteLine($"NOMBRE: {_Nombre ?? "No especificado"}" +
                           $" / Sexo: {_Sexo}" +
                           $" / DNI: {_DNI}" +
                           $" / Fecha de Nacimiento: {_FechaNacimiento:yyyy-M-d}" +
                           $" / Edad: {_Edad}");
    }
}
