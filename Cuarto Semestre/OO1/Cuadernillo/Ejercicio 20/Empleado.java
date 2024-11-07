package ar.edu.unlp.oo1.ejercicio20;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Empleado {
	String nombre;
	String apellido;
	int CUIL;
	LocalDate fechaDeNacimiento;
	int hijosACargo;
	List<IContrato> contratos;
	IContrato contratoActivo;
	
	public Empleado(String nombre, String apellido, int CUIL, LocalDate fechaDeNacimiento, int hijosACargo) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.CUIL = CUIL;
		this.fechaDeNacimiento = fechaDeNacimiento;
		contratos = new ArrayList<IContrato>();
	}
	
	// Método para generar recibos de sueldo
	public ReciboSueldo generarReciboSueldo() {
		double sueldoBasico = contratoActivo.calcularSueldoBasico();
		double sueldoAdicional = this.calcularSueldoAdicional(sueldoBasico);
		double montoCorrespondiente = sueldoBasico + sueldoAdicional;
		
		ReciboSueldo reciboGenerado = new ReciboSueldo(this.nombre, this.apellido, this.CUIL, this.calcularAntiguedad(), montoCorrespondiente);
		return reciboGenerado;
	}
	
	// La antigüedad de un empleado se calcula como 
	// la suma de las duraciones de cada uno de los contratos registrados
	private int calcularAntiguedad() {
		int cantidadDiasTrabajo = 0;
		cantidadDiasTrabajo = this.contratos.stream().mapToInt(cont -> cont.obtenerDuracion().sizeInDays()).sum();
		
		return cantidadDiasTrabajo;
	}
	
	public boolean agregarContrato(IContrato contrato) {
		if (contrato != null) {
			this.contratos.add(contrato);
			// Si el contrato es vigente...
			if (contrato.esActivo()) {
				this.contratoActivo = contrato;
			}
			return true;
		}
		return false;
	}
	
	public double calcularSueldoAdicional(double sueldoBasico) {
		int antiguedad = this.calcularAntiguedad();
		
		// Esto da "mal olor", pero hacerlo de otra forma es solo para complicarse pienso
		if (antiguedad >= 7300) {
			return sueldoBasico;
		} else if (antiguedad >= 5475) {
			return (sueldoBasico * 0.7);
		} else if (antiguedad >= 3650) {
			return (sueldoBasico * 0.5);
		} else if (antiguedad >= 1825) {
			return (sueldoBasico * 0.3);
		}
		return 0;
	}
}
