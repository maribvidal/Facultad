package ar.edu.unlp.oo1.Ejercicio13;

import java.util.*;

public class ClienteDeCorreo {
	List<Carpeta> carpetas;
	Carpeta inbox;
	
	public ClienteDeCorreo() {
		this.inbox = new Carpeta("Inbox");
		this.carpetas = new ArrayList<Carpeta>();
		this.carpetas.add(inbox);
	}
	
	public void recibir(Email email) {
		this.inbox.agregarEmail(email);
	}
	public Email buscar(String texto) {
		Carpeta primeraCarpeta = this.carpetas.stream().filter(c -> c.buscarEmail(texto) != null).findFirst().orElse(null);
		Email emailBuscado = primeraCarpeta.buscarEmail(texto);
		return (emailBuscado != null ? emailBuscado : null);
	}
	public int espacioOcupado() {
		int tmnCarpetas = this.carpetas.stream().mapToInt(ca -> ca.tamañoTotal()).sum();
		return tmnCarpetas;
	}
}