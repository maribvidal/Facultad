package ar.edu.unlp.info.oo1.ejercicio22_estadisticas;

import java.util.*;

public class Carpeta {
	String nombre;
	List<Email> emails;
	
	public Carpeta(String nombre) {
		this.nombre = nombre;
		this.emails = new ArrayList<Email>();
	}
	
	public String getNombre() {
		return this.nombre;
	}
	public void agregarEmail(Email email) {
		this.emails.add(email);
	}
	public Email buscarEmail(String texto) {
		Email emailBuscado = this.getEmails().stream().filter(e -> e.tieneTexto(texto)).findFirst().orElse(null);
		return emailBuscado;
	}
	public void mover(Email email, Carpeta destino) {
		this.emails.remove(email);
		destino.agregarEmail(email);
	}
	
	public int tamañoTotal() {
		int tmnTotal = this.getEmails().stream().mapToInt(em -> em.tamaño()).sum();
		return tmnTotal;
	}
	public List<Email> getEmails() { return this.emails; }
	
	// Nuevos métodos
	public int contarEmails() { return this.getEmails().size(); };
	
	public Bag<String> categorizarEmails() {
		Bag<String> bolsa = new BagImpl<String>();
		this.getEmails().stream().forEach(em -> {
			if (em.tamaño() <= 300) {
				bolsa.add("Pequeño");
			} else if (em.tamaño() > 300 && em.tamaño() <= 500) {
				bolsa.add("Mediano");
			} else {
				bolsa.add("Grande");
			}
		});
		return bolsa;
	}
}
