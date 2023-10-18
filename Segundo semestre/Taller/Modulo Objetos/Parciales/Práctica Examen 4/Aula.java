package parcialturnob;

public class Aula {
    private String nombre;
    private int capacidad = 0; //Inicialmente, el aula no tiene alumnos
    private Alumno [] vec_alumnos;
    private int vec_dimF;

    public Aula(String nombre, int capacidadMax) {
        this.setNombre(nombre);
        this.vec_dimF = capacidadMax;
        this.vec_alumnos = new Alumno [this.vec_dimF]; //El vector se inicializa con todos los elementos en null
    }
   
    public String getNombre() {
        return this.nombre;
    }
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public int getCapacidad() {
        return this.capacidad;
    }
    public int getCapacidadMax() {
        return this.vec_dimF;
    }
    
    //Método auxiliar
    public void insertarAlumno(Alumno unAlumno) {
        this.vec_alumnos[this.capacidad] = unAlumno;
        this.capacidad++;
    }
    
    //Método auxiliar
    public Alumno buscarPorLegajo(String unLegajo) {
        Alumno auxAlumno = null;
        String auxLegajo = "";
        boolean encontrado = false;
        int i = 0;
        
        while (i < this.capacidad && !encontrado) {
            auxLegajo = vec_alumnos[i].getLegajo();
            if (auxLegajo.equals(unLegajo)) {
                auxAlumno = vec_alumnos[i];
                encontrado = true;
            }
            i++;
        }
        
        return auxAlumno;
    }
    
    @Override
    public String toString() {
        String aux = "Aula: " + this.getNombre() + "\n";
        for (int i = 0; i < this.getCapacidad(); i++) //Solo se deberían leer aquellos alumnos ingresados
            aux = aux + this.vec_alumnos[i].toString() + "\n";
        return aux;
    }
}
