<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html" charset="UTF-8">
    <title>Formulario prueba</title>
</head>
<body>
<h1>Datos clientes</h1>
<form action="servlets" method="post">
    <p>
        <label for="rut">Rut:</label>
        <input type="text" id="rut" name="rut">
    </p>
    <p>
        <label for="password">Contraseña:</label>
        <input type="text" id="password" name="password">
    </p>
    <button type="submit">Enviar</button>
</form>

</body>
</html>
