<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyectoweb.model.beans.Usuario" %>
<%@ page import="com.example.proyectoweb.model.beans.Actividad" %>
<%@ page import="com.example.proyectoweb.model.beans.DelegadoAct" %>
<%@ page import="com.example.proyectoweb.servlets.AdminGenServlet" %>
<%@ page import="com.example.proyectoweb.model.beans.Donaciones" %>
<%@ page import="com.example.proyectoweb.model.beans.*" %>

<% ArrayList<Actividad> listaActividades = (ArrayList<Actividad>) request.getAttribute("listaActividades");%>
<% ArrayList<Usuario> listaUsuarios = (ArrayList<Usuario>) request.getAttribute("listaUsuarios");%>
<%
  if (session.getAttribute("id") != null){
    int id = (int) session.getAttribute("id");
    String idRolSistema = (String) session.getAttribute("idRolSistema");
    String idRolAcademico = (String) session.getAttribute("idRolAcademico");
    String nombres = (String) session.getAttribute("nombres");
    String apellidos = (String) session.getAttribute("apellidos");
  }
%>


<!doctype html>
<html lang="es">


<%
  if (session.getAttribute("id")!=null){
%>

<head>
  <!-- Bootstrap core CSS -->
  <link href="css/style-graficos.css" rel="stylesheet">
  <link href="css/_progress.scss" rel="stylesheet">

  <meta http-equiv="Content-Type" content=text/html; charset=ISO-8859-1″>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="css/slide-bar.css">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

  <!-- Add the slick-theme.css if you want default styling -->
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
  <!-- Add the slick-theme.css if you want default styling -->
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

  <script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

  <!-- UIkit CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.17.4/dist/css/uikit.min.css" />

  <!-- UIkit JS -->
  <script src="https://cdn.jsdelivr.net/npm/uikit@3.17.4/dist/js/uikit.min.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/uikit@3.17.4/dist/js/uikit-icons.min.js"></script>

  <link rel="icon" type="image/jpg" href="favicon.png" />

  <!-- Add the slick-theme.css if you want default styling -->
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
  <!-- Add the slick-theme.css if you want default styling -->
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

  <title>Estadísticas | Semana de Ingeniería 2023</title>


</head>

<body>
<header>
  <div class="logo"><a href="<%=request.getContextPath()%>/admin_gen"><img class="logo-img" src='images/logo_topbar.png' alt="logo"></a></div>

  <div class="bars">
    <div class="line"></div>
    <div class="line"></div>
    <div class="line"></div>
  </div>

  <nav class="nav-bar">
    <ul>
      <li>
        <a href="<%=request.getContextPath()%>/admin_gen?action=home">Usuarios</a>
      </li>
      <li>
        <a href="<%=request.getContextPath()%>/admin_gen?action=activities&ac=list">Actividades</a>
      </li>
      <li>
        <a href="<%=request.getContextPath()%>/admin_gen?action=statistics" class="active">Estadísticas</a>
      </li>
      <li>
        <a href="<%=request.getContextPath()%>/admin_gen?action=donations">Donaciones</a>
      </li>
      <li>
        <a href="<%=request.getContextPath()%>/logout"><i class="fa-solid fa-door-open nav-icon2"></i>Cerrar Sesión</a>
      </li>
    </ul>
  </nav>
</header>

<div class="container">
  <div style="margin-bottom: 50px"></div>

  <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px">Estadísticas</strong></h2>
  <div class="container d-flex col-md-10 justify-content-end">
    <li>
      <a class="btn btn-primary me-1 float-end mt-1 ml-1 fw-bold active" href="<%=request.getContextPath()%>/admin_gen?action=statistics"> Recaudaciones</a>
    </li>
    <li>
      <a class="btn btn-outline-primary me-1 float-end mt-1 ml-1 " href="<%=request.getContextPath()%>/admin_gen?action=statistics&select=canAl"> Cantidad de alumnos y egresados</a>
    </li>
    <li>
      <a class="btn btn-outline-primary me-1 float-end mt-1 ml-1" href="<%=request.getContextPath()%>/admin_gen?action=statistics&select=cantAp"> Cantidad de apoyos por actividad</a>
    </li>
  </div>

  <div class="container">
    <div class="modu-dest-intern formato">


      <div style="padding-top: 1em;"></div>

      <h1 style="padding-left: 120px; text-align: start;">Cantidad de Apoyos por Actividad</h1>
      <p style="padding-left: 120px; text-align: start;">Resumen total de Apoyos:</p>

      <div class="containerBarraP_Apoyos">
        <div class="skills_apoyos">
          <h2 style="margin-left:100px">Barra 75%</h2>
          <div class="progress-bar">
            <div class="barra"></div>
          </div>
          <h2 style="margin-left:100px">Participantes 15%</h2>
          <div class="progress-bar">
            <div class="participantes"></div>
          </div>
        </div>
      </div>

      <img src = "../../../assets/dist/imgs/graficoBarras.jpg">

      <div style="padding-top: 2em;"></div>



    </div>
  </div>


</div>

<div class="container-fluid" style="background-color: #fff; padding-right: 0; padding-left: 0">
  <div class="my-4"></div>
  <footer id="sticky-footer" class="flex-shrink-0 py-4 text-white-50" style="background-color: #04011E">
    <div class="container">
      <div class="nav justify-content-center border-bottom pb-3 mb-3">
        <p style="text-align: center">
          <small class="text-center">© Pontificia Universidad Católica del Perú - Todos los derechos reservados</small>
        </p>
      </div>
    </div>
  </footer>
</div>



<script src="js/bootstrap/bootstrap.js"></script>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async=""></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


</body>


<% } else { %>

<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
  <script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>
  <link rel="icon" type="image/jpg" href="favicon.png"/>
  <title>Semana de Ingeniería 2023</title>
</head>

<body>

<section class="index">

  <div class="forgot-container">

    <div class="forgot-form">
      <form action="<%=request.getContextPath()%>/login" method="POST" id="complete">
        <h2>Se ha cerrado la Sesión!</h2>
        <div class="forgot-back" style="padding-top: 10px; max-width: 450px; margin-bottom: 25px">
          <label>Debe iniciar sesión para acceder al contenido de la página, regrese al login.</label>
        </div>

        <input type="submit" value="Regresar" class="forgot-button">

      </form>
    </div>
  </div>

  <div class="container-fluid footer-container">
    <p>© Pontificia Universidad Católica del Perú - Todos los derechos reservados</p>
  </div>

</section>

</body>

<%}%>
</html>