<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estacionamiento</title>
    <link rel="stylesheet" href="../styles.css">
    <style>
        /* Configuración del cuerpo para ocupar toda la altura */
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh; /* Ocupa al menos la altura total de la ventana */
            margin: 0; /* Elimina márgenes predeterminados */
        }

        /* Estilo del contenido */
        main {
            flex: 1; /* El contenido principal ocupa todo el espacio disponible */
            padding: 20px; /* Ajusta el relleno del contenido */
        }

        /* Estilo del footer */
        footer {
            background-color: rgba(66, 73, 73, 0.39);
            color: white;
            text-align: center;
            padding: 1rem 0;
        }
    </style>
</head>
<body>


<!-- Footer fijo en la parte inferior -->
<footer>
    <p>&copy; 2024 Estacionamiento. Todos los derechos reservados.</p>
</footer>
</body>
</html>
