package ar.edu.unlp.oo1.parcial;

import java.util.List;
import java.time.LocalDate;
import java.util.ArrayList;

public class EventoPresencial extends Evento {
	// Los eventos presenciales se llevan a cabo en varias sedes
	private List<Sede> sedes;
	
	public EventoPresencial(String nom, LocalDate fecha, String temaPri, double preIns, double preRem) {
		super(nom, fecha, temaPri, preIns, preRem);
		this.sedes = new ArrayList<Sede>();
	}
	
	// El precio de asistencia a un evento presencial es la suma del
	// precio de inscripción, el precio de la remera y la suma de los
	// precios totales de estadía en cada una de las sedes de ese evento.
	
	@Override
	public double obtenerPrecioAsistencia(LocalDate fechaConsulta) {
		return (this.getPrecioBase(fechaConsulta) + this.obtenerPreciosSedes());
	}
	
	private double obtenerPreciosSedes() {
		return (this.sedes.stream().mapToDouble(s -> s.obtenerPrecioTotal()).sum());
	}
	
	public void agregarSede(Sede s) {
		this.sedes.add(s);
	}
}
