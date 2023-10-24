<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyectoweb.model.beans.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% ArrayList<Usuario> listaUsuarios = (ArrayList<Usuario>) request.getAttribute("listaUsuarios");%>

<!DOCTYPE html>
<html lang="en">
<head>
  <title>Administracion de Usuarios</title>

  <!-- Provicionales usados en clase de iweb: -->

  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
        crossorigin="anonymous">

  <!--  -------------------- -->


  <meta http-equiv=”Content-Type” content=”text/html; charset=ISO-8859-1″>    <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Hugo 0.84.0">
  <title>Semana de Ingeniería</title>


  <link rel="canonical" href="#">

  <link rel="icon" type="image/jpg" href="favicon.png"/>

  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap/bootstrap.min.css" rel="stylesheet">



  <style>
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }
  </style>


  <!-- Custom styles for this template <link href="carousel.css" rel="stylesheet"> -->



  <!-- CSS -->
  <link rel="stylesheet" href="carousel/css/style.css">


  <link rel="stylesheet" href="css/style.css">

</head>


<body>
<main>


  <header>
    <nav class="sticky-navbar1 navbar navbar-expand-lg navbar-dark blue" aria-label="Eleventh navbar example">
      <div class="container">
        <a class="navbar-brand me-5 " href="../home.html">
          <img class="logo-topbar-fluid" src='images/logo_topbar.png' alt="...">
        </a>
        <button class="navbar-toggler justify-content-center" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExample09">
          <ul class="navbar-nav me-auto mb-4 mb-lg-0">

          </ul>
          <a href = "#"><button type="button" class="btn-darkbg btn-outline-wt">Cerrar Sesión  <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg> </button></a>
        </div>
      </div>
    </nav>
  </header>



  <div class="container-img-responsive">
    <div class="container col-xxl-8 px-4 py-5">
      <div class="row flex-lg-row-reverse align-items-center g-5 py-5 ">
        <div class="col-10 col-sm-8 col-lg-6"></div>
        <div class="col-lg-6">
          <h1 class=" fst-italic fw-bold lh-1 mb-2 text-white ">¡INICIA LA SEMANA DE INGENIERÍA 2023!</h1>
          <p class="lead fs-3 text-white">LUNES 16 DE OCTUBRE</p>
          <div class="d-grid gap-2 d-md-flex justify-content-md-start">
          </div>
        </div>
      </div>
    </div>
  </div>






  <div style="padding-top: 3em;"></div>


  <div class="container">
    <div class="modu-dest-intern formato">






      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div style="padding-top: 2em;"></div>
            <h1 class="fw-bold lh-1 mb-2" style="text-align: left;">Interfaz de Administración de Usuarios</h1>
            <div style="padding-top: 0.5em;"></div>
            <p class="fw-bold lh-1 mb-2" style="text-align: left;">Administrar Usuarios</p>
            <div style="padding-top: 1em;"></div>

            <hr class="hr hr-blurry"/>

           <form method="post" action="<%=request.getContextPath()%>/UsuarioServlet?action=busqueda">

            <div class="custom-form-group">
              <input type="text" class="form-control" id="busqueda" name="busquedaNombreCodigo" placeholder="Buscar por nombre o código">

            </div>


            <!-- Menú desplegable de estado
            <div class="custom-form-group">
              <select class="form-select" id="estado" name="estado">
                <option value="" disabled selected>Estado</option>
                <option value="verificar">Por verificar</option>
                <option value="pendiente">Aprobado</option>
                <option value="aprobado">Rechazado</option>
                <option value="aprobado">Baneado</option>
              </select>
            </div> -->

            <button type="submit" class="btn btn-primary" >Aplicar filtros</button>
             <a class="btn btn-primary" href="<%=request.getContextPath()%>/UsuarioServlet" role="button">Borrar filtros</a>
           </form>





          </div>
        </div>




        <div style="padding-top: 0.75em;"></div>
        <div style="padding-top : 1em;"></div>



        <div class="container">

          <hr class="hr hr-blurry"/>

          <div class="row" data-masonry='{"percentPosition": true }'>


            <form autocomplete="off"  method="post" accept-charset="utf-8" id="mform2_c5Hfs9zIVAeeWpH" class="mform">
              <div style="display: none;"><input name="sesskey" type="hidden" value="mfwKCcurEd">
                <input name="_qf__user_active_filter_form" type="hidden" value="1">
              </div>


            </form><div class="no-overflow"><div class="table-responsive"><table class="admintable generaltable table-sm" id="users">
            <thead>
            <tr>
              <th class="header c0 centeralign" style="" scope="col"><a><strong>NOMBRE</strong></a> / <a><strong>APELLIDO</strong></a></th>
              <th class="header c1 centeralign" style="" scope="col"><a><strong>CÓDIGO</strong></a></th>
              <th class="header c2" style="" scope="col"><a><strong>CONDICIÓN</strong></a></th>
              <th class="header c3" style="" scope="col"><a><strong>ESTADO</strong></a></th>
              <th class="header c4" style="" scope="col"><a><strong>ULTIMO ACCESO</strong></a></th>
              <th class="header c5" style="" scope="col">EDITAR</th>
              <td class="header c6 lastcol" style=""></td>
            </tr>
            </thead>



            <tbody>

            <% for (Usuario usuario: listaUsuarios){ %>
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

            <% String estado ="a";
              switch(usuario.getIdEstado()){
              case "ACC":
                estado = "Aceptado";
                break;
              case "VER":
                estado = "Verificado";
                break;
              case "PEN":
                estado = "Pendiente";
                break;
              case "BAN":
                estado = "Baneado";
                break;
              default:
                estado = "a";
            }%>
              <td class="cell c3" style=""><%= estado %></td>
              <td class="cell c4" style=""><%= usuario.getUltimoLogin() %></td>
              <td class="cell c5" style=""><a href="<%=request.getContextPath()%>/UsuarioServlet?action=editarEstado&id=<%=usuario.getCodigo()%>"><img width="24" height="24" src="https://img.icons8.com/sf-regular/48/edit-row.png" alt="edit-row"/></a></td>

              <td class="cell c6 lastcol" style=""></td>
            </tr>

            <%}%>



            </tbody>


          </table>
          </div></div><nav aria-label="Página" class="pagination pagination-centered justify-content-center">

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


            <div style="padding-top: 2em;"></div>


            <nav aria-label="Page navigation example">
              <div style="padding-top: 2em;"></div>
              <ul class="pagination justify-content-center">

                <li class="page-item disabled">
                  <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Atrás</a>
                </li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item">
                  <a class="page-link" href="#">Siguiente</a>
                </li>
              </ul>
            </nav>












          </div>
        </div>


        <div style="padding-top: 2em;"></div>

</main>

<div class="container-fluid" style="padding-left: 0px; padding-right: 0px;">
  <footer class="text-center" style="background: #042454;">
    <div class="container text-white py-4 py-lg-5">
      <p class="text-white mb-0"><br>© Pontificia Universidad Católica del Perú - Todos los derechos reservados<br><br></p>
    </div>
  </footer>
</div>



</body>

<script src="../../assets/dist/js/script_dropdown.js"></script>


<!-- Core JS -->
<script src="../../assets/dist/js/bootstrap.bundle.min.js"></script>
<script src="../../assets/dist/js/dist_masonry.pkgd.min.js"></script>

<!-- Swiper JS -->
<script src="../../carousel/js/swiper-bundle.min.js"></script>

<!-- JavaScript -->
<script src="../../carousel/js/script.js"></script>



</html>

