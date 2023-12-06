<%@ page import="com.example.proyectoweb.model.beans.Usuario" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% Usuario usuario = (Usuario) request.getAttribute("usuario"); %>

<%
    if (session.getAttribute("id") != null){
        int id = (int) session.getAttribute("id");
        String idRolSistema = (String) session.getAttribute("idRolSistema");
        String idRolAcademico = (String) session.getAttribute("idRolAcademico");
        String nombres = (String) session.getAttribute("nombres");
        String apellidos = (String) session.getAttribute("apellidos");
    }
%>


<!doctype html>
<html lang="es">

<%
   if (session.getAttribute("id")!=null){
%>

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
</body>


    <% } else { %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>
    <link rel="icon" type="image/jpg" href="favicon.png"/>
    <title>Semana de Ingeniería 2023</title>
</head>

<body>

<section class="index">

    <div class="forgot-container">

        <div class="forgot-form">
            <form action="<%=request.getContextPath()%>/login" method="POST" id="complete">
                <h2>Se ha cerrado la Sesión!</h2>
                <div class="forgot-back" style="padding-top: 10px; max-width: 450px; margin-bottom: 25px">
                    <label>Debe iniciar sesión para acceder al contenido de la página, regrese al login.</label>
                </div>

                <input type="submit" value="Regresar" class="forgot-button">

            </form>
        </div>
    </div>

    <div class="container-fluid footer-container">
        <p>© Pontificia Universidad Católica del Perú - Todos los derechos reservados</p>
    </div>

</section>

</body>

<%}%>