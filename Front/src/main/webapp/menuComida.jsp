<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Venta de Comida - Estacionamiento</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            display: flex;
            flex-direction: column;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            position: relative;
            overflow-y: auto;
        }

        ::-webkit-scrollbar {
            width: 12px;
        }

        ::-webkit-scrollbar-track {
            background: #f1f1f1;
            border-radius: 10px;
        }

        ::-webkit-scrollbar-thumb {
            background: #888;
            border-radius: 10px;
            transition: background-color 0.3s;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #555;
        }

        .background {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-image: url('img/fondo4.jpg');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            z-index: -1;
        }

        .container {
            flex: 1;
            width: 80%;
            margin: 0 auto;
            padding: 20px;
            position: relative;
            z-index: 1;
        }

        header {
            display: flex;
            align-items: center;
            background-color: #10100e;
            color: white;
            border-radius: 19px;
            padding: 20px 0;
            padding-left: 20px;
        }

        header h1 {
            margin: 0;
            font-size: 36px;
            margin-left: 15px;
        }

        .header-icon {
            font-size: 30px;
            margin-left: auto;
            margin-right: 20px;
        }

        .menu {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-top: 20px;
            overflow-y: auto;
            max-height: 70vh;
        }

        .menu-item {
            background: #ffffff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
            text-align: center;
        }

        .menu-item:hover {
            transform: translateY(-5px);
        }

        .menu-item label {
            font-size: 18px;
            display: block;
            text-align: center;
        }

        .menu-item-image {
            width: 100%;
            height: auto;
            margin: 10px 0;
            max-width: 300px;
            display: block;
            margin-left: auto;
            margin-right: auto;
            border-radius: 18px;
        }

        .price {
            font-size: 16px;
            color: #777;
            margin: 10px 0;
            text-align: center;
        }

        button {
            padding: 10px 20px; /* Ajusta el tamaño según el texto */
            background-color: #10100e;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 18px;
            margin-top: 10px;
            /* Elimina el ancho fijo para que el tamaño se ajuste al texto */
            width: auto;
            display: inline-block; /* Asegura que el botón no se expanda innecesariamente */
            text-align: center; /* Asegura que el texto esté centrado */
        }

        button:hover {
            background-color: #e27f42;
        }


        /* Estilo para los inputs de cantidad */
        .quantity-container {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
            margin-top: 10px;  /* Añadir espacio entre la imagen y el input */
        }

        .quantity-input {
            width: 50px;
            padding: 5px;
            text-align: center;
            border-radius: 5px;
            border: 1px solid #ddd;
            font-size: 16px;
        }

        .button-container {
            display: flex;
            justify-content: space-between; /* Espacio entre los botones */
            margin-top: 10px;
            width: 100%; /* Asegura que el contenedor de los botones ocupe todo el ancho */
        }
        a{
            text-decoration: none;
        }

        .volver-btn {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
            width: 100%;
            background-color: #10100e;
            color: white;
            outline: none;
            text-decoration: none; /* Quita el subrayado */
            border: none;
        }

        .volver-btn:hover {
            background-color: #e27f42;
            outline: none;
        }

    </style>
</head>

<body>

<div class="background"></div>

<div class="container">
    <header>
        <h1>Menú</h1>
        <i class="fas fa-shopping-cart header-icon"></i>
    </header>

    <form action="Svmenu" method="post">
        <div class="menu">
            <div class="menu-item">
                <label>Completo</label>
                <div class="price">$2,100</div>
                <img src="img/completo.jpg" alt="Completo" class="menu-item-image">
                <div class="quantity-container">
                    <input type="number" name="completoCantidad" min="0" value="0" class="quantity-input">
                </div>
            </div>
            <div class="menu-item">
                <label>Hamburguesa</label>
                <div class="price">$2,500</div>
                <img src="img/hamburguesa.jpg" alt="Hamburguesa" class="menu-item-image">
                <div class="quantity-container">
                    <input type="number" name="hamburguesaCantidad" min="0" value="0" class="quantity-input">
                </div>
            </div>
            <div class="menu-item">
                <label>Pizza</label>
                <div class="price">$7,000</div>
                <img src="img/pizza.png" alt="Pizza" class="menu-item-image">
                <div class="quantity-container">
                    <input type="number" name="pizzaCantidad" min="0" value="0" class="quantity-input">
                </div>
            </div>
            <div class="menu-item">
                <label>Papas Fritas</label>
                <div class="price">$1,500</div>
                <img src="img/papas_fritas.jpg" alt="Papas Fritas" class="menu-item-image">
                <div class="quantity-container">
                    <input type="number" name="papasFritasCantidad" min="0" value="0" class="quantity-input">
                </div>
            </div>
            <div class="menu-item">
                <label>Sushi</label>
                <div class="price">$2,800</div>
                <img src="img/sushi.jpg" alt="Sushi" class="menu-item-image">
                <div class="quantity-container">
                    <input type="number" name="sushiCantidad" min="0" value="0" class="quantity-input">
                </div>
            </div>
            <div class="menu-item">
                <label>Bowl</label>
                <div class="price">$2,500</div>
                <img src="img/bowl.jpg" alt="Bowl" class="menu-item-image">
                <div class="quantity-container">
                    <input type="number" name="bowlCantidad" min="0" value="0" class="quantity-input">
                </div>
            </div>
        </div>

        <div class="button-container">
            <a href="menuPrincipal.jsp">
                <button type="button" class="volver-btn">Volver</button>
            </a>

            <button type="submit">Realizar Pedido</button>
        </div>
    </form>
</div>

</body>
</html>
