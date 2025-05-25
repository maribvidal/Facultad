package unlp.oo2.patrones.ej21;

import java.time.LocalDate;

public class NullMamifero implements IMamifero {
	//
	// INTERFAZ PÚBLICA
	
	public String getIdentificador() {
		return "";
	}

	public String getEspecie() {
		return "";
	}

	public LocalDate getFechaNacimiento() {
		return LocalDate.of(0, 0, 0);
	}

	public IMamifero getMadre() {
		return new Mamifero("", "", LocalDate.of(0, 0, 0));
	}

	public void setMadre(IMamifero madre) {}

	public IMamifero getPadre() {
		return new Mamifero("", "", LocalDate.of(0, 0, 0));
	}

	public void setPadre(IMamifero padre) {}

	public IMamifero getAbueloMaterno() {
		return new Mamifero("", "", LocalDate.of(0, 0, 0));
	}

	public IMamifero getAbuelaMaterna() {
		return new Mamifero("", "", LocalDate.of(0, 0, 0));
	}

	public IMamifero getAbueloPaterno() {
		return new Mamifero("", "", LocalDate.of(0, 0, 0));
	}
	
	public IMamifero getAbuelaPaterna() {
		return new Mamifero("", "", LocalDate.of(0, 0, 0));
	}

	public boolean tieneComoAncestroA(IMamifero m) {
		return false;
	}
}
