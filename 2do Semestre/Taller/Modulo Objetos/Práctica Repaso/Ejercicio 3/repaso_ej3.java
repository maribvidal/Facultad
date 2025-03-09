package repaso_ej3;

/*

d) Realice un programa que instancie un evento ocasional y una gira, cargando la
información necesaria. Luego, para ambos, imprima el costo e invoque al mensaje actuar.

*/
public class Repaso_Ej3 {
    public static void main(String[] args) {
        Fecha f1 = new Fecha("La Plata", 6);
        EventoOcasional evento = new EventoOcasional("Radiohead", 3, "shOw privado", "Roberto", 2);
        Gira gira = new Gira("Tan Bionica", 6, "Gira Argentina", 10);
        evento.agregarTema("How to disappear completely");
        gira.agregarTema("Ciudad Magica");
        gira.agregarTema("Ella");
        gira.agregarFecha(f1);
        gira.agregarFecha(f1);
        System.out.println("Costo del evento ocasional: " + evento.calcularCosto());
        System.out.println("Costo de la gira: " + gira.calcularCosto());
        evento.actuar();
        System.out.println("");
        gira.actuar();
        gira.actuar();
    }
}
