package unlp.oo2.patrones.ej6;

public class EstadoLleno extends ExcursionEstado {

    public void inscribir(Excursion contexto, Usuario unUsuario) {
        contexto.agregarUsuarioListaEspera(unUsuario);
    }

    public String obtenerInformacion(Excursion contexto) {
        return "";
    }
}