package Servlets;

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

        String[] carta={"completo","hamburguesa","pizza","papasFritas","sushi","bowl"};

        for (int i = 0; i < carta.length; i++) {
            menu.put(carta[i], Integer.parseInt(req.getParameter(carta[i]+"Cantidad")));
        }

        for (String key : menu.keySet()) {
            System.out.println( key + ", cantidad :" + menu.get(key));
        }
        resp.sendRedirect("menuPrincipal.jsp");
        System.out.println("");
    }
}
