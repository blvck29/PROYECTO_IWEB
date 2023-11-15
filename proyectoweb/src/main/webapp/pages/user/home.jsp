<%@ page import="com.example.proyectoweb.model.beans.Evento" %>
<%@ page import="com.example.proyectoweb.model.beans.Actividad" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.example.proyectoweb.model.beans.Inscrito" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% ArrayList<Actividad> listaActividades = (ArrayList<Actividad>) request.getAttribute("listaActividades");%>
<% ArrayList<Evento> listaEventos = (ArrayList<Evento>) request.getAttribute("listaEventos"); %>
<% ArrayList<Inscrito> listaInscritos = (ArrayList<Inscrito>) request.getAttribute("listaInscritos"); %>

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
                <a href="<%=request.getContextPath()%>/user_home" class="active" style="margin-bottom: -15px">Inicio</a>
            </li>

            <li class="nav-item dropdown" style="margin-top: 20px">
                <form method="get" id="eventForm" action="<%=request.getContextPath()%>/user_home">
                    <select name="action" class="navbar-dropdwon form-select border-0" style="font-size: 0.9rem" id="eventSelect" onchange="submitForm()">
                        <option style="font-size: 0.9rem; display:none;">Ver Eventos</option>
                        <option style="font-size: 0.9rem; color:black" value="events&id=self">Inscrito</option>
                        <option style="font-size: 0.9rem; color:black" value="events&id=prox">Próximos</option>
                        <option style="font-size: 0.9rem; color:black" value="events&id=end">Finalizados</option>
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


<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <ol class="carousel-indicators">
        <li data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"></li>
        <li data-bs-target="#myCarousel" data-bs-slide-to="1"></li>
        <li data-bs-target="#myCarousel" data-bs-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="carousel-images" alt="Slide 1" id="slide1"
                 src="../../images/placeholder.jpg"
                 data-src-large="images/slide1-large.jpg"
                 data-src-medium="images/slide1-medium.jpg"
                 data-src-small="images/slide1-small.jpg"
                 data-src-xsmall="images/slide1-xsmall.jpg">
        </div>
        <div class="carousel-item">
            <img class="carousel-images" alt="Slide 2" id="slide2"
                 src="images/placeholder.jpg"
                 data-src-large="images/slide2-large.jpg"
                 data-src-medium="images/slide2-medium.jpg"
                 data-src-small="images/slide2-small.jpg"
                 data-src-xsmall="images/slide2-xsmall.jpg">
        </div>
        <div class="carousel-item">
            <img class="carousel-images" alt="Slide 3" id="slide3"
                 src="images/placeholder.jpg"
                 data-src-large="images/slide3-large.jpg"
                 data-src-medium="images/slide3-medium.jpg"
                 data-src-small="images/slide3-small.jpg"
                 data-src-xsmall="images/slide3-xsmall.jpg">
        </div>
    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </a>
</div>


<div class="container">


    <div style="margin-bottom: 60px"></div>

    <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px">Actividades</strong></h2>

    <div style="margin-bottom: 20px"></div>


    <div class = "container" style="max-height: 300px">
        <div class="carousel-act">
            <%for (Actividad actividad : listaActividades) {%>
            <div class="bg-image" style="max-width: 21rem;">
                <img src="images/placeholder_acts.jpg" class="w-100" alt="event">
                <div class="mask text-light d-flex justify-content-center flex-column text-center" style="background-color: rgba(0, 0, 0, 0.5)">
                    <h4><%=actividad.getTitulo()%></h4>
                    <a class="text-light m-0" href="<%=request.getContextPath()%>/user_home?action=acts&idAct=<%=actividad.getIdActividad()%>">Ver Eventos</a>
                </div>
            </div>
            <%}%>
        </div>



    </div>
    <div class = "container" style="max-height: 80px"></div>
    <hr>

    <div style="margin-bottom: 50px"></div>


    <div class="d-flex justify-content-between">
        <div>
            <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px">Eventos Destacados</strong></h2>
        </div>
        <div>
            <button type="button" class="btn btn-info btn-lg px-4">
                <a href="<%=request.getContextPath()%>/user_home?action=events&id=prox" class="link-info text-light">Ver Más</a>
            </button>
        </div>
    </div>


    <div style="margin-bottom: 40px"></div>


    <div style="margin-bottom: 50px"></div>

    <div class="row align-content-center" data-masonry='{"percentPosition": true }'>

        <%int event_counter = 0;%>
        <% for (Evento evento : listaEventos) { %>
        <%if (event_counter==8) { break; }%>
        <div class="col-sm-6 col-lg-3 mb-4">

            <div class="card-list">
                <article class="card">
                    <figure class="card-image">
                        <img class="image-event" src="images/placeholder_events.jpg" alt="event" />
                    </figure>
                    <div class="card-header">
                        <a href="<%=request.getContextPath()%>/user_home?action=details&id=<%=evento.getIdEvento()%>"><%=evento.getTitulo()%><p><%=evento.getSubTitulo()%></p></a>

                    </div>
                    <div class="card-footer">
                        <div class="card-meta card-meta--views">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="8" r="4"></circle>
                                <path d="M18 21v-2a4 4 0 0 0-4-4H10a4 4 0 0 0-4 4v2"></path>
                            </svg>
                            <%
                                int cant = 0;
                                for (Inscrito ins: listaInscritos) {
                                    if(ins.getIdEvento() == evento.getIdEvento()){
                                        cant = ins.getCantidad();
                                    }
                                }%>
                            <%=cant%>
                        </div>
                        <div class="card-meta card-meta--date">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="Calendar">
                                <rect x="2" y="4" width="20" height="18" rx="4"></rect>
                                <path d="M8 2v4"></path>
                                <path d="M16 2v4"></path>
                                <path d="M2 10h20"></path>
                            </svg>
                            <%SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy"); String fechaFormateada = formato.format(evento.getFecha());%>
                            <%=fechaFormateada%>
                        </div>
                    </div>
                </article>
            </div>
        </div>
        <%event_counter = event_counter + 1;%>
        <%}%>

    </div>


    <div style="margin-bottom: 60px"></div>

</div>

<div class="container-fluid" style="padding-left:0 !important; margin-top: 30px !important; padding-right: 0 !important; background: rgb(45,0,83) !important;
background: radial-gradient(circle, rgba(45,0,83,1) 0%, rgba(35,3,80,1) 59%, rgba(21,0,48,1) 100%) !important;">
    <div class="text-secondary px-4 py-5 text-center">
        <div class="py-5">
            <h1 class="display-5 fw-bold text-white">Contamos con tu Apoyo!</h1>
            <div style="margin-bottom: 20px"></div>
            <h3 class="fw-bold text-white">Realiza tu donativo a la Fibra Tóxica, sé un hincha de corazón</h3>
            <div style="margin-bottom: 20px"></div>
            <div class="justify-content-sm-center">
                <button type="button" class="btn btn-outline-info btn-lg px-4">
                    <a href="<%=request.getContextPath()%>/user_home?action=donate" class="link-info text-light">Donar</a>
                </button>
            </div>
        </div>
    </div>
</div>


<div class="container-fluid" style="background-color: #fff; padding-right: 0; padding-left: 0">
    <footer id="sticky-footer" class="flex-shrink-0 py-4 text-white-50" style="background-color: #04011E">
        <div class="container"><div class="nav justify-content-center border-bottom pb-3 mb-3">
            <p style="text-align: center">
                <small class="text-center">&copy; Pontificia Universidad Católica del Perú - Todos los derechos reservados</small>
            </p>
        </div></div>
    </footer>
</div>

<script>
    function submitForm() {
        var selectElement = document.getElementById("eventSelect");
        var selectedValue = selectElement.value;
        if (selectedValue) {
            var newURL = "<%=request.getContextPath()%>/user_home?action=" + selectedValue;
            window.location.href = newURL;
        }
    }
</script>

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


<script src="js/slider.js"></script>
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
