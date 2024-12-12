package Servlets;
import logica.Exception.RutException;
import logica.Sistema;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@WebServlet(name="Svlogin", urlPatterns={"/Svlogin"})
public class Svlogin extends HttpServlet {
    Sistema sistema = Sistema.getInstance();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String rut=req.getParameter("username");
        String pass=req.getParameter("password");
        boolean run;
        try {
            run=sistema.crearPersona(rut);
        } catch (RutException e) {
            run=false;
            throw new RuntimeException(e);
        }

        if (run && sistema.validarUsuario(pass,rut)) {
            resp.sendRedirect("menuPrincipal.jsp");
            System.out.println("usuario ya esta registrado");

        } else {
            req.setAttribute("errorUsername", "Error al ingresar a la cuenta. Intente de nuevo");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
            System.out.println("no register");
        }

    }

}
