package ar.unlp.tendler.ejercicio9;

public class CajaDeAhorro extends Cuenta {
    double comision = 1.02;
    
    @Override
    public boolean extraer(double monto) {
        return super.extraer(monto * comision);
    }
    
    @Override
    public boolean transferirACuenta(double monto, Cuenta cuentaDestino) {
        return super.transferirACuenta(monto * comision, cuentaDestino);
    }
    
    public boolean puedeExtraer(double monto) {
        return (this.getSaldo() - monto > 0);
    }
}
