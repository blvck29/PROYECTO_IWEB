<%@ page import="com.example.proyectoweb.model.beans.Evento" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% Evento evento = (Evento) request.getAttribute("evento");%>


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
    <div class="logo"><a href="home.jsp"><img class="logo-img" src='images/logo_topbar.png' alt="logo"></a></div>

    <div class="bars">
        <div class="line"></div>
        <div class="line"></div>
        <div class="line"></div>
    </div>

    <nav class="nav-bar">
        <ul>
            <li>
                <a href="<%=request.getContextPath()%>/admin_act?action=home">Eventos</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/admin_act?action=new_event">Crear Evento</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/admin_act?action=list_apoyos">Gestionar Apoyos</a>
            </li>
            <li>
                <a href="#"><i class="fa-solid fa-user nav-icon2"></i>Usuario</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/"><i class="fa-solid fa-door-open nav-icon2"></i>Cerrar Sesión</a>
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
    <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px">Interfaz de Modificación de Evento</strong></h2>
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
                                <input name="titulo" type="text" class="form-control" id="nombre" value="<%=evento.getTitulo()%>">
                            </div>
                        </div>

                        <div style="padding-top: 1.5em;"></div>

                        <div>
                            <div class="form-group" style="padding-right: 1rem">
                                <label  style="text-align: left;"><strong>Subtítulo del evento:</strong></label>
                                <input name="subtitulo" type="text" class="form-control" id="nombre" value="<%=evento.getSubTitulo()%>">
                            </div>
                        </div>

                        <div style="padding-top: 1.5em;"></div>

                        <div class="form-group" style="padding-right: 1rem">
                            <label style="text-align: left;"><strong>Hora del evento:</strong></label>
                            <input name="hora" type="time" class="form-control" id="fecha-evento" value="<%=evento.getHora()%>">
                        </div>

                        <div style="padding-top: 1.5em;"></div>

                        <div class="form-group" style="padding-right: 1rem">
                            <label  style="text-align: left;"><strong>Fecha del evento:</strong></label>
                            <input name="fecha" type="date" class="form-control" id="fecha-evento" value="<%=evento.getFecha()%>">
                        </div>

                        <div style="padding-top: 1.5em;"></div>

                        <label style="text-align: left;"><strong>Lugar:</strong></label>
                        <select class="form-select" id="eleccion" aria-label="Default select example">
                            <option   >Selecciona una opción:</option>
                            <option value="1" <%=nombreLugar.equals("Cancha de Minas")? "selected": ""%> >Cancha de Minas</option>
                            <option value="2"<%=nombreLugar.equals("Polideportivo")? "selected": ""%>>Polidepotivo</option>
                            <option value="3" <%=nombreLugar.equals("Losa de Paleta Frontón")? "selected": ""%>>Losa de Paleta Frontón</option>
                        </select>
                        <div id="imagen-container">
                            <img id="imagen1" src="https://descubre.pucp.edu.pe/imagesv2/dte005/IMG_4565.jpg" alt="Imagen 1">
                            <img id="imagen2" src="http://descubre.pucp.edu.pe/imagesv2/dte001/POLIDEPORTIVO.jpg" alt="Imagen 2">
                            <img id="imagen3" src="http://descubre.pucp.edu.pe/imagesv2/dte004/LOSA%20DE%20FRONTON.jpg" alt="Imagen 3">
                        </div>
                        <p id="texto-mostrado"></p>
                        <input type="hidden" name="lugar" id="lugarTexto" value="">
                        <div id="iframe-container">
                            <iframe id="iframe1" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d321.6392773860829!2d-77.08220459017669!3d-12.072196035587183!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c96c8bf00001%3A0xc39b8453d7952a96!2sCanchas%20de%20Minas!5e1!3m2!1ses!2spe!4v1699334362532!5m2!1ses!2spe" width="550" height="220" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            <iframe id="iframe2" src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1081.8846268772293!2d-77.08026385223693!3d-12.066408817670428!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9105c96ab754beb9%3A0xcfd8f8bd1f987eb9!2sColiseo%20Polideportivo%20-%20PUCP!5e1!3m2!1ses!2spe!4v1699332525901!5m2!1ses!2spe" width="550" height="220" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                            <iframe id="iframe3" src="https://www.ejemplo3.com"></iframe>
                        </div>
                        <a id="texto-mostrado-url"></a>



                        <div style="padding-top: 1.5em;"></div>

                        <div>
                            <div class="form-group">
                                <label style="text-align: left;"><strong>Descripción del evento:</strong></label>
                                <textarea class="form-control" name="descripcion" aria-label="With textarea" placeholder="250 palabras máximo." value="<%=evento.getDescripcion()%>"></textarea>
                            </div>
                            <div style="padding-top: 1em;"></div>
                        </div>


                    </div>
                </div>

                <div class="uk-flex uk-flex-center uk-margin-top">
                    <div class="uk-flex uk-flex-center">
                        <a id="redirect-button" class="btn btn-secondary m-2" href="<%=request.getContextPath()%>/admin_act?action=home">Cancelar</a>
                        <button type="submit" class="btn btn-primary m-2">Guardar</button>
                    </div>
                </div>

            </div>



            <div class="col-lg-6 col-md-12" style="padding-left: 2em; padding-right: 2em; padding-top: 1.5em">

                <img src="images/placeholder_events.jpg" alt="imagen de evento" style="height: auto; width: 100%">

                <div style="margin-bottom: 20px"></div>

                <div class="container" style="padding-left: 6rem; padding-right: 6rem">
                    <div class="uk-upload-box">
                        <div id="error-alert" class="uk-alert-danger uk-margin-top uk-hidden" uk-alert>
                            <p id="error-messages"></p>
                        </div>

                        <form id="upload-form">
                            <div class="drop__zone uk-placeholder uk-text-center">
                                <span uk-icon="icon: cloud-upload"></span>
                                <span class="uk-text-middle uk-margin-small-left">Adjunte arrastrando el archivo o</span>
                                <div uk-form-custom>
                                    <input name="document" accept="image/png, image/jpeg, application/pdf, application/vnd.openxmlformats-officedocument.wordprocessingml.document" type="file">
                                    <span class="uk-link">seleccione la captura</span>
                                </div>
                                <ul id="preview" class="uk-list uk-grid-match uk-child-width-1-2 uk-child-width-1-4@l uk-child-width-1-5@xl uk-text-center" uk-grid uk-scrollspy="cls: uk-animation-scale-up; target: .list-item; delay: 80"></ul>
                            </div>
                        </form>
                    </div>

                    <div class="uk-flex uk-flex-center uk-margin-top">
                        <div class="uk-flex uk-flex-center">
                            <button type="button" id="reset-button" class="btn btn-secondary m-2">Borrar</button>
                            <button type="submit" form="upload-form" class="btn btn-primary m-2">Subir</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
            textoMostrado.textContent = "Losa de Paleta Frontón: Un lugar de entretenimiento.";
            urlDireccion.textContent = "URL: ";
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






<script src="js/upload.js"></script>
<script src="js/bootstrap/bootstrap.js"></script>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>



</body>

</html>
