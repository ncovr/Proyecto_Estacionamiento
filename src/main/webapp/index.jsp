<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Iniciar Sesión</title>
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
            background-image: url('img/fondo.jpg');
            background-size: cover;
            background-position: center;
            filter: blur(2px);
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

        /* Animación de entrada para el bloque */
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
        }

        .login-form h2 {
            text-align: center;
            margin-bottom: 30px;
            color: white;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-weight: bold;
            display: block;
            font-size: 18px;
        }

        .form-group input {
            width: 100%;
            padding: 15px;
            border-radius: 8px;
            border: 1px solid #202424; /* Color del borde por defecto */
            font-size: 18px;
            box-sizing: border-box;
            color: white;
        }

        /* Cambiar el color de fondo para los campos de texto */
        #username, #password {
            background-color: #424949; /* Color de fondo para el campo de nombre y contraseña */
        }

        /* Estilo para los placeholders */
        .form-group input::placeholder {
            color: #ffffff; /* Color del placeholder por defecto */
        }

        /* Estilo para los placeholders cuando el campo está enfocado */
        .form-group input:focus::placeholder {
            color: #ff7f50; /* Cambiar color del placeholder cuando el campo está enfocado */
        }

        /* Estilo cuando los campos están enfocados */
        .form-group input:focus {
            outline: none; /* Elimina el borde azul predeterminado del navegador */
            border: 1px solid #ff7f50; /* Cambiar el borde cuando el campo está enfocado */
        }

        .form-group input[type="submit"] {
            background-color: rgba(66, 73, 73, 0.39);
            color: white;
            cursor: pointer;
            border: none;
            font-size: 18px;
            padding: 15px;
            border-radius: 8px;
            width: 100%;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3); /* Sombra añadida al botón */
            transition: all 0.4s ease-out;
        }

        .form-group input[type="submit"]:hover {
            background-color: #e27f42;
            transform: scale(1.05);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.5); /* Sombra más pronunciada al hacer hover */
        }

        .form-group input[type="submit"]:active {
            transform: scale(1); /* Vuelve al tamaño original cuando se hace clic */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3); /* Restaura la sombra */
        }

        .form-group .error {
            color: red;
            font-size: 16px;
        }

        /* Estilo para el botón "Crear Cuenta" */
        .form-group .create-account {
            background-color: rgba(66, 73, 73, 0.39);
            color: white;
            cursor: pointer;
            border: none;
            font-size: 18px;
            padding: 15px;
            border-radius: 8px;
            width: 100%;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.3); /* Sombra añadida al botón */
            transition: all 0.4s ease-out;
        }

        .form-group .create-account:hover {
            background-color: #e27f42;
            transform: scale(1.05);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.5); /* Sombra más pronunciada al hacer hover */
        }

        .form-group .create-account:active {
            transform: scale(1); /* Vuelve al tamaño original cuando se hace clic */
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2); /* Restaura la sombra */
        }

    </style>
</head>
<body>

<!-- Capa de fondo difuminado -->
<div class="background"></div>

<div class="container">
    <div class="login-form">
        <h2>Iniciar Sesión</h2>
        <form action="Svlogin" method="post">
            <div class="form-group">
                <input type="text" id="username" name="username" placeholder="Rut" required>
            </div>
            <div class="form-group">
                <input type="password" id="password" name="password" placeholder="Contraseña" required>
            </div>
            <div class="form-group">
             <span class="error">
                 <%
                     String errorUsername = (String) request.getAttribute("errorUsername");
                     if (errorUsername != null) {
                         out.print(errorUsername);
                     }
                 %>
             </span>
            </div>

            <div class="form-group">
                <input type="submit" value="Iniciar Sesión">
            </div>
        </form>

        <!-- Botón "Crear Cuenta" que redirige a CrearCuenta.jsp -->
        <div class="form-group">
            <a href="crearCuenta.jsp">
                <button class="create-account">Crear Cuenta</button>
            </a>
        </div>
    </div>
</div>

</body>
</html>
