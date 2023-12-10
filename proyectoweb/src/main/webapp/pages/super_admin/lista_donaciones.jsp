<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyectoweb.model.beans.Donaciones" %>
<%@ page import="com.example.proyectoweb.model.beans.Usuario" %>
<%@ page import="com.example.proyectoweb.model.Dtos.DonacionUserDto" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%Usuario user = (Usuario) session.getAttribute("usuario");%>
<%ArrayList<Donaciones> listaDonaciones = (ArrayList<Donaciones>) request.getAttribute("listaDonaciones");%>
<%ArrayList<DonacionUserDto> listaDonacionesDetalles = (ArrayList<DonacionUserDto>) request.getAttribute("listaDetalles");%>

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
    <link rel = "stylesheet" href="css/bootstrap/dataTablesDonaciones.bootstrap4.min.css">

    <!-- Modal-->
    <link rel = "stylesheet" href = "css/modalButton.css">

    <title>Administración de Usuarios | Semana de Ingeniería 2023</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-HjQE6zC8aa2BK9xVRvPUdo4FqIkFfQF1dM1iZeFzTC1Q9dI6yCeF6pMJpPs19j7e" crossorigin="anonymous">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
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
                <a href="<%=request.getContextPath()%>/admin_gen?action=home" class="active">Usuarios</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/admin_gen?action=activities&ac=list">Actividades</a>
            </li>
            <li>
                <a href="<%=request.getContextPath()%>/admin_gen?action=statistics">Estadísticas</a>
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


<div class="container-fluid" style="padding-left:0 !important; padding-right: 0 !important; background: rgb(45,0,83) !important;
background: radial-gradient(circle, rgba(45,0,83,1) 0%, rgba(35,3,80,1) 59%, rgba(21,0,48,1) 100%) !important;">
    <div class="text-secondary px-4 py-5 text-center">
        <div class="py-5">
            <h1 class="display-5 fw-bold text-white">Bienvenido, <%=user.getNombres() + " " + user.getApellidos()%></h1>
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

        <div class="col-md-10 mb-2" >
            <form method="post" action="<%=request.getContextPath()%>/admin_gen?action=donations&ac=busqueda">

                <a class="btn btn-primary" href="<%=request.getContextPath()%>/admin_gen?action=donations" role="button">Borrar filtros</a>
                <!-- Button trigger modal -->
                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                    Ver detalles
                </button>

            </form>

            <!--Ventana Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-xl">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Detalles acerca de el Monto total y Kit teleco</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body" style="max-height: 400px; overflow-y: auto;">
                            <!-- Contenido del modal -->
                            <!-- Puedes ajustar la altura máxima según tus necesidades -->
                            <!-- El desplazamiento vertical se activará si el contenido es más largo que la altura máxima -->
                            <!-- ... -->

                            <div class="table-responsive container">
                                <table id="donationsDetails" class="table table-striped table-bordered" style="width:100%">
                                    <thead>
                                        <tr>
                                            <th class="header c1 centeralign" style="" scope="col"><a><strong>NOMBRE</strong></a></th>
                                            <th class="header c1 centeralign" style="" scope="col"><a><strong>APELLIDO</strong></a></th>
                                            <th class="header c1 centeralign" style="" scope="col"><a><strong>CODIGO</strong></a></th>
                                            <th class="header c1 centeralign" style="" scope="col"><a><strong>MONTO TOTAL</strong></a></th>
                                            <th class="header c1 centeralign" style="" scope="col"><a><strong>CANTIDAD DE DONACIONES</strong></a></th>
                                            <th class="header c1 centeralign" style="" scope="col"><a><strong>KIT TELECO</strong></a></th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        <% for (DonacionUserDto donaciones: listaDonacionesDetalles){ %>
                                        <tr class="">
                                            <td class="centeralign cell c0" style=""><a><%=donaciones.getNombre() %></a></td>
                                            <td class="centeralign cell c1" style=""><%= donaciones.getApellido()%></td>

                                            <td class="cell c2" style=""><%=donaciones.getCodigo() %></td>

                                            <td class="centeralign cell c1" style=""><%=donaciones.getMontoTotal() %></td>


                                            <td class="centeralign cell c1" style=""><%= donaciones.getCantidadDonaciones() - 1 %></td>
                                            <td class="centeralign cell c1" style=""><%= donaciones.getKitTeleco() %></td>

                                        </tr>
                                        <%}%>
                                    </tbody>
                                </table>
                            </div>


                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Fin de Ventana Modal-->
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
        </tr>
        </thead>



        <tbody>
            <% for (Donaciones donaciones:listaDonaciones){ %>
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
            </tr>
            <%}%>
        </tbody>
    </table>
</div>

<div style="margin-bottom: 50px"></div>


<div class="container-fluid" style="padding-right: 0; padding-left: 0">
    <footer id="sticky-footer" class="footer-distributed" style="background-color: #04011E">
        <div class="footer-left">
            <img src="images/logo_topbar.png" alt="Logo de Ingeniería de las Telecomunicaciones" style="width: 400px; height: auto;">
            <p class="footer-links">
                <a href="<%=request.getContextPath()%>/admin_gen?action=home">Usuarios</a> |
                <a href="<%=request.getContextPath()%>/admin_gen?action=activities&ac=list">Actividades</a> |
                <a href="<%=request.getContextPath()%>/admin_gen?action=statistics">Estadisticas</a> |
                <a href="<%=request.getContextPath()%>/admin_gen?action=donations">Donaciones</a> |
                <a href="<%=request.getContextPath()%>/admin_gen?action=profile">Perfil</a>
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

<script>
    new DataTable('#donationsDetails', { language: {

            url: '//cdn.datatables.net/plug-ins/1.13.7/i18n/es-MX.json',

        },
    });
</script>

</body>

</html>


