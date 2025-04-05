package biblioteca;

import java.util.ArrayList;
import java.util.List;

public class Biblioteca {
	private List<Socio> socios;
	private IExporter exporter;

	public Biblioteca() {
		socios = new ArrayList<>();
		exporter = new JSONExporter(); 
	}

	public void agregarSocio(Socio socio) {
		socios.add(socio);
	}

	/**
	 * Retorna la representación JSON de la colección de socios.
	 */
	public String exportarSocios() {
		return exporter.exportar(socios);
	}

	public IExporter getExporter() {
		return exporter;
	}

	public void setExporter(IExporter exporter) {
		this.exporter = exporter;
	}
}
