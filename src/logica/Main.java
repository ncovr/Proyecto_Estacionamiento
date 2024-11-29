package logica;

import java.util.ArrayList;
import java.util.Scanner;

public class Main {
    private Sistema i = Sistema.getInstance();
    private Scanner in = new Scanner(System.in);
    private String in1, in2, in3, in4;
    private ArrayList<String> aux2 = new ArrayList<>();

    public static void main(String[] args) {
        Main app = new Main(); // Crear instancia de la clase
        app.test();
/*
        do {
            app.menu(); // Llamar métodos no estáticos usando la instancia
            app.espaciado();
        } while (!app.aux[0].equals("0"));
*/
    }

    private void espaciado() {
        System.out.println("\n");
    }

    private void menu() {
        System.out.println("Bienvenido al sistema (^. ^)");
        System.out.print("Ingrese id de usuario: ");
        in1 = in.nextLine();
        System.out.print("Ahora, su clave: ");
        in2 = in.nextLine();
        switch (in1) {
            case "admin":
                break;
            case "cajero":
                break;
            case "entrada":
                break;
            default:
                System.out.println("id y/o clave incorrectas. Será redirigido al menu principal");
        }
    }

    private void test() {
        // Crear cliente, ingresar un vehículo al sistema, luego desarrendarlo
        System.out.println("Se arrienda");
        i.arrendar("AABB00", "Nicolas Verdugo", "912345678");
        System.out.println("Arriendos:");
        i.consultarArriendos("AABB00", "Nicolas Verdugo");
        System.out.println("Se desarrienda");
        i.desarrendar("AABB00", "Nicolas Verdugo");
        System.out.println("Arriendos:");
        i.consultarArriendos("AABB00", "Nicolas Verdugo");


        System.out.println("\nSe arrienda");
        i.arrendar("AABB00", "Nicolas Verdugo", "912345678");
        System.out.println("Arriendos:");
        i.consultarArriendos("AABB00", "Nicolas Verdugo");
        System.out.println("Se desarrienda");
        i.desarrendar("AABB00", "Nicolas Verdugo");
        System.out.println("Arriendos:");
        i.consultarArriendos("AABB00", "Nicolas Verdugo");

        // Pausar la ejecución durante 90 segundos (1 minuto y medio)
        /*try {
            Thread.sleep(90 * 1000); // 90 segundos en milisegundos
        } catch (InterruptedException e) {
            System.out.println("La pausa fue interrumpida: " + e.getMessage());
        }*/

        /*i.addProductoInventario("01", "Cazuela", 2800, 10);
        i.addProductoInventario("02", "Pan", 500, 10);
        i.addProductoInventario("03", "Calla", 5000, 10);


        System.out.println("Ingrese a continuación los codigos. Para terminar, presione enter: ");
        aux2 = new ArrayList<>();
        in1 = in.nextLine();
        while (!in1.isEmpty()) {
            aux2.add(in1);
            in1 = in.nextLine();
        }
        String codigo = i.ingresarPedido(aux2);
        i.mostrarPedidos();
        System.out.print("Confirme pago (INGRESE CUALQUIER COSA SI SE CONFIRMA): ");
        in1 = in.nextLine();
        if (in1.isEmpty()) {
            i.cancelarPedido(codigo);
        }

        i.mostrarPedidos();*/



    }

}
