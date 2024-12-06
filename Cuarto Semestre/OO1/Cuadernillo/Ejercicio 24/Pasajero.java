package ar.edu.unlp.oo1.ejercicio24;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class Pasajero extends Usuario
{
    private List<Viaje> viajes;

    public Pasajero(String nombre){
        super(nombre);
        this.viajes = new ArrayList<Viaje>();
    }

    public void registrarseEnViaje(Viaje vi)
    {
        if (this.tieneSaldo() && vi.faltanMasDeDosDias())
        {
            vi.agregarPasajero(this);
            this.viajes.add(vi);
        }
    }

    public double comisionExtra(double monto){
        if (this.viajoHaceUnMes()) {
            monto -= monto*0.1;
        }
        return monto;
    }

    protected double obtenerBonificacion(double costo){
        return ((this.viajes.size()>=1) ? 500 : 0);
    }

    private boolean tieneSaldo() {
        return (this.saldo > 0);
    }

    private boolean viajoHaceUnMes()
    {
       // return fecha.isBefore(LocalDate.now().minusDays(30));
       return !this.viajes.stream().anyMatch(v -> v.haceCuantosDias()<=30);
    }
}
