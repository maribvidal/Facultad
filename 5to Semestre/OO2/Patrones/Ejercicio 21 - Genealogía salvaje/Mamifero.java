package unlp.oo2.patrones.ej21;

import java.time.LocalDate;

public class Mamifero implements IMamifero {
    private String identificador;
    private String especie;
    private LocalDate fechaNacimiento;
    private IMamifero madre;
    private IMamifero padre;

    //
    
    public Mamifero(String identificador, String especie, LocalDate fechaNacimiento) {
        this.identificador = identificador;
        this.especie = especie;
        this.fechaNacimiento = fechaNacimiento;
        // Inicializar padres con el Null Object por defecto
        this.madre = new NullMamifero();
        this.padre = new NullMamifero();
    }

    // INTERFAZ PÚBLICA
    
    public String getIdentificador() {
        return identificador;
    }

    public String getEspecie() {
        return especie;
    }

    public LocalDate getFechaNacimiento() {
        return fechaNacimiento;
    }

    public IMamifero getMadre() {
        return this.madre;
    }

    public void setMadre(IMamifero madre) {
    	this.madre = madre;
    }

    public IMamifero getPadre() {
        return this.padre;
    }

    public void setPadre(IMamifero padre) {
        this.padre = padre;
    }
    
    public IMamifero getAbueloMaterno() {
    	return this.madre.getPadre();
    }
    
    public IMamifero getAbuelaMaterna() {
    	return this.madre.getMadre();
    }

    public IMamifero getAbueloPaterno() {
    	return this.padre.getPadre();
    }

    public IMamifero getAbuelaPaterna() {
    	return this.padre.getMadre();
    }

    public boolean tieneComoAncestroA(IMamifero m) {
    	boolean condicion = this.getMadre().equals(m) || this.getPadre().equals(m);
    	if (condicion)
    		return true;
    	return this.getMadre().tieneComoAncestroA(m) || this.getPadre().tieneComoAncestroA(m);
    }
}