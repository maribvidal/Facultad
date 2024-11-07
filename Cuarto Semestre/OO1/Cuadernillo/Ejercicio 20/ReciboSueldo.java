package ar.edu.unlp.oo1.ejercicio20;

import java.time.LocalDate;

// ValueObject manejado por el Empleado

public class ReciboSueldo {
	public String nombreEmpleado;
	public String apellidoEmpleado;
	public int CUIL;
	public int antiguedad;
	public LocalDate fechaGenerado;
	public double montoTotal;
	
	public ReciboSueldo(String nombreEmpleado, String apellidoEmpleado, int CUIL, int antiguedad, double montoTotal) {
		this.nombreEmpleado = nombreEmpleado;
		this.apellidoEmpleado = apellidoEmpleado;
		this.CUIL = CUIL;
		this.antiguedad = antiguedad;
		this.fechaGenerado = LocalDate.now();
		this.montoTotal = montoTotal;
	}
}
