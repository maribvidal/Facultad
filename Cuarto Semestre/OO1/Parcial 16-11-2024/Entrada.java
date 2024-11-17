package ar.edu.unlp.oo1.parcial;

import java.time.LocalDate;
import java.time.Period;
import java.time.temporal.ChronoUnit;

public class Entrada {
	private double precioCompra;
	private LocalDate fechaCompra;
	private Evento eventoAsociado;
	private boolean tieneSeguro;
	
	public Entrada(Evento ev, boolean tieneS) {
		// "Retorna una entrada para dicho evento con fecha de compra igual a la compra actual"
		this.fechaCompra = LocalDate.now();
		
		this.eventoAsociado = ev;
		this.tieneSeguro = tieneS;
		
		// Establecer el precio como el que fue al dia de ser comprada la entrada
		this.precioCompra = this.eventoAsociado.obtenerPrecioAsistencia(fechaCompra);
	}
	
	public double obtenerMontoRecuperable() {
		double total = (this.diferenciaDeDiasMayor() ? this.precioCompra * 0.5 : 0);
		total += this.montoExtraPorSeguro();
		return total;
	}
	
	// El monto a recuperar se calcula teniendo en cuenta la diferencia de
	// días entre la fecha de compra de la entrada y la fecha del evento
	private boolean diferenciaDeDiasMayor() {
		int dias = (int) ChronoUnit.DAYS.between(this.fechaCompra, this.eventoAsociado.getFecha());
		System.out.println(dias);
		return (dias >= 30); 
	}
	
	// En todos los casos anteriores, si la entrada fue adquirida con seguro
	// de reembolso, al monto a recuperar anterior se suma el 15% del precio
	// de asistencia
	private double montoExtraPorSeguro() { return (this.tieneSeguro ? this.precioCompra * 0.15 : 0); }
	
	public LocalDate getFechaCompra() { return this.fechaCompra; }
	public LocalDate getFechaEvento() { return this.eventoAsociado.getFecha(); }
	
	public double obtenerMontoGastado() {
		double montoPorSeguro = (this.tieneSeguro ? 500 : 0);
		return (this.precioCompra + montoPorSeguro);
	}
}
