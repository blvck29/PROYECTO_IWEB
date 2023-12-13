<%@ page import="com.example.proyectoweb.model.beans.Evento" %>
<%@ page import="com.example.proyectoweb.model.beans.Actividad" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.example.proyectoweb.model.beans.Inscrito" %>
<%@ page import="com.example.proyectoweb.model.beans.Usuario" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%Usuario user = (Usuario) session.getAttribute("usuario");%>

    <% ArrayList<Actividad> listaActividades = (ArrayList<Actividad>) request.getAttribute("listaActividades");%>
    <% ArrayList<Evento> listaEventos = (ArrayList<Evento>) request.getAttribute("listaEventos"); %>
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

    <!--Footer-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-HjQE6zC8aa2BK9xVRvPUdo4FqIkFfQF1dM1iZeFzTC1Q9dI6yCeF6pMJpPs19j7e" crossorigin="anonymous">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">

    <style>
        #paginationButtons {
            display: flex;
            justify-content: center;
            gap: 5px;
            margin-top: 20px;
        }

        #paginationButtons button {
            padding: 5px 10px;
            border-radius: 5px;
            border: 1px solid #33C3FB;
            background-color: #33C3FB;
            cursor: pointer;
            color: white;
        }


        #paginationButtons button.active {
            background-color: #e0e0e0;
            font-weight: bold;
            color: white;
        }


        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
        }

    </style>



    <title>Home | Semana de Ingeniería 2023</title>
</head>

<body>


<% if (user.getIdRolSistema().equals("USER")){  %>

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
                <form method="get" id="eventFormUser" action="<%=request.getContextPath()%>/user_home">
                    <select name="action" class="navbar-dropdwon form-select border-0" style="font-size: 0.9rem" id="eventSelectUser" onchange="submitFormUser()">
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
                <a href="<%=request.getContextPath()%>/user_home?action=profile"><i class="fa-solid fa-user nav-icon2"></i><%=user.getNombres() + " " + user.getApellidos()%></a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/logout"><i class="fa-solid fa-door-open nav-icon2"></i>Cerrar Sesión</a>
            </li>
        </ul>
    </nav>

    </header>

    <% } else { %>


    <header>
        <div class="logo"><a href="<%=request.getContextPath()%>/admin_act?action=home"><img class="logo-img" src='images/logo_topbar.png' alt="logo"></a></div>

        <div class="bars">
            <div class="line"></div>
            <div class="line"></div>
            <div class="line"></div>
        </div>

        <nav class="nav-bar">
            <ul>
                <li class="nav-item dropdown" style="margin-top: 20px">
                    <form method="get" id="eventForm2" action="<%=request.getContextPath()%>/admin_act">
                        <select name="action" class="navbar-dropdwon form-select border-0" style="font-size: 0.9rem" id="eventSelect2" onchange="submitForm2()">
                            <option style="font-size: 0.9rem; display:none;">Cambiar Rol</option>
                            <option style="font-size: 0.9rem; color:black" value="user">Usuario</option>
                            <option style="font-size: 0.9rem; color:black" value="admin">Admin</option>
                        </select>
                    </form>
                </li>
                <li class="nav-item dropdown" style="margin-top: 20px">
                    <form method="get" id="eventFormAdmin" action="<%=request.getContextPath()%>/user_home">
                        <select name="action" class="navbar-dropdwon form-select border-0" style="font-size: 0.9rem" id="eventSelectAdmin" onchange="submitFormAdmin()">
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
                    <a href="<%=request.getContextPath()%>/user_home?action=profile"><i class="fa-solid fa-user nav-icon2"></i><%=user.getNombres() + " " + user.getApellidos()%></a>
                </li>
                <li>
                    <a href="<%=request.getContextPath()%>/logout"><i class="fa-solid fa-door-open nav-icon2"></i>Cerrar Sesión</a>
                </li>
            </ul>
        </nav>


    </header>

    <% } %>




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
            <div class="bg-image" style="max-height: 400px; object-fit: cover;">
                <img src="<%=request.getContextPath()%>/user_home?action=imagenPorActividad&idActividad=<%=actividad.getIdActividad()%>" class="w-100" alt="event">
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

    <div class="row align-content-center" id="divRow" data-masonry='{"percentPosition": true }'>


        <% for (Evento evento : listaEventos) { %>

        <div class="col-sm-6 col-lg-3 mb-4">

            <div class="card-list">
                <article class="card">
                    <figure class="card-image">
                        <img class="image-event" src="<%=request.getContextPath()%>/user_home?action=imagenPorEvento&idEvento=<%=evento.getIdEvento()%>" />
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

        <%}%>

    </div>
    <div id="paginationButtons"></div>


    <div style="margin-bottom: 60px"></div>

</div>
<%-- comensadkas --%>


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
    function submitFormUser() {
        var selectElement = document.getElementById("eventSelectUser");
        var selectedValue = selectElement.value;
        if (selectedValue) {
            var newURL = "<%=request.getContextPath()%>/user_home?action=" + selectedValue;
            window.location.href = newURL;
        }
    }
</script>


<script>
    function submitFormAdmin() {
        var selectElement = document.getElementById("eventSelectAdmin");
        var selectedValue = selectElement.value;
        if (selectedValue) {
            var newURL = "<%=request.getContextPath()%>/user_home?action=" + selectedValue;
            window.location.href = newURL;
        }
    }
</script>


<script>
    function submitForm2() {
        var selectElement = document.getElementById("eventSelect2");
        var selectedValue = selectElement.value;
        if (selectedValue == "user") {
            var newURL = "<%=request.getContextPath()%>/user_home";
            window.location.href = newURL;
        } else {
            var newURL = "<%=request.getContextPath()%>/admin_act";
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

<script>
    document.addEventListener('DOMContentLoaded', function () {
        var items = document.querySelectorAll('#divRow .col-sm-6.col-lg-3.mb-4');
        var itemsPerPage = 8;
        var paginationButtons = document.getElementById('paginationButtons');

        function displayItems(page) {
            var start = (page - 1) * itemsPerPage;
            var end = start + itemsPerPage;

            var visibleItems = Array.from(items).slice(start, end);

            var divRow = document.getElementById('divRow');
            divRow.innerHTML = ''; // Limpiar el contenedor

            visibleItems.forEach(function (item) {
                divRow.appendChild(item);
            });
        }

        function setupPagination() {
            var pageCount = Math.ceil(items.length / itemsPerPage);
            for (var i = 1; i <= pageCount; i++) {
                var button = document.createElement('button');
                button.innerText = i;

                button.addEventListener('click', function () {
                    // Remove 'active' class from all buttons
                    var buttons = paginationButtons.getElementsByTagName('button');
                    for (var j = 0; j < buttons.length; j++) {
                        buttons[j].classList.remove('active');
                    }

                    // Add 'active' class to the clicked button
                    this.classList.add('active');

                    var pageNumber = parseInt(this.innerText);
                    displayItems(pageNumber);
                });

                paginationButtons.appendChild(button);
            }
        }


        displayItems(1); // Mostrar la primera página al cargar

        setupPagination(); // Configurar los botones de paginación
    });

</script>



<script src="js/slider.js"></script>
<script src="js/bootstrap/bootstrap.js"></script>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>







</body>



</html>
