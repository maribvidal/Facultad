namespace teoria9;

class Nodo<T>
{
    public T Valor { get; private set; }
    public Nodo<T>? Proximo { get; set; } = null;
    public Nodo(T valor) => Valor = valor;
}
