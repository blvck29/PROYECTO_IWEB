<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyectoweb.model.beans.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% ArrayList<Usuario> listaUsuarios = (ArrayList<Usuario>) request.getAttribute("listaUsuarios");%>
<% Integer cantPaginas = (Integer) request.getAttribute("cantPaginas"); %>
<% String indicador = (String) request.getAttribute("indicador"); %>


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
  <link rel="stylesheet" href="css/slide-bar.css">
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

  <title>Administración de Usuarios | Semana de Ingeniería 2023</title>
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
          <a href="<%=request.getContextPath()%>/admin_gen?action=home" class="active">Usuarios</a>
        </li>
        <li>
          <a href="<%=request.getContextPath()%>/admin_gen?action=activities&ac=list">Actividades</a>
        </li>
        <li>
          <a href="<%=request.getContextPath()%>/admin_gen?action=statistics">Estadísticas</a>
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


  <div class="container-fluid" style="padding-left:0 !important; padding-right: 0 !important; background: rgb(45,0,83) !important;
background: radial-gradient(circle, rgba(45,0,83,1) 0%, rgba(35,3,80,1) 59%, rgba(21,0,48,1) 100%) !important;">
    <div class="text-secondary px-4 py-5 text-center">
      <div class="py-5">
        <h1 class="display-5 fw-bold text-white">Bienvenido, Administrador General</h1>
        <div style="margin-bottom: 20px"></div>
        <h3 class="fw-bold text-white">Panel de Administración de Usuarios</h3>
        <div style="margin-bottom: 20px"></div>
        <div class="justify-content-sm-center">
        </div>
      </div>
    </div>
  </div>

  <div style="padding-top: 40px;"></div>

  <div class="container">
    <div class="row">

      <div class="col-md-10">

        <form method="post" action="<%=request.getContextPath()%>/admin_gen?action=home&ac=busqueda">

          <div class="custom-form-group">
            <input type="text" class="form-control" name="busquedaNombreCodigo" placeholder="Buscar por nombre o código" style="width: 120%">
          </div>
          <button type="submit" class="btn btn-primary">Aplicar filtros</button>

          <a class="btn btn-primary" href="<%=request.getContextPath()%>/admin_gen" role="button">Borrar filtros</a>
        </form>
      </div>

      <div class="col-md-2" >
        <div class="btn-group">
          <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
            ESTADO
          </button>
          <ul class="dropdown-menu dropdown-menu-lg-end">
            <form method="post" action="<%=request.getContextPath()%>/admin_gen?action=home&ac=busquedaPorEstado&id=ACC">
              <li><button class="dropdown-item" type="submit">Aceptados</button></li>
            </form>
            <form method="post" action="<%=request.getContextPath()%>/admin_gen?action=home&ac=busquedaPorEstado&id=VER">
              <li><button class="dropdown-item" type="submit">Sin Asignar</button></li>
            </form>
            <form method="post" action="<%=request.getContextPath()%>/admin_gen?action=home&ac=busquedaPorEstado&id=BAN">
              <li><button class="dropdown-item" type="submit">Baneados</button></li>
            </form>
          </ul>
        </div>
      </div>

    </div>





    <div style="padding-top: 15px;"></div>
    <hr class="hr hr-blurry"/>
  </div>

  <div class="container">
    <form autocomplete="off"  method="post" accept-charset="utf-8" id="mform2_c5Hfs9zIVAeeWpH" class="mform">
      <div style="display: none;"><input name="sesskey" type="hidden" value="mfwKCcurEd">
        <input name="_qf__user_active_filter_form" type="hidden" value="1">
      </div>
    </form>
  </div>

  <div style="padding-top: 25px;"></div>

  <div class="table-responsive container">
    <table class="admintable generaltable table-sm" id="users">
      <thead>
      <tr>
        <th class="header c0 centeralign" style="" scope="col"><a><strong>NOMBRE</strong></a> / <a><strong>APELLIDO</strong></a></th>
        <th class="header c1 centeralign" style="" scope="col"><a><strong>CÓDIGO</strong></a></th>
        <th class="header c2" style="" scope="col"><a><strong>ROL EN EL SISTEMA</strong></a></th>
        <th class="header c2" style="" scope="col"><a><strong>ROL ACADÉMICO</strong></a></th>
        <th class="header c3" style="" scope="col"><a><strong>ESTADO</strong></a></th>
        <th class="header c5" style="" scope="col">EDITAR</th>
        <td class="header c6 lastcol" style=""></td>
      </tr>
      </thead>



      <tbody>

      <% for (Usuario usuario: listaUsuarios){ %>
      <tr class="">
        <td class="centeralign cell c0" style=""><a><%= usuario.getNombres()+" "+ usuario.getApellidos()%></a></td>
        <td class="centeralign cell c1" style=""><%= usuario.getCodigo() %></td>

        <% String rol ="---";
          switch(usuario.getIdRolSistema()){
            case "DELGEN":
              rol = "Delegado General";
              break;
            case "DELACT":
              rol = "Delegado de Actividad";
              break;
            case "USER":
              rol = "Usuario";
              break;
            default:
              rol = "---";
          }%>
        <td class="cell c2" style=""><%= rol %></td>



        <% String rolAcademico ="---";
          switch(usuario.getIdRolAcademico()){
            case "STUDENT":
              rolAcademico = "Estudiante";
              break;
            case "GRADUAT":
              rolAcademico = "Egresado";
              break;
            default:
              rolAcademico = "---";
          }%>
        <td class="cell c2" style=""><%= rolAcademico %></td>



        <% String estado ="---";
          switch(usuario.getIdEstado()){
            case "ACC":
              estado = "Aceptado";
              break;
            case "VER":
              estado = "Sin Asignar";
              break;
            case "BAN":
              estado = "Baneado";
              break;
            default:
              estado = "---";
              break;
          }%>

        <%if (estado.equals("Sin Asignar")){%>
        <td class="cell c3" style="color: red;"><%= estado %></td>
        <%}else{%>
        <td class="cell c3" style=""><%= estado %></td>
        <%}%>
        <td class="cell c5" style=""><a href="<%=request.getContextPath()%>/admin_gen?action=editar&id=<%=usuario.getCodigo()%>"><img width="24" height="24" src="https://img.icons8.com/sf-regular/48/edit-row.png" alt="edit-row"/></a></td>

        <td class="cell c6 lastcol" style=""></td>
      </tr>

      <%}%>
      </tbody>
    </table>
  </div>

  <div class="container">
    <nav class="mt-4">
      <ul class="pagination justify-content-center">





        <%  for(Integer i= 1; i<=cantPaginas; i++){ %>

        <%  if(indicador == null){ %>

        <li class="page-item">
          <a href="<%=request.getContextPath()%>/admin_gen?action=home&pagina=<%=i%>" class="page-link"><%=i%></a>
        </li>


        <%  }else {%>

        <form method="post" action="<%=request.getContextPath()%>/admin_gen?action=home&pagina=<%=i%>&ac=busquedaPorEstado&id=<%=indicador%>">
            <button type="submit" class="page-link"><%=i%></button>
        </form>

        <%  } %>
        <% } %>





        <li class="page-item">
          <a href="#" aria-label="Next" class="page-link">
            <span aria-hidden="true">»</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
      </ul>
    </nav>
  </div>


  <div style="margin-bottom: 50px"></div>


  <div class="container-fluid" style="background-color: #fff; padding-right: 0; padding-left: 0">
    <div class="my-4"></div>
    <footer id="sticky-footer" class="flex-shrink-0 py-4 text-white-50" style="background-color: #04011E">
      <div class="container"><div class="nav justify-content-center border-bottom pb-3 mb-3">
        <p style="text-align: center">
          <small class="text-center">&copy; Pontificia Universidad Católica del Perú - Todos los derechos reservados</small>
        </p>
      </div></div>
    </footer>
  </div>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
  <script src="js/script.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
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
