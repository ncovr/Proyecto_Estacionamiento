<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Disponibilidad de Estacionamiento</title>
    <style>
        /* Estilos básicos */
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin: 0;
            padding: 0;
            background-image: url('img/fondo3.jpg');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        h1 {
            color: #333;
            margin-bottom: 20px;
            font-size: 2.5rem;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
        }

        .legend {
            display: flex;
            justify-content: center;
            gap: 30px;
            margin-bottom: 30px;
            font-size: 1.2rem;
        }

        .legend div {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .legend span {
            width: 25px;
            height: 25px;
            display: inline-block;
            border: 1px solid #333;
            border-radius: 50%;
        }

        .available {
            background-color: #6ba66b;
        }

        .occupied {
            background-color: #de4444;
        }

        .reserved {
            background-color: #ffd736;
        }

        .parking-area {
            display: flex;
            flex-direction: column;
            gap: 50px; /* Aumenta el espacio entre filas */
            margin: 0 auto;
            padding: 40px; /* Aumenta el espacio interno */
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 20px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
            width: 80%; /* Aumenta el ancho relativo al viewport */
            max-width: 1200px; /* Establece un máximo de ancho */
        }

        .row {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 20px; /* Aumenta el espacio entre espacios de estacionamiento */
        }

        .space {
            width: 160px; /* Ancho del espacio */
            height: 110px; /* Alto del espacio */
            text-align: center;
            line-height: 110px; /* Centrado vertical del texto */
            border: 2px solid #ccc;
            font-weight: bold;
            font-size: 1.2rem;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
            position: relative;
        }


        .divider {
            width: 100%;
            height: 40px;
            background-color: #e0e0e0;
            border-top: 2px solid #999;
            border-bottom: 2px solid #999;
        }

        .back-button {
            margin-top: 30px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .back-button a {
            text-decoration: none;
            padding: 10px 20px;
            font-size: 1rem;
            color: white;
            background-color: #333;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            transition: background-color 0.3s;
            margin-right: 15px;
        }

        .back-button a:hover {
            background-color: #6ba66b;
        }

        .submit-button {
            text-decoration: none;
            padding: 10px 20px;
            font-size: 1rem;
            color: white;
            background-color: #333;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
            transition: background-color 0.3s;
            margin-right: 15px;
        }

        .submit-button:hover {
            background-color: #6ba66b;
        }

        /* Estilo del menú desplegable */
        .status-select {
            position: absolute;
            bottom: 5px;
            left: 50%;
            transform: translateX(-50%);
            background-color: white;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 0.7rem;
            font-weight: bold;
            padding: 2px 5px;
            width: 110px;
            text-align: center;
        }
        .status-select option {
            padding: 10px; /* Aumenta el espacio interno de cada opción */
            font-size: 1rem; /* Ajusta el tamaño de la fuente */
        }

        .space:hover .status-select {
            display: block;
        }
    </style>
</head>
<body>
<h1>Consulta la Disponibilidad de Espacios</h1>
<form action="Svconsultar" method="post">
    <div class="legend">
    </div>
    <div class="parking-area">
        <div class="row">
            <div class="space available" id="space1">
                1
                <select class="status-select" onchange="updateStatus(this)">
                    <option value="available" selected>Desocupado</option>
                    <option value="occupied">Ocupado</option>
                    <option value="reserved">Reservado</option>
                </select>
            </div>
            <div class="space available" id="space2">
                2
                <select class="status-select" onchange="updateStatus(this)">
                    <option value="available" selected>Desocupado</option>
                    <option value="occupied">Ocupado</option>
                    <option value="reserved">Reservado</option>
                </select>
            </div>
            <div class="space available" id="space3" >
                3
                <select class="status-select" onchange="updateStatus(this)">
                    <option value="available" selected>Desocupado</option>
                    <option value="occupied">Ocupado</option>
                    <option value="reserved">Reservado</option>
                </select>
            </div>
            <div class="space available" id="space4">
                4
                <select class="status-select" onchange="updateStatus(this)">
                    <option value="available" selected>Desocupado</option>
                    <option value="occupied">Ocupado</option>
                    <option value="reserved">Reservado</option>
                </select>
            </div>
            <div class="space available" id="space5">
                5
                <select class="status-select" onchange="updateStatus(this)">
                    <option value="available" selected>Desocupado</option>
                    <option value="occupied">Ocupado</option>
                    <option value="reserved">Reservado</option>
                </select>
            </div>
        </div>
        <div class="divider"></div>
        <div class="row">
            <div class="space available" id="space6">
                6
                <select class="status-select" onchange="updateStatus(this)">
                    <option value="available" selected>Desocupado</option>
                    <option value="occupied">Ocupado</option>
                    <option value="reserved">Reservado</option>
                </select>
            </div>
            <div class="space available" id="space7">
                7
                <select class="status-select" onchange="updateStatus(this)">
                    <option value="available" selected>Desocupado</option>
                    <option value="occupied">Ocupado</option>
                    <option value="reserved">Reservado</option>
                </select>
            </div>
            <div class="space available" id="space8">
                8
                <select class="status-select" onchange="updateStatus(this)">
                    <option value="available" selected>Desocupado</option>
                    <option value="occupied">Ocupado</option>
                    <option value="reserved">Reservado</option>
                </select>
            </div>
            <div class="space available" id="space9">
                9
                <select class="status-select" onchange="updateStatus(this)">
                    <option value="available" selected>Desocupado</option>
                    <option value="occupied">Ocupado</option>
                    <option value="reserved">Reservado</option>
                </select>
            </div>
            <div class="space available" id="space10">
                10
                <select class="status-select" onchange="updateStatus(this)">
                    <option value="available" selected>Desocupado</option>
                    <option value="occupied">Ocupado</option>
                    <option value="reserved">Reservado</option>
                </select>
            </div>
        </div>
    </div>
    <div class="back-button">
        <a href="estacionamiento.jsp" class="submit-button">Volver</a>
    </div>
</form>

<script>
    function updateStatus(select) {
        const space = select.parentElement;
        const status = select.value;

        // Cambia el color según el estado
        if (status === "available") {
            space.className = "space available";
        } else if (status === "occupied") {
            space.className = "space occupied";
        } else if (status === "reserved") {
            space.className = "space reserved";
        }
    }

</script>

</body>
</html>
