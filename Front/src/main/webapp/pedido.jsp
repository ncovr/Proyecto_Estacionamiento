<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Random,java.util.Date, java.text.SimpleDateFormat, java.util.HashMap, java.text.DecimalFormat" %>
<%@ page import="java.util.LinkedList" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Boleta de Pedido</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Courier New', Courier, monospace;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .boleta-container {
            background-color: white;
            border-radius: 5px;
            padding: 20px 30px;
            width: 350px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border: 1px solid #ddd;
            position: absolute;
            top: 50%;
            left: 10px;
            transform: translateY(-50%);
            height: 90vh;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .boleta-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .boleta-header h2 {
            margin: 0;
            font-size: 18px;
            text-transform: uppercase;
        }

        .boleta-header p {
            margin: 5px 0;
            font-size: 14px;
            color: #555;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            text-align: left;
            padding: 5px 0;
            font-size: 14px;
        }

        th {
            border-bottom: 1px solid #ddd;
            text-transform: uppercase;
        }

        td {
            border-bottom: 1px dotted #ccc;
        }

        .total {
            text-align: right;
            margin-top: 15px;
            font-size: 16px;
            position: relative;
        }

        .line {
            text-align: center;
            margin: 10px 0;
            font-size: 14px;
            color: #555;
        }

        .footer {
            text-align: center;
            margin-top: 20px;
            font-size: 12px;
            color: #888;
        }

        .footer p {
            margin: 2px 0;
        }

        .cantidad-total p {
            margin-outside: 30px;
            font-weight: bold;
            font-size: 14px;
        }

        .cantidad-total {
            text-align: left;
            font-size: 16px;
            line-height: 1.5;
            font-weight: bold;
        }

        .cantidad-total .cantidad {
            margin-bottom: 30px;
        }

        .cantidad-total .total {
            margin-top: 30px;
        }

        .button-container {
            display: flex;
            justify-content: flex-end;  /* Alinea los botones a la derecha */
            width: 100%;
            position: fixed;
            bottom: 20px;
        }

        .button-container button {
            background-color: rgba(26, 26, 26, 0.98);
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, background-color 0.3s ease;
            margin-left: 10px; /* Espacio entre los botones */
        }

        .button-container button:hover {
            background-color: #e27f42;
            transform: scale(1.1);
        }

        /* Estilo para el dropdown de pago */
        .payment-method {
            margin-top: 20px;
            text-align: left;
        }

        select {
            padding: 10px;
            font-size: 14px;
            width: 100%;
            margin-top: 10px;
        }

    </style>
</head>
<body>

<div class="boleta-container">
    <div class="boleta-header">
        <h2>RECIBO</h2>
        <%
            //generar fecha actual
            Date fechaAc=new Date();
            SimpleDateFormat formato=new SimpleDateFormat("EEEE, d  MMMM  yyyy", new java.util.Locale("es", "ES"));
            String fechaFormateada = formato.format(fechaAc);
            Random random = new Random();
            int numeroOrden = random.nextInt(10000);
            int codigoAutorizacion=random.nextInt(1000);
        %>
        <p>Orden #<%= String.format("%04d", numeroOrden) %></p>
        <p><%= fechaFormateada%></p>
    </div>

    <table>
        <thead>
        <tr>
            <th>Ítem</th>
            <th>Cantidad</th>
            <th>Precio C/U</th>
        </tr>
        </thead>
        <tbody>
        <%
            HashMap<String, Integer> menu = new HashMap<>();
            HashMap<String, Integer>precios=new HashMap<>();
            String[] carta = {"completo", "hamburguesa", "pizza", "papasFritas", "sushi", "bowl"};
            int[] cartaPrecio = {2100, 2500, 7000, 1500, 2800, 2500};


            for (int i = 0; i < carta.length; i++) {
                String cantidadStr = request.getParameter(carta[i] + "Cantidad");
                if (cantidadStr != null && !cantidadStr.isEmpty()) {
                    int cantidad = Integer.parseInt(cantidadStr);
                    menu.put(carta[i], cantidad);
                    precios.put(carta[i],cartaPrecio[i]);
                }
            }


            for (String item : menu.keySet()) {
                int cantidad = menu.get(item);
                int precio= precios.get(item);
                if (cantidad > 0) {
        %>
        <tr>
            <td><%= item %></td>
            <td><%= cantidad %></td>
            <td><%= precio%></td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>

    <%
        int cantidadTotal = 0;
        int total = 0;

        for (String item : menu.keySet()) {
            int cantidad = menu.get(item);
            if (cantidad > 0) {
                cantidadTotal += cantidad;
                int precio = 0;
                switch (item) {
                    case "completo":
                        precio = 2100;
                        break;
                    case "hamburguesa":
                        precio = 2500;
                        break;
                    case "pizza":
                        precio = 7000;
                        break;
                    case "papasFritas":
                        precio = 1500;
                        break;
                    case "sushi":
                        precio = 2800;
                        break;
                    case "bowl":
                        precio = 2500;
                        break;
                }
                total += cantidad * precio;
            }
        }
        DecimalFormat formator = new DecimalFormat("#,###");
        String totalFormateado = formator.format(total);
    %>

    <div class="line">-----------------------------------------</div>
    <div class="cantidad-total">
        <p>Cantidad Total: <%= cantidadTotal %></p>
        <p>Total: $<%=totalFormateado %></p>
    </div>
    <div class="line">-----------------------------------------</div>

    <!-- Dropdown para elegir el método de pago -->
    <div class="payment-method">
        <label for="paymentMethod">Método de Pago:</label>
        <select name="paymentMethod" id="paymentMethod">
            <option value="boleta">Boleta</option>
            <option value="factura">Factura</option>
        </select>
    </div>

    <div class="footer">
        <p>Tarjeta: **** **** **** 2024</p>
        <p>Código de autorización:<%=codigoAutorizacion%></p>
    </div>
</div>

<!-- Contenedor para los botones "Pagar" y "Volver" -->
<div class="button-container">
    <!-- Botón Pagar -->
    <button>Pagar</button>

    <!-- Botón Volver -->
    <a href="menuComida.jsp">
        <button>Volver</button>
    </a>
</div>

</body>
</html>
