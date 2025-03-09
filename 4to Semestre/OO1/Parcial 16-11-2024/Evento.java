package ar.edu.unlp.oo1.parcial;

import java.time.LocalDate;

// De cada evento se conoce su nombre, la fecha, el tema principal,
// el precio de inscripción y el precio de una remera que se entrega
// como artículo promocional del evento.

public abstract class Evento {
	private String nombre;
	private LocalDate fecha;
	private String temaPrincipal;
	private double precioInscripcion;
	private double precioRemera;
	
	public Evento(String nom, LocalDate fecha, String temaPri, double preIns, double preRem) {
		this.nombre = nom;
		this.fecha = fecha;
		this.temaPrincipal = temaPri;
		this.precioInscripcion = preIns;
		this.precioRemera = preRem;
	}
	
	public abstract double obtenerPrecioAsistencia(LocalDate fechaConsulta);
	
	// En ambos casos, si el evento se realiza en el mismo día en
	// que se hace la consulta, el precio de inscripción tiene un
	// recargo del 20%
	protected double getPrecioBase(LocalDate fechaConsulta) {
		double preIns = (this.fecha.equals(fechaConsulta) ? this.precioInscripcion * 1.2 : this.precioInscripcion);
		return (preIns + this.precioRemera); 
	}
	
	public LocalDate getFecha() { return this.fecha; }
}
