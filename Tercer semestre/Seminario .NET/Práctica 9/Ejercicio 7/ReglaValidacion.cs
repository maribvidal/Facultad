namespace teoria9;

class ReglaValidacion<T>(Func<T, bool> predicado, string mensajeError)
{
    Func<T, bool> _predicado = predicado;
    public string MensajeError { get; } = mensajeError;

    public bool Ok(T instancia) => _predicado(instancia);
}
