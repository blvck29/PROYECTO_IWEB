<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyectoweb.model.beans.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% ArrayList<Usuario> listaApoyos = (ArrayList<Usuario>) request.getAttribute("listaApoyos");%>

<!doctype html>
<html lang="es">

<head>
  <meta http-equiv="Content-Type" content=text/html; charset=ISO-8859-1″>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <link rel="stylesheet" href="css/style.css">
  <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
  <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

  <!-- Add the slick-theme.css if you want default styling -->
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
  <!-- Add the slick-theme.css if you want default styling -->
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

  <script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

  <link rel="icon" type="image/jpg" href="favicon.png" />

  <!-- Add the slick-theme.css if you want default styling -->
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
  <!-- Add the slick-theme.css if you want default styling -->
  <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

  <title>Administración de Usuarios | Semana de Ingeniería 2023</title>
</head>

<body>
<header>
  <div class="logo"><a href="home.jsp"><img class="logo-img" src='images/logo_topbar.png' alt="logo"></a></div>

  <div class="bars">
    <div class="line"></div>
    <div class="line"></div>
    <div class="line"></div>
  </div>

  <nav class="nav-bar">
    <ul>
      <li>
        <a href="tabla_inscritos.jsp" class="active">Usuarios</a>
      </li>
      <li>
        <a href="../user/per_events.jsp">Estadísticas</a>
      </li>
      <li>
        <a href="#"><i class="fa-solid fa-user nav-icon2"></i>Usuario</a>
      </li>
      <li>
        <a href="<%=request.getContextPath()%>"><i class="fa-solid fa-door-open nav-icon2"></i>Cerrar Sesión</a>
      </li>
    </ul>
  </nav>
</header>




<div style="padding-top: 40px;"></div>

<div class="container">
  <div class="row">
    <div class="col-md-12">
      <div style="padding-top: 2em;"></div>
      <h1 class="fw-bold lh-1 mb-2" style="text-align: left;">Interfaz de Administración de Apoyos</h1>
      <div style="padding-top: 0.5em;"></div>
      <p class="fw-bold lh-1 mb-2" style="text-align: left;">Administrar Apoyos</p>
      <div style="padding-top: 1em;"></div>

      <hr class="hr hr-blurry"/>

      <form method="post" action="#">

        <div class="custom-form-group">
          <input type="text" class="form-control" name="busquedaNombreCodigo" placeholder="Buscar por nombre o código">
        </div>
        <button type="submit" class="btn btn-primary">Aplicar filtros</button>

        <a class="btn btn-primary" href="#" role="button">Borrar filtros</a>
      </form>
    </div>
  </div>
</div>

<br>

<div class="container">
  <form autocomplete="off"  method="post" accept-charset="utf-8" id="mform2_c5Hfs9zIVAeeWpH" class="mform">
    <div style="display: none;"><input name="sesskey" type="hidden" value="mfwKCcurEd">
      <input name="_qf__user_active_filter_form" type="hidden" value="1">
    </div>
  </form>
</div>
<div class="table-responsive container">
  <table class="admintable generaltable table-sm" id="users">
    <thead>

    <tr>
      <th class="header c0 centeralign" style="" scope="col"><a><strong>NOMBRE</strong></a> / <a><strong>APELLIDO</strong></a></th>
      <th class="header c1 centeralign" style="" scope="col"><a><strong>CÓDIGO</strong></a></th>
      <th class="header c2" style="" scope="col"><a><strong>ROL</strong></a></th>
      <th class="header c4" style="" scope="col"><a><strong>ULTIMO ACCESO</strong></a></th>
      <th class="header c5" style="" scope="col">EDITAR</th>
      <td class="header c6 lastcol" style=""></td>
    </tr>
    </thead>



    <tbody>

    <% for (Usuario usuario: listaApoyos){ %>
    <tr class="">
      <td class="centeralign cell c0" style=""><a><%= usuario.getNombres()+" "+ usuario.getApellidos()%></a></td>
      <td class="centeralign cell c1" style=""><%= usuario.getCodigo() %></td>

      <% String rol ="a";
        switch(usuario.getIdRol()){
          case "ADMINPRI":
            rol = "Administrador Principal";
            break;
          case "ADMINSEC":
            rol = "Administrador Secundario";
            break;
          case "STUDENT":
            rol = "Estudiante";
            break;
          case "GRADUAT":
            rol = "Graduado";
            break;
          default:
            rol = "No definido";
        }%>


      <td class="cell c2" style=""><%= rol %></td>
      <td class="cell c3" style=""><%= usuario.getUltimoLogin() %></td>
      <td class="cell c4" style=""><a href="#"><img width="24" height="24" src="https://img.icons8.com/sf-regular/48/edit-row.png" alt="edit-row"/></a></td>

    </tr>

    <%}%>
    </tbody>
  </table>
</div>

<div class="container">
  <nav class="mt-4">
    <ul class="pagination justify-content-center">
      <!---->
      <li class="page-item active">
        <a href="#" class="page-link">1</a>
      </li>
      <li class="page-item">
        <a href="#" class="page-link">2</a>
      </li>
      <li class="page-item">
        <a href="#" class="page-link">3</a>
      </li>
      <li class="page-item">
        <a href="#" class="page-link">4</a>
      </li>
      <li class="page-item">
        <a href="#" class="page-link">5</a>
      </li>
      <li class="page-item">
        <a href="#" class="page-link">6</a>
      </li>
      <li class="page-item">
        <a href="#" aria-label="Next" class="page-link">
          <span aria-hidden="true">»</span>
          <span class="sr-only">Next</span>
        </a>
      </li>
    </ul>
  </nav>
</div>

<script>
  function redireccionar() {
    var seleccion = document.getElementById("estado").value;
    if (seleccion === "aprobado") {
      window.location.href = "#";
    } else if (seleccion === "rechazado") {
      window.location.href = "#";
    } else if (seleccion === "ban") {
      window.location.href = "#";
    }
  }
</script>

<script src="js/slider.js"></script>
<script src="js/bootstrap/bootstrap.js"></script>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


</body>

</html>

