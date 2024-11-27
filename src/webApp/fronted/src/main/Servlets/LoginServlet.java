package webApp.fronted.src.main.Servlets;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validación de usuario y contraseña (esto es solo un ejemplo)
        if ("admin".equals(username) && "1234".equals(password)) {
            // Redirigir al usuario a la página principal si las credenciales son correctas
            response.sendRedirect("dashboard.jsp");
        } else {
            // Si las credenciales son incorrectas, mostrar un mensaje de error
            request.setAttribute("errorUsername", "Usuario o contraseña incorrectos.");
            request.setAttribute("errorPassword", "Usuario o contraseña incorrectos.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}
