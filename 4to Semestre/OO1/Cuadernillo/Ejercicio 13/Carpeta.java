package ar.edu.unlp.oo1.Ejercicio13;

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
}
