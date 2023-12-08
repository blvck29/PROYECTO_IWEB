<%@ page import="com.example.proyectoweb.model.beans.Usuario" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.proyectoweb.model.beans.Donaciones" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<%Usuario user = (Usuario) session.getAttribute("usuario");%>
<% ArrayList<Donaciones> listaDonaciones = (ArrayList<Donaciones>) request.getAttribute("listaDonaciones"); %>


<!doctype html>
<html lang="es">


<head>

    <meta http-equiv="Content-Type" content=text/html; charset=ISO-8859-1″>
    <meta name="viewport" content="width=device-width, initial-scale=1">

   <link rel="stylesheet" href="css/style.css">
   <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
   <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

   <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

   <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

   <script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>
   <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>


   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.17.4/dist/css/uikit.min.css" />

   <script src="https://cdn.jsdelivr.net/npm/uikit@3.17.4/dist/js/uikit.min.js"></script>
   <script src="https://cdn.jsdelivr.net/npm/uikit@3.17.4/dist/js/uikit-icons.min.js"></script>

   <link rel="icon" type="image/jpg" href="favicon.png" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">

    <title>Home | Semana de Ingeniería 2023</title>
</head>

<body>
<header>
    <div class="logo"><a href="<%=request.getContextPath()%>/user_home"><img class="logo-img" src='images/logo_topbar.png' alt="logo"></a></div>

    <div class="bars">
        <div class="line"></div>
        <div class="line"></div>
        <div class="line"></div>
    </div>

    <nav class="nav-bar">
        <ul>
            <li>
                <a href="<%=request.getContextPath()%>/user_home" style="margin-bottom: -15px">Inicio</a>
            </li>

            <li class="nav-item dropdown" style="margin-top: 20px">
                <form method="get" id="eventForm" action="<%=request.getContextPath()%>/user_home">
                    <select name="action" class="navbar-dropdwon form-select border-0" style="font-size: 0.9rem" id="eventSelect" onchange="submitForm()">
                        <option style="font-size: 0.9rem; display:none;">Ver Eventos</option>
                        <option style="font-size: 0.9rem; color:black" value="events&id=self">Inscrito</option>
                        <option style="font-size: 0.9rem; color:black" value="events&id=prox">Próximos</option>
                        <option style="font-size: 0.9rem; color:black" value="events&id=end">Acabados</option>
                    </select>
                </form>
            </li>

            <li>
                <a href="<%=request.getContextPath()%>/user_home?action=donate" class="active">Donaciones</a>
            </li>
            <li>
                <a href="#"><i class="fa-solid fa-user nav-icon2"></i><%=user.getNombres() + " " + user.getApellidos()%></a>
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
            <h1 class="display-5 fw-bold text-white" style="font-family: 'Poppins', sans-serif">Contamos con tu Apoyo!</h1>
            <div style="margin-bottom: 10px"></div>
            <h3 class="fw-bold text-white" style="font-family: 'Poppins', sans-serif">Realiza tu donativo a la Fibra Tóxica, sé un hincha de corazón</h3>
            <div style="margin-bottom: 10px"></div>
        </div>
    </div>
</div>



<div class="container">

    <div style="margin-bottom: 50px"></div>

    <div class="card">
        <div class="card-body">
            <h2><strong style="padding-left: 10px">Indicaciones para Donar</strong></h2>
            <hr style="border-top: 1px solid #262626;">
            <p class="w-lg-50" style="text-align: left;">Gracias por considerar realizar una donación. Para realiza una donacion a la AITEL deberá depositar (mediante PLIN o YAPE) el dinero que desee teniendo las siguiente consideraciones:</p>
            <ul style="text-align: left;">
                <li style="text-align: left; list-style: circle !important;">Si usted es egresado, el monto mínimo de donación es de s/.100</li>
                <li style="text-align: left; list-style: circle !important;">Si usted es alumno, no hay cantidad mínima de donación</li>
            </ul>


            <h2><strong style="padding-left: 10px">Métodos de Donación</strong></h2>
            <hr style="border-top: 1px solid #262626;">
            <p class="w-lg-50" style="text-align: left;">Puede realizar una donacion a la AITEL mediante los siguientes métodos de pago:</p>
            <div style="margin-bottom: 30px"></div>

            <div class="row">
                <div class="col text-start">
                    <div class="row">
                        <div class="col text-center"><img src="images/yape.png" width="240"></div>
                        <div class="col text-center">
                            <figure class="figure"><img class="figure-img" src="images/qr.jpg" width="220">
                                <figcaption class="figure-caption text-break" style="font-weight: bold;">
                                    <h6 style="font-family: 'Poppins', sans-serif">Yapea al <bold>933154550</bold></h6>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                </div>

                <div class="col text-start">
                    <div class="row">
                        <div class="col text-center"><img src="images/plin.png" width="240"></div>
                        <div class="col text-center">
                            <figure class="figure"><img class="figure-img" src="images/qr.jpg" width="220">
                                <figcaption class="figure-caption text-break" style="font-weight: bold;">
                                    <h6 style="font-family: 'Poppins', sans-serif">Yapea al <bold>933154550</bold></h6>
                                </figcaption>
                            </figure>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>


    <div class="uk-container uk-margin-top uk-margin-bottom">

        <div style="margin-bottom: 50px"></div>

        <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px">Mis Donaciones</strong></h2>

        <div style="margin-bottom: 20px"></div>

        <!-- Button trigger modal -->
        <button type="button" style="margin-left: 40px" class="btn btn-outline-primary btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal">
            Ver mis donaciones
        </button>


        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog  modal-xl">
                <div class="modal-content">


                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Mis Donaciones</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">

                        <%if (!listaDonaciones.isEmpty()) { %>

                        <div class="row">
                            <% int contador = 0; %>
                            <%for (Donaciones donacion : listaDonaciones) {
                            %>

                            <div class="col-sm-4 mb-4">
                                <div class="card-list">
                                    <article class="card">


                                        <figure class="card-image">
                                            <img class="image-event" src="<%=request.getContextPath()%>/user_home?action=imagenDonacionPorUsuario&idDonacion=<%=donacion.getIdDonaciones()%>" style="object-fit: cover; height: 80%; width: 100%;"/>
                                        </figure>





                                        <div class="card-footer">

                                            <label>Fecha y Hora de Donación: </label>
                                            <div class="row">

                                                <div class="col-md-7">
                                                    <div class="card-meta card-meta--date">
                                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="Calendar">
                                                            <rect x="2" y="4" width="20" height="18" rx="4"></rect>
                                                            <path d="M8 2v4"></path>
                                                            <path d="M16 2v4"></path>
                                                            <path d="M2 10h20"></path>
                                                        </svg>
                                                        <%=donacion.getFechaDonacion().split(" ")[0]%>
                                                    </div>

                                                </div>
                                                <div class="col-md-3">
                                                    <div class="card-meta card-meta--date">
                                                        <img width="18" height="20" src="https://img.icons8.com/ios/50/5C5C5C/clock--v1.png" alt="clock--v1"/>
                                                        <%=donacion.getFechaDonacion().split(" ")[1]%>
                                                    </div>

                                                </div>


                                            </div>

                                        </div>


                                    </article>
                                </div>
                            </div>

                                <% contador++; %>
                                <% if (contador % 3 == 0) { %>
                                </div><div class="row">
                                <% } %>
                            <%}%>

                        </div>
                        <%}else { %>
                        <br>
                        <br>
                        <br>
                        <h2 style="text-align: center;">Aún no has realizado donaciones</h2>
                        <br>
                        <br>
                        <%} %>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" data-bs-dismiss="modal">Cerrar</button>
                    </div>


                </div>
            </div>
        </div>


        <div style="margin-bottom: 20px"></div>

    </div>



    <div class="uk-container uk-margin-top uk-margin-bottom">

        <div style="margin-bottom: 0px"></div>

        <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px">Nueva Donación</strong></h2>

        <div style="margin-bottom: 20px"></div>

        <!-- Button trigger modal -->
        <button type="button" style="margin-left: 40px" class="btn btn-outline-primary btn-lg" data-bs-toggle="modal" data-bs-target="#exampleModal2">
            Donar
        </button>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog  modal-lg">
                <div class="modal-content">


                    <form method="post" action="<%=request.getContextPath()%>/user_home?action=donate" enctype="multipart/form-data">


                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Nueva Donación</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>



                        <div class="modal-body">
                            <div style="padding-top: 1.5em;"></div>

                            <div class="row">
                                <div class="col-md-3">
                                    <div class="form-group" style="padding-right: 1rem">
                                        <label style="text-align: left;"><strong>Monto a donar:</strong></label>
                                        <input name="monto" type="number" class="form-control" step="0.1" inputmode="decimal" required>
                                    </div>
                                </div>
                            </div>



                            <div style="padding-top: 10px;"></div>



                            <div class="container" style="padding-left: 6rem; padding-right: 6rem">
                                <div class="uk-upload-box">
                                    <div id="error-alert" class="uk-alert-danger uk-margin-top uk-hidden" uk-alert>
                                        <p id="error-messages"></p>
                                    </div>

                                    <div class="drop__zone uk-placeholder uk-text-center">
                                        <span uk-icon="icon: cloud-upload"></span>
                                        <span class="uk-text-middle uk-margin-small-left">Adjunte arrastrando el archivo o</span>
                                        <div uk-form-custom>
                                            <input type="file" name="fileFoto" accept="image/png, image/jpeg, application/pdf, application/vnd.openxmlformats-officedocument.wordprocessingml.document" required>
                                            <span class="uk-link">seleccione la captura</span>
                                        </div>
                                        <ul id="preview" class="uk-list uk-grid-match uk-child-width-1-2 uk-child-width-1-4@l uk-child-width-1-5@xl uk-text-center" uk-grid uk-scrollspy="cls: uk-animation-scale-up; target: .list-item; delay: 80"></ul>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <div class="modal-footer">
                            <div class="uk-flex uk-flex-center uk-margin-top">
                                <div class="uk-flex uk-flex-center">
                                    <button type="submit"  class="btn btn-primary m-2">Confirmar Donación</button>
                                    <button type="button" class="btn btn-secondary m-2" data-bs-dismiss="modal">Cancelar</button>
                                </div>
                            </div>
                        </div>


                    </form>

                </div>
            </div>
        </div>


        <div style="margin-bottom: 20px"></div>



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
    function submitForm() {
        var selectElement = document.getElementById("eventSelect");
        var selectedValue = selectElement.value;
        if (selectedValue) {
            var newURL = "<%=request.getContextPath()%>/user_home?action=" + selectedValue;
            window.location.href = newURL;
        }
    }
</script>
<script src="js/upload.js"></script>
<script src="js/bootstrap/bootstrap.js"></script>
<script src="script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>


</body>
</html>

