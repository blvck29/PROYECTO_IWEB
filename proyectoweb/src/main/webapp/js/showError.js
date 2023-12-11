function showError(errorMessage) {
    Swal.fire({
        icon: 'error',
        title: 'ERROR:',
        iconColor: '#DC3545',
        confirmButtonColor: '#DC3545',
        confirmButtonText: "Regresar",
        text: errorMessage,
        footer: '<a href="">Volver a ingresar los datos</a>'
    });
}

function showErrorDonation(errorMessage) {
    Swal.fire({
        icon: 'error',
        title: 'ERROR:',
        iconColor: '#DC3545',
        confirmButtonColor: '#DC3545',
        confirmButtonText: "Cerrar",
        text: errorMessage,
    });
}


function kitTeleco(msg) {
    Swal.fire({
        position: "center",
        icon: "success",
        iconColor: '#481A84',
        title: "¡Felicidades!",
        text: msg,
        confirmButtonColor: '#481A84',
        confirmButtonText: "Cerrar",
    });
}

function donacionCorrecta(msg) {
    Swal.fire({
        position: "center",
        icon: "success",
        iconColor: '#481A84',
        title: "¡Felicidades!",
        text: msg,
        confirmButtonColor: '#481A84',
        confirmButtonText: "Cerrar",
    });
}


function tokenError(errorMessage) {
    Swal.fire({
        icon: 'error',
        title: 'ERROR:',
        iconColor: '#DC3545',
        confirmButtonColor: '#DC3545',
        confirmButtonText: "Volver a ingresar Token",
        text: errorMessage,
    });
}

function showErrorForgetPassErrorEmail(errorMessage) {
    Swal.fire({
        icon: 'error',
        title: 'CORREO INVÁLIDO:',
        iconColor: '#DC3545',
        confirmButtonColor: '#DC3545',
        confirmButtonText: "Volver a ingresar correo",
        text: errorMessage,
    });
}


function showErrorEmailRechazado(errorMessage) {
    Swal.fire({
        icon: 'error',
        title: 'ERROR:',
        iconColor: '#DC3545',
        confirmButtonColor: '#DC3545',
        confirmButtonText: "Cerrar",
        text: errorMessage,
    });
}


function nuevaContrasena(msg) {
    Swal.fire({
        position: "center",
        icon: "success",
        iconColor: '#481A84',
        title: "¡Felicidades!",
        text: msg,
        confirmButtonColor: '#481A84',
        confirmButtonText: "Cerrar",
    });
}

function showErrorLogin(errorMessage) {
    Swal.fire({
        icon: 'error',
        title: 'ERROR:',
        iconColor: '#DC3545',
        confirmButtonColor: '#DC3545',
        confirmButtonText: "Volver a ingresar los datos",
        text: errorMessage,
    });
}