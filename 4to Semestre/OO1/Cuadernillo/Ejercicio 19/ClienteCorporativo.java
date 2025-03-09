package ar.edu.unlp.oo1.ejercicio19;

public class ClienteCorporativo extends Cliente {
	int CUIT;

	public ClienteCorporativo(String nombre, String direccion, int CUIT) {
		super(nombre, direccion);
		this.CUIT = CUIT;
	}

}