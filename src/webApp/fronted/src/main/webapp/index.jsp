<html>
<head>
    <title>Venta de Comida</title>
    <style>
        body { font-family: Arial, sans-serif; }
        .menu-item { margin-bottom: 15px; }
        button { padding: 5px 10px; background: #6bc47e; color: white; border: none; cursor: pointer; }
        button:hover { background: #57c26e; }
    </style>
</head>

<body>
<h1>Menu</h1>
<form action="pedido.jsp" method="post">
    <div class="menu-item">
        <label>
            <input type="checkbox" name="comida" value="Tacos">
            Tacos ($10)
        </label>
    </div>
    <div class="menu-item">
        <label>
            <input type="checkbox" name="comida" value="Hamburguesa">
            Hamburguesa ($20)
        </label>
    </div>
    <div class="menu-item">
        <label>
            <input type="checkbox" name="comida" value="Pizza">
            Pizza ($15)
        </label>
    </div>
    <button type="submit">Realizar Pedido</button>
</form>
</body>
</html>
