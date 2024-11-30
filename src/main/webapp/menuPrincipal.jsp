<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menú</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: 'Calibri', cursive, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative;
        }

        .background {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url('img/fondo2.jpg');
            background-size: cover;
            background-position: center;
            filter: blur(4px);
            z-index: -1;
        }

        .container {
            width: 100%;
            max-width: 600px;
            padding: 0;
            position: relative;
            z-index: 10;
            opacity: 0; /* Inicialmente invisible */
            animation: slideIn 1s forwards; /* Animación de entrada */
        }

        @keyframes slideIn {
            0% {
                transform: translateY(-50px);
                opacity: 0;
            }
            100% {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .login-form {
            background-color: rgb(66, 73, 73);
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
            display: flex;
            flex-direction: column;
            height: 100%;
            justify-content: space-between; /* Para que los elementos se distribuyan y el botón quede abajo */
        }

        .login-form h2 {
            text-align: center;
            margin: 0 0 30px 0; /* Ajusta el margen inferior para mayor separación */
            color: white;
            background-color: #E27F42FF; /* Color de fondo */
            padding: 10px 40px; /* Espaciado consistente con el contenedor */
            border-radius: 10px; /* Bordes redondeados */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3); /* Sombra */
            width: calc(100% - 80px); /* Ajusta el ancho del título para respetar el padding del contenedor */
        }

        .form-group {
            margin-bottom: 20px;
            opacity: 0; /* Inicialmente invisible */
            animation: slideRight 0.5s forwards; /* Animación de deslizamiento hacia la derecha */
        }

        @keyframes slideRight {
            0% {
                transform: translateX(-50px);
                opacity: 0;
            }
            100% {
                transform: translateX(0);
                opacity: 1;
            }
        }

        .form-group .create-account {
            position: relative;
            background-color: #424949;
            color: white;
            cursor: pointer;
            border: none;
            font-size: 18px;
            padding: 15px;
            border-radius: 8px;
            width: 100%;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Sombra añadida al botón */
            overflow: hidden; /* Para que el fondo no se desborde */
        }

        .form-group .create-account::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #10100e;
            transform: scaleX(0);
            transform-origin: right;
            transition: transform 0.3s ease-out;
            z-index: -1; /* Para que quede detrás del texto del botón */
        }

        .form-group .create-account:hover::before {
            transform: scaleX(1);
            transform-origin: left;
        }

        .form-group .create-account:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3); /* Sombra más pronunciada al hacer hover */
        }

        .form-group .create-account:active {
            transform: scale(1); /* Vuelve al tamaño original cuando se hace clic */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Restaura la sombra */
        }

        /* Estilo para el botón "Volver" pequeño en la parte inferior derecha */
        .back-button {
            position: absolute;
            bottom: 10px;
            right: 10px;
            background-color: #424949;
            color: white;
            cursor: pointer;
            border: none;
            font-size: 12px;
            padding: 10px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }

        .back-button::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: #10100e;
            transform: scaleX(0);
            transform-origin: right;
            transition: transform 0.3s ease-out;
            z-index: -1;
        }

        .back-button:hover::before {
            transform: scaleX(1);
            transform-origin: left;
        }

        .back-button:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.3);
        }

        .back-button:active {
            transform: scale(1);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>

<!-- Capa de fondo difuminado -->
<div class="background"></div>

<div class="container">
    <div class="login-form">
        <h2>Menú Principal</h2>
        <div class="form-group">
            <a href="estacionamiento.jsp">
                <button class="create-account">Estacionamiento</button>
            </a>
        </div>
        <div class="form-group">
            <a href="menuComida.jsp">
                <button class="create-account">Tomar Pedido</button>
            </a>
        </div>
    </div>
    <!-- Botón "Volver" pequeño en la parte inferior derecha -->
    <a href="index.jsp">
        <button class="back-button">Volver</button>
    </a>
</div>

</body>
</html>
