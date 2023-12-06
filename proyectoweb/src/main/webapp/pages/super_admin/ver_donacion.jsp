<%@ page import="com.example.proyectoweb.model.beans.Evento" %>
<%@ page import="com.example.proyectoweb.model.beans.Donaciones" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% Donaciones donante = (Donaciones) request.getAttribute("Donante"); %>


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

    <link rel="icon" type="image/jpg" href="../../favicon.png" />

    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
    <link rel="icon" type="image/jpg" href="favicon.png"/>

    <title>Home | Semana de Ingeniería 2023</title>
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
background: radial-gradient(circle, rgba(45,0,83,1) 0%, rgba(35,3,80,1) 59%, rgba(21,0,48,1) 100%) !important;")>
    <div class="text-secondary px-4 py-5 text-center">
        <div class="py-5">
            <h1 class="display-5 fw-bold text-white">Bienvenido, @Admin_general</h1>
            <div style="margin-bottom: 20px"></div>
            <h3 class="fw-bold text-white">Panel de Administración de Usuarios</h3>
            <div style="margin-bottom: 20px"></div>
            <div class="justify-content-sm-center">
            </div>
        </div>
    </div>
</div>



<div class="container">

    <div style="margin-bottom: 50px"></div>
    <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px">Interfaz de Detalles del Donación</strong></h2>
    <div style="margin-bottom: 20px"></div>

    <hr style="border-top: 1px solid #262626;">

    <div style="margin-bottom: 40px"></div>

    <div class="container">
        <form method="POST" action="<%=request.getContextPath()%>/admin_gen?action=donations&ac=editarDonacion" class="col-md-6 col-lg-6">


            <div class="row">
                <div class="col-lg-6 col-md-12" style="text-align: left; padding-top: 1.5em">
                    <div class="card">
                        <div class="card-body" style="padding-left: 35px">

                            <input name="idDonacion" type="hidden" class="form-control" id="idDonacion" value="<%=donante.getIdDonaciones()%>">

                            <div style="padding-top: 1.5em;"></div>

                            <div>
                                <div class="form-group" style="padding-right: 1rem">
                                    <label  style="text-align: left;"><strong>Nombre/Apellido del donante:</strong></label>
                                    <input name="titulo" type="text" class="form-control" id="titulo" value="<%=donante.getNombres() + " "+donante.getApellidos()%>" disabled readonly>
                                </div>
                            </div>

                            <div style="padding-top: 1.5em;"></div>

                            <% String rolAcademico ="---";
                                switch(donante.getIdRolAcademico()){
                                    case "STUDENT":
                                        rolAcademico = "Estudiante";
                                        break;
                                    case "GRADUAT":
                                        rolAcademico = "Egresado";
                                        break;
                                    default:
                                        rolAcademico = "---";
                                }%>

                            <div>
                                <div class="form-group" style="padding-right: 1rem">
                                    <label  style="text-align: left;"><strong>Rol Académico:</strong></label>
                                    <input name="subtitulo" type="text" class="form-control" id="subtitulo" value="<%=rolAcademico%>" disabled readonly>
                                </div>
                            </div>

                            <div style="padding-top: 1.5em;"></div>

                            <div class="form-group" style="padding-right: 1rem">
                                <label style="text-align: left;"><strong>Monto Donado:</strong></label>
                                <input name="monto" type="text" class="form-control" id="monto" value="<%="S/." + donante.getMonto()%>">
                            </div>

                            <div style="padding-top: 1.5em;"></div>

                            <%  String[] fechaHora = donante.getFechaDonacion().split(" ");
                                String fecha = fechaHora[0];
                                String hora = fechaHora[1];
                                String[] horaHMS = hora.split(":");
                                String horaMostrar = horaHMS[0] + ":" + horaHMS[1];
                            %>

                            <div class="form-group" style="padding-right: 1rem">
                                <label  style="text-align: left;"><strong>Fecha de Donacion:</strong></label>
                                <input name="fecha-donacion" type="text" class="form-control" id="fecha-donacion" value="<%=fecha%>" >
                            </div>

                            <div style="padding-top: 1.5em;"></div>

                            <div class="form-group" style="padding-right: 1rem">
                                <label  style="text-align: left;"><strong>Hora de Donacion:</strong></label>
                                <input name="hora-donacion" type="text" class="form-control" id="hora-donacion" value="<%=horaMostrar%>" >
                            </div>

                            <div style="padding-top: 1.5em;"></div>

                            <%
                                switch (donante.getComprobado()){
                                    case (0):
                            %>

                            <div class="radio-buttons">
                                <label style="padding-right: 30px"><input type="radio" name="estado"  value="1" required> Comprobar <br></label>
                                <label><input type="radio" name="estado"  value="2" required> Rechazar </label>
                            </div>
                            <%
                                    break;
                                case (1):
                            %>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="estado"  value="2" required>
                                <label class="form-check-label" id="exampleRadios2">
                                    Rechazar
                                </label>
                            </div>

                            <%
                                    break;
                                case (2):
                            %>
                            <div class="radio-buttons">
                                <label style="padding-right: 30px"><input type="radio" name="estado" value="1" required> Comprobar <br></label>
                            </div>
                            <%
                                        break;
                                }
                            %>

                        </div>
                    </div>

                    <div class="uk-flex uk-flex-center uk-margin-top">
                        <div class="uk-flex uk-flex-center">
                            <a id="redirect-button" class="btn btn-primary m-2" href="<%=request.getContextPath()%>/admin_gen?action=donations">Regresar</a>
                            <button type="submit" class="btn btn-primary">Actualizar</button>
                        </div>
                    </div>
                </div>

                <div class="col-lg-6 col-md-12" style="padding-left: 2em; padding-right: 2em; padding-top: 1.5em">

                    <img src="images/placeholder_events.jpg" alt="imagen de evento" style="height: auto; width: 100%">

                    <div style="margin-bottom: 20px"></div>

                </div>

            </div>
        </form>
    </div>

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



<script src="js/upload.js"></script>
<script src="js/bootstrap/bootstrap.js"></script>
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
