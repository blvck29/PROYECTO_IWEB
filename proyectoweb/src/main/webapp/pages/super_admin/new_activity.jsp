<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyectoweb.model.beans.Usuario" %>
<%@ page import="com.example.proyectoweb.model.beans.Actividad" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%ArrayList<Usuario> listaUsuarios = (ArrayList<Usuario>) request.getAttribute("listaUsuarios");%>
<%ArrayList<Actividad> listaActividades = (ArrayList<Actividad>) request.getAttribute("listaActividades");%>

<%
    ArrayList<String> titulosActividad = new ArrayList<String>();
    ArrayList<Integer> listaIdsDelegados = new ArrayList<Integer>();

    for (Actividad act : listaActividades) {
        titulosActividad.add(act.getTitulo());
    }

    for (Actividad act : listaActividades) {
        listaIdsDelegados.add(act.getIdEncargado());
    }
%>

<script>
    var titulosActividad = [
        <% for (String titulo : titulosActividad) { %>
        '<%= titulo %>',
        <% } %>
    ];

    var idsDelegados = [
        <%
        for (Integer id : listaIdsDelegados){%>
        '<%= id %>',
        <% }  %>
    ];

    console.log(titulosActividad);
    console.log(idsDelegados);
</script>

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

    <link rel="icon" type="image/jpg" href="favicon.png" />

    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="js/showError.js"></script>

    <title>Home | Semana de Ingeniería 2023</title>
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
                <a href="<%=request.getContextPath()%>/admin_gen?action=donations">Donaciones</a>
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
            <h1 class="display-5 fw-bold text-white" style="font-family: 'Poppins', sans-serif">Creando Nueva Actividad</h1>
            <div class="justify-content-sm-center">
            </div>
        </div>
    </div>
</div>



<div class="container">

    <div style="margin-bottom: 50px"></div>
    <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px">Interfaz de Creación de Actividad</strong></h2>
    <div style="margin-bottom: 20px"></div>

    <hr style="border-top: 1px solid #262626;">

    <div style="margin-bottom: 40px"></div>








    <div class="container">

        <div class="row">
            <div class="col-lg-6 col-md-12" style="text-align: left; padding-top: 1.5em">
                <form id="form" method="post" action="<%=request.getContextPath()%>/admin_gen?action=activities&ac=crear">
                <div class="card">
                    <div class="card-body" style="padding-left: 35px">
                            <div style="padding-top: 1.5em;"></div>
                            <div class="form-group" style="padding-right: 1rem">
                                <label style="text-align: left;">
                                    <strong>Nombre de Actividad:</strong></label>
                                <input type="text" id="nombreAct" class="form-control" name="nombreActividad" required>
                            </div>
                            <div style="padding-top: 1.5em;"></div>
                            <div class="form-group" style="padding-right: 1rem">
                                <label><strong>Delegado de Actividad:</strong></label>
                                <select class="form-select" name="idDelegado" id="idDelegado" aria-label="Default select example" required>
                                    <option selected disabled value="">Seleccionar</option>
                                    <%for (Usuario usuario : listaUsuarios){ %>
                                    <option value="<%=usuario.getIdUsuario()%>"><%=usuario.getNombres() + " " + usuario.getApellidos()%></option>
                                    <%}%>
                                </select>
                                <div>
                                </div>
                            </div>
                            <div style="padding-top: 1.5em;"></div>
                    </div>
                </div>

                    <div class="uk-flex uk-flex-center uk-margin-top">
                        <div class="uk-flex uk-flex-center">
                            <a id="redirect-button" class="btn btn-secondary m-2" href="<%=request.getContextPath()%>/admin_gen?action=activities">Cancelar</a>
                            <button type="submit" class="btn btn-primary m-2">Guardar</button>
                        </div>
                    </div>

                </form>
            </div>



            <div class="col-lg-6 col-md-12" style="padding-left: 2em; padding-right: 2em; padding-top: 1.5em">
                <div class="container" style="padding-left: 6rem; padding-right: 6rem">
                    <div class="uk-upload-box">
                        <div id="error-alert" class="uk-alert-danger uk-margin-top uk-hidden" uk-alert>
                            <p id="error-messages"></p>
                        </div>

                        <form id="upload">
                            <div class="drop__zone uk-placeholder uk-text-center">
                                <span uk-icon="icon: cloud-upload"></span>
                                <span class="uk-text-middle uk-margin-small-left">Adjunte arrastrando el archivo o</span>
                                <div uk-form-custom>
                                    <input name="document" accept="image/png, image/jpeg, application/pdf, application/vnd.openxmlformats-officedocument.wordprocessingml.document" type="file">
                                    <span class="uk-link">seleccione la captura</span>
                                </div>
                                <ul id="preview" class="uk-list uk-grid-match uk-child-width-1-2 uk-child-width-1-4@l uk-child-width-1-5@xl uk-text-center" uk-grid uk-scrollspy="cls: uk-animation-scale-up; target: .list-item; delay: 80"></ul>
                            </div>
                        </form>
                    </div>

                    <div class="uk-flex uk-flex-center uk-margin-top">
                        <div class="uk-flex uk-flex-center">
                            <a type="button" id="reset-button" class="m-2">Borrar</a>
                            <a type="submit" id="upload-form" class="m-2">Subir</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


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
        const nombre = document.getElementById("nombreAct")
        const form = document.getElementById("form")
        const idDelegado = document.getElementById("idDelegado")

        form.addEventListener("submit", e=>{

            if (titulosActividad.includes(nombre.value)){
                showError('El nombre de la actividad ya existe')
                e.preventDefault() // Evita el envío del formulario si la validación falla
            }else if (nombre.value.length<4){
                 showError("El titulo de la actividad es muy corto")
                 e.preventDefault()
            }else if (nombre.value.length>8){
                showError("El titulo de la actividad es muy largo")
                e.preventDefault()
            }
            else if(idsDelegados.includes(idDelegado.value)){
                showError("El delegado ya fue seleccionado para otra actividad")
                e.preventDefault()
            }
            else{
                //Envia el form al servlet
            }
        })
</script>

<script src="js/upload.js"></script>
<script src="js/bootstrap/bootstrap.js"></script>
<script src="js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>



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