package Servlets;

import logica.Serializable.parking;
import logica.Serializable.parkingManager;
import logica.Sistema;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;


@WebServlet(name = "Svcuenta", urlPatterns = {"/Svcuenta"})
public class Svcuenta extends HttpServlet {
    Sistema sistema = Sistema.getInstance();
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int espacioId = 12;
        String[] espacio=new String[espacioId];
        for (int i = 0; i < espacioId; i++) {
            espacio[i]=req.getParameter("opcion"+((i+1)));
        }

        boolean espacios;
        espacios=sistema.registrarEspacio(espacio);
        if(espacios){
            resp.sendRedirect("estacionamiento.jsp");
            System.out.println("save espacios");
        }else{
            req.getRequestDispatcher("estacionamiento.jsp").forward(req, resp);
            System.out.println("no save espacios");
        }



    }


    }

    public void print(String[] espacio){
        for (int i = 0; i < espacio.length; i++) {
            System.out.println("espacio "+(i+1)+";"+espacio[i]);
        }
    }
}