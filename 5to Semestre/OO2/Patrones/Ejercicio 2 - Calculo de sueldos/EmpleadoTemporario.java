package unlp.oo2.patrones.ej2;

public class EmpleadoTemporario extends NoPasante {
    private int cantidadHoras;

    public EmpleadoTemporario(boolean esCasado, int cantidadHijos, int cantidadHoras) {
        super(esCasado, cantidadHijos);
        this.cantidadHoras = cantidadHoras;
    }

    // Método que se pide implementar
    protected double calcularSueldoBasico() {
        double calculo = 20000 + (this.cantidadHoras * 300);
        return calculo;
    }
}