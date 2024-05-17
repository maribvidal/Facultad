namespace teoria9;
using System.Collections;

class ListaEnlazada<T>
{
    List<Nodo<T>> _lista = new List<Nodo<T>>();

    private Nodo<T> CrearNodo(T valor)
    {
        return new Nodo<T>(valor);
    }

    public void AgregarAdelante(T valor)
    {
        Nodo<T> miNodo = CrearNodo(valor);

        //Vincular el nodo actual con el siguiente en la lista, si es que hay uno
        if (_lista.Count == 0)
            miNodo.Proximo = null;
        else
            miNodo.Proximo = _lista[0];

        _lista.Insert(0, miNodo);
    } 
    public void AgregarAtras(T valor)
    {
        Nodo<T> miNodo = CrearNodo(valor);

        //Vincular el ante-último nodo de la lista con el último, si es que existen nodos
        if (_lista.Count == 0)
            _lista[_lista.Count - 1].Proximo = miNodo;

        _lista.Add(miNodo);
    }
    public IEnumerator<T> GetEnumerator()
    {
        foreach (Nodo<T> unNodo in _lista)
            yield return unNodo.Valor;
    }
}
