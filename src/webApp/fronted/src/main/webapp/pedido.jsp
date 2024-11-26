<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="com.sun.net.httpserver.Request" %>
<html>
<head>
    <title>Pedido Confirmado</title>
</head>
<body>
<h1>Resumen del Pedido</h1>
<%
    String[] comidas = request.getParameter("comida");

    if (comidas != null) {
        System.out.println("<p>Has pedido:</p>");
        System.out.println("<ul>");
        for (String comida : comidas) {
            System.out.println("<li>" + comida + "</li>");
        }
        System.out.println("</ul>");
    } else {
        System.out.println("<p>No has seleccionado ningún producto.</p>");
    }
%>
<a href="index.jsp">Volver al Menú</a>
</body>
</html>
