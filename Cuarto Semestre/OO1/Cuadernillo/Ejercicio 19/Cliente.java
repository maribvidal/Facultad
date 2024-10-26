package ar.edu.unlp.oo1.ejercicio19;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public abstract class Cliente {
	protected List<Envio> envios;
	protected String nombre;
	protected String direccion;
	
	public Cliente(String nombre, String direccion) {
		this.nombre = nombre;
		this.direccion = direccion;
		this.envios = new ArrayList<Envio>();
	}
	
	// Getters
	
	public List<Envio> getEnvios() { return this.envios; }
	
	public List<Envio> obtenerEnviosPeriodo(LocalDate fechaInicio, LocalDate fechaFinal) {
		List<Envio> enviosPeriodo = this.getEnvios().stream().filter(e -> fechaInicio.isBefore(e.getFechaDespacho()) && fechaFinal.isAfter(e.getFechaDespacho())).toList();
		return enviosPeriodo;
	}
	
	public double calcularMontoPeriodo(LocalDate fechaInicio, LocalDate fechaFinal) {
		double montoTotal = this.obtenerEnviosPeriodo(fechaInicio, fechaFinal).stream().mapToDouble(e -> e.costo()).sum();
		return montoTotal;
	}
}