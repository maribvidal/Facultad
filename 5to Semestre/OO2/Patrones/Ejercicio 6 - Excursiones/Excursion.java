package unlp.oo2.patrones.ej6;

import java.time.LocalDate;
import java.util.List;
import java.util.ArrayList;

public class Excursion {
    private String nombre;
    private LocalDate fechaInicio;
    private LocalDate fechaFin;
    // Se puede usar un primitivo porque no hace nada mas
    private String puntoEncuentro;
    private double costo;
    private int cupoMinimo;
    private int cupoMaximo;
    private List<Usuario> inscriptos;
    private List<Usuario> listaEspera;
    // Aplicar patrón State
    private ExcursionEstado estado;

    public Excursion(String nombre, LocalDate fechaInicio, 
            LocalDate fechaFin, String puntoEncuentro, 
            double costo, int cupoMinimo, int cupoMaximo) 
            {
    			this.nombre = nombre;
    			this.fechaInicio = fechaInicio;
    			this.fechaFin = fechaFin;
    			this.puntoEncuentro = puntoEncuentro;
    			this.costo = costo;
    			this.cupoMinimo = cupoMinimo;
    			this.cupoMaximo = cupoMaximo;
    		
                this.estado = new EstadoProvisorio();
                this.inscriptos = new ArrayList<Usuario>();
                this.listaEspera = new ArrayList<Usuario>();
    }

    // Métodos que pide implementar el enunciado
    public void inscribir(Usuario unUsuario) {
    	this.estado.inscribir(this, unUsuario);
    }
    public String obtenerInformacion() {
        String cadena = "EXCURSION " + this.nombre 
                        + " / COSTO " + this.costo
                        + "\n/ FECHAS del " + this.fechaInicio
                        + " al " + this.fechaFin
                        + "\n/PUNTO DE ENCUENTRO " + this.puntoEncuentro;
        return (cadena + this.estado.obtenerInformacion(this));
    }

    public int cantidadInscriptos() { return this.inscriptos.size(); }
    public int cantidadInscriptosFaltantesCupoMinimo() { return this.cupoMinimo - this.cantidadInscriptos(); }
    public int cantidadInscriptosFaltantesCupoMaximo() { return this.cupoMaximo - this.cantidadInscriptos(); }
    public boolean seAlcanzoCupoMinimo() { return (this.cantidadInscriptos() >= this.cupoMinimo); }
    public boolean seAlcanzoCupoMaximo() { return (this.cantidadInscriptos() >= this.cupoMaximo); }
    public List<String> obtenerMailInscriptos() {
        List<String> lista = this.inscriptos.stream().map(usu -> usu.getEmail()).toList();
        return lista;
    }

    // Aplicar patrón State
    public void cambiarEstado(ExcursionEstado nuevoEstado) { this.estado = nuevoEstado; }
    public void inscribirUsuario(Usuario unUsuario) { this.inscriptos.add(unUsuario); }
    public void agregarUsuarioListaEspera(Usuario unUsuario) { this.listaEspera.add(unUsuario); }

    // Exclusivamente para los tests
    public List<Usuario> getInscriptos() { return this.inscriptos; }
    public List<Usuario> getListaEspera() { return this.listaEspera; }
    public ExcursionEstado getEstado() { return this.estado; }
}