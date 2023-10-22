<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<!doctype html>
<html lang="es">

<head>
    <meta http-equiv="Content-Type" content=text/html; charset=ISO-8859-1″>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">

    <script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>

    <link rel="icon" type="image/jpg" href="../../favicon.png" />

    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <!-- Add the slick-theme.css if you want default styling -->
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

    <title>Home | Semana de Ingeniería 2023</title>
</head>

<body>
<header>
    <div class="logo"><a href="#"><img class="logo-img" src='../../images/logo_topbar.png' alt="logo"></a></div>

    <div class="bars">
        <div class="line"></div>
        <div class="line"></div>
        <div class="line"></div>
    </div>

    <nav class="nav-bar">
        <ul>
            <li>
                <a href="#" class="active">Inicio</a>
            </li>
            <li>
                <a href="#">Mis Eventos</a>
            </li>
            <li>
                <a href="#">Donaciones</a>
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





<div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <ol class="carousel-indicators">
        <li data-bs-target="#myCarousel" data-bs-slide-to="0" class="active"></li>
        <li data-bs-target="#myCarousel" data-bs-slide-to="1"></li>
        <li data-bs-target="#myCarousel" data-bs-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <img class="carousel-images" alt="Slide 1" id="slide1"
                 src="../../images/placeholder.jpg"
                 data-src-large="../../images/slide1-large.jpg"
                 data-src-medium="../../images/slide1-medium.jpg"
                 data-src-small="../../images/slide1-small.jpg"
                 data-src-xsmall="../../images/slide1-xsmall.jpg">
        </div>
        <div class="carousel-item">
            <img class="carousel-images" alt="Slide 1" id="slide2"
                 src="../../images/placeholder.jpg"
                 data-src-large="../../images/slide2-large.jpg"
                 data-src-medium="../../images/slide2-medium.jpg"
                 data-src-small="../../images/slide2-small.jpg"
                 data-src-xsmall="../../images/slide2-xsmall.jpg">
        </div>
        <div class="carousel-item">
            <img class="carousel-images" alt="Slide 1" id="slide3"
                 src="../../images/placeholder.jpg"
                 data-src-large="../../images/slide3-large.jpg"
                 data-src-medium="../../images/slide3-medium.jpg"
                 data-src-small="../../images/slide3-small.jpg"
                 data-src-xsmall="../../images/slide3-xsmall.jpg">
        </div>
    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-bs-slide="next">
        <span class="carousel-control-next-icon" ariahidden="true"></span>
        <span class="visually-hidden">Next</span>
    </a>
</div>

<script src="https://cdn.jsdelivr.net/npm/masonry-layout@4.2.2/dist/masonry.pkgd.min.js" integrity="sha384-GNFwBvfVxBkLMJpYMOABq3c+d3KnQxudP/mGPkzpZSTYykLBNsZEnG2D9G/X/+7D" crossorigin="anonymous" async></script>




<div class="container">

    <div style="margin-bottom: 45px"></div>

    <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px">Eventos Destacados</strong></h2>

    <div style="margin-bottom: 25px"></div>

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
                                <circle cx="12" cy="8" r="4" />
                                <path d="M18 21v-2a4 4 0 0 0-4-4H10a4 4 0 0 0-4 4v2" />
                            </svg>
                            5
                        </div>
                        <div class="card-meta card-meta--date">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="Calendar">
                                <rect x="2" y="4" width="20" height="18" rx="4" />
                                <path d="M8 2v4" />
                                <path d="M16 2v4" />
                                <path d="M2 10h20" />
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
                                <circle cx="12" cy="8" r="4" />
                                <path d="M18 21v-2a4 4 0 0 0-4-4H10a4 4 0 0 0-4 4v2" />
                            </svg>
                            5
                        </div>
                        <div class="card-meta card-meta--date">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="Calendar">
                                <rect x="2" y="4" width="20" height="18" rx="4" />
                                <path d="M8 2v4" />
                                <path d="M16 2v4" />
                                <path d="M2 10h20" />
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
                                <circle cx="12" cy="8" r="4" />
                                <path d="M18 21v-2a4 4 0 0 0-4-4H10a4 4 0 0 0-4 4v2" />
                            </svg>
                            5
                        </div>
                        <div class="card-meta card-meta--date">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="Calendar">
                                <rect x="2" y="4" width="20" height="18" rx="4" />
                                <path d="M8 2v4" />
                                <path d="M16 2v4" />
                                <path d="M2 10h20" />
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
                                <circle cx="12" cy="8" r="4" />
                                <path d="M18 21v-2a4 4 0 0 0-4-4H10a4 4 0 0 0-4 4v2" />
                            </svg>
                            5
                        </div>
                        <div class="card-meta card-meta--date">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="Calendar">
                                <rect x="2" y="4" width="20" height="18" rx="4" />
                                <path d="M8 2v4" />
                                <path d="M16 2v4" />
                                <path d="M2 10h20" />
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
                                <circle cx="12" cy="8" r="4" />
                                <path d="M18 21v-2a4 4 0 0 0-4-4H10a4 4 0 0 0-4 4v2" />
                            </svg>
                            5
                        </div>
                        <div class="card-meta card-meta--date">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="Calendar">
                                <rect x="2" y="4" width="20" height="18" rx="4" />
                                <path d="M8 2v4" />
                                <path d="M16 2v4" />
                                <path d="M2 10h20" />
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
                                <circle cx="12" cy="8" r="4" />
                                <path d="M18 21v-2a4 4 0 0 0-4-4H10a4 4 0 0 0-4 4v2" />
                            </svg>
                            5
                        </div>
                        <div class="card-meta card-meta--date">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="Calendar">
                                <rect x="2" y="4" width="20" height="18" rx="4" />
                                <path d="M8 2v4" />
                                <path d="M16 2v4" />
                                <path d="M2 10h20" />
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
                                <circle cx="12" cy="8" r="4" />
                                <path d="M18 21v-2a4 4 0 0 0-4-4H10a4 4 0 0 0-4 4v2" />
                            </svg>
                            5
                        </div>
                        <div class="card-meta card-meta--date">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="Calendar">
                                <rect x="2" y="4" width="20" height="18" rx="4" />
                                <path d="M8 2v4" />
                                <path d="M16 2v4" />
                                <path d="M2 10h20" />
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
                                <circle cx="12" cy="8" r="4" />
                                <path d="M18 21v-2a4 4 0 0 0-4-4H10a4 4 0 0 0-4 4v2" />
                            </svg>
                            5
                        </div>
                        <div class="card-meta card-meta--date">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" display="block" id="Calendar">
                                <rect x="2" y="4" width="20" height="18" rx="4" />
                                <path d="M8 2v4" />
                                <path d="M16 2v4" />
                                <path d="M2 10h20" />
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






    <div style="margin-bottom: 45px"></div>

    <h2><i class="fa-solid fa-star" style="color: #8de7ef;"></i><strong style="padding-left: 10px">Actividades</strong></h2>

    <div style="margin-bottom: 25px"></div>




    <script src="../../js/slider.js"></script>
    <script src="../../js/bootstrap/bootstrap.js"></script>
    <script src="../../js/script.js"></script>

</div>



</body>

</html>