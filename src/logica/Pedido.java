package logica;

import java.time.LocalDateTime;
import java.util.ArrayList;

public class Pedido {
    private LocalDateTime fecha;
    private int valor;
    private ArrayList<String> codigos = new ArrayList<>();
    private String serial;

    public Pedido(int codigo, ArrayList<String> codigos){
        this.codigos = codigos;
        this.fecha = LocalDateTime.now();
        serial = fecha.getMonthValue() + "-" + fecha.getDayOfMonth() + "-" + fecha.getYear()+"_"+codigo;

    }

    void agregarCodigo(String codigo){
        this.codigos.add(codigo);
    }

    void eliminarCodigo(int codigo){
        this.codigos.remove(codigo);
    }

    ArrayList<String> getDatos(){
        ArrayList<String> datos = new ArrayList<>();

        datos.add(fecha.getDayOfMonth() + "-" + fecha.getMonthValue() + "-" + fecha.getYear()); // Fecha
        datos.add(fecha.getHour() + "-" + fecha.getMinute() + "-" + fecha.getSecond()); // Hora
        datos.add(valor+"");
        datos.add(serial);

        return datos;
    }

    String getSerial(){
        return serial;
    }

    ArrayList<String> getCodigos(){
        return codigos;
    }

    void setValor(int valor){
        this.valor = valor;
    }

    int getValor(){
        return valor;
    }
}
