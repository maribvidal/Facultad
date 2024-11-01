package ar.edu.unlp.oo1.ejercicio20;

import java.time.LocalDate;
import java.ArrayList;

public class Empleado {
	String nombre;
	String apellido;
	int CUIL;
	LocalDate fechaDeNacimiento;
	int hijosACargo;
	List<Contrato> contratos;
	
	public Empleado(String nombre, String apellido, int CUIL, LocalDate fechaDeNacimiento, int hijosACargo) {
		this.nombre = nombre;
		this.apellido = apellido;
		this.CUIL = CUIL;
		this.fechaDeNacimiento = fechaDeNacimiento;
		contratos = new ArrayList<Contrato>();
	}
}
