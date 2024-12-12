package logica;

import logica.Exception.RutException;
import logica.Serializable.UsuarioManager;
import logica.Serializable.Usuario;

import java.util.ArrayList;

public class Sistema {
    private static ArrayList<Usuario>usuarios;
    private boolean[] plazas;
    private final int tarifaMinuto;
    private ArrayList<Cliente> clientes = new ArrayList<>();
    private ArrayList<Pedido> pedidos = new ArrayList<>();
    private Inventario inventario = new Inventario();
    private static Sistema instance;

    public Sistema() {
        plazas = new boolean[10];
        tarifaMinuto = 10;
        this.usuarios=UsuarioManager.cargarUsuario();
    }

    public static Sistema getInstance() {
        if (instance == null) {
            instance = new Sistema();
        }
        return instance;
    }

    // Retorna el índice de la primera plaza que encuentre disponible
    int disponible() {
        for (int i = 0; i < plazas.length; i++) {
            if (!plazas[i]) {
                return i;
            }
        }
        return -1; // 0: no hay espacio
    }

    // Asigna un vehiculo en la primera plaza disponible que encuentre
    void arrendar(String patente, String nombre, String telefono) {
        // Se crea un cliente y luego se busca si existe en el sistema
        Cliente c = new Cliente(nombre, telefono);
        for (Cliente cliente : clientes) {
            if (cliente.getNombre().equals(nombre) && cliente.getTelefono().equals(telefono)) {
                c = cliente;
                clientes.remove(cliente);
                break;
            }
        }

        // Se registra el arriendo y se almacena al cliente en el sistema
        c.registrarArriendo(disponible(), patente);
        plazas[disponible()] = true;
        clientes.add(c);
    }

    void consultarArriendos(String patente, String nombre) {
        String[] arr = null;

        for (Cliente cliente : clientes) {
            if (cliente.getNombre().equals(nombre)) {
                arr = cliente.getArriendos();
                break;
            }
        }

        for (int i = 0; i < arr.length; i++) {
            System.out.print(" " + arr[i]);
        }
        System.out.println();


    }

    int calcularPrecio(String patente, String nombre) {
        for (Cliente cliente : clientes) {
            if (cliente.getNombre().equals(nombre)) {
                return cliente.getArriendoActivo(patente).calcularPrecio(10);
            }
        }
        return 0;
    }

    void desarrendar(String patente, String nombre) {
        // Busca al cliente en sistema para desarrendar
        int idPlaza = -1;
        for (Cliente cliente : clientes) {
            if (cliente.getNombre().equals(nombre)) {
                idPlaza = cliente.getArriendoActivo(patente).getIdPlaza();
                cliente.getArriendoActivo(patente).cancelarArriendo();
            }
        }

        if (idPlaza != -1) {
            plazas[idPlaza] = false;
        }

    }

    // Comida Rapida _-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_

    //Determina un codigo único para un pedido
    private int codificar() {
        if (pedidos.isEmpty()) {
            return 1;
        }
        return pedidos.indexOf(pedidos.getLast()) + 2;
    }

    String ingresarPedido(ArrayList<String> codigos) {
        Pedido pedido = new Pedido(codificar(), codigos);
        pedido.setValor(inventario.calcularValor(codigos));
        pedidos.add(pedido);
        return pedido.getSerial();
    }

    void cancelarPedido(String serial) {
        if (pedidos.isEmpty()) {
            System.out.println("No registran pedidos");
            return;
        }

        for (Pedido pedido : pedidos) {
            if (pedido.getSerial().equals(serial)) {
                pedidos.remove(pedido);
                return;
            }
        }
    }

    void mostrarPedidos() {
        if (pedidos.isEmpty()) {
            System.out.println("No registran pedidos");
        }

        for (Pedido pedido : pedidos) {
            System.out.println(pedido.getSerial() + " por: " + pedido.getValor());
        }
    }

    // Ingresa productos al inventario
    void addProductoInventario(String codigo, String nombre, int costo, int cantidad) {
        inventario.agregarProducto(codigo, nombre, costo, cantidad);
    }

    // Recoge datos del pedido y el detalle de los productos para luego generar una boleta
    void boletaPedido(int serial) {
        ArrayList<String> datos = new ArrayList<>();
        if (!pedidos.isEmpty()) {
            for (Pedido pedido : pedidos) {
                if (pedido.getSerial().equals(serial)) {
                    datos.addAll(pedido.getDatos());
                }
            }
        }

    }

    public boolean crearPersona(String run) throws RutException {
        Boolean isValid;
        try {
            isValid=Rut.isValido(run);
            if(isValid){
                return true;
            }
        } catch (RutException e) {
            return false;
        }
        return false;
    }

    // Registrar un nuevo usuario
    public boolean registrarUsuario(String run, String password) {
        if (UsuarioManager.esUsuarioRegistrado(usuarios, password,run)) {
            return false; // El usuario ya está registrado
        }

        Usuario nuevoUsuario = new Usuario(run, password);
        usuarios.add(nuevoUsuario);

        // Guardar los cambios en el archivo
        UsuarioManager.guardarUsuario(usuarios);
        return true;
    }

    // Validar un usuario
    public boolean validarUsuario(String password, String user) {
        return UsuarioManager.esUsuarioRegistrado(usuarios, password, user);
    }





}
