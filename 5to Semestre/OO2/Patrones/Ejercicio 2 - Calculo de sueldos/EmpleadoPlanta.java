package unlp.oo2.patrones.ej2;

public class EmpleadoPlanta extends NoPasante {
    private int cantidadAñosAntiguedad;

    public EmpleadoPlanta(boolean esCasado, int cantidadHijos, int cantidadAñosAntiguedad) {
        super(esCasado, cantidadHijos);
        this.cantidadAñosAntiguedad = cantidadAñosAntiguedad;
    }

    // Método a sobreescribir
    @Override
    protected double calcularAdicional() {
        double calculo = super.calcularAdicional() + (this.cantidadAñosAntiguedad * 2000);
        return calculo;
    }

    // Método que se pide implementar
    protected double calcularSueldoBasico() {
        return 50000;
    }
}