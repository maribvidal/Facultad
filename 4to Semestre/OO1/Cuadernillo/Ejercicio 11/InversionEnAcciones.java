package ar.edu.unlp.oo1.ejercicio11;

public class InversionEnAcciones implements IInversion {
	String nombre;
	int cantidad;
	double valorUnitario;
	
	public InversionEnAcciones(String nombre) {
		this.nombre = nombre;
		this.setCantidad(0);
		this.setValorUnitario(0);
	}
	
	public int getCantidad() {
		return cantidad;
	}

	public void setCantidad(int cantidad) {
		this.cantidad = cantidad;
	}

	public double getValorUnitario() {
		return valorUnitario;
	}

	public void setValorUnitario(double valorUnitario) {
		this.valorUnitario = valorUnitario;
	}

	@Override
	public double valorActual() {
		return cantidad * valorUnitario;
	}
}
