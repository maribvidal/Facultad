package ar.edu.unlp.oo1.ejercicio9;

public class CuentaCorriente extends Cuenta {
    double limiteDescubierto;
	
    public CuentaCorriente(double saldo) {
    	super.depositar(saldo);
    	limiteDescubierto = 0;
    }
	
    public void setLimiteDescubierto (double limite) { //lo negocia cada cliente
    	if (limite > 0)
    		limiteDescubierto = limite;
    }
   
	@Override
    public boolean puedeExtraer(double monto) {
        return ((this.getSaldo() + limiteDescubierto) - monto > 0);
    }   
}
