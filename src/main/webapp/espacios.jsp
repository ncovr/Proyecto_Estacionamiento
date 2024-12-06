<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Espacios</title>
  <style>
    .recuadros {
      display: flex;
      flex-wrap: wrap;
      justify-content: space-between;
      margin: 10px;
    }

    .recuadro {
      width: 180px;
      height: 80px;
      border: 1px solid #000;
      text-align: center;
      line-height: 25px;
      margin: 5px;
      display: flex;
      flex-direction: column;
      justify-content: space-between;
      padding: 5px;
    }

    .opciones {
      display: flex;
      flex-direction: row; /* Los botones radio estarán en fila */
      align-items: center;
      justify-content: space-between;
      margin-top: 5px;
    }

    .opciones label {
      margin-right: 3px; /* Espaciado entre los botones de opción */
    }
    .opcion1 {
      background-color: #6ba66b; /* Fondo verde cuando opción 1 está seleccionada */
    }

    .opcion2 {
      background-color: rgba(222, 68, 68, 0.89); /* Fondo rojo cuando opción 2 está seleccionada */
    }

    input[type="radio"] {
      margin-right: 5px; /* Espaciado entre el radio button y el texto */
    }

    .bloque {
      display: flex;
      justify-content: space-between;
      margin-bottom: 10px; /* Espacio entre las dos filas */
    }
  </style>
</head>
<body>
<div>
  <h3>Disponibilidad estacionamiento</h3>
  <div class="bloque">
    <!-- Primera hilera de 5 recuadros -->
    <div class="recuadro" id="recuadro1">
      1
      <div class="opciones">
        <label>
          <input type="radio" name="opcion1" value="1" onclick="marcarOpcion(1, 1)"> Opción 1
        </label>
        <label>
          <input type="radio" name="opcion1" value="2" onclick="marcarOpcion(2, 1)"> Opción 2
        </label>
      </div>
    </div>

    <div class="recuadro" id="recuadro2">
      2
      <div class="opciones">
        <label>
          <input type="radio" name="opcion2" value="1" onclick="marcarOpcion(1, 2)"> Opción 1
        </label>
        <label>
          <input type="radio" name="opcion2" value="2" onclick="marcarOpcion(2, 2)"> Opción 2
        </label>
      </div>
    </div>

    <div class="recuadro" id="recuadro3">
      3
      <div class="opciones">
        <label>
          <input type="radio" name="opcion3" value="1" onclick="marcarOpcion(1, 3)"> Opción 1
        </label>
        <label>
          <input type="radio" name="opcion3" value="2" onclick="marcarOpcion(2, 3)"> Opción 2
        </label>
      </div>
    </div>

    <div class="recuadro" id="recuadro4">
      4
      <div class="opciones">
        <label>
          <input type="radio" name="opcion4" value="1" onclick="marcarOpcion(1, 4)"> Opción 1
        </label>
        <label>
          <input type="radio" name="opcion4" value="2" onclick="marcarOpcion(2, 4)"> Opción 2
        </label>
      </div>
    </div>

    <div class="recuadro" id="recuadro5">
      5
      <div class="opciones">
        <label>
          <input type="radio" name="opcion5" value="1" onclick="marcarOpcion(1, 5)"> Opción 1
        </label>
        <label>
          <input type="radio" name="opcion5" value="2" onclick="marcarOpcion(2, 5)"> Opción 2
        </label>
      </div>
    </div>
  </div>

  <div class="bloque">
    <!-- Segunda hilera de 5 recuadros -->
    <div class="recuadro" id="recuadro6">
      6
      <div class="opciones">
        <label>
          <input type="radio" name="opcion6" value="1" onclick="marcarOpcion(1, 6)"> Opción 1
        </label>
        <label>
          <input type="radio" name="opcion6" value="2" onclick="marcarOpcion(2, 6)"> Opción 2
        </label>
      </div>
    </div>

    <div class="recuadro" id="recuadro7">
      7
      <div class="opciones">
        <label>
          <input type="radio" name="opcion7" value="1" onclick="marcarOpcion(1, 7)"> Opción 1
        </label>
        <label>
          <input type="radio" name="opcion7" value="2" onclick="marcarOpcion(2, 7)"> Opción 2
        </label>
      </div>
    </div>

    <div class="recuadro" id="recuadro8">
      8
      <div class="opciones">
        <label>
          <input type="radio" name="opcion8" value="1" onclick="marcarOpcion(1, 8)"> Opción 1
        </label>
        <label>
          <input type="radio" name="opcion8" value="2" onclick="marcarOpcion(2, 8)"> Opción 2
        </label>
      </div>
    </div>

    <div class="recuadro" id="recuadro9">
      9
      <div class="opciones">
        <label>
          <input type="radio" name="opcion9" value="1" onclick="marcarOpcion(1, 9)"> Opción 1
        </label>
        <label>
          <input type="radio" name="opcion9" value="2" onclick="marcarOpcion(2, 9)"> Opción 2
        </label>
      </div>
    </div>

    <div class="recuadro" id="recuadro10">
      10
      <div class="opciones">
        <label>
          <input type="radio" name="opcion10" value="1" onclick="marcarOpcion(1, 10)"> Opción 1
        </label>
        <label>
          <input type="radio" name="opcion10" value="2" onclick="marcarOpcion(2, 10)"> Opción 2
        </label>
      </div>
    </div>
  </div>
</div>

<script>
  function marcarOpcion(opcion, id) {
    // Quitar las clases de color anteriores
    var recuadros = document.querySelectorAll('.recuadro');
    recuadros.forEach(function(recuadro) {
      recuadro.classList.remove('opcion1', 'opcion2');
    });

    // Aplicar la clase correspondiente al bloque que corresponde
    var recuadroSeleccionado = document.getElementById('recuadro' + id);

    if (opcion == 1) {
      recuadroSeleccionado.classList.add('opcion1');
    } else if (opcion == 2) {
      recuadroSeleccionado.classList.add('opcion2');
    }
  }
</script>
</body>
</html>
