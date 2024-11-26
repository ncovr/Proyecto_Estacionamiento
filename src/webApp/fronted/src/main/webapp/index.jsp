<%@ page contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <title>Venta de Comida - Estacionamiento</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        header {
            text-align: center;
            background-color: #4CAF50;
            color: white;
            padding: 20px 0;
        }
        header h1 {
            margin: 0;
            font-size: 36px;
        }
        .menu {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin-top: 20px;
        }
        .menu-item {
            background: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            margin: 10px;
            width: 200px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }
        .menu-item:hover {
            transform: translateY(-5px);
        }
        .menu-item label {
            font-size: 18px;
            display: block;
        }
        .price {
            font-size: 16px;
            color: #777;
        }
        button {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            margin-top: 20px;
        }
        button:hover {
            background-color: #45a049;
        }
        .footer {
            text-align: center;
            margin-top: 40px;
            padding: 20px;
            background-color: #333;
            color: white;
        }
    </style>
</head>

<body>

<div class="container">
    <header>
        <h1>Menú - Venta de Comida</h1>
    </header>

    <form action="pedido.jsp" method="post">
        <div class="menu">
            <div class="menu-item">
                <label>
                    <input type="checkbox" name="comida" value="Tacos">
                    Tacos
                </label>
                <div class="price">$10</div>
            </div>
            <div class="menu-item">
                <label>
                    <input type="checkbox" name="comida" value="Hamburguesa">
                    Hamburguesa
                </label>
                <div class="price">$20</div>
            </div>
            <div class="menu-item">
                <label>
                    <input type="checkbox" name="comida" value="Pizza">
                    Pizza
                </label>
                <div class="price">$15</div>
            </div>
        </div>

        <button type="submit">Realizar Pedido</button>
    </form>
    <br>
    <button onclick="window.location.href='pedido.jsp'">Ir al menu detallado</button>
</div>

<div class="footer">
    <p>&copy; 2024 Estacionamiento & Comida. Todos los derechos reservados.</p>
</div>

</body>
</html>
