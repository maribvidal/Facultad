package parcialturnob;

public class Examen {
    private String fecha;
    private String enunciado;
    private Aula aulaA;
    private Aula aulaB;

    public Examen(String fecha, Aula aulaA, Aula aulaB) {
        this.setFecha(fecha);
        this.setAulaA(aulaA);
        this.setAulaB(aulaB);
    }

    public String getFecha() {
        return this.fecha;
    }
    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getEnunciado() {
        return this.enunciado;
    }
    public void setEnunciado(String enunciado) {
        this.enunciado = enunciado;
    }

    public void setAulaA(Aula aulaA) {
        this.aulaA = aulaA;
    }
    public void setAulaB(Aula aulaB) {
        this.aulaB = aulaB;
    }
    
    //Métodos
    public boolean estaLlena(Aula unAula) {
        int capacidad = unAula.getCapacidadMax() - unAula.getCapacidad();
        return (capacidad == 0);
    }
    
    public String agregarAlumno(Alumno unAlumno) {
        String nomAula = "";
        int capA = this.aulaA.getCapacidad();
        int capB = this.aulaB.getCapacidad();
        int capA_max = this.aulaA.getCapacidadMax();
        int capB_max = this.aulaB.getCapacidadMax();
        
        if (capA < capA_max || capB < capB_max) {
            if (capA < capB) {
                this.aulaA.insertarAlumno(unAlumno);
                nomAula = this.aulaA.getNombre();
            } else if (capA >= capB) {
                this.aulaB.insertarAlumno(unAlumno);
                nomAula = this.aulaB.getNombre();
            }
        } else {
            System.out.println("ERROR: No hay mas capacidad en ningún aula");
        }
        
        return nomAula;
    }
    
    public void asignarNota(String unLegajo, int unaNota) {
        //Buscar alumno
        Alumno auxAlumno = null;
        auxAlumno = this.aulaA.buscarPorLegajo(unLegajo);
        if (auxAlumno == null)
            auxAlumno = this.aulaB.buscarPorLegajo(unLegajo);     
        
        if (auxAlumno != null) { //Asignar nota
            auxAlumno.setNota(unaNota);
        } else {
            System.out.println("ERROR: Dicho alumno no se encuentra registrado, o el legajo está mal ingresado");
        }
    }
    
    public int cuantosRinden() {
        return (this.aulaA.getCapacidad() + this.aulaB.getCapacidad());
    }
    
    @Override
    public String toString() {
        String aux = "Examen: Fecha: " + this.getFecha() + ", Cantidad de alumnos total: " + this.cuantosRinden() + "\n";
        aux = aux + this.aulaA.toString();
        aux = aux + this.aulaB.toString();
        return aux;
    }
}
