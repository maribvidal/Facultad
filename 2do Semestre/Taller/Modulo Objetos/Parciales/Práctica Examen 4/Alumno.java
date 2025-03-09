package parcialturnob;

public class Alumno {
    private String legajo;
    private String apeNom;
    private int nota = -1; //El -1 simboliza que no está cargada
    
    public Alumno(String legajo, String apeNom) {
        this.setLegajo(legajo);
        this.setApeNom(apeNom);
    }
    
    public String getLegajo() {
        return this.legajo;
    }
    public void setLegajo(String legajo) {
        this.legajo = legajo;
    }

    public String getApeNom() {
        return this.apeNom;
    }
    public void setApeNom(String apeNom) {
        this.apeNom = apeNom;
    }

    public int getNota() {
        return this.nota;
    }
    public void setNota(int nota) {
        this.nota = nota;
    }
    
    @Override
    public String toString() {
        String aux = this.getLegajo() + " - " + this.getApeNom();
        if (nota != -1) { //Mostrar nota si está cargada
            aux = aux + " - " + this.getNota();
        }
        return aux;
    }
}
