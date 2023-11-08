<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    int id = (int) session.getAttribute("id");
    String username = (String) session.getAttribute("user");
    char f = username.charAt(0);
    String name = username.replace(username.charAt(0), Character.toUpperCase(f));

%>

<!doctype html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content=text/html; charset=ISO-8859-1″>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- UIkit CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.17.6/dist/css/uikit.min.css" />

    <link rel="stylesheet" href="resources/css/dashboard.css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">


    <script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

    <link rel="icon" type="image/png" href="favicon.png" />


    <title>Comred ERP | Dashboard</title>
</head>

<body>

<% if (id == 0) { %>

<header>

    <nav class="uk-container-expand uk-navbar-container uk-background-secondary uk-light" style="background-color: #222;">
        <div style="padding: 0 5% 0 5%">
            <div class="uk-container-expand uk-background-secondary">
                <div uk-navbar>
                    <div class="uk-navbar-left">
                        <ul class="uk-navbar-nav">
                            <li class="uk-active"><a style="font-size: 1.3rem" href="home"><strong>Dashboard</strong></a></li>
                            <li>
                                <a href="#">Cotizaciones <span uk-navbar-parent-icon></span></a>
                                <div class="uk-navbar-dropdown">
                                    <ul class="uk-nav uk-navbar-dropdown-nav">
                                        <li class="uk-nav-header">Opciones</li>
                                        <li><a href="#">Listar</a></li>
                                        <li><a href="#">Nuevo</a></li>
                                        <li class="uk-nav-divider"></li>
                                        <li><a href="#">Estadísticas</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <a href="#">Customers <span uk-navbar-parent-icon></span></a>
                                <div class="uk-navbar-dropdown">
                                    <ul class="uk-nav uk-navbar-dropdown-nav">
                                        <li class="uk-nav-header">Opciones</li>
                                        <li><a href="#">Clientes</a></li>
                                        <li><a href="#">Vendedores</a></li>
                                        <li class="uk-nav-divider"></li>
                                        <li><a href="#">Nuevo</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <a href="#">Productos <span uk-navbar-parent-icon></span></a>
                                <div class="uk-navbar-dropdown">
                                    <ul class="uk-nav uk-navbar-dropdown-nav">
                                        <li class="uk-nav-header">Opciones</li>
                                        <li><a href="#">Listar</a></li>
                                        <li><a href="#">Nuevo</a></li>
                                        <li class="uk-nav-divider"></li>
                                        <li><a href="#">Inventario</a></li>
                                    </ul>
                                </div>
                            </li>
                            <li>
                                <a href="#">Operaciones <span uk-navbar-parent-icon></span></a>
                                <div class="uk-navbar-dropdown">
                                    <ul class="uk-nav uk-navbar-dropdown-nav">
                                        <li class="uk-nav-header">Opciones</li>
                                        <li><a href="#">Compras</a></li>
                                        <li><a href="#">Ventas</a></li>
                                        <li><a href="#">Facturas</a></li>
                                        <li><a href="#">Recibos</a></li>
                                        <li class="uk-nav-divider"></li>
                                        <li><a href="#">Estadísticas</a></li>
                                    </ul>
                                </div>
                            </li>
                        </ul>

                    </div>
                    <div class="uk-navbar-right">

                        <ul class="uk-navbar-nav">
                            <li>
                                <a href="logout">LogOut</a>
                            </li>
                        </ul>
                    </div>

                </div>
            </div>
        </div>
    </nav>
</header>

<div style="margin-top: 60px"></div>

<div style="padding: 0 5% 0 5%">
    <div class="uk-container-expand">
        <div class="uk-grid-small uk-child-width-expand@s uk-text-center " uk-grid="masonry: pack">

            <div class="uk-width-2-5@s">
                <div class="card" style="min-height: 170px; margin-bottom: 15px">
                    <p class="card-subtitle">Informacion del usuario</p>
                    <p class="card-title">Hola de nuevo, <%=name%></p>
                    <p class="card-subtitle">Es bueno verte de nuevo...</p>

                    <a href="">→ Panel de Cotizaciones</a>
                </div>


                <div class="card-2" style="min-height: 250px; margin-bottom: 15px; min-width: fit-content">
                    <p class="card-normalt">Facturas</p>
                    <div class="uk-container-expand"><hr></div>
                    <div class="uk-flex-row">
                        <div>
                            <p style="margin: 2px 0">February, 10, 2020</p>
                            <p class="card-subtitle" style="margin: 2px 0">NO #00021993</p>
                        </div>
                    </div>
                    <div class="uk-container-expand"><hr></div>
                    <div class="uk-container-expand"><hr></div>
                    <div class="uk-container-expand"><hr></div>
                </div>
            </div>


            <div class="uk-width-3-5@s">


                <div class="uk-grid-small uk-child-width-expand@s uk-text-center" uk-grid="masonry: pack">
                    <div class="uk-width-1-2@s uk-width-medium-*">
                        <div class="card-2" style="min-height: 210px; margin-bottom: 15px">
                        </div>
                    </div>
                    <div class="uk-width-1-2@s">
                        <div class="card-2" style="min-height: 210px; margin-bottom: 15px">
                        </div>
                    </div>
                </div>


                <div class="card-2" style="min-height: 140px; margin-bottom: 15px">
                    <p class="card-normalt">Proyectos Culminados</p>
                </div>
            </div>


        </div>
    </div>


    <div class="uk-container-expand"><hr style="margin-top: 35px; margin-bottom: 55px;"></div>



</div>






<% } %>


<div style="margin-top: 30px"></div>


<div class="uk-container-expand footer-container" style="width: 100%">
    <div style="height: 15px"></div>
    <p>© COMRED Perú SAC - Todos los derechos reservados</p>
</div>


<!-- UIkit JS -->
<script src="https://cdn.jsdelivr.net/npm/uikit@3.17.6/dist/js/uikit.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/uikit@3.17.6/dist/js/uikit-icons.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>

<script>
    // Activa la funcionalidad de UIkit para hacer el Navbar responsive
    UIkit.util.ready(function () {
        UIkit.navbar('.uk-navbar', {
            align: 'center', // Puedes ajustar la alineación según tus preferencias
            boundary: '!.uk-navbar-container'
        });
    });
</script>

</body>
</html>
