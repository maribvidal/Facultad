package ar.edu.unlp.oo1.ejercicio24;

import java.time.LocalDate;

public class Conductor extends Usuario 
{
    private Vehiculo vehiculo;

    public Conductor(String nom, Vehiculo veh)
    {
        super(nom);
        this.vehiculo = veh;
    }

    // Para el caso de los conductores, la comisiÃ³n es siempre del 1% si el auto tiene menos de 5 aÃ±os. Si no, es del 10%.
    protected double comisionExtra(double monto)
    {
        return (this.vehiculo.antiguedadAÃ±osVehiculo() < 5 ? monto * 0.01 : monto * 0.1);
    }

    // Del monto correspondiente al conductor, se le bonifica el 0.1% del valor del vehÃ­culo utilizado para el viaje
    protected double obtenerBonificacion(double costo)
    {
        return (costo - (this.vehiculo.obtenerValor() * 0.1));
    }

    public Viaje darDeAlta(String origen,String destino, double costoTotal,Vehiculo vehiculo,LocalDate fecha)
    {
        Viaje viaje = new Viaje(origen,destino,costoTotal,fecha,vehiculo);
        viaje.agregarPasajero(this);
        return viaje;
    }
}
