import java.time.LocalDateTime;
import java.util.ArrayList;

public class Pedido {
    private LocalDateTime fecha;
    private String valor;
    private ArrayList<Integer> codigos;

    public Pedido(){
        this.fecha = LocalDateTime.now();
    }

    void agregarCodigo(int codigo){
        this.codigos.add(codigo);
    }

    void eliminarCodigo(int codigo){
        this.codigos.remove(codigo);
    }

    String generarBoleta(){
        return null;
    }

    private int calcularValor(){
        return -1;
    }
}
