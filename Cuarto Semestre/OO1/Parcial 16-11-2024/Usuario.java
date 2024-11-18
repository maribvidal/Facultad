package ar.edu.unlp.oo1.parcial;

import java.util.List;
import java.util.ArrayList;
import java.time.LocalDate;
import java.time.Period;

// De cada usuario se conoce su nombre y las entradas que compró.

public class Usuario {
	private String nombre;
	private List<Entrada> entradasCompradas;
	
	public Usuario(String nom) {
		this.nombre = nom;
		this.entradasCompradas = new ArrayList<Entrada>();
	}
	
	// CONSULTAR EL PRECIO DE ASISTENCIA A UN EVENTO
	public double consultarPrecioAsistenciaEvento(Evento evento, LocalDate fechaConsulta) {
		return (evento.obtenerPrecioAsistencia(fechaConsulta));
	}
	
	// COMPRAR UNA ENTRADA PARA UN EVENTO
	// Al momento de comprar una entrada, se puede decir si
	// pagar o no un seguro de reembolso que permite recuperar
	// un mayor monto en caso de devolución de la entrada.
	public Entrada comprarEntradaEvento(Evento evento, boolean quiereSeguro) {
		Entrada nuevaEntrada = null;
		
		if (evento.getFecha().isAfter(LocalDate.now()) || evento.getFecha().equals(LocalDate.now())) {
			nuevaEntrada = new Entrada(evento, quiereSeguro);
			this.entradasCompradas.add(nuevaEntrada);
		}
		
		return nuevaEntrada;
	}
	
	// CALCULAR EL MONTO A RECUPERAR POR UNA ENTRADA
	public double calcularMontoRecuperableEntrada(Entrada entrada) {
		return (entrada.obtenerMontoRecuperable());
	}
	
	// CALCULAR EL MONTO TOTAL POR LAS ENTRADAS COMPRADAS EN UN PERIODO
	public double calcularMontoTotalEntradasPeriodo(LocalDate fechaInicial, LocalDate fechaFinal) {
		DateLapse periodo = new DateLapse(fechaInicial, fechaFinal);
		double total = this.obtenerEntradasCompradasPeriodo(periodo).stream().mapToDouble(e -> e.obtenerMontoGastado()).sum();
		return total;
	}
	
	private List<Entrada> obtenerEntradasCompradasPeriodo(DateLapse periodo) {
		return (this.entradasCompradas.stream().filter(e -> periodo.includesDate(e.getFechaCompra())).toList());
	}
	
	// Retornar la entrada al siguiente evento
	public Entrada obtenerEntradaSiguienteEvento() {
		List<Entrada> entradasVigentes = this.entradasCompradas.stream().filter(e -> LocalDate.now().isBefore(e.getFechaEvento())).toList();
		Entrada proximaEntrada = entradasVigentes.stream().min((e1, e2) -> Integer.compare(Period.between(LocalDate.now(), e1.getFechaEvento()).getDays(), Period.between(LocalDate.now(), e2.getFechaEvento()).getDays())).orElse(null);
		return proximaEntrada;
	}
	
	// Métodos debug
	public List<Entrada> getEntradasCompradas() { return this.entradasCompradas; }
	public void agregarEntrada(Entrada e) { this.entradasCompradas.add(e); }
}
