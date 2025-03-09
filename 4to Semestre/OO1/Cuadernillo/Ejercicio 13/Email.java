package ar.edu.unlp.oo1.Ejercicio13;

import java.util.List;
import java.util.ArrayList;

public class Email {
	String titulo;
	String cuerpo;
	List<Archivo> archivos;
	
	public Email(String titulo, String cuerpo) {
		this.titulo = titulo;
		this.cuerpo = cuerpo;
		this.archivos = new ArrayList<Archivo>();
	}
	
	public String getTitulo() {
		return this.titulo;
	}
	public String getCuerpo() {
		return this.cuerpo;
	}
	public List<Archivo> adjuntos() {
		return this.archivos;
	}
	
	public int tamaño() {
		int tmnTitulo = getTitulo().length();
		int tmnCuerpo = getCuerpo().length();
		int tmnArchivos = adjuntos().stream().mapToInt(arch -> arch.tamaño()).sum();
		
		return (tmnTitulo + tmnCuerpo + tmnArchivos);
	}
	
	public boolean tieneTexto(String texto) {
		return (getTitulo().contains(texto) || getCuerpo().contains(texto));
	}
}