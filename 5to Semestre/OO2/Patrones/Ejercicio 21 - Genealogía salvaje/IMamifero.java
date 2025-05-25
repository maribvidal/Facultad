package unlp.oo2.patrones.ej21;

import java.time.LocalDate;

public interface IMamifero {
	//
	// INTERFAZ PÚBLICA
	
    public String getIdentificador();
    public String getEspecie();
    public LocalDate getFechaNacimiento();
    public IMamifero getMadre();
    public void setMadre(IMamifero madre);
    public IMamifero getPadre();
    public void setPadre(IMamifero padre);
    public IMamifero getAbueloMaterno();
    public IMamifero getAbuelaMaterna();
    public IMamifero getAbueloPaterno();
    public IMamifero getAbuelaPaterna();
    public boolean tieneComoAncestroA(IMamifero m);
}