<%@ page import="com.example.proyectoweb.model.beans.Inscripcion" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyectoweb.model.beans.Evento" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


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

<% ArrayList<Inscripcion> listaEventosPropia = (ArrayList<Inscripcion>) request.getAttribute("listaEventosPropia"); %>
<% Evento event = (Evento) request.getAttribute("evento_detailed"); %>

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

    <title>Home | Semana de Ingeniería 2023</title>
</head>


<body>
<header>
    <div class="logo"><a href="<%=request.getContextPath()%>/user_home"><img class="logo-img" src='images/logo_topbar.png' alt="logo"></a></div>

    <div class="bars">
        <div class="line"></div>
        <div class="line"></div>
        <div class="line"></div>
    </div>

    <nav class="nav-bar">
        <ul>
            <li>
                <a href="<%=request.getContextPath()%>/user_home" style="margin-bottom: -15px">Inicio</a>
            </li>

            <li class="nav-item dropdown" style="margin-top: 20px">
                <form method="get" id="eventForm" action="<%=request.getContextPath()%>/user_home">
                    <select name="action" class="navbar-dropdwon form-select border-0" style="font-size: 0.9rem" id="eventSelect" onchange="submitForm()">
                        <option style="font-size: 0.9rem; display:none;">Ver Eventos</option>
                        <option style="font-size: 0.9rem; color:black" value="events&id=self">Inscrito</option>
                        <option style="font-size: 0.9rem; color:black" value="events&id=prox">Próximos</option>
                        <option style="font-size: 0.9rem; color:black" value="events&id=end">Acabados</option>
                    </select>
                </form>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/user_home?action=donate">Donaciones</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/user_home?action=user"><i class="fa-solid fa-user nav-icon2"></i>Usuario</a>
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
            <h1 class="display-5 fw-bold text-white">Eventos de <%=event.getIdActividad().toLowerCase()%></h1>
            <div class="justify-content-sm-center">
            </div>
        </div>
    </div>
</div>






<div class="container">

    <div style="margin-bottom: 50px"></div>

    <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px"><%=event.getTitulo()%></strong></h2>
    <h4 style="padding-left: 45px"><p><%=event.getSubTitulo()%></p></h4>

    <div style="margin-bottom: 20px"></div>

    <hr>

    <div style="margin-bottom: 40px"></div>

    <div class="container">

        <div><p><%=event.getDescripcion()%></p>
            <div style="padding-top: 1em;"></div>
        </div>

        <div class="row">
            <div class="col-lg-6 col-md-12" style="text-align: left; padding-top: 1.5em">

                <div class="card">
                    <div class="card-body" style="padding-left: 35px">

                        <div>
                            <div style="padding-top: 1.5em;"></div>
                            <label><strong>Fecha de evento:</strong></label>
                            <%=event.getFecha()%>
                            <div style="padding-top: 1.5em;"></div>
                        </div>

                        <div>
                            <label><strong>Hora:</strong></label>
                            <%=event.getHora()%>
                            <div style="padding-top: 1.5em;"></div>
                        </div>

                        <div>
                            <label><strong>Lugar de evento:</strong></label>
                            <%=event.getLugar()%>
                            <div style="padding-top: 1em;"></div>
                        </div>

                        <div class="container" style="padding-top: 1rem; align-items: center; align-content: center; text-align: center;">
                            <button class="btn btn-primary">Inscribirse</button>
                        </div>
                        <div style="padding-top: 1em;"></div>

                    </div>


                    </div>
                </div>



            <div class="col-lg-6 col-md-12" style="padding-left: 2em; padding-right: 2em; padding-top: 1.5em">
                <img src="<%=event.getImagen()%>" alt="imagen de evento" style="height: auto; width: 100%">

            </div>
        </div>
    </div>


    <div style="margin-bottom: 30px"></div>
    <hr>
    <div class="mapita-iframe">
        <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m12!1m3!1d1950.8141224621138!2d-77.0783234033185!3d-12.069079591850105!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!5e0!3m2!1ses!2spe!4v1449699157324" frameborder="0" style="border:0" data-gtm-yt-inspected-9="true"></iframe>
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











<script>
    $(document).ready(function(){
        $('.carousel-act').slick({
            slidesToShow: 3,
            centerMode: true,
            responsive: [
                {
                    breakpoint: 1400, // Cuando el ancho de la pantalla sea 768px o menos
                    settings: {
                        slidesToShow: 2, // Cambia a mostrar solo 1 diapositiva
                    }
                },
                {
                    breakpoint: 1000, // Cuando el ancho de la pantalla sea 992px o menos
                    settings: {
                        slidesToShow: 1, // Cambia a mostrar 2 diapositivas
                    }
                }
            ]
        });
    });
</script>


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