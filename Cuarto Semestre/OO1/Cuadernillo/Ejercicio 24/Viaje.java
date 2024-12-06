package ar.edu.unlp.oo1.ejercicio24;

import java.time.LocalDate;
import java.util.List;
import java.util.ArrayList;
import java.time.temporal.ChronoUnit;

public class Viaje {
    private String origen;
    private String destino;
    private double costoTotal;
    private LocalDate fechaViaje;
    private Vehiculo vehiculoAsociado;
    private List<Usuario> pasajeros;

    // +<<create>> Viaje(orig: String, dest: String, costoT: Real, fechaV: LocalDate, ve: Vehiculo)
    public Viaje(String orig, String dest, double costoT, LocalDate fechaV, Vehiculo ve)
    {
        this.origen = orig;
        this.destino = dest;
        this.costoTotal = costoT;
        this.fechaViaje = fechaV;
        this.vehiculoAsociado = ve;
        this.pasajeros = new ArrayList<Usuario>();
    }

    public void agregarPasajero(Usuario usu)
    {
        if (this.vehiculoAsociado.tieneCapacidad())
        {
            pasajeros.add(usu);
            this.vehiculoAsociado.decrementarCapacidad();
        }
    }

    public void procesarViaje()
    {
        double costoDividido = (this.costoTotal / this.pasajeros.size());
        this.pasajeros.stream().forEach(pasaj -> pasaj.restarSaldo(costoDividido));
    }

    public int haceCuantosDias()
    {
        return (int) ChronoUnit.DAYS.between(this.fechaViaje, LocalDate.now());
    }

    public boolean faltanMasDeDosDias()
    {
        return (this.fechaViaje.isBefore(LocalDate.now().minusDays(2)));
    }
}
