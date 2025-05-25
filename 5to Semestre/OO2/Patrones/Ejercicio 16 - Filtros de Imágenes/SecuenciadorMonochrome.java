package ar.edu.info.oo2.filtros;

import ar.edu.info.oo2.pipes.ImageFilterPipe;

public class SecuenciadorMonochrome extends SecuenciadorFiltros {
	//
	// INTERFAZ PÚBLICA
	
	@Override
	public ImageFilterPipe construirSecuenciaFiltros() {
		this.pipe.addFilter(new Monochrome());
		return this.pipe;
	}
}