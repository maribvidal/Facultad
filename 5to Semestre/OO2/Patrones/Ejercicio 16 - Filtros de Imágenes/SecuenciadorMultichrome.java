package ar.edu.info.oo2.filtros;

import ar.edu.info.oo2.pipes.ImageFilterPipe;

public class SecuenciadorMultichrome extends SecuenciadorFiltros {
	//
	// INTERFAZ PÚBLICA
	
	public void agregarFiltroArtifacter() {
		this.pipe.addFilter(new Artifacter());
	}
	
	public void agregarFiltroRainbow() {
		this.pipe.addFilter(new Rainbow());
	}
	
	public void agregarFiltroRGBShifter() {
		this.pipe.addFilter(new RGBShifter());
	}
	
	public void agregarFiltroRGBShiftRepeater() {
		this.pipe.addFilter(new RGBShiftRepeater());
	}
	
	@Override
	public ImageFilterPipe construirSecuenciaFiltros() {
		return this.pipe;
	}
}