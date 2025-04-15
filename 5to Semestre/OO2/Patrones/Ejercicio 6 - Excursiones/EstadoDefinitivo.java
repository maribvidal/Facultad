package unlp.oo2.patrones.ej6;

public class EstadoDefinitivo extends ExcursionEstado {

    public void inscribir(Excursion contexto, Usuario unUsuario) {
    	contexto.inscribirUsuario(unUsuario);
    	
        if (contexto.seAlcanzoCupoMaximo())
            contexto.cambiarEstado(new EstadoLleno()); 
    }

    public String obtenerInformacion(Excursion contexto) {
        String mailsInscriptos = contexto.obtenerMailInscriptos().toString();
        String cadena = "\nMAILS INSCRIPTOS: " + mailsInscriptos
                        + "\nCANT. USUARIOS FALTANTES PARA ALCANZAR EL CUPO MÁXIMO: "
                        + contexto.cantidadInscriptosFaltantesCupoMaximo();
        return cadena;
    }
}
