<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Estacionamiento</title>
  <link rel="stylesheet" href="styles.css">
  <style>
    /* Estilo general */
    body {
      margin: 0;
      padding: 0;
      font-family: 'Arial', sans-serif;
      background-color: white;
      height: 100vh;
      min-height: 100vh;
      overflow-x: hidden;
      display: flex;
      justify-content: center; /* Alineación horizontal */
      align-items: center; /* Alineación vertical */
      flex-direction: column;
      background-image: url('img/fondo3.jpg'); /* Cambia la ruta de la imagen aquí */
      background-size: cover; /* Hace que la imagen cubra todo el fondo */
      background-position: center; /* Centra la imagen */
    }

    /* Título principal */
    h1 {
      font-size: 2.5rem;
      color: #424949;
      margin-top: 20px;
      text-align: center;
    }

    /* Botón para mostrar la barra lateral */
    .toggle-btn {
      position: absolute;
      top: 10px;
      left: 10px;
      width: 40px;
      height: 40px;
      background-color: rgba(66, 73, 73, 0.39);
      color: white;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 18px;
      z-index: 1000;
    }

    .toggle-btn:hover {
      background-color: #333;
    }

    /* Barra lateral gris */
    .sidebar {
      width: 250px;
      background-color: #10100e;
      height: 100%;
      position: fixed;
      top: 0;
      left: -250px;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding-top: 60px;
      gap: 15px;
      transition: all 0.3s ease;
      box-shadow: 5px 0 10px rgba(0, 0, 0, 0.3);
    }

    .sidebar.active {
      left: 0;
    }

    /* Botones de la barra lateral */
    .sidebar button {
      width: 160px;
      height: 40px;
      font-size: 14px;
      color: white;
      background-color: #424949;
      border: none;
      border-radius: 6px;
      cursor: pointer;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
      text-align: center;
      display: flex;
      align-items: center;
      justify-content: center;
      transition: all 0.3s ease;
    }

    .sidebar button:hover {
      background-color: #6bc47e;
    }

    /* Remueve subrayado en enlaces */
    .sidebar a {
      text-decoration: none;
    }

    /* Contenido principal */
    .main-content {
      margin-bottom: 100px;
      text-align: center;
      margin-top: 20px; /* Ajuste de margen superior */
      max-width: 800px; /* Limita el tamaño del contenido */
      padding: 20px;
      display: flex; /* Usamos Flexbox */
      justify-content: center; /* Centra los botones */
      gap: 20px; /* Espacio entre los botones */
    }

    p {
      color: #666;
      font-size: 1.2em;
      margin-bottom: 20px;
    }

    /* Nuevo botón cuadrado con bordes suaves */
    .square-btn {
      padding: -10px;
      width: 110px;
      height: 110px;
      font-size: 16px;
      background-color: #424949;
      color: white;
      margin: 2rem auto;
      border: none;
      border-radius: 25px; /* Bordes suavizados */
      cursor: pointer;
      box-shadow: 0 6px 12px rgba(0, 0, 0, 0.3);
      transition: all 0.3s ease;
      display: flex;
      flex-direction: column; /* Asegura que el icono esté arriba */
      align-items: center;
      justify-content: center;
    }

    .square-btn i {
      margin-bottom: 10px; /* Espacio entre el icono y el texto */
    }

    .square-btn:hover {
      background-color: #333;
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.4);
      transform: scale(1.1); /* Aumenta ligeramente el tamaño del botón */
    }
  </style>
</head>
<body>

<!-- Título -->
<h1>Estacionamiento</h1>
<h3 style="color: #687272; font-size: 1.4rem; margin-top: -20px; text-align: center;">
  Funcionalidades
</h3>

<!-- Botón de alternar -->
<button class="toggle-btn" onclick="toggleSidebar()">☰</button>

<!-- Barra lateral -->
<div class="sidebar" id="sidebar">
  <a href="menuComida.jsp">
    <button>Tomar Pedido</button>
  </a>
  <a href="index.jsp">
    <button>Cerrar Sesión</button>
  </a>
  <a href="menuPrincipal.jsp">
    <button>Volver</button>
  </a>
</div>

<!-- Contenido principal -->
<div class="main-content" id="main-content">
  <!-- Botón cuadrado con bordes suaves -->
  <button class="square-btn">
    <!-- Icono al lado del texto -->
    <img src="img/consultar.png" alt="Icono de consulta" style="width: 20px; height: 20px; margin-right: 10px;">
    Consultar Disponibilidad
  </button>
  <!-- Otro botón cuadrado con bordes suaves -->
  <button class="square-btn">
    <!-- Icono al lado del texto -->
    <img src="img/estacionamiento.png" alt="Icono de Asignar Espacio"
         style="width: 20px; height: 20px; margin-right: 10px;">
    Asignar Espacio
  </button>
  <!-- Nuevo botón cuadrado con bordes suaves -->
  <button class="square-btn">
    <!-- Icono al lado del texto -->
    <img src="img/duracion.png" alt="Icono de registrar duración"
         style="width: 20px; height: 20px; margin-right: 10px;">
    Registrar Duración
  </button>
  <!-- Botón "Procesar pago" con las mismas características -->
  <button class="square-btn">
    <!-- Icono al lado del texto -->
    <img src="img/pago.png" alt="Icono de procesar pago" style="width: 20px; height: 20px; margin-right: 10px;">
    Procesar Pago
  </button>
</div>

<script>
  function toggleSidebar() {
    const sidebar = document.getElementById('sidebar');
    const mainContent = document.getElementById('main-content');
    sidebar.classList.toggle('active');
    mainContent.classList.toggle('active');
  }
</script>
</body>
</html>
