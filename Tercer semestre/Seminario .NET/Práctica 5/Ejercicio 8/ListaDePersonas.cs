using System.Security.Principal;
using teoria5;

class ListaDePersonas
{
    private readonly List<Persona> s_Lista = new List<Persona>();

    public void Agregar(Persona p)
    {
        s_Lista.Add(p);
    }

    //Indizadores
    public Persona this[int DNI]
    {
        get
        {
            Persona obtenerPersona = null;
            foreach (Persona elem in s_Lista)
            {
                if ((int)elem[2] == DNI)
                {
                    obtenerPersona = elem;
                    break;
                }
            }
            return obtenerPersona;
        }
    }
    public List<string> this[char primeraLetra]
    {
        get
        {
            List<string> listaNombres = null;
            foreach (Persona elem in s_Lista)
            {
                string elemNombre = (string)elem[0];
                char elemLetra = elemNombre[0];
                if (elemLetra == primeraLetra)
                {
                    //Si la lista no estaba creada previamente, ahora crearla
                    if (listaNombres == null)
                        listaNombres = new List<string>();
                    //Agregar nombre
                    listaNombres.Add(elemNombre);
                }
            }
            return listaNombres;
        }
    }
}
