<%@ page import="com.example.proyectoweb.model.beans.Usuario" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% Usuario usuario = (Usuario) request.getAttribute("usuario"); %>



<%Usuario user = (Usuario) session.getAttribute("usuario");%>

<%  if (user.getIdRolSistema().equals("DELGEN")){ %>

<!doctype html>
<html lang="es">

<head>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="js/showError.js"></script>

    <link rel="icon" type="image/jpg" href="favicon.png" />

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-HjQE6zC8aa2BK9xVRvPUdo4FqIkFfQF1dM1iZeFzTC1Q9dI6yCeF6pMJpPs19j7e" crossorigin="anonymous">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">
    <!--  Link Footer add
    <link rel="stylesheet" href="css/styleFooter.css">-->

    <title>Administrar Usuario | Semana de Ingeniería 2023</title>
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
    </nav>
</header>

<div class="container">
    <div style="margin-bottom: 50px"></div>

    <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px">Administrar Usuario</strong></h2>

    <div style="margin-bottom: 20px"></div>
    <hr>
    <div style="margin-bottom: 30px"></div>




    <div class="form-group">
        <label for="name"><strong>Nombre y apellidos:</strong></label>
        <input class="form-control"  type="text" value="<%=usuario.getNombres() + " " + usuario.getApellidos()%>" id="name"  aria-label="Disabled input example" disabled="" readonly="">
    </div>
    <div style="margin-bottom: 20px"></div>

    <div class="form-group">
        <label for="codigoPUCP"><strong>Código PUCP:</strong></label>
        <input class="form-control" name="codigoPUCP" type="text" value="<%=usuario.getCodigo()%>" id="codigoPUCP" aria-label="Disabled input example" disabled="" readonly="">
    </div>
    <div style="margin-bottom: 20px"></div>

    <div class="form-group">
        <label for="correoPUCP"><strong>Correo PUCP:</strong></label>
        <input class="form-control" name="correoPUCP" type="text" value="<%=usuario.getCorreo()%>" id="correoPUCP" aria-label="Disabled input example" disabled="" readonly="">
    </div>
    <div style="margin-bottom: 20px"></div>

    <% String rol ="---";
        switch(usuario.getIdRolSistema()){
            case "DELGEN":
                rol = "Delegado General";
                break;
            case "DELACT":
                rol = "Delegado de Actividad";
                break;
            case "USER":
                rol = "Usuario";
                break;
            default:
                rol = "---";
        }%>

    <div class="form-group">
        <label ><strong>Rol:</strong></label>
        <input class="form-control" type="text" value="<%=rol%>" aria-label="Disabled input example" disabled="" readonly="">
    </div>
    <div style="margin-bottom: 20px"></div>

    <% String estado ="---";
        switch(usuario.getIdEstado()){
            case "ACC":
                estado = "Aceptado";
                break;
            case "VER":
                estado = "Sin Asignar";
                break;
            case "BAN":
                estado = "Baneado";
                break;
            default:
                estado = "---";
                break;
        }%>

    <div class="form-group">
        <label><strong>Estado actual:</strong></label>
        <input class="form-control" type="text" value="<%=estado%>" aria-label="Disabled input example" disabled="" readonly="">
    </div>
    <div style="margin-bottom: 20px"></div>



<form method="post" id="formEdit" action="<%=request.getContextPath()%>/admin_gen?action=home&ac=editarEstadoUsuario">

    <div class="form-group">
        <input class="form-control" type="hidden" name="idUsuario"   value="<%=usuario.getIdUsuario()%>">
    </div>


    <div class="form-group">
        <label><strong>Editar estado:</strong></label>
        <div style="margin-bottom: 20px"></div>


            <%
                switch (estado){
            case ("Sin Asignar"):
            %>

            <div class="radio-buttons">
                <label style="padding-right: 30px"><input type="radio" name="estado"  value="ACC" required> Aprobado <br></label>
                <label>                            <input type="radio" name="estado"  value="eliminarUsuario" required> Rechazado </label>
            </div>
                <%
                        break;
                case ("Aceptado"):
                %>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="estado" id="exampleRadios2" value="BAN" required>
                    <label class="form-check-label" for="exampleRadios2">
                        Banear
                    </label>
                </div>

                <%
                        break;
                case ("Baneado"):
                %>
                <div class="radio-buttons">
                    <label style="padding-right: 30px"><input type="radio" name="estado" value="ACC" required> Desbanear <br></label>
                </div>
                <%
                        break;
            }
                %>


        <div style="margin-bottom: 20px"></div>

        <div class="button-container">
            <a id="redirect-button" class="btn btn-secondary m-2" href="<%=request.getContextPath()%>/admin_gen">Cancelar</a>
            <button onclick="alert" type="submit" class="btn btn-primary m-2">Guardar</button>
        </div>
        <div style="margin-bottom: 50px"></div>
    </div>
</form>


    <script>
        const form = document.getElementById("formEdit");

        form.addEventListener("submit", e => {
            e.preventDefault(); // Evita que el formulario se envíe de inmediato

            Swal.fire({
                title: '¿Estás seguro de editar este estado?',
                text: "No se podrán revertir estos cambios",
                icon: 'warning',
                iconColor: '#DC3545',
                showCancelButton: true,
                cancelButtonColor: '#0D6EFD',
                cancelButtonText: 'Cancelar',
                confirmButtonColor: '#0D6EFD',
                confirmButtonText: 'Aplicar cambios',
                footer: '<a href="">Volver a ingresar los datos</a>'
            }).then((result) => {
                if (result.isConfirmed) {
                    // El usuario ha confirmado, ahora puedes enviar el formulario
                    form.submit();
                }
            });
        });
    </script>



    <script src="js/bootstrap/bootstrap.js"></script>
    <script src="js/script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async=""></script>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>



</div>

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

</body>

</html>

<% } else {request.getRequestDispatcher("/logout").forward(request, response);}%>
