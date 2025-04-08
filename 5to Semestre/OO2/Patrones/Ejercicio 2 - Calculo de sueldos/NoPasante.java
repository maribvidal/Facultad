package unlp.oo2.patrones.ej2;

public abstract class NoPasante extends Empleado {
	private boolean esCasado;
    private int cantidadHijos;

    public NoPasante(boolean esCasado, int cantidadHijos) {
        this.esCasado = esCasado;
        this.cantidadHijos = cantidadHijos;
    }

    // Método que se pide implementar
    protected double calcularAdicional() {
        double calculo = (this.montoPorCasado() + this.montoPorHijos());
        return calculo;
    }

    private double montoPorCasado() {
        return (this.esCasado ? 5000 : 0);
    }

    private double montoPorHijos() {
        double calculo = (cantidadHijos * 2000);
        return calculo;
    }
}