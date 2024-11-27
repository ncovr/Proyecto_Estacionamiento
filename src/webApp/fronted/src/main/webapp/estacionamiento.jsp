<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estacionamiento</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        /* Estilo general */
        body {
            margin: 0;
            padding: 0;
            font-family: 'Arial', sans-serif;
            background-color: white;
            display: flex;
            height: 100vh; /* Altura completa de la ventana */
        }

        /* Barra lateral gris */
        .sidebar {
            width: 250px;
            background-color: #808080; /* Color gris */
            height: 100%;
            padding-top: 20px;
            position: fixed;
            display: flex;
            flex-direction: column; /* Organiza los botones en columna */
            align-items: center; /* Centra horizontalmente */
            gap: 15px; /* Espaciado entre botones */
        }

        /* Botones de la barra lateral */
        .sidebar button {
            width: 160px; /* Ancho reducido */
            height: 40px; /* Altura reducida */
            font-size: 14px; /* Fuente más pequeña */
            color: white;
            background-color: #424949; /* Gris oscuro */
            border: none;
            border-radius: 6px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
            text-align: center;
            display: flex; /* Flexbox para centrar el texto */
            align-items: center; /* Centra verticalmente */
            justify-content: center; /* Centra horizontalmente */
        }

        .sidebar button:hover {
            background-color: #333; /* Gris más oscuro al pasar el ratón */
            transform: scale(1.05); /* Efecto de agrandar */
        }

        .sidebar button:active {
            transform: scale(1); /* Tamaño original al presionar */
        }

        /* Remueve subrayado en enlaces */
        .sidebar a {
            text-decoration: none; /* Quita subrayado */
        }

        /* Contenido principal */
        .main-content {
            margin-left: 250px; /* Deja espacio para la barra lateral */
            padding: 20px;
            width: calc(100% - 250px); /* Ajusta el ancho relativo */
            height: 100%;
        }

        h1 {
            color: #333;
        }
    </style>
</head>
<body>

<!-- Barra lateral -->
<div class="sidebar">
    <!-- Botones -->
    <a href="index.jsp">
        <button>Cerrar Sesión</button>
    </a>
    <a href="menuTwo.jsp">
        <button>Volver</button>
    </a>
    <a href="menu.jsp">
        <button>Tomar Pedido</button>
    </a>
</div>

<!-- Contenido principal -->
<div class="main-content">
    <h1>Bienvenido al Estacionamiento</h1>
    <p>Aquí puedes gestionar la funcionalidad del estacionamiento.</p>
    <!-- Agrega más contenido aquí según sea necesario -->
</div>

</body>
</html>
