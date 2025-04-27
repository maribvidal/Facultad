package unlp.oo2.patrones.ej13;

public abstract class SandwichBuilder {
	private Sandwich producto;
	
	//
	
	public SandwichBuilder() {
		this.producto = new Sandwich();
	}
	
	// INTERFAZ PÚBLICA
	
	public abstract void colocarPan();
	public abstract void colocarAderezo();
	public abstract void colocarPrincipal();
	public abstract void colocarAdicional();
	
	public Sandwich obtenerSandwich() {
		return this.producto;
	}
	
	// MÉTODOS PRIVADA A LA CLASE
	protected void agregarComponenteSandwich(IComponente c) {
		this.producto.agregarComponente(c);
	}
}