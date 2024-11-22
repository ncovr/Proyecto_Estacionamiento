public class Producto {
    private int codigo;
    private String nombre;
    private int costo;

    public Producto(int codigo, String nombre, int costo) {
        this.codigo = codigo;
        this.nombre = nombre;
        this.costo = costo;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCosto() {
        return costo;
    }

    public void setCosto(int costo) {
        this.costo = costo;
    }
}
