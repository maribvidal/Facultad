package parcialturnoc;

/*
venta se registra: DNI del cliente, cantidad de m3
cargados, monto abonado y el medio de pago utilizado (débito, crédito o efectivo).
 */

public class Venta {
    private String DNI;
    private int metCubicos;
    private double montoAbonado;
    private String medioPago;

    public Venta(String DNI, int metCubicos, double montoAbonado, String medioPago) {
        this.setDNI(DNI);
        this.setMetCubicos(metCubicos); 
        this.setMontoAbonado(montoAbonado);
        this.setMedioPago(medioPago);
    }
    
    public String getDNI() {
        return DNI;
    }
    public void setDNI(String DNI) {
        this.DNI = DNI;
    }

    public int getMetCubicos() {
        return metCubicos;
    }
    public void setMetCubicos(int metCubicos) {
        this.metCubicos = metCubicos;
    }

    public double getMontoAbonado() {
        return montoAbonado;
    }
    public void setMontoAbonado(double montoAbonado) {
        this.montoAbonado = montoAbonado;
    }

    public String getMedioPago() {
        return medioPago;
    }
    public void setMedioPago(String medioPago) {
        this.medioPago = medioPago;
    }

    @Override
    public String toString() {
        return "Venta{" + "DNI=" + DNI + ", metCubicos=" + metCubicos + ", montoAbonado=" + montoAbonado + ", medioPago=" + medioPago + '}';
    }
}
