package parcialturnoc;

/*
La estación posee una
dirección, precio por m3 y la información de sus 6 surtidores
 */

public class Estacion {
    private String direccion;
    private double precioM3;
    private Surtidor [] vec_surtidores = new Surtidor[6];
    private int maxVentas;

    public Estacion(String direccion, double precioM3, int maxVentas) {
        this.setDireccion(direccion);
        this.setPrecioM3(precioM3);
        
        for (int i = 0; i < 6; i++)
            vec_surtidores[i] = new Surtidor(true, maxVentas);
    }
    
    public String getDireccion() {
        return direccion;
    }
    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public double getPrecioM3() {
        return precioM3;
    }
    public void setPrecioM3(double precioM3) {
        this.precioM3 = precioM3;
    }
    
    //Métodos
    //a) Dado un número N de surtidor, el DNI de un cliente, una cantidad de m3 y una forma de pago, generar la venta
    //correspondiente y agregarla en dicho surtidor de la estación. Asumir que el número N de surtidor es válido.
    public void generarVenta(int nroSurtidor, String dniCliente, int cantM3, String medioPago) {
        Venta nueVenta = new Venta(dniCliente, cantM3, cantM3 * this.precioM3, medioPago);
        this.vec_surtidores[nroSurtidor].agregarVenta(nueVenta);
    }
    //b) Dado un valor X, marcar como fuera de servicio aquellos surtidores que hayan vendido menos de X m3 en total
    //(entre int sus ventas).
    public void marcarFuera(int cantidad) {
        for (int i = 0; i < 6; i++) {
            if (this.vec_surtidores[i].verMetrosCubicosVendidos() < cantidad)
                this.vec_surtidores[i].setFueraDeServicio(false);
        }
    }
    //c) Obtener la venta realizada con mayor monto abonado de toda la estación.
    public Venta obtenerVentaMayor() {
        Venta ventaMax = null, ventaAux = null;
        double montoMax = 0;
        
        for (int i = 0; i < 6; i++) {
            ventaAux = this.vec_surtidores[i].obtenerVentaMax();
            if (montoMax > ventaAux.getMontoAbonado()) {
                montoMax = ventaAux.getMontoAbonado();
                ventaMax = ventaAux;
            }
        }
        
        return ventaMax;
    }
    
    public String toString() {
        String aux = "";
        
        aux = aux + "ESTACION DIRECCIÓN: " + this.getDireccion() + " / PRECIO POR M3: " + this.getPrecioM3() + "\n";
        for (int i = 0; i < 6; i++)
            aux = aux + "SURTIDOR NO." + (i+1) + " / " + this.vec_surtidores[i].toString() + "\n";
        
        return aux;
    }
}
