package Servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "Svmenu", urlPatterns = {"/Svmenu"})
public class Svmenu extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HashMap<String, Integer> menu = new HashMap<>();

        String[] carta = {"completo", "hamburguesa", "pizza", "papasFritas", "sushi", "bowl"};
        int cantidad = 15;
        boolean cantidadExcede = false;

        for (int i = 0; i < carta.length; i++) {
            menu.put(carta[i], Integer.parseInt(req.getParameter(carta[i] + "Cantidad")));

        }

        for (String key : menu.keySet()) {
            System.out.println(key + ", cantidad :" + menu.get(key));
            if (menu.get(key) > cantidad) {
                cantidadExcede = true;
            }
        }
        if (cantidadExcede) {
            req.setAttribute("errorCantidad", "Error al registrar. Una o más cantidades exceden el máximo " +
                    "permitido de " + cantidad + ".");
            req.getRequestDispatcher("menuComida.jsp").forward(req, resp);
            return; // Terminar la ejecución del servlet
        }
        //revision si pidio cero elementos del menu
        boolean isCero = false;
        isCero = mismoValor(menu);
        if (isCero) {
            req.setAttribute("errorCantidad", "Erro al registar. Las cantidad no pueden ser cero");
            req.getRequestDispatcher("menuComida.jsp").forward(req, resp);
            return;
        }
        // Si todas las cantidades son válidas, continuar con el flujo normal
        req.setAttribute("menu", menu);
        RequestDispatcher dispatcher = req.getRequestDispatcher("pedido.jsp");
        dispatcher.forward(req, resp);


    }

    public static <K, V> boolean mismoValor(HashMap<K, V> map) {
        if (map.isEmpty()) return true; // Si está vacío, consideramos que son "iguales"
        // Obtén un iterador para los valores
        V firstValue = null;
        for (V value : map.values()) {
            if (firstValue == null) {
                firstValue = value; // Inicializa el primer valor
            } else if (!firstValue.equals(value)) {
                return false; // Si algún valor es diferente, regresa falso
            }
        }
        return true; // Si llega aquí, todos son iguales
    }


}
