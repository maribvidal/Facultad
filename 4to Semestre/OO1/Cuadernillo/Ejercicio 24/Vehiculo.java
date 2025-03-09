package ar.edu.unlp.oo1.ejercicio24;

import java.time.*;

public class Vehiculo 
{
    private String descripcion;
    private int capacidad;
    private int añoFabricacion;
    private double valorMercado;

    public Vehiculo(String desc, int capac, int añoFab, double valorM) 
    {
        this.descripcion = desc;
        this.capacidad = capac;
        this.añoFabricacion = añoFab;
        this.valorMercado = valorM;
    }

    public boolean tieneCapacidad() 
    {
        return (this.capacidad > 0);
    }

    public void decrementarCapacidad()
    {
        this.capacidad--;
    }
    
    public double obtenerValor()
    {
        return this.valorMercado;
    }

    public int antiguedadAñosVehiculo()
    {
        return LocalDate.now().getYear() - this.añoFabricacion;
    }
}
