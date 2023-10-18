package parcialturnob;

public class ParcialTurnoB {
    public static void main(String[] args) {
        Aula aulaA = new Aula("Aula 5 - FORTRAN", 2);
        Aula aulaB = new Aula("Aula 11 - JAVA", 2);
        System.out.println(aulaA.getCapacidad());
        Examen examen = new Examen("18/10/2023", aulaA, aulaB);
        System.out.println(examen.toString());
        
        Alumno a1 = new Alumno("2229/2", "Cosme Fulanito");
        Alumno a2 = new Alumno("2229/3", "Cosme Menguito");
        Alumno a3 = new Alumno("2229/4", "Cosme Pito");
        Alumno a4 = new Alumno("2229/5", "Cosme Listo");
        Alumno a5 = new Alumno("2229/6", "Perez Pesado");
        Alumno a6 = new Alumno("2229/7", "Martin Gutierrez");
        Alumno a7 = new Alumno("2229/8", "Marco Peña");
        
        examen.agregarAlumno(a1);
        examen.agregarAlumno(a2);
        examen.agregarAlumno(a3);
        examen.agregarAlumno(a4);
        examen.agregarAlumno(a5);
        examen.agregarAlumno(a6);
        examen.agregarAlumno(a7);
        System.out.println(examen.toString());
        System.out.println("Capacidad aula A: " + aulaA.getCapacidad());
        System.out.println("Capacidad aula B: " + aulaB.getCapacidad());
    }
}
