import java.util.ArrayList;

public class Cliente {
    private String patente;
    private String nombre;
    private String telefono;
    private ArrayList<Arriendo> arriendos;

    public Cliente(String patente, String nombre, String telefono) {
        this.patente = patente;
        this.nombre = nombre;
        this.telefono = telefono;
    }

    void registrarArriendo(int idPlaza){
        arriendos.add(new Arriendo(idPlaza));
    }


    // _+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+
    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getTelefono() {
        return telefono;
    }

    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }
}
