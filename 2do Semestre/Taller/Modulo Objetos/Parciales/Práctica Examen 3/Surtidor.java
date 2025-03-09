package parcialturnoc;

/*
surtidor se conoce si se encuentra fuera de
servicio y la información de las ventas (como máximo V). 
 */
public class Surtidor {
    private boolean fueraDeServicio;
    private Venta [] vec_ventas;
    
    private int vec_dimF;
    private int vec_dimL = 0;

    //Constructor
    public Surtidor(boolean fueraDeServicio, int nroMax) {
        this.setFueraDeServicio(fueraDeServicio);
        this.vec_dimF = nroMax;
        
        vec_ventas = new Venta [this.vec_dimF];
    }

    public boolean getFueraDeServicio() {
        return fueraDeServicio;
    }
    public void setFueraDeServicio(boolean fueraDeServicio) {
        this.fueraDeServicio = fueraDeServicio;
    }

    public int getVec_dimL() {
        return vec_dimL;
    }
    public void setVec_dimL(int vec_dimL) {
        this.vec_dimL = vec_dimL;
    }
    
    //Métodos
    public void agregarVenta(Venta unaVenta) {
        if (this.vec_dimL < this.vec_dimF) {
            this.vec_ventas[this.vec_dimL] = unaVenta;
            this.vec_dimL++;
        } else {
            System.out.println("ERROR: El vector está lleno");
        }
    }
    public double verMetrosCubicosVendidos() {
        int acumulador = 0;
        for (int i = 0; i < this.vec_dimL; i++)
            acumulador = acumulador + this.vec_ventas[i].getMetCubicos();
        return acumulador;
    }
    public Venta obtenerVentaMax() {
        Venta ventaMax = null; //Declarando en null
        double montoMax = 0;
        
        for (int i = 0; i < this.vec_dimL; i++) { //Recorriendo el vector de ventas
            if (montoMax > this.vec_ventas[i].getMontoAbonado()) { //Actualizar máximo
                montoMax = this.vec_ventas[i].getMontoAbonado();
                ventaMax = this.vec_ventas[i];
            }
        }
        
        return ventaMax;
    }
    public String toString() {
        String aux = "";
        
        aux = aux + "¿ESTÁ FUERA DE SERVICIO? ";
        if (this.getFueraDeServicio()) {
            aux = aux + "SI / ";
        } else {
            aux = aux + "NO / ";
        }
        for (int i = 0; i < this.vec_dimL; i++)
            aux = aux + this.vec_ventas[i].toString() + "\n";
        
        return aux;
    }
}
