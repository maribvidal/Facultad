package ar.unlp.tendler.ejercicio9;

public class CuentaCorriente extends Cuenta {
    @Override
    
    
    public boolean puedeExtraer(double monto) {
        return (this.getSaldo() - monto > 0);
    }   
}
