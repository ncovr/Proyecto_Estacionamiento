<%@ page import="java.util.*" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Espacios</title>
    <style>
        body {
            font-family: 'Roboto', Arial, sans-serif;
            margin: 0;
            padding: 0;
            overflow: hidden;
            align-items: center;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url("img/fondo55.jpg");
            background-size: cover;
        }

        .fondo-desenfocado {
            position: fixed; /* Fondo fijo */
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url("img/fondo55.jpg");
            background-size: cover; /* Ajusta la imagen para cubrir todo */
            background-position: center;
            filter: blur(4px); /* Aplica el desenfoque */
            z-index: -1; /* Envía el fondo detrás del contenido */
        }

        .container {
            position: relative; /* Contenido en una nueva capa */
            z-index: 1; /* Asegura que el contenido esté encima */
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9); /* Fondo semi-transparente para mejor legibilidad */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .contenedor-principal {
            border: 2px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }


        h3 {
            text-align: center;
            font-size: 1.8rem;
            margin: 20px 0;
            color: rgba(26, 26, 26, 0.83);
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
        }

        .bloque {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .recuadro {
            flex: 1 1 calc(20% - 10px); /* Cinco recuadros por fila */
            margin: 15px 15px;
            padding: 10px;
            background-color: #ffffff;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .recuadro:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        button {
            font-size: 1rem;
            padding: 10px 20px;
            border-radius: 5px;
            border: none;
            cursor: pointer;
            transition: all 0.3s ease;
            margin: 10px;
        }

        button:hover {
            transform: translateY(-3px);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        button[type="submit"] {
            background-color: rgba(26, 26, 26, 0.85);
            color: white;
        }

        button[type="submit"]:hover {
            background-color: #218838;
        }

        button[type="button"] {
            background-color: rgba(26, 26, 26, 0.87);
            color: white;
        }

        button[type="button"]:hover {
            background-color: #6ba66b;
        }

        button a {
            color: white;
            text-decoration: none;
            display: block;
        }


        .opciones {
            display: flex;
            justify-content: space-around;
            align-items: center;
            margin-top: 10px;
        }

        .opciones label {
            font-size: 0.9rem;
            cursor: pointer;
        }

        .opcion1 {
            background-color: #d4edda;
            border-color: #c3e6cb;
        }

        .opcion2 {
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        @media (max-width: 600px) {
            .recuadro {
                flex: 1 1 calc(45% - 10px); /* Dos recuadros por fila en pantallas pequeñas */
            }
        }
    </style>
</head>
<body>
<div class="fondo-desenfocado"></div>
<div class="container">
    <h3>Disponibilidad estacionamiento</h3>
    <form id="parkingForm" action="Svcuenta" method="post">
        <div class="contenedor-principal">
            <div class="bloque">
                <%
                    Map<Integer, Integer> espacios = (Map<Integer, Integer>) request.getAttribute("espacios");
                    for (int i = 1; i <= 12; i++) {
                        Integer estado = espacios.get(i);
                        String clase = estado == 1 ? "opcion1" : "opcion2"; // 1 = libre, 2 = ocupado
                %>
                <div class="recuadro" id="recuadro<%= i %>" class="<%= clase %>">
                    Espacio <%= i %>
                    <div class="opciones">
                        <label>
                            <input type="radio" name="opcion<%= i %>" value="1" <%= estado == 1 ? "checked" : "" %> onclick="marcarOpcion(1, <%= i %>)"> Libre
                        </label>
                        <label>
                            <input type="radio" name="opcion<%= i %>" value="2" <%= estado == 2 ? "checked" : "" %> onclick="marcarOpcion(2, <%= i %>)"> Ocupado
                        </label>
                    </div>
                </div>
                <% } %>

            </div>
        </div>
        <button type="submit">Guardar Datos</button>
        <button type="button">
            <a href="estacionamiento.jsp">Volver</a>
        </button>
    </form>
</div>

<script>
    function marcarOpcion(opcion, id) {
        const recuadroSeleccionado = document.getElementById('recuadro' + id);

        // Limpia estilos previos
        recuadroSeleccionado.classList.remove('opcion1', 'opcion2');

        // Aplica el nuevo estilo
        if (opcion === 1) recuadroSeleccionado.classList.add('opcion1');
        if (opcion === 2) recuadroSeleccionado.classList.add('opcion2');


    }
</script>
</body>
</html>
