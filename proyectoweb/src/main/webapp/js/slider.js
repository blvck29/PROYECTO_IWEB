function cambiarImagenSegunResolucion() {
    const slide1 = document.getElementById("slide1");
    const slide2 = document.getElementById("slide2");
    const slide3 = document.getElementById("slide3");
    const windowWidth = window.innerWidth;

    if (windowWidth <= 460 && windowWidth > 0) {
        slide1.src = slide1.getAttribute("data-src-xsmall");
        slide2.src = slide2.getAttribute("data-src-xsmall");
        slide3.src = slide3.getAttribute("data-src-xsmall");
    } else if (windowWidth <= 768 && windowWidth > 460) {
        slide1.src = slide1.getAttribute("data-src-small");
        slide2.src = slide2.getAttribute("data-src-small");
        slide3.src = slide3.getAttribute("data-src-small");
    } else if (windowWidth <= 1260 && windowWidth > 768) {
        slide1.src = slide1.getAttribute("data-src-medium");
        slide2.src = slide2.getAttribute("data-src-medium");
        slide3.src = slide3.getAttribute("data-src-medium");
    } else if (windowWidth > 1260) {
        slide1.src = slide1.getAttribute("data-src-large");
        slide2.src = slide2.getAttribute("data-src-large");
        slide3.src = slide3.getAttribute("data-src-large");
    }
}

var carousel = document.getElementById("myCarousel");

// Escuchar el evento de cambio de slide
carousel.addEventListener("slid.bs.carousel", function (event) {
    cambiarImagenSegunResolucion();
});

// Llamar a la función cuando se carga la página y cuando se redimensiona la ventana
window.addEventListener("load", cambiarImagenSegunResolucion);
window.addEventListener("resize", cambiarImagenSegunResolucion);