import java.util.ArrayList;

public class Sistema {
    private boolean[] plazas;
    private final int tarifaMinuto;
    ArrayList<Cliente> clientes;
    ArrayList<Pedido> pedidos;
    Inventario inventario;
    Sistema instance;

    Sistema() {
        if (instance == null) {
            instance = new Sistema();
        }

        plazas = new boolean[10];
        tarifaMinuto = 10;
    }

    // Retorna la primera plaza que encuentre disponible
    int disponible(){
        for (int i = 0; i < plazas.length; i++) {
            if (!plazas[i]) {
                return i+1;
            }
        }
        return 0; // 0: no hay espacio
    }

    void arrendar(String patente, String nombre){
        // Asigna un vehiculo en la primera plaza disponible que encuentre
        int plaza = disponible();
    }

    void desarrendar(String patente, String nombre){

    }

    void ingresarPedido(){

    }

    void editarPersonal(){

    }


}
