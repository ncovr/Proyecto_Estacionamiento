import java.time.Duration;
import java.time.LocalDateTime;

public class Arriendo {
    private LocalDateTime inicio;
    private LocalDateTime fin;
    private int idPlaza;

    public Arriendo(int idPlaza) {
        this.idPlaza = idPlaza;
        this.inicio = LocalDateTime.now();
    }

    void cancelarArriendo() {

    }

    // Calcula el precio del arriendo
    int calcularPrecio(int tarifaMinuto){
        return (int) Duration.between(inicio, fin).toMinutes() * tarifaMinuto;
    }

    // _+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+_+

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
