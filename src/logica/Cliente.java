package logica;

import java.util.ArrayList;

public class Cliente {
    private String nombre;
    private String telefono;
    private ArrayList<Arriendo> arriendos = new ArrayList();

    public Cliente(String nombre, String telefono) {
        this.nombre = nombre;
        this.telefono = telefono;
    }

    void registrarArriendo(int idPlaza, String patente){
        arriendos.add(new Arriendo(idPlaza, patente));
    }


    // _+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+
    // Retorna el logica.Arriendo que esté activo
    public Arriendo getArriendoActivo(String patente){
        // Un cliente puede tener registros de muchos arriendos, por lo que se retorna el que esté activo
        for (Arriendo ar : arriendos) {
            if (ar.getFin() == null && ar.getPatente().equals(patente)) {
                return ar;
            }
        }
        return null;
    }

    // Retorna un arreglo en donde cada posición se almacena un logica.Arriendo, esté activo o inactivo
    String[] getArriendos(){
        String[] arr = new String[arriendos.size()];
        Arriendo a;
        for (int i = 0; i < arriendos.size(); i++) {
            a = arriendos.get(i);
            arr[i] = a.getPatente()+/*", "+a.getEstado()+*/", "+a.getFin();
        }
        return arr;
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
