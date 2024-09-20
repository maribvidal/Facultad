package ar.edu.unlp.info.ejercicio_farola;

import java.util.*;

public class Farola {
	boolean encendido;
	List<Farola> vecinos;
	
	// CONSTRUCTOR
	public Farola() {
		this.encendido = false;
		this.vecinos = new LinkedList<Farola>();
	}
	
	public boolean isOn() { return this.encendido == true; }
	public boolean isOff() { return this.encendido == false; }
	
	public void turnOn() { 
		if (this.isOff()) {
			this.encendido = true;
			this.getNeighbors().stream().forEach(f -> f.turnOn());
		}
	}
	public void turnOff() {
		if (this.isOn()) {
			this.encendido = false;
			this.getNeighbors().stream().forEach(f -> f.turnOff());
		}
	}
	
	public List<Farola> getNeighbors() {
		return this.vecinos;
	}
	
	private void agregarVecino(Farola unVecino) {
		if (!getNeighbors().contains(unVecino))
			this.getNeighbors().add(unVecino);
	}
	
	public void pairWithNeighbor(Farola unVecino) {
		this.agregarVecino(unVecino);
		unVecino.agregarVecino(this);
	} 
}
