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
        iconColor: '#5D1BB2',
        title: "¡Felicidades!",
        text: msg,
        confirmButtonColor: '#5D1BB2',
        confirmButtonText: "Cerrar",
    });
}
