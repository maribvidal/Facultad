package ar.edu.unlp.oo1.ejercicio17;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Set;
import java.util.TreeSet;

public class Usuario extends Persona {
	Set<Propiedad> alquilando; // Propiedades que el usuario está alquilando
	ArrayList<Reserva> reservas; // Propiedades que el usuario reserva
	
	public Usuario(String nombre, String direccion, String DNI) {
		super(nombre, direccion, DNI);
		alquilando = new TreeSet<Propiedad>();
		reservas = new ArrayList<Reserva>();
	}

	// Necesitamos una forma de relacionar al Usuario con las propiedades
	// y que en esta relación se sepa el periodo de días de su estadía
	// --> objeto Reserva
	// El usuario además posee la potestad de crear y destruir objetos Reserva
	public boolean realizarReserva(Propiedad propiedad, DateLapse periodo)
	{
		if (propiedad.consultarDisponibilidad(periodo))
		{
			propiedad.agregarPeriodo(periodo);
			Reserva nuevaReserva = new Reserva(propiedad, periodo);
			reservas.add(nuevaReserva);
			return true;
		}
		// No se pudo realizar
		return false;
	}
	
	public double cancelarReserva(Reserva reserva)
	{
		double montoRetorno = 0;
		// Si la reserva no existe, se le devuelve 0
		
		// Revisar si el periodo existe primero
		if (!reserva.propiedad.consultarDisponibilidad(reserva.periodo))
		{
			montoRetorno = reserva.obtenerReembolso();
			reserva.propiedad.quitarPeriodo(reserva.periodo);
			reservas.remove(reserva);
		}
		
		// No existe dicha reserva
		return montoRetorno;
	}
	
	public void alquilar(Propiedad propiedad) { this.alquilando.add(propiedad); }
	public void dejarDeAlquilar(Propiedad propiedad) { this.alquilando.remove(propiedad); }
	public ArrayList<Reserva> obtenerReservas() { return this.reservas; }
}
