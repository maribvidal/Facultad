package ar.edu.unlp.oo1.ejercicio17;
import java.util.*;

public class Propiedad {
    String nombre;
    String direccion;
    double precio;
    List<DateLapse> ocupaciones;

    public Propiedad(String nombre, String direccion, double precio) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.precio = precio;
        this.ocupaciones = new ArrayList<DateLapse>();
    }
    
    public List<DateLapse> getOcupaciones() { return this.ocupaciones; }
    public double getPrecio() { return this.precio; }
    public double getPrecioPeriodo(DateLapse periodo) {
    	double precio = this.getPrecio();
    	int cantidadDias = periodo.sizeInDays();
    	return precio * cantidadDias;
    }
    
    public boolean consultarDisponibilidad(DateLapse periodo) {
        int fechas = (int) this.getOcupaciones().stream().filter(fecha -> fecha.overlaps(periodo)).count();
        return (fechas == 0);
    }
    
    public void agregarPeriodo(DateLapse periodo) {
        this.ocupaciones.add(periodo);
    }
    
    public void quitarPeriodo(DateLapse periodo) {
    	this.ocupaciones.remove(periodo);
    }
    
    public List<DateLapse> fechasDentroPeriodo(DateLapse periodo) {
        return this.getOcupaciones().stream().filter(fecha -> periodo.inside(fecha)).toList();
    }
}