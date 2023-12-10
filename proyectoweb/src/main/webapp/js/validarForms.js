const form = document.getElementById("form");
const usuario = document.getElementById("username");
const lastnames = document.getElementById("lastname");
const codigo = document.getElementById("codigo");
const email = document.getElementById("email");
const password = document.getElementById("password");
const password2 = document.getElementById("password2");
const genero = document.getElementById("genero");
const estadoAcademico = document.getElementById("estadoAcademico");





let correosUsados2 = [];
let codigosUsados2 = [];


async function obtenerDatosDelServidor() {
    try {
        const response = await fetch('/proyectoweb/login?action=obtenerDatos');
        if (!response.ok) {
            throw new Error('Error al obtener los datos del servidor');
        }
        const data = await response.json();
        correosUsados2 = data.correos || [];
        codigosUsados2 = data.codigos || [];

    } catch (error) {
        console.error('Error al obtener datos del servidor:', error);
    }
}
obtenerDatosDelServidor();


form.addEventListener("submit", (e) => {
    e.preventDefault();

    if (checkInputs(correosUsados2, codigosUsados2)) {
        form.submit();
    }
});


function checkInputs(correosUsados2, codigosUsados2) {

    function setErrorFor(input, message) {
        const formControl = input.parentElement;
        const small = formControl.querySelector("small");
        formControl.className = "form123-control error";
        small.innerText = message;
        hasErrors = true;
    }

    function setSuccessFor(input) {
        const formControl = input.parentElement;
        formControl.className = "form123-control success";
    }



    let hasErrors = false;

    // trim to remove the whitespaces
    const usuarioValue = usuario.value.trim();
    const lastnameValue = lastnames.value.trim();
    const codigoValue = codigo.value.trim();
    const emailValue = email.value.trim();
    const passwordValue = password.value.trim();
    const password2Value = password2.value.trim();
    const generoValue = genero.value.trim();
    const estadoAcademicoValue = estadoAcademico.value.trim();




    if (usuarioValue === "") {
        setErrorFor(usuario, "No puedes dejar en blanco este campo");
    } else {
        setSuccessFor(usuario);
    }


    if (lastnameValue === "") {
        setErrorFor(lastnames, "No puedes dejar en blanco este campo");
    } else {
        setSuccessFor(lastnames);
    }



    if (codigoValue === "") {
        setErrorFor(codigo, "No puedes dejar en blanco este campo");
    } else if (codigoValue.length !== 8) {
        setErrorFor(codigo, "El código debe tener 8 dígitos");
    }else if (codigosUsados2.includes(codigoValue)) {
        setErrorFor(codigo, "Este código ya está registrado");
    } else {
        setSuccessFor(codigo);
    }


    if (emailValue === "") {
        setErrorFor(email, "No puede dejar el email en blanco");
    } else if (!isEmail(emailValue)) {
        setErrorFor(email, "Debe ingresar un correo PUCP");
    } else if (correosUsados2.includes(emailValue)) {
        setErrorFor(email, "Este correo ya está registrado");
    } else {
        setSuccessFor(email);
    }

    if (passwordValue === "") {
        setErrorFor(password, "No puedes dejar en blanco este campo");
    } else {
        setSuccessFor(password);
    }

    if (password2Value === "") {
        setErrorFor(password2, "No puedes dejar en blanco este campo");
    } else if (passwordValue !== password2Value) {
        setErrorFor(password2, "Las contraseñas no coinciden");
    } else {
        setSuccessFor(password2);
    }

    if (generoValue === "noGenero") {
        setErrorFor(genero, "No puedes dejar en blanco este campo");
    } else {
        setSuccessFor(genero);
    }

    if (estadoAcademicoValue === "noAcademic") {
        setErrorFor(estadoAcademico, "No puedes dejar en blanco este campo");
    } else {
        setSuccessFor(estadoAcademico);
    }



    return !hasErrors;
}



function isEmail(email) {
    return /^[^\s@]+@pucp\.edu\.pe$/.test(email);
}
