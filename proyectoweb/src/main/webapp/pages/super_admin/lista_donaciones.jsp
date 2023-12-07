<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyectoweb.model.beans.Donaciones" %>
<%@ page import="com.example.proyectoweb.model.beans.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%Usuario user = (Usuario) session.getAttribute("usuario");%>

<%  if (user.getIdRolSistema().equals("DELGEN")){ %>

    <% ArrayList<Donaciones> listaDonaciones = (ArrayList<Donaciones>) request.getAttribute("listaDonaciones");%>
    <%Integer cantidadPaginasDonaciones = (Integer) request.getAttribute("cantPaginasDonations");%>
    <% ArrayList<Usuario> listaUsuarios = (ArrayList<Usuario>) request.getAttribute("listaUsuarios");%>

<!doctype html>
<html lang="es">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
          crossorigin="anonymous">

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



    <link rel="icon" type="image/jpg" href="favicon.png" />

    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
    <link rel = "stylesheet" href="https://cdn.datatables.net/1.13.7/css/dataTables.bootstrap4.min.css">





    <title>Administración de Usuarios | Semana de Ingeniería 2023</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

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
                <a href="<%=request.getContextPath()%>/admin_gen?action=statistics">Estadísticas</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/admin_gen?action=donations" class="active">Donaciones</a>
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
            <h1 class="display-5 fw-bold text-white">Bienvenido, @Admin_general</h1>
            <div style="margin-bottom: 20px"></div>
            <h3 class="fw-bold text-white">Panel de Donaciones</h3>
            <div style="margin-bottom: 20px"></div>
            <div class="justify-content-sm-center">
            </div>
        </div>
    </div>
</div>

<div style="padding-top: 40px;"></div>




<div class="container">
    <div class="row">

        <div class="col-md-10" >
            <form method="post" action="<%=request.getContextPath()%>/admin_gen?action=donations&ac=busqueda">

                <a class="btn btn-primary" href="<%=request.getContextPath()%>/admin_gen?action=donations" role="button">Borrar filtros</a>
            </form>
        </div>


        <div class="col-md-2" >
            <div class="btn-group">
                <button type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" data-bs-display="static" aria-expanded="false">
                    COMPROBACIÓN
                </button>
                <ul class="dropdown-menu dropdown-menu-lg-end">
                    <form method="post" action="<%=request.getContextPath()%>/admin_gen?action=donations&ac=filtrarComprobados&id=1">
                        <li><button class="dropdown-item" type="submit">Comprobados</button></li>
                    </form>
                    <form method="post" action="<%=request.getContextPath()%>/admin_gen?action=donations&ac=filtrarComprobados&id=0">
                        <li><button class="dropdown-item" type="submit">No comprobados</button></li>
                    </form>
                    <form method="post" action="<%=request.getContextPath()%>/admin_gen?action=donations&ac=filtrarComprobados&id=2">
                        <li><button class="dropdown-item" type="submit">Rechazados</button></li>
                    </form>

                </ul>
            </div>
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
    <table id="donations" class="table table-striped table-bordered" style="width:100%">
        <thead>
        <tr>
            <th class="header c1 centeralign" style="" scope="col"><a><strong>ID REGISTRO DONACION</strong></a></th>
            <th class="header c1 centeralign" style="" scope="col"><a><strong>NOMBRE/APELLIDO</strong></a></th>
            <th class="header c1 centeralign" style="" scope="col"><a><strong>ROL ACADÉMICO</strong></a></th>
            <th class="header c1 centeralign" style="" scope="col"><a><strong>MONTO</strong></a></th>
            <th class="header c1 centeralign" style="" scope="col"><a><strong>FECHA DE DONACIÓN</strong></a></th>
            <th class="header c1 centeralign" style="" scope="col"><a><strong>HORA DE DONACIÓN</strong></a></th>
            <th class="header c5" style="" scope="col">ESTADO DE DONACIÓN</th>
            <th class="header c5" style="" scope="col">VER Y EDITAR</th>
            <td class="header c6 lastcol" style=""></td>
        </tr>
        </thead>



        <tbody>

        <% if(listaDonaciones != null) {%>
            <% for (Donaciones donaciones: listaDonaciones){ %>
            <tr class="">
                <td class="centeralign cell c0" style=""><a><%=donaciones.getIdDonaciones() %></a></td>
                <td class="centeralign cell c1" style=""><%= donaciones.getNombres() +" "+ donaciones.getApellidos()%></td>

                <% String rolAcademico ="---";
                    switch(donaciones.getIdRolAcademico()){
                        case "STUDENT":
                            rolAcademico = "Estudiante";
                            break;
                        case "GRADUAT":
                            rolAcademico = "Egresado";
                            break;
                        default:
                            rolAcademico = "---";
                    }%>
                <td class="cell c2" style=""><%= rolAcademico %></td>

                <td class="centeralign cell c1" style=""><%="S/. "+ donaciones.getMonto() %></td>

                <%  String[] fechaHora = donaciones.getFechaDonacion().split(" ");
                    String fecha = fechaHora[0];
                    String hora = fechaHora[1];
                    String[] horaHMS = hora.split(":");
                    String horaMostrar = horaHMS[0] + ":" + horaHMS[1];
                %>


                <td class="centeralign cell c1" style=""><%= fecha %></td>
                <td class="centeralign cell c1" style=""><%= horaMostrar %></td>



                <%if (donaciones.getComprobado() == 0){%>
                <td class="cell c5" style="color: black">Pendiente de Comprobacion</td>
                <%}else if(donaciones.getComprobado() == 1){%>
                <td class="cell c5" style="color: #0d6efd">Comprobado</td>
                <%} else if (donaciones.getComprobado() == 2) {%>
                <td class="cell c5" style="color: red">Rechazado</td>
                <%} %>



                <td class="cell c6 lastcol" style=""><a href="<%=request.getContextPath()%>/admin_gen?action=donations&ac=ver&idDonante=<%=donaciones.getIdUsuario()%>"><img width="24" height="24" src="https://img.icons8.com/pulsar-line/48/view-delivery.png" alt="edit-row"/></a></td>
                <td class="cell c6 lastcol" style=""></td>
            </tr>
            <%}%>
        <%} else {%>
            <tr>
            <td colspan="2"> No hay datos disponibles en la tabla. </td>
            </tr>
        <% }%>
        </tbody>
    </table>
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


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<script src = "https://code.jquery.com/jquery-3.7.0.js"></script>
<script src = "https://cdn.datatables.net/1.13.7/js/jquery.dataTables.min.js"></script>
<script src = "https://cdn.datatables.net/1.13.7/js/dataTables.bootstrap4.min.js"></script>
<script>
    new DataTable('#donations', { language: {

            url: '//cdn.datatables.net/plug-ins/1.13.7/i18n/es-MX.json',

        },
    });
</script>
<script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>


</body>

</html>

<% } else {request.getRequestDispatcher("/logout").forward(request, response);}%>
