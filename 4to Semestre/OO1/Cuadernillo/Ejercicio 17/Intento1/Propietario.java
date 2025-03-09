package ar.edu.unlp.oo1.ejercicio17;

import java.util.ArrayList;
import java.util.List;

public class Propietario extends Persona {
	ArrayList<Propiedad> propiedades;
	
	public Propietario(String nombre, String direccion, String DNI) {
		super(nombre, direccion, DNI);
		propiedades = new ArrayList<Propiedad>();
	}
	
	public void agregarPropiedad(Propiedad propiedad) {
		this.propiedades.add(propiedad);
	}
	
	public double calcularIngresos(DateLapse periodo) {
		List<DateLapse> fechasDisponibles;
		double ingresosBrutos = 0;
		
		for (Propiedad prop : propiedades) {
			fechasDisponibles = prop.fechasDentroPeriodo(periodo);
			ingresosBrutos += fechasDisponibles.stream().mapToInt(dt -> dt.sizeInDays()).sum() * prop.getPrecio();
		}
		
		return (ingresosBrutos * 0.75);
	}
}