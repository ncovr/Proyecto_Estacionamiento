package Servlets;

import logica.Sistema;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;


@WebServlet(name = "Svcuenta", urlPatterns = {"/Svcuenta"})
public class Svcuenta extends HttpServlet {
    Sistema sistema = Sistema.getInstance();
    int espacioId = 12;
    int[] espacio=new int[espacioId];


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try{
            for (int i = 1; i <= espacioId; i++) {
                espacio[i]= Integer.parseInt(req.getParameter("opcion"+(i)));
            }
            System.out.println("done");

            resp.sendRedirect("estacionamiento.jsp");
        }catch(NumberFormatException e){
            System.err.println("Error al procesar los estados: " + e.getMessage());
            req.setAttribute("error", "Datos inválidos");
            req.getRequestDispatcher("estacionamiento.jsp").forward(req, resp);
        }
    }

}
