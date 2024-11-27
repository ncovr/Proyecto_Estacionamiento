<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>iniciar sesion</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: 'Calibri',cursive, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            position: relative; /* Necesario para que el fondo se ubique correctamente */
        }

        /* Capa de fondo difuminado */
        .background {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url('img/fondo.jpg');
            background-size: cover;
            background-position: center;
            filter: blur(2px); /* Difumina solo la imagen de fondo */
            z-index: -1; /* Coloca el fondo por debajo del contenido */
        }

        .container {
            width: 100%;
            max-width: 600px;
            padding: 0;
            position: relative;
            z-index: 10;
        }

        .login-form {
            background-color: rgb(66, 73, 73); /* Fondo blanco semi-transparente */
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.2);
        }

        .login-form h2 {
            text-align: center;
            margin-bottom: 30px;
            color: white; /* Cambié el color del título a blanco */
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
            border: 1px solid #424949; /* Color actualizado */
            font-size: 18px;
            box-sizing: border-box;
        }

        .form-group input[type="submit"] {
            background-color: #343a3a;
            color: white;
            cursor: pointer;
            border: none;
            font-size: 18px;
            padding: 15px;
            border-radius: 8px;
            width: 100%;
        }

        .form-group input[type="submit"]:hover {
            background-color: #45a049;
        }

        .form-group .error {
            color: red;
            font-size: 16px;
        }

    </style>
</head>
<body>

<!-- Capa de fondo difuminado -->
<div class="background"></div>

<div class="container">
    <div class="login-form">
        <h2>Log in</h2>
        <form action="LoginServlet" method="post">
            <div class="form-group">
                <label for="username">Nombre:</label>
                <input type="text" id="username" name="username" required>
                <span class="error">${errorUsername}</span>
            </div>
            <div class="form-group">
                <label for="password">Contraseña:</label>
                <input type="password" id="password" name="password" required>
                <span class="error">${errorPassword}</span>
            </div>
            <div class="form-group">
                <input type="submit" value="Iniciar Sesión">
            </div>
        </form>
    </div>
</div>

</body>
</html>
