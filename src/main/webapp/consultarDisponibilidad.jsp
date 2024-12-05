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
            gap: 40px;
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 20px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.3);
        }

        .row {
            display: flex;
            justify-content: center;
            align-items: center;
            gap: 10px;
        }

        .space {
            width: 80px;
            height: 80px;
            text-align: center;
            line-height: 80px;
            border: 2px solid #ccc;
            font-weight: bold;
            font-size: 1.2rem;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .space.selected {
            outline: 4px solid #007bff;
        }

        .path {
            width: 40px;
            height: 80px;
            background-color: #e0e0e0;
            border: 2px dashed #999;
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
    </style>
</head>
<body>
<h1>Consulta la Disponibilidad de Espacios</h1>
<form action="Svconsultar" method="post">
    <div class="legend">
    </div>
    <div class="parking-area">
        <div class="row">
            <div class="space available" id="space1" onclick="selectSpace(this)">1</div>
            <div class="space available" id="space2" onclick="selectSpace(this)">2</div>
            <div class="space available" id="space3" onclick="selectSpace(this)">3</div>
            <div class="space available" id="space4" onclick="selectSpace(this)">4</div>
            <div class="space available" id="space5" onclick="selectSpace(this)">5</div>
        </div>
        <div class="divider"></div>
        <div class="row">
            <div class="space available" id="space6" onclick="selectSpace(this)">6</div>
            <div class="space available" id="space7" onclick="selectSpace(this)">7</div>
            <div class="space available" id="space8" onclick="selectSpace(this)">8</div>
            <div class="space available" id="space9" onclick="selectSpace(this)">9</div>
            <div class="space available" id="space10" onclick="selectSpace(this)">10</div>
        </div>
    </div>

    <!-- El bloque de botones ha sido eliminado -->

    <form id="parkingForm" method="post" action="Svconsultar">
        <input type="hidden" name="parkingData" id="parkingData">
        <div class="back-button">
            <a href="estacionamiento.jsp">Volver</a>
            <button class="submit-button" type="submit" onclick="prepareData()">Enviar Datos</button>
        </div>
    </form>

    <script>
        let selectedSpace = null;

        function selectSpace(element) {
            if (selectedSpace) {
                selectedSpace.classList.remove('selected');
            }
            selectedSpace = element;
            selectedSpace.classList.add('selected');
        }

        function prepareData() {
            const parkingData = getParkingStatus();
            document.getElementById('parkingData').value = JSON.stringify(parkingData);
        }

        function getParkingStatus() {
            const spaces = document.querySelectorAll('.space');
            const statusData = Array.from(spaces).map(space => {
                return {
                    number: space.textContent.trim(),
                    status: space.classList.contains('available') ? 'available' :
                        space.classList.contains('occupied') ? 'occupied' : 'reserved'
                };
            });
            return statusData;
        }
    </script>
</form>
</body>
</html>
