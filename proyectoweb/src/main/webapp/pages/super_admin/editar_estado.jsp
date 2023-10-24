<%@ page import="com.example.proyectoweb.model.beans.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% Usuario usuario = (Usuario) request.getAttribute("usuario"); %>

<html lang="en">
<head>

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">


    <meta http-equiv=”Content-Type” content=”text/html; charset=ISO-8859-1″>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Semana de Ingeniería</title>

    <link rel="canonical" href="#">

    <link rel="icon" type="image/jpg" href="favicon.png"/>
    <link rel="stylesheet" type="text/css" href="style.css">
    <link rel="stylesheet" type="text/css" href="cuerpo.css">


    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

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
    <link href="headers.css" rel="stylesheet">

    <!-- Swiper CSS -->
    <link rel="stylesheet" href="swiper-bundle.min.css">



    <!-- CSS -->
    <link rel="stylesheet" href="carousel/css/style.css">


    <link rel="stylesheet" href="css/style.css">

</head>
<body>


<main>

    <header>

        <nav class="navbar navbar-expand-lg navbar-dark blue" aria-label="Eleventh navbar example">
            <div class="container">
                <a class="navbar-brand me-5 " href="#">
                    <img class="logo-topbar-fluid" src='images/logo_topbar.png' alt="...">
                </a>
                <button class="navbar-toggler justify-content-center" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample09" aria-controls="navbarsExample09" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarsExample09">
                    <ul class="navbar-nav me-auto mb-4 mb-lg-0">
                        <li class="nav-item">
                            <button type="button" class="btn-darkbg btn-outline-wt  me-2" href = "#">Estadísticas</button>
                        </li>
                        <li class="nav-item">
                            <button type="button" class="btn-darkbg btn-outline-wt  me-2" href = "#">Administración</button>
                        </li>
                    </ul>
                    <button type="button" class="btn-darkbg btn-outline-wt" href = "#">Cerrar Sesión   <svg xmlns="http://www.w3.org/2000/svg" width="15" height="15" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-log-out"><path d="M9 21H5a2 2 0 0 1-2-2V5a2 2 0 0 1 2-2h4"></path><polyline points="16 17 21 12 16 7"></polyline><line x1="21" y1="12" x2="9" y2="12"></line></svg> </button>


                </div>
            </div>
        </nav>
    </header>

    <div class="container-img-responsive">
        <div class="container col-xxl-8 px-4 py-5">
            <div class="row flex-lg-row-reverse align-items-center g-5 py-5 ">
                <div class="col-10 col-sm-8 col-lg-6"></div>
                <div class="col-lg-6">
                    <p class="lead fs-3 text-white">Administración-Administración de Usuarios</p>
                    <h1 class=" fst-italic fw-bold lh-1 mb-2 text-white "><strong>Administración de Usuarios</strong></h1>
                    <div class="d-grid gap-2 d-md-flex justify-content-md-start">
                    </div>
                </div>
            </div>
        </div>
    </div>



    <div class="b-example-divider"></div>





<div class="container">
    <h1 ><strong>Estado de Usuario</strong></h1>
    <br/>
    <div class="row">
        <div class="col-md-6">
            <div class="event-section">


                    <div class="form-group">
                        <label for="nombre"><strong>Nombre y apellidos:</strong></label>
                        <input class="form-control" type="text" value="<%=usuario.getNombres() + " "+ usuario.getApellidos()%>" aria-label="Disabled input example" disabled readonly>
                    </div>
                    <br/>
                    <div class="form-group">
                        <label for="codigoPUCP"><strong>Código PUCP:</strong></label>
                        <input class="form-control" type="text" value="<%=usuario.getCodigo()%>" aria-label="Disabled input example" disabled readonly>
                    </div>
                    <br/>
                    <div class="form-group">
                        <label for="correoPUCP"><strong>Correo PUCP:</strong></label>
                        <input class="form-control" type="text" value="<%=usuario.getCorreo()%>" aria-label="Disabled input example" disabled readonly>
                    </div>
                    <br/>
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
                <div class="form-group">
                    <label for="correoPUCP"><strong>Rol:</strong></label>
                    <input class="form-control" type="text" value="<%=rol%>" aria-label="Disabled input example" disabled readonly>
                </div>

                <br>
                <div class="form-group">
                        <label for="correoPUCP"><strong>Estado actual:</strong></label>

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

                        <input class="form-control" type="text" value="<%=estado%>" aria-label="Disabled input example" disabled readonly>
                    </div>
                    <br/>
                    <div class="form-group">
                        <label for="EstadoAlumno"><strong>Editar estado:</strong></label>
                        <br/>

                        <% if (estado.equals("Aceptado")){%>
                        <div class="radio-buttons">
                            <label><input type="radio" name="status" value="denegado"> Baneado </label>
                        </div>
                    </div>
                        <br/>
                        <div class="button-container">
                            <a class="btn btn-primary" href="<%=request.getContextPath()%>/UsuarioServlet" role="button">Cancelar</a>
                            <a class="btn btn-primary" href="<%=request.getContextPath()%>/UsuarioServlet" role="button">Guardar cambios</a>
                        </div>


                         <%}else if (estado.equals("Verificado")){%>
                        <div class="radio-buttons">
                            <label><input type="radio" name="status" value="aprobado"> Aprobado <br></label>
                            <label><input type="radio" name="status" value="denegado"> Denegado </label>
                        </div>
                     </div>
                        <br/>
                        <div class="button-container">
                            <a class="btn btn-primary" href="<%=request.getContextPath()%>/UsuarioServlet" role="button">Cancelar</a>
                            <a class="btn btn-primary" href="<%=request.getContextPath()%>/UsuarioServlet" role="button">Guardar cambios</a>
                        </div>


                         <%}else if (estado.equals("Pendiente")){%>
                         <input class="form-control" type="text" value="Esperando a que el usuario confirme su contraseña por correo" aria-label="Disabled input example" disabled readonly>
                     </div>
                    <br/>
                        <div class="button-container">
                            <a class="btn btn-primary" href="<%=request.getContextPath()%>/UsuarioServlet" role="button">Regresar</a>
                        </div>

                        <%}%>







            </div>
        </div>
</main>
<br>
<br>
<br>
<br>


       <div class="container-fluid" style="padding-left: 0px; padding-right: 0px;">
            <footer class="text-center" style="background: #042454;">
                <div class="container text-white py-4 py-lg-5">
                    <p class="text-white mb-0"><br>© Pontificia Universidad Católica del Perú - Todos los derechos reservados<br><br></p>
                </div>
            </footer>
        </div>


</body>


<script src="/assets/dist/js/bootstrap.bundle.min.js"></script>

<!-- Swiper JS (Carrusel)-->
<script src="/assets/dist/js/swiper-bundle.min.js"></script>

<!-- JavaScript (Carrusel)-->
<script src="/assets/dist/js/script.js"></script>

</html>
