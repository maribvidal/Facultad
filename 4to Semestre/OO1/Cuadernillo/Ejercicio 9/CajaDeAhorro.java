package ar.edu.unlp.oo1.ejercicio9;

public class CajaDeAhorro extends Cuenta {
    double comision = 0.02;
    
    public CajaDeAhorro(double saldo) {
    	super.depositar(saldo);
    }
    
    @Override
    public boolean extraer(double monto) {
        return super.extraer(monto + monto * comision);
    }
    
    @Override
    public boolean transferirACuenta(double monto, Cuenta cuentaDestino) {
    	if (puedeExtraer(monto * comision)) {
    		super.transferirACuenta(monto, cuentaDestino);
    		this.saldo -= monto * comision;
    		return true;
    	}
    	return false;
    }
    
    @Override
    public void depositar(double monto) {
    	// Se cobra la comisión al depositar
    	super.depositar(monto - (monto * comision));
    }
    
    public boolean puedeExtraer(double monto) {
        return (this.getSaldo() - monto > 0);
    }
}
