import java.util.ArrayList;

public class Inventario {
    ArrayList<Producto> productos = new ArrayList<>();

    public Inventario() {}

    String getNombre(int codigo){
        for (Producto p : productos) {
            if (p.getCodigo() == codigo){
                return p.getNombre();
            }
        }
        return null;
    }

    int getCosto(int codigo){
        for (Producto p : productos) {
            if (p.getCodigo() == codigo){
                return p.getCosto();
            }
        }
        return 0;
    }

    void agregarProducto(Producto producto){
        productos.add(producto);
    }

    void eliminarProducto(Producto producto){
        productos.remove(producto);
    }



}
