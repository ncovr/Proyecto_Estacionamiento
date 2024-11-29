<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.Random,java.util.Date, java.text.SimpleDateFormat, java.util.HashMap, java.text.DecimalFormat" %>
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
            position: absolute; /* Cambié la posición a absolute */
            top: 50%; /* Centrado verticalmente */
            left: 10px; /* Fijado a la izquierda */
            transform: translateY(-50%); /* Ajusta la posición para que esté centrado verticalmente */
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
            text-align: left; /* Alinear texto a la izquierda */
            font-size: 16px;
            line-height: 1.5;
            font-weight: bold;
        }

        .cantidad-total .cantidad {
            margin-bottom: 30px; /* Espacio entre "Cantidad" y "Total" */
        }

        .cantidad-total .total {
            margin-top: 30px; /* Ajustar la posición de "Total" */
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
            SimpleDateFormat formato=new SimpleDateFormat("EEEE, d  MMMM , yyyy", new java.util.Locale("es", "ES"));
            String fechaFormateada = formato.format(fechaAc);
            // Generar un número aleatorio para la orden
            Random random = new Random();
            int numeroOrden = random.nextInt(10000); // Generar un número entre 0 y 9999
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
        </tr>
        </thead>
        <tbody>
        <%
            HashMap<String, Integer> menu = new HashMap<>();
            String[] carta = {"completo", "hamburguesa", "pizza", "papasFritas", "sushi", "bowl"};
            int[] precios = {2100, 2500, 7000, 1500, 2800, 2500};
            int totalGeneral = 0;

            // Llenar el HashMap con los productos y las cantidades desde el formulario
            for (int i = 0; i < carta.length; i++) {
                String cantidadStr = request.getParameter(carta[i] + "Cantidad");
                if (cantidadStr != null && !cantidadStr.isEmpty()) {
                    int cantidad = Integer.parseInt(cantidadStr);
                    menu.put(carta[i], cantidad);

                    // Calcular el total de cada producto
                    if (cantidad > 0) {
                        int precio = precios[i];
                        int totalProducto = cantidad * precio;
                        totalGeneral += totalProducto;
                    }
                }
            }

            // Mostrar los productos y sus cantidades
            for (String item : menu.keySet()) {
                int cantidad = menu.get(item);
                if (cantidad > 0) {
        %>
        <tr>
            <td><%= item %></td>
            <td><%= cantidad %></td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
    <%
        int cantidadTotal = 0;  // Variable para contar la cantidad total de productos
        int total = 0;   // Variable para almacenar el precio total

        // Recorrer los productos y calcular el total
        for (String item : menu.keySet()) {
            int cantidad = menu.get(item);
            if (cantidad > 0) {
                // Sumar cantidad total
                cantidadTotal += cantidad;
                // Sumar el precio total (suponiendo precios fijos)
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
        DecimalFormat formator=new DecimalFormat("#,###");
        String totalFormateado=formator.format(total);
    %>

    <div class="line">-----------------------------------------</div>
    <div class="cantidad-total">
        <p>Cantidad Total: <%= cantidadTotal %></p> <!-- Cantidad total de productos -->
        <p>Total: $<%=totalFormateado %></p> <!-- Precio total -->
    </div>
    <div class="line">-----------------------------------------</div>


    <div class="footer">
        <p>Tarjeta: **** **** **** 2024</p>
        <p>Código de autorización:<%= String.format(" %04d", codigoAutorizacion) %></p>
        <p>Cliente: SYNX</p>
    </div>
</div>

</body>
</html>
