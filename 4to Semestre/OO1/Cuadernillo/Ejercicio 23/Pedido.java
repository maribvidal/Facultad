package ar.edu.unlp.info.oo1.Ejercicio23;

public class Pedido {
	Producto producto;
	IFormaDePago formaDePago;
	IFormaDeEnvio formaDeEnvio;
	int cantidadSolicitada;
	
	public Pedido(Producto producto, IFormaDeEnvio formadeenvio, IFormaDePago formadepago, int cant) {
		this.producto = producto;
		this.formaDeEnvio = formadeenvio;
		this.formaDePago = formadepago;
		this.cantidadSolicitada = cant;
	}
	
	public double calcularCostoTotal () {
		double costoTotal = 0;
		//(precio final en base a la forma de pago seleccionada) + (costo de envío en base a la forma de envío seleccionada).
		double precioProd = this.cantidadSolicitada * producto.getPrecio();
		costoTotal = this.formaDePago.calcularPrecioFinal(precioProd) + this.formaDeEnvio.calcularCostoEnvio();
		return costoTotal;
	}
	
	public String getCategoria() {
		return this.producto.getCategoria();
	}
}
