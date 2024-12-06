package ar.edu.unlp.oo1.ejercicio24;

public abstract class Usuario 
{
    protected String nombre;
    protected double saldo;


    public Usuario(String nom)
    {
        this.nombre = nom;
        this.saldo = 0;
    }

    // Para el caso de los conductores, la comisión es siempre del 1% si el auto tiene menos de 5 años. Si no, es del 10%. 
    // En el caso de un pasajero, se cobra una comisión del 10% solo si no realizó ningún viaje los últimos 30 días.
    public void cargarSaldo(double monto) 
    {
        this.saldo += (monto - this.comisionExtra(monto));
    }

    public void restarSaldo(double costo)
    {
        this.saldo -= (costo - this.obtenerBonificacion(costo));
    }

    public double obtenerSaldo()
    {
        return this.saldo;
    }

    protected abstract double comisionExtra(double monto);
    protected abstract double obtenerBonificacion(double costo);
}
