package tema4;

public abstract class Empleado {
    private String nombre;
    private double sueldo;
    private int antiguedad;
    
    public Empleado(String nombre, double sueldo, int antiguedad){
        this.setNombre(nombre);
        this.setSueldo(sueldo);
        this.setAntiguedad(antiguedad);
    }

    //Getters
    public String getNombre() {
        return nombre;
    }
    public double getSueldo() {
        return sueldo;
    }
    public int getAntiguedad() {
        return antiguedad;
    }
    
    //Setters
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }
    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    //Otros métodos
    public double calcularSueldoBasico(){
        double porcentaje = (this.getSueldo()/10) * this.getAntiguedad(); //10% del sueldo básico por cada año de antigüedad
        double calculo = this.getSueldo() + porcentaje;
        return calculo;
    }
    
    @Override
    public String toString(){
        String aux = "Nombre: " + this.getNombre() + "\n" +
                     " / Sueldo a cobrar: " + this.calcularSueldoACobrar() + "\n" + 
                     " / Efectividad: " + this.calcularEfectividad();
        return aux;
    }
    
    //Métodos abstractos
    public abstract double calcularEfectividad();
    public abstract double calcularSueldoACobrar();
}
