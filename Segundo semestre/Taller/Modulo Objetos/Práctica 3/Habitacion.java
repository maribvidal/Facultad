package tema3;

import PaqueteLectura.GeneradorAleatorio;

public class Habitacion {
    private double costoNoche;
    private boolean estaOcupada;
    private Cliente cliente;
    
    public Habitacion() {
        GeneradorAleatorio.iniciar();
        this.costoNoche = 2000 + GeneradorAleatorio.generarDouble(6000);
        this.estaOcupada = false;
    }
    
    //Getters
    public double getCostoNoche() {
        return this.costoNoche;
    }
    
    public boolean getEstaOcupada() {
        return this.estaOcupada;
    }
    
    public Cliente getCliente() {
        return this.cliente;
    }
    
    //Setters
    public void setCostoNoche(double costoNoche) {
        this.costoNoche = costoNoche;
    }

    public void setEstaOcupada(boolean estaOcupada) {
        this.estaOcupada = estaOcupada;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    @Override
    public String toString() {
        return "Habitacion{" + "costoNoche=" + this.costoNoche + ", estaOcupada=" + this.estaOcupada + ", cliente=" + this.cliente.toString() + '}';
    }
}
