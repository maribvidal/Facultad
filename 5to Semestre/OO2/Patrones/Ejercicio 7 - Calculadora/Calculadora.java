package unlp.oo2.patrones.ej7;

public class Calculadora {
    private double valorActual;
    private double valorAcumulado;
    private IEstado estado;

    public Calculadora() {
    	this.valorActual = 0;
    	this.valorAcumulado = 0;
    	this.estado = new EstadoInicial();
    }
    
	public String getResultado() {
        return ("RESULTADO: " + this.estado.getResultado(this));
    }

	public void borrar() {
        this.estado.borrar(this);
    }

	public void setValor(double unValor) {
        this.estado.setValor(this, unValor);
    }

	public void mas() {
        this.estado.mas(this);
    }

	public void menos() {
        this.estado.menos(this);
    }

	public void por() {
        this.estado.por(this);
    }

	public void dividido() {
        this.estado.dividido(this);
    }

    // Métodos que necesitan los estados
    public double getValorActual() { return this.valorActual; }
    public double getValorAcumulado() { return this.valorAcumulado; }
    public void setValorActual(double unValor) { this.valorActual = unValor; }
    public void setValorAcumulado(double unValor) { this.valorAcumulado = unValor; }
    public void cambiarEstado(IEstado nuevoEstado) { this.estado = nuevoEstado; }
    
    // Debug
    public IEstado getEstado() { return this.estado; }
}