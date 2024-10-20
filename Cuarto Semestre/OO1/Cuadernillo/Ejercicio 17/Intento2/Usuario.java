package ar.edu.unlp.oo1.ejercicio17;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Set;
import java.util.TreeSet;

public class Usuario extends Persona {
	Set<Propiedad> marcadas; // Propiedades que el usuario desea alquilar
	ArrayList<Reserva> reservas; // Propiedades que el usuario reserva
	
	public Usuario(String nombre, String direccion, String DNI) {
		super(nombre, direccion, DNI);
		marcadas = new TreeSet<Propiedad>();
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
	
	public boolean cancelarReserva(Reserva reserva)
	{
		// Revisar si el periodo existe primero
		if (!reserva.propiedad.consultarDisponibilidad(reserva.periodo))
		{
			reserva.propiedad.quitarPeriodo(reserva.periodo);
			reservas.remove(reserva);
			return true;
		}
		// No se pudo cancelar
		return false;
	}
	
	// Métodos para la wishlist de propiedades
	public boolean marcarPropiedad(Propiedad propiedad) {
		// Utilizo un Set para la wishlist, ya que si
		// una propiedad ya se marcó, no tiene sentido volver
		// a marcarla
		return this.marcadas.add(propiedad);
	}
	public boolean desmarcarPropiedad(Propiedad propiedad) {
		return this.marcadas.remove(propiedad);
	}
}
