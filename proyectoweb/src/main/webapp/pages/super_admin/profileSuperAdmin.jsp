<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyectoweb.model.beans.Usuario" %>
<%@ page import="com.example.proyectoweb.model.beans.Evento" %>


<%Usuario user = (Usuario) session.getAttribute("usuario");%>

<%  if (user.getIdRolSistema().equals("DELGEN")){ %>
    <% ArrayList<Evento> listaEventos = (ArrayList<Evento>) request.getAttribute("listaEventos"); %>

<!doctype html>
<html lang="es">

<head>
    <!-- Bootstrap core CSS -->
    <link href="css/style-graficos.css" rel="stylesheet">
    <link href="css/_progress.scss" rel="stylesheet">

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

    <link rel="icon" type="image/jpg" href="favicon.png" />

    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

    <title>Estadísticas | Semana de Ingeniería 2023</title>


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
                <a href="<%=request.getContextPath()%>/admin_gen?action=home">Usuarios</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/admin_gen?action=activities&ac=list">Actividades</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/admin_gen?action=statistics" class="active">Estadísticas</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/admin_gen?action=donations">Donaciones</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/admin_gen?action=profile"><i class="fa-solid fa-user nav-icon2"></i><%=user.getNombres() + " " + user.getApellidos()%></a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/logout"><i class="fa-solid fa-door-open nav-icon2"></i>Cerrar Sesión</a>
            </li>
        </ul>
    </nav>
</header>

<div class="container">

    <div style="margin-bottom: 50px"></div>
    <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px">Perfil</strong></h2>
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
                                <label  style="text-align: left;"><strong>Nombre del usuario:</strong></label>
                                <span>
                    <input name="titulo" type="text" class="form-control"  value="<%=user.getNombres()%>" readonly>
                  </span>
                            </div>
                        </div>

                        <div style="padding-top: 1.5em;"></div>

                        <div>
                            <div class="form-group" style="padding-right: 1rem">
                                <label  style="text-align: left;"><strong>Apellidos</strong></label>
                                <span>
                    <input name="subtitulo" type="text" class="form-control" id="nombre" value="<%=user.getApellidos()%>" readonly>
                  </span>
                            </div>
                        </div>

                        <div style="padding-top: 1.5em;"></div>

                        <div>
                            <div class="form-group" style="padding-right: 1rem">
                                <label  style="text-align: left;"><strong>Codigo PUCP</strong></label>
                                <span>
                    <input name="titulo" type="text" class="form-control"  value="<%=user.getCodigo()%>" readonly>
                  </span>
                            </div>
                        </div>

                        <div style="padding-top: 1.5em;"></div>

                        <div>
                            <div class="form-group" style="padding-right: 1rem">
                                <label  style="text-align: left;"><strong> Rol en el sistema</strong></label>
                                <span>
                    <input name="titulo" type="text" class="form-control"  value="<%=user.getIdRolSistema()%>" readonly>
                  </span>
                            </div>
                        </div>

                        <div style="padding-top: 1.5em;"></div>

                        <div>
                            <div class="form-group" style="padding-right: 1rem">
                                <label  style="text-align: left;"><strong> Rol academico</strong></label>
                                <span>
                  <input name="titulo" type="text" class="form-control"  value="<%=user.getIdRolAcademico()%>" readonly>
                  </span>
                            </div>
                        </div>

                        <div style="padding-top: 1.5em;"></div>
                        <div>
                            <div class="form-group" style="padding-right: 1rem">
                                <label  style="text-align: left;"><strong> Cantidad de eventos inscritos</strong></label>
                                <span>
                    <input name="titulo" type="text" class="form-control"  value="<%=user.getCantEventsInscrito()%>" readonly>
                  </span>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <div class="col-lg-6 col-md-12">
                <div class="card">
                    <div class="card-body" style="padding-left: 3px">
                        <!-- Imagen de perfil -->
                        <div style="text-align: center; margin-bottom: 0px;">
                            <figure class="card-image" style="max-width: 200px; margin: 0 auto;">
                                <% if (user.getSexo().equals("M")) { %>
                                <img class="image-event" src="images/profile1.png" alt="event" style="max-width: 100%; height: auto;">
                                <% } else if (user.getSexo().equals("F")) { %>
                                <img class="image-event" src="images/profile2.png" alt="event" style="max-width: 100%; height: auto;">
                                <% } else { %>
                                <!-- Aquí podrías manejar otro caso, por ejemplo, si no es M ni F -->
                                <p>Imagen no disponible</p>
                                <% } %>
                            </figure>
                        </div>


                        <br>

                        <!-- Resto del contenido -->
                        <label style="text-align: center; padding-left: 20px;"><strong>Eventos en los que estás inscrito:  </strong></label>

                        <% if (listaEventos != null && !listaEventos.isEmpty()) { %>
                        <% for (Evento evento : listaEventos) { %>
                        <h4 style="padding-left: 20px;">El evento es <%= evento.getTitulo() %></h4>
                        <% } %>
                        <% } else { %>
                        <p style="padding-left: 20px;">No hay eventos inscritos actualmente.</p>
                        <% } %>


                    </div>
                </div>
            </div>








        </div>
    </div>

</div>







<div class="container-fluid" style="background-color: #fff; padding-right: 0; padding-left: 0">
    <div class="my-4"></div>
    <footer id="sticky-footer" class="flex-shrink-0 py-4 text-white-50" style="background-color: #04011E">
        <div class="container">
            <div class="nav justify-content-center border-bottom pb-3 mb-3">
                <p style="text-align: center">
                    <small class="text-center">© Pontificia Universidad Católica del Perú - Todos los derechos reservados</small>
                </p>
            </div>
        </div>
    </footer>
</div>



<script src="js/bootstrap/bootstrap.js"></script>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async=""></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


</body>

</html>

<% } else {request.getRequestDispatcher("/logout").forward(request, response);}%>
