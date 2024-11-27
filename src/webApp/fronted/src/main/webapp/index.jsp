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
            border: 1px solid #202424; /* Color de los recuadros actualizado */
            font-size: 18px;
            box-sizing: border-box;
        }

        /* Estilo para los placeholders */
        .form-group input::placeholder {
            color: #A9A9A9;
        }

        .form-group input[type="submit"] {
            background-color: #141515;
            color: white;
            cursor: pointer;
            border: none;
            font-size: 18px;
            padding: 15px;
            border-radius: 8px;
            width: 100%;
        }

        .form-group input[type="submit"]:hover {
            background-color: #e27f42  ;
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
                <input type="text" id="username" name="username" placeholder="Nombre" required>
                <span class="error">${errorUsername}</span>
            </div>
            <div class="form-group">
                <input type="password" id="password" name="password" placeholder="Contraseña" required>
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
