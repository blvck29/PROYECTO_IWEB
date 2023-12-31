<%@ page import="com.example.proyectoweb.model.beans.Evento" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.example.proyectoweb.model.beans.Actividad" %>
<%@ page import="com.example.proyectoweb.model.beans.Usuario" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%Usuario user = (Usuario) session.getAttribute("usuario");%>

    <% ArrayList<Evento> listaEventos = (ArrayList<Evento>) request.getAttribute("listaEventos"); %>
    <% Actividad actividad = (Actividad) request.getAttribute("actividad"); %>
    <% String dato = (String) request.getAttribute("dato"); %>

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

    <link rel="icon" type="image/jpg" href="favicon.png" />

    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

    <!--Footer-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-HjQE6zC8aa2BK9xVRvPUdo4FqIkFfQF1dM1iZeFzTC1Q9dI6yCeF6pMJpPs19j7e" crossorigin="anonymous">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">

    <!-- Estilo de los botones Pagination -->

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
                <a href="<%=request.getContextPath()%>/admin_act?action=home" class="active">Eventos</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/admin_act?action=new_event&idActividad=<%=actividad.getIdActividad()%>">Crear Evento</a>
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



<div class="container-fluid" style="padding-left:0 !important; padding-right: 0 !important; background: rgb(45,0,83) !important;
background: radial-gradient(circle, rgba(45,0,83,1) 0%, rgba(35,3,80,1) 59%, rgba(21,0,48,1) 100%) !important;">
    <div class="text-secondary px-4 py-5 text-center">
        <div class="py-5">
            <h1 class="display-5 fw-bold text-white">Bienvenido, <%=actividad.getDelegado().getNombres()%></h1>
            <div style="margin-bottom: 20px"></div>
            <h3 class="fw-bold text-white">Crea un nuevo evento de <%= actividad.getTitulo() %> !</h3>
            <div style="margin-bottom: 20px"></div>
        </div>
    </div>
</div>








<div class="container">

    <div style="margin-bottom: 50px"></div>

    <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px">Eventos de la Actividad: <%=actividad.getTitulo()%></strong></h2>

    <div style="margin-bottom: 40px"></div>

    <% if(listaEventos.size() != 0){ %>

    <!--<div class="input-group mb-3">

            <div class="input-group-text p-0">
                <label>
                    <div class="btn-group">
                        <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
                            Filtrar por fecha
                        </button>
                        <ul class="dropdown-menu dropdown-menu-lg-end">
                            <form method="post" action="<%=request.getContextPath()%>/admin_act?action=filtros&ac=eventosXfecha&idAct=<%=actividad.getIdActividad()%>&filtro=all">
                                <li><button class="dropdown-item" type="submit">TODOS</button></li>
                            </form>
                            <form method="post" action="<%=request.getContextPath()%>/admin_act?action=filtros&ac=eventosXfecha&idAct=<%=actividad.getIdActividad()%>&filtro=prox">
                                <li><button class="dropdown-item" type="submit">PRÓXIMOS</button></li>
                            </form>
                            <form method="post" action="<%=request.getContextPath()%>/admin_act?action=filtros&ac=eventosXfecha&idAct=<%=actividad.getIdActividad()%>&filtro=fin">
                                <li><button class="dropdown-item" type="submit">FINALIZADOS</button></li>
                            </form>
                        </ul>
                    </div>
                </label>
            </div>
             <form method="post" action="<%= request.getContextPath() %>/admin_act?action=filtros&ac=busquedaXEvento&idAct=<%=actividad.getIdActividad()%>">
                <input type="text" name="txtBuscar" class="form-control" placeholder="Buscar Evento">
                <button class="input-group-text shadow-none px-4 btn-large">
                    <i class="fa-solid fa-magnifying-glass" style="color: #262626;"></i>
                </button>
            </form>
        </div>-->
    <div style="display: flex; align-items: center;">
        <!-- Filtro desplegable -->
        <div style="float: left;">
            <label>
                <div class="btn-group">
                    <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
                        Filtrar por fecha
                    </button>
                    <ul class="dropdown-menu dropdown-menu-lg-end">
                        <form method="post" action="<%=request.getContextPath()%>/admin_act?action=filtros&ac=eventosXfecha&idAct=<%=actividad.getIdActividad()%>&filtro=all">
                            <li><button class="dropdown-item" type="submit">TODOS</button></li>
                        </form>
                        <form method="post" action="<%=request.getContextPath()%>/admin_act?action=filtros&ac=eventosXfecha&idAct=<%=actividad.getIdActividad()%>&filtro=prox">
                            <li><button class="dropdown-item" type="submit">PRÓXIMOS</button></li>
                        </form>
                        <form method="post" action="<%=request.getContextPath()%>/admin_act?action=filtros&ac=eventosXfecha&idAct=<%=actividad.getIdActividad()%>&filtro=fin">
                            <li><button class="dropdown-item" type="submit">FINALIZADOS</button></li>
                        </form>
                    </ul>
                </div>
            </label>
        </div>

        <!-- Input y botón -->
        <form method="post" action="<%= request.getContextPath() %>/admin_act?action=filtros&ac=busquedaXEvento&idAct=<%=actividad.getIdActividad()%>" style="display: flex; margin-left: 10px;">
            <input type="text" name="txtBuscar" class="form-control" placeholder="Buscar Evento" style="flex: 1; width: calc(100% + 800px);">
            <button class="input-group-text shadow-none px-4 btn-large">
                <i class="fa-solid fa-magnifying-glass" style="color: #262626;"></i>
            </button>
        </form>
    </div>

    <br><br>




        <div class="row align-content-center" id="divRow" data-masonry='{"percentPosition": true }'>





            <%
                for (Evento evento : listaEventos) {
                    SimpleDateFormat formato = new SimpleDateFormat("dd/MM/yyyy");
                    String fechaFormateada = formato.format(evento.getFecha());
            %>

            <div class="col-sm-6 col-lg-3 mb-4">

                <div class="card-list">
                    <article class="card">
                        <figure class="card-image">
                            <img class="image-event" src="<%=request.getContextPath()%>/admin_act?action=imagenPorEvento&idEvento=<%=evento.getIdEvento()%>" />
                        </figure>
                        <div class="card-header">
                            <a href="<%=request.getContextPath()%>/admin_act?action=verEvento&idEvento=<%=evento.getIdEvento()%>&idActividad=<%=evento.getIdActividad()%>"><%=evento.getTitulo()%><p><%=evento.getSubTitulo()%></p><p>Fecha: <%=fechaFormateada%></p></a>

                        </div>
                        <div class="card-footer">

                            <div class="row">
                                <div class="col-md-4">
                                    <div class="card-meta card-meta--views">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="#0d6efd" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <circle cx="12" cy="8" r="4"></circle>
                                            <path d="M18 21v-2a4 4 0 0 0-4-4H10a4 4 0 0 0-4 4v2"></path>
                                        </svg>
                                        <a href="<%=request.getContextPath()%>/admin_act?action=verInscritos&idEvento=<%=evento.getIdEvento()%>&idActividad=<%=evento.getIdActividad()%>">Apoyos</a>
                                    </div>

                                </div>
                                <div class="col-md-4">
                                    <div class="card-meta card-meta--date">

                                        <% if (evento.getIdEstado().equals("PUBLIC")){ %>

                                        <svg xmlns="http://www.w3.org/2000/svg" height="1em" viewBox="0 0 512 512" style="fill: #0d6efd">
                                            <path d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"/>
                                        </svg>
                                        <a href="<%=request.getContextPath()%>/admin_act?action=edit_event&idEvento=<%=evento.getIdEvento()%>&idActividad=<%=evento.getIdActividad()%>">Editar</a>

                                        <% } else{ %>

                                        <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="30" height="30" viewBox="0,0,256,256"
                                             style="fill:#0d6efd;">
                                            <g fill="#0d6efd" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><g transform="scale(8.53333,8.53333)"><path d="M4,5c-1.105,0 -2,0.895 -2,2v16c0,1.105 0.895,2 2,2h22c1.105,0 2,-0.895 2,-2v-16c0,-1.105 -0.895,-2 -2,-2zM23,8c1.105,0 2,0.895 2,2c0,1.105 -0.895,2 -2,2c-1.105,0 -2,-0.895 -2,-2c0,-1.105 0.895,-2 2,-2zM9,12.00195c0.61925,0 1.23844,0.23648 1.71094,0.70899l3.26172,3.26172l1.02734,1.02734l1.15625,1.15625c0.422,0.422 1.10339,0.41809 1.52539,-0.00391c0.423,-0.422 0.423,-1.10825 0,-1.53125l-1.15234,-1.15039l0.75977,-0.75976c0.945,-0.945 2.47687,-0.945 3.42188,0l4.28906,4.28906v3h-20v-7l2.28906,-2.28906c0.4725,-0.4725 1.09169,-0.70899 1.71094,-0.70899z"></path></g></g>
                                        </svg>
                                        <a href="<%=request.getContextPath()%>/admin_act?action=album&idEvento=<%=evento.getIdEvento()%>">Álbum</a>

                                        <% }  %>

                                    </div>

                                </div>
                                <div class="col-md-3">
                                    <div class="card-meta card-meta--date">
                                        <svg xmlns="http://www.w3.org/2000/svg"  viewBox="0 6 50 50" style="fill: #0d6efd">
                                            <path d="M 28 11 C 26.895 11 26 11.895 26 13 L 26 14 L 13 14 C 11.896 14 11 14.896 11 16 C 11 17.104 11.896 18 13 18 L 14.160156 18 L 16.701172 48.498047 C 16.957172 51.583047 19.585641 54 22.681641 54 L 41.318359 54 C 44.414359 54 47.041828 51.583047 47.298828 48.498047 L 49.839844 18 L 51 18 C 52.104 18 53 17.104 53 16 C 53 14.896 52.104 14 51 14 L 38 14 L 38 13 C 38 11.895 37.105 11 36 11 L 28 11 z M 18.173828 18 L 45.828125 18 L 43.3125 48.166016 C 43.2265 49.194016 42.352313 50 41.320312 50 L 22.681641 50 C 21.648641 50 20.7725 49.194016 20.6875 48.166016 L 18.173828 18 z"></path>
                                        </svg>
                                        <a style="cursor: pointer;color: #0d6efd" onclick="return confirmacionEliminar('<%=request.getContextPath()%>/admin_act?action=borrarEvento&idEventoEliminar=<%=evento.getIdEvento()%>')">Borrar</a>
                                    </div>

                                </div>


                            </div>
                        </div>
                    </article>
                </div>

            </div>
         <%}


        }else{ %>

        <%}%>


    </div>

    <div id="paginationButtons"></div>
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
    function confirmacionEliminar(href) {
        event.preventDefault(); // Previene ir al href(el cual va al servlet) hasta que se de en borrar

        Swal.fire({
            title: '¿Estás seguro de eliminar este evento?',
            text: 'No se podrán revertir estos cambios',
            icon: 'warning',
            iconColor: '#DC3545',
            showCancelButton: true,
            cancelButtonColor: '#0D6EFD',
            cancelButtonText: 'Cancelar',
            confirmButtonColor: '#DC3545',
            confirmButtonText: 'Borrar'
        }).then((result) => {
            if (result.isConfirmed) {
                window.location.href = href; // Utiliza el enlace pasado como parámetro
            }
        });
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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var items = document.querySelectorAll('#divRow .col-sm-6.col-lg-3.mb-4');
            var itemsPerPage = 6;
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


</body>

</html>

