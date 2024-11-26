import java.util.ArrayList;

public class Inventario {
    private ArrayList<Producto> productos = new ArrayList<>();

    public Inventario() {}

    String getNombre(String codigo){
        for (Producto p : productos) {
            if (p.getCodigo().equals(codigo)){
                return p.getNombre();
            }
        }
        return null;
    }

    int getCosto(String codigo){
        for (Producto p : productos) {
            if (p.getCodigo().equals(codigo)){
                return p.getCosto();
            }
        }
        return 0;
    }

    private Producto getProducto(String codigo){
        for (Producto p : productos) {
            if (p.getCodigo().equals(codigo)){
                return p;
            }
        }
        return null;
    }

    int calcularValor(ArrayList<String> codigos){
        int valor = 0;
        for (String codigo : codigos){
            valor += getCosto(codigo);
        }
        return valor;
    }

    void agregarProducto(String codigo, String nombre, int costo, int cantidad){
        if (getProducto(codigo) == null) {
            productos.add(new Producto(codigo, nombre, costo, cantidad));
        }
    }

    void eliminarProducto(Producto producto){
        productos.remove(producto);
    }



}
