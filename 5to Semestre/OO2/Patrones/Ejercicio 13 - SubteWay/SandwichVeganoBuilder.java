package unlp.oo2.patrones.ej13;

public class SandwichVeganoBuilder extends SandwichBuilder {
	//
	public SandwichVeganoBuilder() {
		super();
	}
	
	// INTERFAZ PÚBLICA
	
	public void colocarPan() {
		this.agregarComponenteSandwich(new Componente("Pan integral", 100));
	}
	public void colocarAderezo() {
		this.agregarComponenteSandwich(new Componente("Salsa criolla", 20));
	}
	public void colocarPrincipal() {
		this.agregarComponenteSandwich(new Componente("Milanesa girgolas", 500));
	}
	public void colocarAdicional() {
		// No lleva adicional
	}
}