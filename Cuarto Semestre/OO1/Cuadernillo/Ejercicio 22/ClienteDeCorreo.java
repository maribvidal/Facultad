package ar.edu.unlp.info.oo1.ejercicio22_estadisticas;

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
		Email emailBuscado = null;
		Carpeta primeraCarpeta = this.carpetas.stream().filter(c -> c.buscarEmail(texto) != null).findFirst().orElse(null);
		if (primeraCarpeta != null)
			emailBuscado = primeraCarpeta.buscarEmail(texto);
		return (emailBuscado != null ? emailBuscado : null);
	}
	public int espacioOcupado() {
		int tmnCarpetas = this.carpetas.stream().mapToInt(ca -> ca.tamañoTotal()).sum();
		return tmnCarpetas;
	}
	
	// Solo para testear
	public void agregarCarpeta(Carpeta carpeta) {
		this.carpetas.add(carpeta);
	}
	
	// Nuevos métodos
	public int contarEmailsTotal() {
		int cantidadEmails = this.carpetas.stream().mapToInt(ca -> ca.contarEmails()).sum();
		return cantidadEmails;
	}
}
