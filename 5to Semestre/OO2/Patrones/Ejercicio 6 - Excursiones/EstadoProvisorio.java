package unlp.oo2.patrones.ej6;

public class EstadoProvisorio extends ExcursionEstado {

    public void inscribir(Excursion contexto, Usuario unUsuario) {
    	contexto.inscribirUsuario(unUsuario);
    	
        if (contexto.seAlcanzoCupoMinimo()) {
            contexto.cambiarEstado(new EstadoDefinitivo());
        }
    }

    public String obtenerInformacion(Excursion contexto) {
        String cadena = "\nCANT. USUARIOS FALTANTES PARA ALCANZAR EL CUPO MÍNIMO: "
                        + contexto.cantidadInscriptosFaltantesCupoMinimo();
        return cadena;
    }
}