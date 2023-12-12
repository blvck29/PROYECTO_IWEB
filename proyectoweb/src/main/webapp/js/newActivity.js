const nombre = document.getElementById("nombreAct")
const form = document.getElementById("form")



let titulosActividad = [];
async function obtenerDatosDelServidor() {
    try {
        const response = await fetch('/proyectoweb/admin_gen?action=obtenerDatosCrearActividad');
        if (!response.ok) {
            throw new Error('Error al obtener los datos del servidor');
        }
        const data = await response.json();
        titulosActividad = data.titulosActividad || [];

    } catch (error) {
        console.error('Error al obtener datos del servidor:', error);
    }
}
obtenerDatosDelServidor();




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
        else{
        //Envia el form al servlet
        }
})


