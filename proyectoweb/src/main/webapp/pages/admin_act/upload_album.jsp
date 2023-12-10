<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyectoweb.model.beans.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%Usuario user = (Usuario) session.getAttribute("usuario");%>

<% ArrayList<Usuario> listaUsuarios = (ArrayList<Usuario>) request.getAttribute("listaUsuarios");%>

<!doctype html>
<html lang="es">



<head>
    <meta http-equiv="Content-Type" content=text/html; charset=ISO-8859-1″>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

    <script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

    <link rel="icon" type="image/jpg" href="../../favicon.png" />

    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

    <!-- UIkit CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.17.4/dist/css/uikit.min.css" />

    <!-- UIkit JS -->
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.17.4/dist/js/uikit.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/uikit@3.17.4/dist/js/uikit-icons.min.js"></script>

    <!--Footer-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha384-HjQE6zC8aa2BK9xVRvPUdo4FqIkFfQF1dM1iZeFzTC1Q9dI6yCeF6pMJpPs19j7e" crossorigin="anonymous">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
    <link href="http://fonts.googleapis.com/css?family=Cookie" rel="stylesheet" type="text/css">

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
background: radial-gradient(circle, rgba(45,0,83,1) 0%, rgba(35,3,80,1) 59%, rgba(21,0,48,1) 100%) !important;")>
    <div class="text-secondary px-4 py-5 text-center">
        <div class="py-5">
            <h1 class="display-5 fw-bold text-white" style="font-family: 'Poppins', sans-serif">Bienvenido, @Admin_Act</h1>
            <div style="margin-bottom: 20px"></div>
            <h3 class="fw-bold text-white" style="font-family: 'Poppins', sans-serif">Creando Album para @Evento</h3>
            <div style="margin-bottom: 20px"></div>
            <div class="justify-content-sm-center">
            </div>
        </div>
    </div>
</div>

<div style="padding-top: 40px;"></div>


<div class="container">
    <div class="uk-container uk-margin-top uk-margin-bottom">

        <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px">Suba las Fotos del Álbum</strong></h2>
        <div style="margin-bottom: 40px"></div>

        <div class="uk-upload-box">
            <div id="error-alert" class="uk-alert-danger uk-margin-top uk-hidden" uk-alert>
                <p id="error-messages"></p>
            </div>

            <div class="drop__zone uk-placeholder uk-text-center">
                <span uk-icon="icon: cloud-upload"></span>
                <span class="uk-text-middle uk-margin-small-left">Adjunte arrastrando el archivo o</span>
                <div uk-form-custom>
                    <input id="file-input" name="documents[]" type="file" accept="image/png, image/jpeg, application/pdf, application/vnd.openxmlformats-officedocument.wordprocessingml.document" multiple>
                    <span class="uk-link">Seleccione las fotos</span>
                </div>

                <ul id="preview" class="uk-list uk-grid-match uk-child-width-1-2 uk-child-width-1-4@l uk-child-width-1-5@xl uk-text-center" uk-grid uk-scrollspy="cls: uk-animation-scale-up; target: .list-item; delay: 80"></ul>
            </div>
        </div>

        <div class="uk-flex uk-flex-center uk-margin-top">
            <div class="uk-flex uk-flex-center">
                <button type="button" id="reset-button" class="btn btn-secondary m-2">Borrar</button>
                <button type="button" id="upload-button" class="btn btn-primary m-2">Subir</button>
            </div>
        </div>
    </div>
</div>



<div style="margin-bottom: 50px"></div>

</div>

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
    document.addEventListener("DOMContentLoaded", function() {
        const fileInput = document.getElementById("file-input");
        const resetButton = document.querySelector("#reset-button");
        const uploadButton = document.querySelector("#upload-button");

        resetButton.addEventListener("click", function() {
            fileInput.value = ''; // Limpiar la selección de archivos
            const previewList = document.getElementById("preview");
            previewList.innerHTML = ""; // Limpiar la lista de vista previa
        });

        uploadButton.addEventListener("click", function() {
        });
    });
</script>


<script>
    function submitForm() {
        var selectElement = document.getElementById("eventSelect");
        var selectedValue = selectElement.value;
        if (selectedValue == "user") {
            var newURL = "<%=request.getContextPath()%>/user_home";
            window.location.href = newURL;
        } else {
            var newURL = "<%=request.getContextPath()%>/admin_act";
            window.location.href = newURL;
        }
    }
</script>




<script src="../../js/upload.js"></script>
<script src="js/bootstrap/bootstrap.js"></script>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>


</body>

</html>
