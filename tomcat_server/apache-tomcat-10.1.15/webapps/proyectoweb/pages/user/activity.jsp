<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


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

    <title>Home | Semana de Ingeniería 2023</title>
</head>

<body>
<header>
    <div class="logo"><a href="home.jsp"><img class="logo-img" src='../../images/logo_topbar.png' alt="logo"></a></div>

    <div class="bars">
        <div class="line"></div>
        <div class="line"></div>
        <div class="line"></div>
    </div>

    <nav class="nav-bar">
        <ul>
            <li>
                <a href="home.jsp" class="active">Eventos</a>
            </li>
            <li>
                <a href="events.jsp">Mis Eventos</a>
            </li>
            <li>
                <a href="donate.jsp">Donaciones</a>
            </li>
            <li>
                <a href="#"><i class="fa-solid fa-user nav-icon2"></i>Usuario</a>
            </li>
            <li>
                <a href="../../index.jsp"><i class="fa-solid fa-door-open nav-icon2"></i>Cerrar Sesión</a>
            </li>
        </ul>
    </nav>


</header>



<div class="container-fluid" style="padding-left:0 !important; padding-right: 0 !important; background: rgb(45,0,83) !important;
background: radial-gradient(circle, rgba(45,0,83,1) 0%, rgba(35,3,80,1) 59%, rgba(21,0,48,1) 100%) !important;")>
    <div class="text-secondary px-4 py-5 text-center">
        <div class="py-5">
            <h1 class="display-5 fw-bold text-white">Bienvenido, @Admin_act</h1>
            <div style="margin-bottom: 20px"></div>
            <h3 class="fw-bold text-white">Todo comienza aquí, crea un evento nuevo...</h3>
            <div style="margin-bottom: 20px"></div>
            <div class="justify-content-sm-center">
                <button type="button" class="btn btn-outline-info btn-lg px-4">
                    <a href="create.jsp" class="link-info link-opacity">Crear Evento</a>
                </button>
            </div>
        </div>
    </div>
</div>






<div class="container">

    <div style="margin-bottom: 50px"></div>

    <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px">Eventos de Actividad</strong></h2>

    <div style="margin-bottom: 40px"></div>




    <div class="row align-content-center" data-masonry='{"percentPosition": true }'>
        <div class="col-sm-6 col-lg-3 mb-4">

            <div class="card-list">
                <article class="card">
                    <figure class="card-image">
                        <img class="image-event" src="../../images/placeholder_events.jpg" alt="An orange painted blue, cut in half laying on a blue background" />
                    </figure>
                    <div class="card-header">
                        <a href="#">Partido de Valorant<p>Fibra Tóxica vs. Electroshock</p></a>

                    </div>
                    <div class="card-footer">
                        <div class="card-meta card-meta--views">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="8" r="4"></circle>
                                <path d="M18 21v-2a4 4 0 0 0-4-4H10a4 4 0 0 0-4 4v2"></path>
                            </svg>
                            5
                        </div>
                        <div class="card-meta card-meta--date">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="Calendar">
                                <rect x="2" y="4" width="20" height="18" rx="4"></rect>
                                <path d="M8 2v4"></path>
                                <path d="M16 2v4"></path>
                                <path d="M2 10h20"></path>
                            </svg>
                            18 Oct, 2023
                        </div>
                    </div>
                </article>
            </div>

        </div>


        <div class="col-sm-6 col-lg-3 mb-4">

            <div class="card-list">
                <article class="card">
                    <figure class="card-image">
                        <img class="image-event" src="../../images/placeholder_events.jpg" alt="An orange painted blue, cut in half laying on a blue background" />
                    </figure>
                    <div class="card-header">
                        <a href="#">Partido de Valorant <p>Fibra Tóxica vs. Electroshock</p></a>
                    </div>
                    <div class="card-footer">
                        <div class="card-meta card-meta--views">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="8" r="4"></circle>
                                <path d="M18 21v-2a4 4 0 0 0-4-4H10a4 4 0 0 0-4 4v2"></path>
                            </svg>
                            5
                        </div>
                        <div class="card-meta card-meta--date">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="Calendar">
                                <rect x="2" y="4" width="20" height="18" rx="4"></rect>
                                <path d="M8 2v4"></path>
                                <path d="M16 2v4"></path>
                                <path d="M2 10h20"></path>
                            </svg>
                            18 Oct, 2023
                        </div>
                    </div>
                </article>
            </div>

        </div>


        <div class="col-sm-6 col-lg-3 mb-4">

            <div class="card-list">
                <article class="card">
                    <figure class="card-image">
                        <img class="image-event" src="../../images/placeholder_events.jpg" alt="An orange painted blue, cut in half laying on a blue background" />
                    </figure>
                    <div class="card-header">
                        <a href="#">Partido de Valorant <p>Fibra Tóxica vs. Electroshock</p></a>
                    </div>
                    <div class="card-footer">
                        <div class="card-meta card-meta--views">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="8" r="4"></circle>
                                <path d="M18 21v-2a4 4 0 0 0-4-4H10a4 4 0 0 0-4 4v2"></path>
                            </svg>
                            5
                        </div>
                        <div class="card-meta card-meta--date">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="Calendar">
                                <rect x="2" y="4" width="20" height="18" rx="4"></rect>
                                <path d="M8 2v4"></path>
                                <path d="M16 2v4"></path>
                                <path d="M2 10h20"></path>
                            </svg>
                            18 Oct, 2023
                        </div>
                    </div>
                </article>
            </div>

        </div>


        <div class="col-sm-6 col-lg-3 mb-4">

            <div class="card-list">
                <article class="card">
                    <figure class="card-image">
                        <img class="image-event" src="../../images/placeholder_events.jpg" alt="An orange painted blue, cut in half laying on a blue background" />
                    </figure>
                    <div class="card-header">
                        <a href="#">Partido de Valorant <p>Fibra Tóxica vs. Electroshock</p></a>
                    </div>
                    <div class="card-footer">
                        <div class="card-meta card-meta--views">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="8" r="4"></circle>
                                <path d="M18 21v-2a4 4 0 0 0-4-4H10a4 4 0 0 0-4 4v2"></path>
                            </svg>
                            5
                        </div>
                        <div class="card-meta card-meta--date">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="Calendar">
                                <rect x="2" y="4" width="20" height="18" rx="4"></rect>
                                <path d="M8 2v4"></path>
                                <path d="M16 2v4"></path>
                                <path d="M2 10h20"></path>
                            </svg>
                            18 Oct, 2023
                        </div>
                    </div>
                </article>
            </div>

        </div>


        <div class="col-sm-6 col-lg-3 mb-4">

            <div class="card-list">
                <article class="card">
                    <figure class="card-image">
                        <img class="image-event" src="../../images/placeholder_events.jpg" alt="An orange painted blue, cut in half laying on a blue background" />
                    </figure>
                    <div class="card-header">
                        <a href="#">Partido de Valorant <p>Fibra Tóxica vs. Electroshock</p></a>
                    </div>
                    <div class="card-footer">
                        <div class="card-meta card-meta--views">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="8" r="4"></circle>
                                <path d="M18 21v-2a4 4 0 0 0-4-4H10a4 4 0 0 0-4 4v2"></path>
                            </svg>
                            5
                        </div>
                        <div class="card-meta card-meta--date">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="Calendar">
                                <rect x="2" y="4" width="20" height="18" rx="4"></rect>
                                <path d="M8 2v4"></path>
                                <path d="M16 2v4"></path>
                                <path d="M2 10h20"></path>
                            </svg>
                            18 Oct, 2023
                        </div>
                    </div>
                </article>
            </div>

        </div>


        <div class="col-sm-6 col-lg-3 mb-4">

            <div class="card-list">
                <article class="card">
                    <figure class="card-image">
                        <img class="image-event" src="../../images/placeholder_events.jpg" alt="An orange painted blue, cut in half laying on a blue background" />
                    </figure>
                    <div class="card-header">
                        <a href="#">Partido de Valorant <p>Fibra Tóxica vs. Electroshock</p></a>
                    </div>
                    <div class="card-footer">
                        <div class="card-meta card-meta--views">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="8" r="4"></circle>
                                <path d="M18 21v-2a4 4 0 0 0-4-4H10a4 4 0 0 0-4 4v2"></path>
                            </svg>
                            5
                        </div>
                        <div class="card-meta card-meta--date">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="Calendar">
                                <rect x="2" y="4" width="20" height="18" rx="4"></rect>
                                <path d="M8 2v4"></path>
                                <path d="M16 2v4"></path>
                                <path d="M2 10h20"></path>
                            </svg>
                            18 Oct, 2023
                        </div>
                    </div>
                </article>
            </div>

        </div>


        <div class="col-sm-6 col-lg-3 mb-4">

            <div class="card-list">
                <article class="card">
                    <figure class="card-image">
                        <img class="image-event" src="../../images/placeholder_events.jpg" alt="An orange painted blue, cut in half laying on a blue background" />
                    </figure>
                    <div class="card-header">
                        <a href="#">Partido de Valorant <p>Fibra Tóxica vs. Electroshock</p></a>
                    </div>
                    <div class="card-footer">
                        <div class="card-meta card-meta--views">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="8" r="4"></circle>
                                <path d="M18 21v-2a4 4 0 0 0-4-4H10a4 4 0 0 0-4 4v2"></path>
                            </svg>
                            5
                        </div>
                        <div class="card-meta card-meta--date">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="Calendar">
                                <rect x="2" y="4" width="20" height="18" rx="4"></rect>
                                <path d="M8 2v4"></path>
                                <path d="M16 2v4"></path>
                                <path d="M2 10h20"></path>
                            </svg>
                            18 Oct, 2023
                        </div>
                    </div>
                </article>
            </div>

        </div>


        <div class="col-sm-6 col-lg-3 mb-4">

            <div class="card-list">
                <article class="card">
                    <figure class="card-image">
                        <img class="image-event" src="../../images/placeholder_events.jpg" alt="An orange painted blue, cut in half laying on a blue background" />
                    </figure>
                    <div class="card-header">
                        <a href="#">Partido de Valorant <p>Fibra Tóxica vs. Electroshock</p></a>
                    </div>
                    <div class="card-footer">
                        <div class="card-meta card-meta--views">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                <circle cx="12" cy="8" r="4"></circle>
                                <path d="M18 21v-2a4 4 0 0 0-4-4H10a4 4 0 0 0-4 4v2"></path>
                            </svg>
                            5
                        </div>
                        <div class="card-meta card-meta--date">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="Calendar">
                                <rect x="2" y="4" width="20" height="18" rx="4"></rect>
                                <path d="M8 2v4"></path>
                                <path d="M16 2v4"></path>
                                <path d="M2 10h20"></path>
                            </svg>
                            18 Oct, 2023
                        </div>
                    </div>
                </article>
            </div>

        </div>
    </div>


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
    $(document).ready(function(){
        $('.carousel-act').slick({
            slidesToShow: 3,
            centerMode: true,
            responsive: [
                {
                    breakpoint: 1400, // Cuando el ancho de la pantalla sea 768px o menos
                    settings: {
                        slidesToShow: 2, // Cambia a mostrar solo 1 diapositiva
                    }
                },
                {
                    breakpoint: 1000, // Cuando el ancho de la pantalla sea 992px o menos
                    settings: {
                        slidesToShow: 1, // Cambia a mostrar 2 diapositivas
                    }
                }
            ]
        });
    });
</script>


<script src="../../js/slider.js"></script>
<script src="../../js/bootstrap/bootstrap.js"></script>
<script src="../../js/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>



</body>

</html>