package unlp.oo2.ejercicio2;

public class Piedra extends Opcion {
    // Double Dispatch
    public String jugar(Opcion opcion) {
        return opcion.opcionPiedra();
    }

    public String opcionLagarto() { return "La piedra aplasta al lagarto"; }
    public String opcionPapel() { return "El papel cubre la piedra"; }
    public String opcionPiedra() { return "Empate"; }
    public String opcionSpock() { return "Spock vaporiza la piedra"; }
    public String opcionTijera() { return "La piedra aplasta la tijera"; }
}