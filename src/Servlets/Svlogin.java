package Servlets;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name="Svlogin", urlPatterns={"/Svlogin"})
public class Svlogin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String user=req.getParameter("username");
        String pass=req.getParameter("password");
        System.out.println("nombre " + user + " password " + pass);

        boolean registered=register(user,pass);
        if (registered){
            resp.sendRedirect("menuPrincipal.jsp");
        }else{
            req.setAttribute("errorUsername", "Error al registrar la cuenta. Intente nuevamente.");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }

    public boolean register(String user, String pass){
        return true;
    }
}
