package repaso_ej4;

public class Director extends Persona {
    private int antiguedad;

    public Director(String nombre, String DNI, int edad, int antiguedad) {
        super(nombre, DNI, edad);
        this.setAntiguedad(antiguedad);
    }
    
    public int getAntiguedad() {
        return antiguedad;
    }
    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    @Override
    public String toString() {
        String aux = super.toString();
        aux = aux + "DIRECTOR - ANTIGUEDAD: " + this.getAntiguedad() + "]";
        return aux;
    }
}
