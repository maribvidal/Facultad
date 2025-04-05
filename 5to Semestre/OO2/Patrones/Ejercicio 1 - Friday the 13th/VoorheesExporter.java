package biblioteca;

import java.util.List;

public class VoorheesExporter implements IExporter {

	private String exportar(Socio socio) {
		return socio.toString();
	}

	public String exportar(List<Socio> socios) {
		
		if (socios.isEmpty()) {
			return "[]";
		}
		
		String separator = System.lineSeparator();
		StringBuilder buffer = new StringBuilder("[" + separator);
		socios.forEach(socio -> {
			buffer.append(this.exportar(socio))
				.append(",")
				.append(separator);
		});
		
		// remueve la última coma y fin de línea
		buffer.setLength(buffer.length() - (separator.length() + 1));
		buffer.append(separator).append("]");
		return buffer.toString();
	}
}
