package ar.edu.unlp.oo1.ejercicio15;

public class EmisorFactura {
	CuadroTarifario cuadroTarifario;
	
	// Colocar un constructor solo para facilitar la instanciación
	public EmisorFactura() {
		this.cuadroTarifario = new CuadroTarifario(10);
	}
	
	public Factura emitirFactura(Usuario usuario) {
		Factura nuevaFactura = new Factura(usuario, this.cuadroTarifario.consultarPrecio());
		return nuevaFactura;
	}
}
