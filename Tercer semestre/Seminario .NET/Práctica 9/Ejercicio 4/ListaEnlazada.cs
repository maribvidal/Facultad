namespace teoria9;
using System.Collections;

class ListaEnlazada<T>
{
    List<T> _lista = new List<T>();

    public void AgregarAdelante(T miDato)
    {
        _lista.Insert(0, miDato);
    } 
    public void AgregarAtras(T miDato)
    {
        _lista.Add(miDato);
    }
    public IEnumerator<T> GetEnumerator()
    {
        return _lista.GetEnumerator();
    }
}
