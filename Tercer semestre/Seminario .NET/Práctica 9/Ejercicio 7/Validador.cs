namespace teoria9;

class Validador<T>
{
    List<ReglaValidacion<T>> _listaReglas = new List<ReglaValidacion<T>>();

    public void AgregarRegla(ReglaValidacion<T> regla) => _listaReglas.Add(regla);
    public bool Validar(T objeto, out List<string> errores)
    {
        errores = new List<string>();
        foreach (ReglaValidacion<T> regla in _listaReglas)
        {
            if (!regla.Ok(objeto))
                errores.Add(regla.MensajeError);
        }
        if (errores.Count > 0)
            return false;
        return true;
    }
}
