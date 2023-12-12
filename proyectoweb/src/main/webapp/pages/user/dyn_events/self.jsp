<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.example.proyectoweb.model.beans.*" %>

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%Usuario user = (Usuario) session.getAttribute("usuario");%>

<% ArrayList<Actividad> listaActividades = (ArrayList<Actividad>) request.getAttribute("listaActividades");%>
<% ArrayList<Inscripcion> listaEventosPropia = (ArrayList<Inscripcion>) request.getAttribute("listaEventosPropia"); %>
<% ArrayList<Inscrito> listaInscritos = (ArrayList<Inscrito>) request.getAttribute("listaInscritos"); %>

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

    <!--Footer-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-HjQE6zC8aa2BK9xVRvPUdo4FqIkFfQF1dM1iZeFzTC1Q9dI6yCeF6pMJpPs19j7e" crossorigin="anonymous">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">

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
                <a href="<%=request.getContextPath()%>/user_home?action=profile"><i class="fa-solid fa-user nav-icon2"></i><%=user.getNombres() + " " + user.getApellidos()%></a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/logout"><i class="fa-solid fa-door-open nav-icon2"></i>Cerrar Sesión</a>
            </li>
        </ul>
    </nav>


</header>


<div class="container">

    <div style="margin-bottom: 50px"></div>

    <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px">Tus Eventos</strong></h2>

    <div style="margin-bottom: 40px"></div>


    <div class="input-group mb-3">
        <input type="text" class="form-control" placeholder="Buscar Evento">
        <button class="input-group-text shadow-none px-4 btn-large">
            <i class="fa-solid fa-magnifying-glass" style="color: #262626;"></i>
        </button>

    </div>

    <div style="margin-bottom: 50px"></div>

    <div class="row align-content-center" data-masonry='{"percentPosition": true }'>

        <%int event_counter = 0;%>
        <% for (Inscripcion ins : listaEventosPropia) { %>
        <div class="col-sm-6 col-lg-3 mb-4">

            <div class="card-list">
                <article class="card">
                    <figure class="card-image">
                        <img class="image-event" src="<%=request.getContextPath()%>/user_home?action=imagenPorEvento&idEvento=<%=ins.getIdEvento()%>" />
                    </figure>
                    <div class="card-header">
                        <a href="<%=request.getContextPath()%>/user_home?action=details&id=<%=ins.getIdEvento()%>"><%=ins.getTitulo()%><p><%=ins.getSubTitulo()%></p></a>

                    </div>
                    <div class="card-footer">
                        <div class="card-meta card-meta--views">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="8" r="4"></circle>
                                <path d="M18 21v-2a4 4 0 0 0-4-4H10a4 4 0 0 0-4 4v2"></path>
                            </svg>
                            <%
                                int cant = 0;
                                for (Inscrito inscrito: listaInscritos) {
                                    if(inscrito.getIdEvento() == ins.getIdEvento()){
                                        cant = inscrito.getCantidad();
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
                            <%SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy"); String fechaFormateada = formato.format(ins.getFecha());%>
                            <%=fechaFormateada%>
                        </div>
                    </div>
                </article>
            </div>
        </div>
        <%event_counter = event_counter + 1;%>
        <%}%>

    </div>

    <%if (event_counter >=8) {%>

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

    <%} else if (event_counter==0){%>

    <div class="container align-content-center"><h2>No hay eventos Próximos</h2></div>
    <div style="margin-bottom: 180px"></div>

    <%} else if (event_counter<5){%>

    <div style="margin-bottom: 200px"></div>

    <%}%>

</div>

<div style="margin-bottom: 50px"></div>


<div class="container-fluid" style="padding-right: 0; padding-left: 0">
    <footer id="sticky-footer" class="footer-distributed" style="background-color: #04011E">
        <div class="footer-left">
            <img src="images/logo_topbar.png" alt="Logo de Ingeniería de las Telecomunicaciones" style="width: 400px; height: auto;">
            <p class="footer-links">
                <a href="<%=request.getContextPath()%>/user_home" class="active" style="margin-bottom: -15px">Inicio</a> |
                <a href="<%=request.getContextPath()%>/user_home?action=donate">Donaciones</a> |
                <a href="<%=request.getContextPath()%>/user_home?action=profile">Perfil</a>
            </p>
            <p class="footer-company-name">Copyright © 2023 <strong>Pontificia Universidad Catolica del Perú</strong> Todos los derechos reservados</p>
        </div>

        <div class="footer-center">
            <div>
                <i class="fa fa-map-marker"></i>
                <p><span>Av. Universitaria 1801, San Miguel, 15088</span> Lima, Perú</p>
            </div>

            <div>
                <i class="fa fa-phone"></i>
                <p>+51 982 876 098</p>
            </div>

            <div>
                <i class="fa fa-envelope"></i>
                <p><a href="mailto:sagar00001.co@gmail.com">fibratoxica.sdi@gmail.com</a></p>
            </div>
        </div>

        <div class="footer-right">
            <p class="footer-company-about">
                <span>Semana de Ingeniería</span>
                La carrera de <strong>Ingeniería de las telecomunicaciones</strong> de la <strong>Pontificia Universidad Catolica del Perú</strong> diseñó una pagina WEB para que sus alumnos puedan organizar sus eventos.
            </p>
            <div class="footer-icons">
                <a href="https://www.facebook.com/profile.php?id=100009473024310&mibextid=LQQJ4d"><i class="fa fa-facebook"></i></a>
                <a href="https://www.instagram.com/leo.leonar071/?igshid=OGQ5ZDc2ODk2ZA%3D%3Ds"><i class="fa fa-instagram"></i></a>
                <a href="https://www.youtube.com/@pucp"><i class="fa fa-youtube"></i></a>
            </div>
        </div>
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


<script src="js/slider.js"></script>
<script src="js/bootstrap/bootstrap.js"></script>
<script src="/js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

</body>

</html>
