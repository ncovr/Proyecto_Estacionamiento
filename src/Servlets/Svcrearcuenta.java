package Servlets;

import logica.Exception.RutException;
import logica.Sistema;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Svcrearcuenta", urlPatterns = {"/Svcrearcuenta"})
public class Svcrearcuenta extends HttpServlet {
    Sistema sistema = Sistema.getInstance();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String rut = req.getParameter("username");
        String pass = req.getParameter("password");
        boolean run;
        try {
            run = sistema.crearPersona(rut);
        } catch (RutException e) {
            run = false;
            throw new RuntimeException(e);
        }
        if(sistema.validarUsuario(rut)){

            req.setAttribute("errorUsername", "Error al registrar la cuenta. La cuenta ya existe.");
            req.getRequestDispatcher("crearCuenta.jsp").forward(req, resp);
            System.out.println("usuario ya esta registrado");
        }
        if (run && sistema.registrarUsuario(rut, pass) ) {
            resp.sendRedirect("menuPrincipal.jsp");
            System.out.println("usuario registrado, rut " + rut + " password " + pass);
        } else {
            req.setAttribute("errorUsername", "Error al registrar la cuenta. Intente nuevamente.");
            req.getRequestDispatcher("crearCuenta.jsp").forward(req, resp);
            System.out.println("no register");
        }


    }
}
