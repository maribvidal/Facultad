package unlp.oo2.patrones.ej2;

public abstract class Empleado {

    // INTERFAZ EXTERNA

    public double obtenerSueldo() {
        return this.sueldo();
    }

    // INTERFAZ INTERNA

    protected abstract double calcularSueldoBasico();
    protected abstract double calcularAdicional();

    // Uso del patrón "Template Method"
	protected double sueldo() {
        double calculo = (this.calcularSueldoBasico() 
            + this.calcularAdicional() 
            + this.calcularDescuento());
        return calculo;
    }

    private double calcularDescuento() {
        double calculo = (this.calcularSueldoBasico() * 0.13) + (this.calcularAdicional() * 0.05);
        return calculo;
    }
}