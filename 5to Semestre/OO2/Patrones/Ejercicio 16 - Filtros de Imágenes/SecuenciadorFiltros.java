package ar.edu.info.oo2.filtros;

import ar.edu.info.oo2.pipes.ImageFilterPipe;

public abstract class SecuenciadorFiltros {
	protected ImageFilterPipe pipe;
	//
	public SecuenciadorFiltros() {
		// Crear secuencia con el Null Object,
		// hace desaparecer el switch statement en
		// el SecuenciadorMonochrome
		this.pipe = new ImageFilterPipe(new Dull());
	}
	
	// INTERFAZ PÚBLICA
	
	public void agregarFiltroRepeater() {
		this.pipe.addFilter(new Repeater());
	}
	
	public void agregarFiltroDull() {
		this.pipe.addFilter(new Dull());
	}
	
	public abstract ImageFilterPipe construirSecuenciaFiltros();
}