package repaso_ej4;

public class Repaso_Ej4 {
    public static void main(String[] args) {
        Director director = new Director("Ruperto", "123456", 40, 10);
        Corista c1 = new Corista("Miguel", "234", 18, 1);
        Corista c2 = new Corista("Manuel", "235", 18, 2);
        Corista c3 = new Corista("Manolo", "236", 18, 3);
        CoroSemicircular coroSemi = new CoroSemicircular(director, 5);
        CoroHileras coroHile = new CoroHileras(director, 3, 3);
        
        //Coro semicircular
        coroSemi.agregarCorista(c3);
        coroSemi.agregarCorista(c2);
        coroSemi.agregarCorista(c1);
        
        //Coro por hileras
        coroHile.agregarCorista(c3);
        coroHile.agregarCorista(c3);
        coroHile.agregarCorista(c3);
        coroHile.agregarCorista(c2);
        coroHile.agregarCorista(c2);
        coroHile.agregarCorista(c2);
        
        //Imprimir
        System.out.print(coroSemi.toString());
        System.out.println("¿Está bien formado?: " + coroSemi.estaBienFormado());
        System.out.println("");
        System.out.print(coroHile.toString());
        System.out.println("¿Está bien formado?: " + coroHile.estaBienFormado());
    }
}
