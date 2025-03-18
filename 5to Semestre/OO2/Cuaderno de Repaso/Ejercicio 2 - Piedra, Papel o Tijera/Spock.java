package unlp.oo2.ejercicio2;

public class Spock extends Opcion {
    // Double Dispatch
    public String jugar(Opcion opcion) {
        return opcion.opcionSpock();
    }

    public String opcionLagarto() { return "El lagarto envenena a Spock"; }
    public String opcionPapel() { return "El papel desaprueba a Spock"; }
    public String opcionPiedra() { return "Spock vaporiza la piedra"; }
    public String opcionSpock() { return "Empate"; }
    public String opcionTijera() { return "Spock rompe la tijera"; }
}