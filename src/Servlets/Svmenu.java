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
        int cantidad = 10;
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
            req.setAttribute("menu", menu); // Enviar los valores actuales al JSP para mostrarlos
            req.getRequestDispatcher("menuComida.jsp").forward(req, resp);
            return; // Terminar la ejecución del servlet
        }

        // Si todas las cantidades son válidas, continuar con el flujo normal
        req.setAttribute("menu", menu);
        RequestDispatcher dispatcher = req.getRequestDispatcher("pedido.jsp");
        dispatcher.forward(req, resp);
    }

}
