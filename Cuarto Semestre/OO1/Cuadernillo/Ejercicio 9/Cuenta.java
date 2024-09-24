/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ar.unlp.tendler.ejercicio9;

/**
 *
 * @author alumnos
 */
public abstract class Cuenta {
    double saldo;
    
    public Cuenta() {
        this.saldo = 0;
    } 
        
    public double getSaldo() {
        return this.saldo;
    }
    public void depositar (double monto) {
        this.saldo += monto;
    }
    public boolean extraer(double monto) {
        if (this.puedeExtraer(monto)) {
            this.extraerSinControlar(monto);
            return true;
        }
        return false;
    }
    public boolean transferirACuenta(double monto, Cuenta cuentaDestino) {
        if (this.puedeExtraer(monto)) {
            this.extraerSinControlar(monto);
            cuentaDestino.depositar(monto);
            return true;
        }
        return false;
    }
    
    protected void extraerSinControlar(double monto) {
        this.saldo -= monto;
    }
    
    public abstract boolean puedeExtraer(double monto);
}
