<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyectoweb.model.beans.Usuario" %>
<%@ page import="com.example.proyectoweb.model.beans.Evento" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%Usuario user = (Usuario) session.getAttribute("usuario");%>

<%
  Evento evento = (Evento) request.getAttribute("evento");
  ArrayList<Integer> listaIds = (ArrayList<Integer>) request.getAttribute("listaIds");
%>

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

    <link rel="icon" type="image/jpg" href="favicon.png" />

    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

    <!--Footer-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-HjQE6zC8aa2BK9xVRvPUdo4FqIkFfQF1dM1iZeFzTC1Q9dI6yCeF6pMJpPs19j7e" crossorigin="anonymous">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link rel="stylesheet" href="css/uploadAlbum.css">


    <title>Administración de Usuarios | Semana de Ingeniería 2023</title>
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
                <a href="<%=request.getContextPath()%>/admin_act?action=new_event">Crear Evento</a>
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
            <h1 class="display-5 fw-bold text-white" style="font-family: 'Poppins', sans-serif">Bienvenido, @Admin_Act</h1>
            <div style="margin-bottom: 20px"></div>
            <h3 class="fw-bold text-white" style="font-family: 'Poppins', sans-serif">Creando Álbum de Fotos del Evento <%=evento.getTitulo()%></h3>
            <div style="margin-bottom: 20px"></div>
            <div class="justify-content-sm-center">
            </div>
        </div>
    </div>
</div>

<div style="padding-top: 20px;"></div>


    <div class="container">


        <div class="uk-container uk-margin-top uk-margin-bottom">

            <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px">Álbum de Fotos </strong></h2>
            <div style="margin-bottom: 20px"></div>

            <!-- Button trigger modal -->
            <button type="button" style="margin-left: 40px" class="btn btn-outline-primary btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal">
                Ver Álbum
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog  modal-xl">
                    <div class="modal-content">



                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Fotos Actuales Subidas</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>



                            <div class="modal-body">


                                <%if (!listaIds.isEmpty()) { %>

                                <div style="padding-top: 10px;"></div>
                                <div class="row">
                                <% int contador = 0; %>
                                <% for (Integer id : listaIds) { %>


                                    <div class="col-sm-4 mb-4">

                                        <div style="border: 1px solid rgba(0, 0, 0, 0.125); padding: 8px; transition: box-shadow 0.3s; width: 100%;  border-radius: 4px;">
                                            <img src="<%=request.getContextPath()%>/admin_act?action=imagenDeAlbum&idImagen=<%=id%>"
                                                 alt="imagen de evento"
                                                 style="height: auto; width: 100%"
                                                 onmouseover="this.parentNode.style.boxShadow='0 0 10px rgba(0, 123, 255, 0.5)'"
                                                 onmouseout="this.parentNode.style.boxShadow='none'">
                                        </div>

                                    </div>

                                        <% contador++; %>
                                        <% if (contador % 3 == 0) { %>
                                        </div><div class="row">
                                        <% } %>

                                <%}%>
                                </div>


                                <%}else { %>
                                <br>
                                <br>
                                <br>
                                <h2 style="text-align: center;">Aún no se han subidos imágenes al álbum de este evento</h2>
                                <br>
                                <br>
                                <%} %>

                            </div>



                            <div class="modal-footer">
                                <div class="uk-flex uk-flex-center uk-margin-top">
                                    <div class="uk-flex uk-flex-center">
                                        <button type="button" id="reset-button" class="btn btn-secondary m-2" data-bs-dismiss="modal">Cerrar</button>
                                    </div>
                                </div>
                            </div>



                    </div>
                </div>
            </div>


        </div>





        <div class="uk-container uk-margin-top uk-margin-bottom">

            <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px">Suba las Fotos del Álbum</strong></h2>
            <div style="margin-bottom: 20px"></div>

            <!-- Button trigger modal -->
            <button type="button" style="margin-left: 40px" class="btn btn-outline-primary btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal2">
                Subir Nuevas Fotos
            </button>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog  modal-lg">
                    <div class="modal-content">


                        <form method="post" action="<%=request.getContextPath()%>/admin_act?action=subirFotosAlbum" enctype="multipart/form-data">


                            <div class="modal-header">
                                <h1 class="modal-title fs-5" id="exampleModalLabel">Subir Fotos</h1>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>



                            <div class="modal-body">

                                <input class="form-control" type="hidden"  name="idEvento"   value="<%=evento.getIdEvento()%>">

                                <div class="modu-dest-intern formato">
                                    <div class="upload__box">
                                        <div class="upload__btn-box">
                                            <label class="upload__btn">
                                                <pp>SELECCIONAR IMÁGENES</pp>
                                                <input type="file" name="fotos" multiple="" data-max_length="20" class="upload__inputfile" required>
                                            </label>
                                            <div style="padding-top: 1em;"></div>
                                        </div>
                                        <div class="upload__img-wrap"></div>
                                    </div>
                                </div>

                            </div>



                            <div class="modal-footer">
                                <div class="uk-flex uk-flex-center uk-margin-top">
                                    <div class="uk-flex uk-flex-center">
                                        <button type="button" id="reset-button" class="btn btn-secondary m-2" data-bs-dismiss="modal">Cancelar</button>
                                        <button type="submit" id="upload-button" class="btn btn-primary m-2">Subir Fotos</button>
                                    </div>
                                </div>
                            </div>


                        </form>

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





<script src="js/script_album.js"></script>
<script src="js/bootstrap/bootstrap.js"></script>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


</body>

</html>
