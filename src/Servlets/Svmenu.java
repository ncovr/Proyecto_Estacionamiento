package Servlets;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Svmenu", urlPatterns = {"/Svmenu"})
public class Svmenu extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int Ccompleto = Integer.parseInt(req.getParameter("completoCantidad"));
        int Chamburguesa = Integer.parseInt(req.getParameter("hamburguesaCantidad"));
        int Cpizza=Integer.parseInt(req.getParameter("pizzaCantidad"));
        int CpapasFritas=Integer.parseInt(req.getParameter("papasFritasCantidad"));
        int Csushi=Integer.parseInt(req.getParameter("sushiCantidad"));
        int Cbowl=Integer.parseInt(req.getParameter("bowlCantidad"));

        System.out.println("Completo: " + Ccompleto);
        System.out.println("Hamburguesa: " + Chamburguesa);
        System.out.println("Pizza: " + Cpizza);
        System.out.println("Papas Fritas: " + CpapasFritas);
        System.out.println("Sushi: " + Csushi);
        System.out.println("Bowl: " + Cbowl);

        resp.sendRedirect("menuPrincipal.jsp");
    }
}
