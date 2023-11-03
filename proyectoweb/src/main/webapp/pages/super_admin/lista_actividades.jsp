<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyectoweb.model.beans.Usuario" %>
<%@ page import="com.example.proyectoweb.model.beans.Actividad" %>
<%@ page import="com.example.proyectoweb.model.beans.DelegadoAct" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<% ArrayList<DelegadoAct> listaDelegadosAct = (ArrayList<DelegadoAct>) request.getAttribute("listaDelegadosAct");%>




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

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="js/showError.js"></script>

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
                        <a href="<%=request.getContextPath()%>/admin_gen?action=home">Usuarios</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/admin_gen?action=activities&ac=list" class="active">Actividades</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/admin_gen?action=statistics">Estadísticas</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/admin_gen?action=donations">Donaciones</a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath()%>/"><i class="fa-solid fa-door-open nav-icon2"></i>Cerrar Sesión</a>
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
                    <h3 class="fw-bold text-white">Panel de Administración de Actividades</h3>
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

                    <form method="post" action="<%=request.getContextPath()%>/admin_gen?action=activities&ac=busqueda">

                        <div class="custom-form-group">
                            <input type="text" class="form-control" name="busquedaTituloActividad" placeholder="Buscar por titulo" style="width: 120%">
                        </div>
                        <button type="submit" class="btn btn-primary">Aplicar filtros</button>

                        <a class="btn btn-primary" href="<%=request.getContextPath()%>/admin_gen?action=activities" role="button">Borrar filtros</a>

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
                        <th class="header c1 centeralign" style="" scope="col"><a><strong>TITULO ACTIVIDAD</strong></a></th>
                        <th class="header c1 centeralign" style="" scope="col"><a><strong>NOMBRE DELEGADO</strong></a></th>
                        <th class="header c1 centeralign" style="" scope="col"><a><strong>CODIGO DELEGADO</strong></a></th>
                        <th class="header c5" style="" scope="col">EDITAR</th>
                        <th class="header c6" style="" scope="col">BORRAR</th>
                    </tr>
                </thead>



                <tbody>

                    <% for (DelegadoAct delegadoAct: listaDelegadosAct){ %>
                    <tr class="">
                        <td class="centeralign cell c0" style=""><a><%= delegadoAct.getTituloActividad()%></a></td>
                        <td class="centeralign cell c1" style=""><%= delegadoAct.getNombre() + " " + delegadoAct.getApellido()%> </td>
                        <td class="centeralign cell c1" style=""><%= delegadoAct.getCodigo()%></td>
                        <td class="cell c5" ><a href="<%=request.getContextPath() %>/admin_gen?action=activities&ac=edit&id=<%=delegadoAct.getTituloActividad()%>"><img width="24" height="24" src="https://img.icons8.com/sf-regular/48/edit-row.png" alt="edit-row"/></a></td>
                        <td class="cell c6 "><a id="borrar"  onclick="return confirmacionEliminar(event)" href="<%=request.getContextPath() %>/admin_gen?action=activities&ac=delete&id=<%=delegadoAct.getTituloActividad()%>"><img width="24" height="24" src="https://img.icons8.com/sf-regular/48/filled-trash.png" alt="filled-trash"/></a></td>
                    </tr>

                    <%}%>
                </tbody>
            </table>

            <br>

            <div>
                <a class="btn btn-primary" style="margin-left: 2px;" href="<%=request.getContextPath()%>/admin_gen?action=activities&ac=crear">Crear actividad</a>
            </div>


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

        <script>
            function confirmacionEliminar(event) {
                event.preventDefault(); // Previene ir al href(el cual va al servlet) hasta que se de en borrar

                Swal.fire({
                    title: '¿Estas seguro de eliminar esta actividad?',
                    text: "No se podrán revertir estos cambios",
                    icon: 'warning',
                    iconColor: '#DC3545',
                    showCancelButton: true,
                    cancelButtonColor: '#0D6EFD',
                    cancelButtonText: 'Cancelar',
                    confirmButtonColor: '#DC3545',
                    confirmButtonText: 'Borrar'
                }).then((result) => {
                    if (result.isConfirmed) {
                        window.location.href = document.getElementById('borrar').getAttribute('href');
                    }
                });
            }
        </script>


        <script src="js/bootstrap/bootstrap.js"></script>
        <script src="js/script.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
        <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


    </body>

</html>
