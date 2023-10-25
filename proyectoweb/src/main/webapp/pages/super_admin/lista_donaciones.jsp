<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyectoweb.model.beans.Donaciones" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
  ArrayList<Donaciones> lista = (ArrayList<Donaciones>) request.getAttribute("lista");
%>
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

    <title>Administración de Usuarios | Semana de Ingeniería 2023</title>
</head>

<body>
<header>
    <div class="logo"><a href="tabla_inscritos.jsp"><img class="logo-img" src='images/logo_topbar.png' alt="logo"></a></div>

    <div class="bars">
        <div class="line"></div>
        <div class="line"></div>
        <div class="line"></div>
    </div>

    <nav class="nav-bar">
        <ul>
            <li>
                <a href="tabla_inscritos.jsp" class="active">Usuarios</a>
            </li>
            <li>
                <a href="../user/per_events.jsp">Estadísticas</a>
            </li>
            <li>
                <a href="../user/lista_donaciones.jsp">Donaciones</a>
            </li>
            <li>
                <a href="#"><i class="fa-solid fa-user nav-icon2"></i>Usuario</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>"><i class="fa-solid fa-door-open nav-icon2"></i>Cerrar Sesión</a>
            </li>
        </ul>
    </nav>
</header>


<div class="container-fluid" style="padding-left:0 !important; padding-right: 0 !important; background: rgb(45,0,83) !important;
background: radial-gradient(circle, rgba(45,0,83,1) 0%, rgba(35,3,80,1) 59%, rgba(21,0,48,1) 100%) !important;")>
    <div class="text-secondary px-4 py-5 text-center">
        <div class="py-5">
            <h1 class="display-5 fw-bold text-white">Bienvenido, @Admin_general</h1>
            <div style="margin-bottom: 20px"></div>
            <h3 class="fw-bold text-white">Panel de Administración de Usuarios</h3>
            <div style="margin-bottom: 20px"></div>
            <div class="justify-content-sm-center">
            </div>
        </div>
    </div>
</div>

<div style="padding-top: 40px;"></div>

<div class="container">
    <div class="row">

        <div class="col-md-12">

            <form method="post" action="<%=request.getContextPath()%>/UsuarioServlet?action=busqueda">

                <div class="custom-form-group">
                    <input type="text" class="form-control" name="busquedaNombreCodigo" placeholder="Buscar por nombre o código" style="width: 120%">
                </div>
                <button type="submit" class="btn btn-primary">Aplicar filtros</button>

                <a class="btn btn-primary" href="<%=request.getContextPath()%>/UsuarioServlet" role="button">Borrar filtros</a>
            </form>
        </div>
    </div>
    <div style="padding-top: 15px;"></div>
    <hr class="hr hr-blurry"/>
</div>

<div class="container">
    <form autocomplete="off"  method="post" accept-charset="utf-8" id="mform2_c5Hfs9zIVAeeWpH" class="mform">
        <div style="display: none;"><input name="sesskey" type="hidden" value="mfwKCcurEd">
            <input name="_qf__user_active_filter_form" type="hidden" value="1">
        </div>
    </form>
</div>

<div style="padding-top: 25px;"></div>

<div class="table-responsive container">
    <table class="admintable generaltable table-sm" id="users">
        <thead>
        <tr>
            <th class="header c1 centeralign" style="" scope="col"><a><strong>ID REGISTRO DONACIONES</strong></a></th>
            <th class="header c1 centeralign" style="" scope="col"><a><strong>ID USUARIO</strong></a></th>
            <th class="header c1 centeralign" style="" scope="col"><a><strong>COMPROBANTE</strong></a></th>
            <th class="header c1 centeralign" style="" scope="col"><a><strong>MONTO</strong></a></th>
            <th class="header c5" style="" scope="col">COMPROBADO</th>
            <th class="header c5" style="" scope="col">EDITAR</th>
            <td class="header c6 lastcol" style=""></td>
        </tr>
        </thead>



        <tbody>

        <% for (Donaciones donaciones: lista){ %>
        <tr class="">
            <td class="centeralign cell c0" style=""><a><%=donaciones.getIdRegistro_Donaciones() %></a></td>
            <td class="centeralign cell c1" style=""><%= donaciones.getIdUsuario()%></td>
            <td class="centeralign cell c1" style=""><%= donaciones.getComprobante() %></td>
            <td class="centeralign cell c1" style=""><%= donaciones.getMonto() %></td>
            <td class="cell c5" style=""><%= donaciones.isComprobado() %></td>

            <td class="cell c6 lastcol" style=""><a href="<%=donaciones.isComprobado() %>/ActividadServlet?action=Editar"><img width="24" height="24" src="https://img.icons8.com/sf-regular/48/edit-row.png" alt="edit-row"/></a></td>
        </tr>
        <%}%>
        </tbody>
    </table>
</div>

<div class="container">
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



<script src="js/bootstrap/bootstrap.js"></script>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


</body>

</html>
