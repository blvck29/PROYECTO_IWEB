<%@ page import="com.example.proyectoweb.model.beans.Evento" %>
<%@ page import="com.example.proyectoweb.model.beans.Usuario" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% Evento evento = (Evento) request.getAttribute("evento");%>
<% String idActividad = (String) request.getAttribute("idActividad"); %>


<%Usuario user = (Usuario) session.getAttribute("usuario");%>

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

    <!--Footer-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-HjQE6zC8aa2BK9xVRvPUdo4FqIkFfQF1dM1iZeFzTC1Q9dI6yCeF6pMJpPs19j7e" crossorigin="anonymous">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">

    <style>
        #imagen-container img {
            display: none;
        }
    </style>

    <style>
        #iframe-container iframe {
            display: none;
        }
    </style>

    <style>
        #texto-mostrado-url {
            color: blue; /* Establece el color del texto en azul */
        }
    </style>

    <title>Home | Semana de Ingeniería 2023</title>
</head>

<body>
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
                <form method="get" id="eventForm" action="<%=request.getContextPath()%>/admin_act">
                    <select name="action" class="navbar-dropdwon form-select border-0" style="font-size: 0.9rem" id="eventSelect" onchange="submitForm()">
                        <option style="font-size: 0.9rem; display:none;">Cambiar Rol</option>
                        <option style="font-size: 0.9rem; color:black" value="user">Usuario</option>
                        <option style="font-size: 0.9rem; color:black" value="admin">Admin</option>
                    </select>
                </form>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/admin_act?action=home">Eventos</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/admin_act?action=new_event&idActividad=<%=idActividad%>">Crear Evento</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/admin_act?action=profile"><i class="fa-solid fa-user nav-icon2"></i><%=user.getNombres() + " " + user.getApellidos()%></a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/logout"><i class="fa-solid fa-door-open nav-icon2"></i>Cerrar Sesión</a>
            </li>
        </ul>
    </nav>


</header>

<%
    String[] direccionLugar = evento.getLugar().split(":");
    String nombreLugar = direccionLugar[0];
%>

<div class="container-fluid" style="padding-left:0 !important; padding-right: 0 !important; background: rgb(45,0,83) !important;
background: radial-gradient(circle, rgba(45,0,83,1) 0%, rgba(35,3,80,1) 59%, rgba(21,0,48,1) 100%) !important;">
    <div class="text-secondary px-4 py-5 text-center">
        <div class="py-5">
            <h1 class="display-5 fw-bold text-white" style="font-family: 'Poppins', sans-serif">Eventos de <%=evento.getIdActividad()%></h1>
            <div class="justify-content-sm-center">
            </div>
        </div>
    </div>
</div>



<div class="container">

    <div style="margin-bottom: 50px"></div>
    <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px">Interfaz de Visualización de Detalles del Evento</strong></h2>
    <div style="margin-bottom: 20px"></div>

    <hr style="border-top: 1px solid #262626;">

    <div style="margin-bottom: 40px"></div>

    <div class="container">

        <div class="row">
            <div class="col-lg-6 col-md-12" style="text-align: left; padding-top: 1.5em">
                    <div class="card">
                        <div class="card-body" style="padding-left: 35px">

                            <div style="padding-top: 1.5em;"></div>

                            <div>
                                <div class="form-group" style="padding-right: 1rem">
                                    <label  style="text-align: left;"><strong>Título del evento:</strong></label>
                                    <input name="titulo" type="text" class="form-control" id="nombre" value="<%=evento.getTitulo()%>" disabled readonly>
                                </div>
                            </div>

                            <div style="padding-top: 1.5em;"></div>

                            <div>
                                <div class="form-group" style="padding-right: 1rem">
                                    <label  style="text-align: left;"><strong>Subtítulo del evento:</strong></label>
                                    <input name="subtitulo" type="text" class="form-control" id="nombre" value="<%=evento.getSubTitulo()%>" disabled readonly>
                                </div>
                            </div>

                            <div style="padding-top: 1.5em;"></div>

                            <div class="form-group" style="padding-right: 1rem">
                                <label style="text-align: left;"><strong>Hora del evento:</strong></label>
                                <input name="hora" type="time" class="form-control" id="fecha-evento" value="<%=evento.getHora()%>" disabled readonly>
                            </div>

                            <div style="padding-top: 1.5em;"></div>

                            <div class="form-group" style="padding-right: 1rem">
                                <label  style="text-align: left;"><strong>Fecha del evento:</strong></label>
                                <input name="fecha" type="date" class="form-control" id="fecha-evento" value="<%=evento.getFecha()%>" disabled readonly>
                            </div>

                            <div style="padding-top: 1.5em;"></div>

                            <label style="text-align: left;"><strong>Lugar:</strong></label>
                            <select class="form-select" id="eleccion" aria-label="Default select example" disabled>
                                <option>Selecciona una opción:</option>
                                <option value="1" <%=nombreLugar.equals("Cancha de Minas")? "selected": ""%> >Cancha de Minas</option>
                                <option value="2"<%=nombreLugar.equals("Polideportivo")? "selected": ""%>>Polidepotivo</option>
                                <option value="3" <%=nombreLugar.equals("Losa de Paleta Frontón")? "selected": ""%>>Losa de Paleta Frontón</option>
                                <option value="4" <%=nombreLugar.equals("Cancha Césped Fútbol 11")? "selected": ""%>>Cancha Césped Fútbol 11</option>

                            </select>
                            <div id="imagen-container">
                                <img id="imagen1" src="https://descubre.pucp.edu.pe/imagesv2/dte005/IMG_4565.jpg" alt="Imagen 1">
                                <img id="imagen2" src="http://descubre.pucp.edu.pe/imagesv2/dte001/POLIDEPORTIVO.jpg" alt="Imagen 2">
                                <img id="imagen3" src="http://descubre.pucp.edu.pe/imagesv2/dte004/LOSA%20DE%20FRONTON.jpg" alt="Imagen 3">
                                <img id="imagen4" src="https://github.com/Pierohc/images/blob/main/WhatsApp%20Image%202023-11-13%20at%206.08.43%20PM.jpeg?raw=true" alt="Imagen 4">
                            </div>
                            <p id="texto-mostrado"></p>
                            <input type="hidden" name="lugar" id="lugarTexto" value="">
                            <div id="iframe-container">
                                <iframe id="iframe1" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d321.6392773860829!2d-77.08220459017669!3d-12.072196035587183!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c96c8bf00001%3A0xc39b8453d7952a96!2sCanchas%20de%20Minas!5e1!3m2!1ses!2spe!4v1699334362532!5m2!1ses!2spe" width="550" height="220" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                <iframe id="iframe2" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1081.8846268772293!2d-77.08026385223693!3d-12.066408817670428!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c96ab754beb9%3A0xcfd8f8bd1f987eb9!2sColiseo%20Polideportivo%20-%20PUCP!5e1!3m2!1ses!2spe!4v1699332525901!5m2!1ses!2spe" width="550" height="220" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                <iframe id="iframe3" src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d454.8776701053476!2d-77.08033520327926!3d-12.065691185950032!3m2!1i1024!2i768!4f13.1!5e1!3m2!1ses-419!2spe!4v1699419977900!5m2!1ses-419!2spe" width="550" height="220" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                <iframe id="iframe4" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3901.664912954281!2d-77.07984850386802!3d-12.066560948409279!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c93ffeffffff%3A0x8fe0179c02c7a0ef!2sCancha%20De%20Futbol%20De%20La%20PUCP!5e0!3m2!1ses-419!2spe!4v1699994334042!5m2!1ses-419!2spe" width="550" height="220" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            </div>
                            <a id="texto-mostrado-url"></a>



                            <div style="padding-top: 1.5em;"></div>

                            <div>
                                <div class="form-group">
                                    <label style="text-align: left;"><strong>Descripción del evento:</strong></label>
                                    <input name="titulo" type="text" class="form-control" id="nombre" value="<%=evento.getDescripcion()%>" disabled readonly>
                                </div>
                                <div style="padding-top: 1em;"></div>
                            </div>


                        </div>
                    </div>

                    <div class="uk-flex uk-flex-center uk-margin-top">
                        <div class="uk-flex uk-flex-center">
                            <a id="redirect-button" class="btn btn-primary m-2" href="<%=request.getContextPath()%>/admin_act?action=home">Regresar</a>
                        </div>
                    </div>
            </div>



            <div class="col-lg-6 col-md-12" style="padding-left: 2em; padding-right: 2em; padding-top: 1.5em">
                <div style="border: 1px solid #ccc; padding: 1em; transition: box-shadow 0.3s;">
                    <img src="<%=request.getContextPath()%>/user_home?action=imagenPorEvento&idEvento=<%=evento.getIdEvento()%>"
                         alt="imagen de evento"
                         style="height: auto; width: 100%"
                         onmouseover="this.parentNode.style.boxShadow='0 0 10px rgba(0, 123, 255, 0.5)'"
                         onmouseout="this.parentNode.style.boxShadow='none'">
                </div>
            </div>



        </div>
    </div>

</div>

<div style="margin-bottom: 50px"></div>


<div class="container-fluid" style="padding-right: 0; padding-left: 0">
    <footer id="sticky-footer" class="footer-distributed" style="background-color: #04011E">
        <div class="footer-left">
            <img src="images/logo_topbar.png" alt="Logo de Ingeniería de las Telecomunicaciones" style="width: 400px; height: auto;">
            <p class="footer-links">
                <a href="<%=request.getContextPath()%>/admin_act?action=home">Eventos</a> |
                <a href="<%=request.getContextPath()%>/admin_act?action=profile">Perfil</a>
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
    const selectElement = document.getElementById("eleccion");
    const imagenContainer = document.getElementById("imagen-container");
    const textoMostrado = document.getElementById("texto-mostrado");
    const urlDireccion = document.getElementById("texto-mostrado-url");
    const iframeContainer = document.getElementById("iframe-container");
    const lugarTextoInput = document.getElementById("lugarTexto");

    // Función para actualizar la información basada en la selección actual
    function actualizarInfoSeleccionada(selectedValue) {
        // Oculta todas las imágenes
        imagenContainer.querySelectorAll("img").forEach(img => {
            img.style.display = "none";
        });

        iframeContainer.querySelectorAll("iframe").forEach(iframe => {
            iframe.style.display = "none";
        });

        if (selectedValue === "1") {
            document.getElementById("imagen1").style.display = "block";
            document.getElementById("iframe1").style.display = "block";
            textoMostrado.textContent = "Cancha de Minas: WWH9+458, San Miguel 15088.";
            urlDireccion.textContent = "URL: https://maps.app.goo.gl/JKT12SnpqXDjEjuY9";
            lugarTextoInput.value = textoMostrado.textContent;
        } else if (selectedValue === "2") {
            document.getElementById("imagen2").style.display = "block";
            document.getElementById("iframe2").style.display = "block";
            textoMostrado.textContent = "Polideportivo: Campus PUCP, Coliseo Polideportivo, Campus PUCP, Av. Universitaria 1801, San Miguel 15088.";
            urlDireccion.textContent = "URL: https://maps.app.goo.gl/yB5AjtFs7J5vx8Un7";
            lugarTextoInput.value = textoMostrado.textContent;
        } else if (selectedValue === "3") {
            document.getElementById("imagen3").style.display = "block";
            document.getElementById("iframe3").style.display = "block";
            textoMostrado.textContent = "Losa de Paleta Frontón: Campus PUCP, San Miguel 15088.";
            urlDireccion.textContent = "URL: https://maps.app.goo.gl/S18WQkJgkMCpZTPy7";
            lugarTextoInput.value = textoMostrado.textContent;
        }else if (selectedValue === "4") {
            document.getElementById("imagen4").style.display = "block";
            document.getElementById("iframe4").style.display = "block";
            textoMostrado.textContent = "Cancha Césped Fútbol 11: WWMC+W74, San Miguel 15088.";
            urlDireccion.textContent = "URL: https://maps.app.goo.gl/ydhF8JCpVnCGYku66"
            lugarTextoInput.value = textoMostrado.textContent;
        } else {
            textoMostrado.textContent = ""; // Limpia el texto si no se selecciona una opción válida
            urlDireccion.textContent = "";
            lugarTextoInput.value = "";
        }
    }

    // Escucha el evento de cambio en el select
    selectElement.addEventListener("change", function () {
        const selectedValue = selectElement.value;
        actualizarInfoSeleccionada(selectedValue);
    });

    // Al cargar la página, obtén la opción seleccionada y muestra la información correspondiente
    window.addEventListener("load", function () {
        const selectedValue = selectElement.value;
        actualizarInfoSeleccionada(selectedValue);
    });

</script>


<script>
    function submitForm() {
        var selectElement = document.getElementById("eventSelect");
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



<script src="js/upload.js"></script>
<script src="js/bootstrap/bootstrap.js"></script>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>



</body>

</html>
