package repaso_ej4;

public class Corista extends Persona {
    private int tonoFundamental;

    public Corista(String nombre, String DNI, int edad, int tonoFundamental) {
        super(nombre, DNI, edad);
        this.setTonoFundamental(tonoFundamental);
    }
    
    public int getTonoFundamental() {
        return tonoFundamental;
    }
    public void setTonoFundamental(int tonoFundamental) {
        this.tonoFundamental = tonoFundamental;
    }
    
    @Override
    public String toString() {
        String aux = super.toString();
        aux = aux + "CORISTA - TONO FUNDAMENTAL: " + this.getTonoFundamental() + "]";
        return aux;
    }
}
