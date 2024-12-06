<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Espacios</title>
    <style>
        body {
            font-family: 'Roboto', Arial, sans-serif;
            margin: 0;
            padding: 0;
            overflow: hidden;
            align-items: center;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: url("img/fondo55.jpg");
            background-size: cover;
        }

        .fondo-desenfocado {
            position: fixed; /* Fondo fijo */
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-image: url("img/fondo55.jpg");
            background-size: cover; /* Ajusta la imagen para cubrir todo */
            background-position: center;
            filter: blur(4px); /* Aplica el desenfoque */
            z-index: -1; /* Envía el fondo detrás del contenido */
        }

        .container {
            position: relative; /* Contenido en una nueva capa */
            z-index: 1; /* Asegura que el contenido esté encima */
            margin: 0 auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9); /* Fondo semi-transparente para mejor legibilidad */
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .contenedor-principal {
            border: 2px solid #ccc;
            border-radius: 10px;
            background-color: #f9f9f9;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }


        h3 {
            text-align: center;
            font-size: 1.8rem;
            margin: 20px 0;
            color: rgba(26, 26, 26, 0.83);
        }

        .container {
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
        }

        .bloque {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .recuadro {
            flex: 1 1 calc(20% - 10px); /* Cinco recuadros por fila */
            margin: 15px 15px;
            padding: 10px;
            background-color: #ffffff;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .recuadro:hover {
            transform: scale(1.05);
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .opciones {
            display: flex;
            justify-content: space-around;
            align-items: center;
            margin-top: 10px;
        }

        .opciones label {
            font-size: 0.9rem;
            cursor: pointer;
        }

        .opcion1 {
            background-color: #d4edda;
            border-color: #c3e6cb;
        }

        .opcion2 {
            background-color: #f8d7da;
            border-color: #f5c6cb;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        @media (max-width: 600px) {
            .recuadro {
                flex: 1 1 calc(45% - 10px); /* Dos recuadros por fila en pantallas pequeñas */
            }
        }
    </style>
</head>
<body>
<div class="fondo-desenfocado"></div>
<div class="container">
    <h3>Disponibilidad estacionamiento</h3>
    <form id="parkingForm" action="Svcuenta" method="post">
        <div class="contenedor-principal">
            <div class="bloque">
                <!-- Repite el contenido de los recuadros aquí -->
                <div class="recuadro" id="recuadro1">
                    Espacio 1
                    <div class="opciones">
                        <label>
                            <input type="radio" name="opcion1" value="1" onclick="marcarOpcion(1, 1)"> Libre
                        </label>
                        <label>
                            <input type="radio" name="opcion1" value="2" onclick="marcarOpcion(2, 1)"> Ocupado
                        </label>
                    </div>
                </div>
                <!-- Agrega los demás recuadros de forma similar -->
                <div class="recuadro" id="recuadro2">
                    Espacio 2
                    <div class="opciones">
                        <label>
                            <input type="radio" name="opcion2" value="1" onclick="marcarOpcion(1, 2)"> Libre
                        </label>
                        <label>
                            <input type="radio" name="opcion2" value="2" onclick="marcarOpcion(2, 2)"> Ocupado
                        </label>
                    </div>
                </div>

                <div class="recuadro" id="recuadro3">
                    Espacio 3
                    <div class="opciones">
                        <label>
                            <input type="radio" name="opcion3" value="1" onclick="marcarOpcion(1, 3)"> Libre
                        </label>
                        <label>
                            <input type="radio" name="opcion3" value="2" onclick="marcarOpcion(2, 3)"> Ocupado
                        </label>
                    </div>
                </div>

                <div class="recuadro" id="recuadro4">
                    Espacio 4
                    <div class="opciones">
                        <label>
                            <input type="radio" name="opcion4" value="1" onclick="marcarOpcion(1, 4)"> Libre
                        </label>
                        <label>
                            <input type="radio" name="opcion4" value="2" onclick="marcarOpcion(2, 4)"> Ocupado
                        </label>
                    </div>
                </div>
                <!--salto de espacio -->
                <div class="recuadro" id="recuadro5">
                    Espacio 5
                    <div class="opciones">
                        <label>
                            <input type="radio" name="opcion5" value="1" onclick="marcarOpcion(1, 5)"> Libre
                        </label>
                        <label>
                            <input type="radio" name="opcion5" value="2" onclick="marcarOpcion(2, 5)"> Ocupado
                        </label>
                    </div>
                </div>

                <div class="recuadro" id="recuadro6">
                    Espacio 6
                    <div class="opciones">
                        <label>
                            <input type="radio" name="opcion6" value="1" onclick="marcarOpcion(1, 6)"> Libre
                        </label>
                        <label>
                            <input type="radio" name="opcion6" value="2" onclick="marcarOpcion(2, 6)"> Ocupado
                        </label>
                    </div>
                </div>

                <div class="recuadro" id="recuadro7">
                    Espacio 7
                    <div class="opciones">
                        <label>
                            <input type="radio" name="opcion7" value="1" onclick="marcarOpcion(1, 7)"> Libre
                        </label>
                        <label>
                            <input type="radio" name="opcion7" value="2" onclick="marcarOpcion(2, 7)"> Ocupado
                        </label>
                    </div>
                </div>

                <div class="recuadro" id="recuadro8">
                    Espacio 8
                    <div class="opciones">
                        <label>
                            <input type="radio" name="opcion8" value="1" onclick="marcarOpcion(1, 8)"> Libre
                        </label>
                        <label>
                            <input type="radio" name="opcion8" value="2" onclick="marcarOpcion(2, 8)"> Ocupado
                        </label>
                    </div>
                </div>

                <div class="recuadro" id="recuadro9">
                    Espacio 9
                    <div class="opciones">
                        <label>
                            <input type="radio" name="opcion9" value="1" onclick="marcarOpcion(1, 9)"> Libre
                        </label>
                        <label>
                            <input type="radio" name="opcion9" value="2" onclick="marcarOpcion(2, 9)"> Ocupado
                        </label>
                    </div>
                </div>

                <div class="recuadro" id="recuadro10">
                    Espacio 10
                    <div class="opciones">
                        <label>
                            <input type="radio" name="opcion10" value="1" onclick="marcarOpcion(1, 10)"> Libre
                        </label>
                        <label>
                            <input type="radio" name="opcion10" value="2" onclick="marcarOpcion(2, 10)"> Ocupado
                        </label>
                    </div>
                </div>

                <div class="recuadro" id="recuadro11">
                    Espacio 11
                    <div class="opciones">
                        <label>
                            <input type="radio" name="opcion11" value="1" onclick="marcarOpcion(1, 11)"> Libre
                        </label>
                        <label>
                            <input type="radio" name="opcion11" value="2" onclick="marcarOpcion(2, 11)"> Ocupado
                        </label>
                    </div>
                </div>

                <div class="recuadro" id="recuadro12">
                    Espacio 12
                    <div class="opciones">
                        <label>
                            <input type="radio" name="opcion12" value="1" onclick="marcarOpcion(1, 12)"> Libre
                        </label>
                        <label>
                            <input type="radio" name="opcion12" value="2" onclick="marcarOpcion(2, 12)"> Ocupado
                        </label>
                    </div>
                </div>

            </div>
        </div>
        <button type="submit">Guardar Datos</button>
    </form>
</div>

<script>
    function marcarOpcion(opcion, id) {
        const recuadroSeleccionado = document.getElementById('recuadro' + id);

        // Limpia estilos previos
        recuadroSeleccionado.classList.remove('opcion1', 'opcion2');

        // Aplica el nuevo estilo
        if (opcion === 1) recuadroSeleccionado.classList.add('opcion1');
        if (opcion === 2) recuadroSeleccionado.classList.add('opcion2');
    }
</script>
</body>
</html>
