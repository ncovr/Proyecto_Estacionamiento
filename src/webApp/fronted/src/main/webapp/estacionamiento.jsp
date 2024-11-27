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
            height: 100vh; /* Altura completa de la ventana */
            overflow-x: hidden; /* Evita el scroll horizontal */
            display: flex;
            justify-content: center; /* Centra el contenido horizontalmente */
            align-items: center; /* Centra el contenido verticalmente */
        }

        /* Botón para mostrar la barra lateral */
        .toggle-btn {
            position: absolute;
            top: 10px;
            left: 10px; /* Mantener en la esquina superior izquierda */
            width: 40px;
            height: 40px;
            background-color: #424949;
            color: white;
            border: none;
            border-radius: 50%;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            z-index: 1000; /* Asegura que esté sobre la barra lateral */
        }

        .toggle-btn:hover {
            background-color: #333;
        }

        /* Barra lateral gris */
        .sidebar {
            width: 250px;
            background-color: #808080; /* Color gris */
            height: 100%;
            position: fixed;
            top: 0;
            left: -250px; /* Fuera de la vista inicialmente */
            display: flex;
            flex-direction: column; /* Organiza los botones en columna */
            align-items: center; /* Centra horizontalmente */
            padding-top: 60px; /* Espacio superior para que no se superponga con el botón */
            gap: 15px; /* Espaciado entre botones */
            transition: all 0.3s ease; /* Animación suave */
            box-shadow: 5px 0 10px rgba(0, 0, 0, 0.3);
        }

        .sidebar.active {
            left: 0; /* Muestra la barra lateral */
        }

        /* Botones de la barra lateral */
        .sidebar button {
            width: 160px;
            height: 40px;
            font-size: 14px;
            color: white;
            background-color: #424949;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: all 0.3s ease;
        }

        .sidebar button:hover {
            background-color: #333;
        }

        /* Remueve subrayado en enlaces */
        .sidebar a {
            text-decoration: none;
        }

        /* Contenido principal */
        .main-content {
            text-align: center; /* Centra el texto horizontalmente */
        }

        .centered-content {
            max-width: 600px; /* Ajusta el ancho máximo del contenedor */
            padding: 20px;
        }

        h1 {
            color: #333;
            font-size: 2.5em;
            margin-bottom: 10px;
        }

        p {
            color: #666;
            font-size: 1.2em;
        }
    </style>
</head>
<body>

<!-- Botón de alternar -->
<button class="toggle-btn" onclick="toggleSidebar()">☰</button>

<!-- Barra lateral -->
<div class="sidebar" id="sidebar">
    <a href="menu.jsp">
        <button>Tomar Pedido</button>
    </a>
    <a href="index.jsp">
        <button>Cerrar Sesión</button>
    </a>
    <a href="menuTwo.jsp">
        <button>Volver</button>
    </a>
</div>

<!-- Contenido principal -->
<div class="main-content" id="main-content">
    <div class="centered-content">
        <h1>Bienvenido al Estacionamiento</h1>
        <p>Aquí puedes gestionar la funcionalidad del estacionamiento.</p>
    </div>
</div>

<script>
    function toggleSidebar() {
        const sidebar = document.getElementById('sidebar');
        const mainContent = document.getElementById('main-content');
        sidebar.classList.toggle('active');
        mainContent.classList.toggle('active');
    }
</script>

</body>
</html>
