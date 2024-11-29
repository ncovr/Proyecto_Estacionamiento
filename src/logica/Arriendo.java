package logica;

import java.time.Duration;
import java.time.LocalDateTime;

public class Arriendo {
    private LocalDateTime inicio;
    private LocalDateTime fin;
    private String patente;
    private int idPlaza;

    public Arriendo(int idPlaza, String patente) {
        this.patente = patente;
        this.idPlaza = idPlaza;
        this.inicio = LocalDateTime.now();
    }

    void cancelarArriendo() {
        this.fin = LocalDateTime.now();
    }

    // Calcula el precio del arriendo
    int calcularPrecio(int tarifaMinuto){
        return (int) Duration.between(inicio, LocalDateTime.now()).toMinutes() * tarifaMinuto;
    }

    String getEstado(){
        if (this.fin == null) return "En curso";
        return "Terminado";
    }

    // _+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+


    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }

    public LocalDateTime getInicio() {
        return inicio;
    }

    public void setInicio(LocalDateTime inicio) {
        this.inicio = inicio;
    }

    public LocalDateTime getFin() {
        return fin;
    }

    public void setFin(LocalDateTime fin) {
        this.fin = fin;
    }

    public int getIdPlaza() {
        return idPlaza;
    }

    public void setIdPlaza(int idPlaza) {
        this.idPlaza = idPlaza;
    }
}
