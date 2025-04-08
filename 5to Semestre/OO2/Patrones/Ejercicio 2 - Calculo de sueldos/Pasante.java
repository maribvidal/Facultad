package unlp.oo2.patrones.ej2;

public class Pasante extends Empleado {
    private int cantidadExamenesRendidos;

    public Pasante(int cantidadExamenesRendidos) {
        this.cantidadExamenesRendidos = cantidadExamenesRendidos;
    }

    // Métodos que se piden implementar
    protected double calcularSueldoBasico() {
        return 20000;
    }

    protected double calcularAdicional() {
        double calculo = (this.cantidadExamenesRendidos * 2000);
        return calculo;
    }
}