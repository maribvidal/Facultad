package ar.edu.unlp.oo1.ejercicio17;

import java.time.LocalDate;
import java.util.ArrayList;

public class Usuario extends Persona {
	ArrayList<Propiedad> propiedadesDeseandoAlquilar;
	ArrayList<Reserva> reservas;
	
	public Usuario(String nombre, String direccion, String DNI) {
		super(nombre, direccion, DNI);
		propiedadesDeseandoAlquilar = new ArrayList<Propiedad>();
		reservas = new ArrayList<Reserva>();
	}
	
	public void desearAlquilarPropiedad(Propiedad propiedad) {
		this.propiedadesDeseandoAlquilar.add(propiedad);
	}
	
	public Reserva realizarReserva(Propiedad propiedad, DateLapse periodo) {
		Reserva reservaRealizada = null;
		
		if (propiedad.consultarDisponibilidad(periodo)) {
			reservaRealizada = new Reserva(propiedad, periodo);
			this.reservas.add(reservaRealizada);
		}
		
		return reservaRealizada;
	}
	
	public boolean cancelarReserva(Reserva reserva) {
		LocalDate fechaDeHoy = LocalDate.now();
		
		if (reservas.contains(reserva) && !reserva.getPeriodo().includesDate(fechaDeHoy)) {
			reserva.cancelarse();
			reservas.remove(reserva);
			return true;
		} 
		
		return false;
	}
}