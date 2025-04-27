package unlp.oo2.patrones.ej13;

public class Empleado {
	//
	// INTERFAZ PÚBLICA
	
	private Sandwich pedirSandwich(SandwichBuilder constructor) {
		constructor.colocarPan();
		constructor.colocarAderezo();
		constructor.colocarPrincipal();
		constructor.colocarAdicional();
		
		return constructor.obtenerSandwich();
	}
}