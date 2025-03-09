package ar.edu.unlp.oo1.ejercicio17;
import java.util.*;

public class Propiedad {
    String nombre;
    String direccion;
    double precio;
    List<DateLapse> ocupaciones;
    PoliticaCancelacion politica;

    public Propiedad(String nombre, String direccion, double precio, PoliticaCancelacion politica) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.precio = precio;
        this.ocupaciones = new ArrayList<DateLapse>();
        this.politica = politica;
    }
    
    // Getters
    
    public List<DateLapse> obtenerOcupaciones() { 
    	return this.ocupaciones; 
    }
    
    public double obtenerPrecio() { 
    	return this.precio; 
    }
    
    // Otros métodos
    public void agregarPeriodo(DateLapse periodo) 
    {
        this.ocupaciones.add(periodo);
    }
    
    public boolean consultarDisponibilidad(DateLapse periodo) 
    {
        int fechas = (int) this.obtenerOcupaciones().stream().filter(fecha -> fecha.overlaps(periodo)).count();
        return (fechas == 0);
    }
    
    // Para saber cuanto costaría una estancia, en esta propiedad, en un periodo dado
    public double consultarPrecioPeriodo(DateLapse periodo)
    {
    	return this.obtenerPrecio() * periodo.sizeInDays();
    }
    
    // Para saber cuanta plata genera la propiedad en un periodo dado
    public double consultarIngresosPeriodo(DateLapse periodo)
    {
    	double ingresos = this.fechasDentroPeriodo(periodo).stream().mapToDouble(dt -> consultarPrecioPeriodo(dt)).sum();
    	return ingresos;
    }

    public List<DateLapse> fechasDentroPeriodo(DateLapse periodo) 
    {
        return this.obtenerOcupaciones().stream().filter(fecha -> periodo.inside(fecha)).toList();
    }
    
    public void quitarPeriodo(DateLapse periodo) 
    {
    	this.ocupaciones.remove(periodo);
    }
    
    public double obtenerReembolso(DateLapse periodo) {
    	return this.politica.reembolsar(consultarPrecioPeriodo(periodo), periodo.getFrom());
    }
    
    // La política puede cambiarse en cualquier momento
    public void setPolitica(PoliticaCancelacion politica) { this.politica = politica; }
}
