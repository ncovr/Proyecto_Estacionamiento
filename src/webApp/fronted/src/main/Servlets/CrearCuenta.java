package webApp.fronted.src.main.Servlets;

import main.Sistema;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;

@WebServlet(name = "CrearCuenta", urlPatterns = {"/CrearCuenta"})
public class CrearCuenta extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        HashMap<String, String> data = new HashMap<>();
        System.out.println("nombre " + username + " password " + password);
        data.put(username, password);//key-value
        if (data.containsKey(username) && data.containsValue(password)) {
            System.out.println("data save");
        } else {
            System.out.println("error");
        }
        boolean isRegistered = registrarUsuario(username, password);
        if (isRegistered) {
            // Redirigir al login o a otra página si el registro es exitoso
            response.sendRedirect("pedido.jsp");//CAMBIAR
        } else {
            // Mostrar un mensaje de error si ocurre algún problema
            request.setAttribute("errorUsername", "Error al registrar la cuenta. Intente nuevamente.");
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
    //logica del programa

    private boolean registrarUsuario(String usernamer, String password) {
        return true;
    }

}


