package unlp.oo2.patrones.ej6;

public abstract class ExcursionEstado {
    public abstract void inscribir(Excursion contexto, Usuario unUsuario);
    public abstract String obtenerInformacion(Excursion contexto);
}