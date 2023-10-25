<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


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

    <title>Estadísticas | Semana de Ingeniería 2023</title>
</head>

<body>
<header>
    <div class="logo"><a href="tabla_inscritos.jsp"><img class="logo-img" src="images/logo_topbar.png" alt="logo"></a></div>

    <div class="bars">
        <div class="line"></div>
        <div class="line"></div>
        <div class="line"></div>
    </div>

    <nav class="nav-bar">
        <ul>
            <li>
                <a href="tabla_inscritos.jsp">Usuarios</a>
            </li>
            <li>
                <a href="lista_actividades.jsp">Actividades</a>
            </li>
            <li>
                <a href="statistics.jsp.jsp" class="active">Estadísticas</a>
            </li>
            <li>
                <a href="lista_donaciones.jsp.jsp">Donaciones</a>
            </li>
            <li>
                <a href="/proyectoweb"><i class="fa-solid fa-door-open nav-icon2"></i>Cerrar Sesión</a>
            </li>
        </ul>
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
        <input class="form-control" id="name" type="text" value="Barack Obama" aria-label="Disabled input example" disabled="" readonly="">
    </div>
    <div style="margin-bottom: 20px"></div>

    <div class="form-group">
        <label for="codigoPUCP"><strong>Código PUCP:</strong></label>
        <input class="form-control" id="codigoPUCP" type="text" value="20200101" aria-label="Disabled input example" disabled="" readonly="">
    </div>
    <div style="margin-bottom: 20px"></div>

    <div class="form-group">
        <label for="correoPUCP"><strong>Correo PUCP:</strong></label>
        <input class="form-control" id="correoPUCP" type="text" value="a20200101@pucp.edu.pe" aria-label="Disabled input example" disabled="" readonly="">
    </div>
    <div style="margin-bottom: 20px"></div>

    <div class="form-group">
        <label for="correoPUCP"><strong>Rol:</strong></label>
        <input class="form-control" type="text" value="Estudiante" aria-label="Disabled input example" disabled="" readonly="">
    </div>
    <div style="margin-bottom: 20px"></div>

    <div class="form-group">
        <label for="correoPUCP"><strong>Estado actual:</strong></label>
        <input class="form-control" type="text" value="Verificado" aria-label="Disabled input example" disabled="" readonly="">
    </div>
    <div style="margin-bottom: 20px"></div>

    <div class="form-group">
        <label><strong>Editar estado:</strong></label>
        <div style="margin-bottom: 20px"></div>

        <div class="radio-buttons">
            <label style="padding-right: 30px"><input type="radio" name="status" value="aprobado"> Aprobado <br></label>
            <label><input type="radio" name="status" value="denegado"> Denegado </label>
        </div>

        <div style="margin-bottom: 20px"></div>

        <div class="button-container">
            <a class="btn btn-primary" href="/proyectoweb/UsuarioServlet" role="button">Cancelar</a>
            <a class="btn btn-primary" href="/proyectoweb/UsuarioServlet" role="button">Guardar cambios</a>
        </div>
        <div style="margin-bottom: 50px"></div>


    </div>






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

</html>