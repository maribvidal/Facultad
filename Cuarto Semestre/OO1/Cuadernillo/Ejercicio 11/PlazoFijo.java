package ar.edu.unlp.oo1.ejercicio11;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;

public class PlazoFijo implements IInversion {
	LocalDate fechaDeConstitucion;
	double montoDepositado;
	double porcentajeDeInteresDiario;
	
	public PlazoFijo(LocalDate fecha) {
		this.fechaDeConstitucion = fecha;
		this.setMontoDepositado(0);
		this.setPorcentajeDeInteresDiario(1);
	}
	
	public double getMontoDepositado() {
		return montoDepositado;
	}

	public void setMontoDepositado(double montoDepositado) {
		this.montoDepositado = montoDepositado;
	}

	public double getPorcentajeDeInteresDiario() {
		return porcentajeDeInteresDiario;
	}

	public void setPorcentajeDeInteresDiario(double porcentajeDeInteresDiario) {
		this.porcentajeDeInteresDiario = porcentajeDeInteresDiario;
	}

	@Override
	public double valorActual() {
		long cantidadDias = ChronoUnit.DAYS.between(fechaDeConstitucion, LocalDate.now());
		double interes = cantidadDias * (porcentajeDeInteresDiario * montoDepositado);
		return montoDepositado + interes;
	}
}
