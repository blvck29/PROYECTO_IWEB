<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html lang="es">

<head>
    <meta http-equiv="Content-Type" content=text/html; charset=ISO-8859-1″>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">

    <script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>
    <link rel="icon" type="image/jpg" href="favicon.png"/>

    <link rel="stylesheet" href="css/forms.css" >

    <title>Semana de Ingeniería 2023</title>
</head>


<body>

<section class="index">

    <div class="register-container">

        <div class="register-form">
            <form action="<%=request.getContextPath()%>/login?action=confirm_register" method="POST" >
                <h2>Registrarse</h2>

                        <div class="register-input">
                            <input type="text" id="names" name="names" required>
                            <label for="names">Nombres</label>
                        </div>

                        <div class="register-input">
                            <input type="text" id="lastnames" name="lastnames" required>
                            <label for="lastnames">Apellidos</label>
                        </div>

                        <div class="register-input">
                            <input type="number" id="code" name="code" required>
                            <label for="code">Código PUCP</label>
                        </div>


                        <div style="margin-bottom:10px" class="register-input">
                            <input type="text email" id="email" name="email" required>
                            <label for="email">Correo PUCP <t class="t-light">(codigo@pucp.edu.pe)</t></label>
                        </div>


                        <div style="display: flex; justify-content: space-between; margin-top:10px;">
                            <div style="width: 200px" class="register-checkbox">
                                <input type="checkbox" id="condition" name="condition" value="condit">
                                <label for="condition">Soy egresado PUCP</label>
                            </div>

                            <div style="width: 150px; margin-bottom: 10px; margin-top:10px" class="register-checkbox">
                                <p>Género biológico:</p>
                                <input type="radio" id="male" name="male" value="M">
                                <label for="male">Masculino</label><br>
                                <input type="radio" id="female" name="male" value="F">
                                <label for="female">Femenino</label>
                            </div>
                        </div>

                        <div class="register-input">
                            <input type="password" id="password" name="password" required>
                            <label for="password">Contraseña <t class="t-light">(mínimo 8 caracteres)</t></label>
                        </div>
                        <div class="register-input">
                            <input type="password" id="passwordconf" name="passwordconf" required>
                            <label for="passwordconf">Confirmar contraseña</label>
                        </div>


                <input type="submit" value="Registrarse" class="register-button">

                <div class="register-back">
                    <label><a href="<%=request.getContextPath()%>/login">Regresar</a></label>

                </div>
                <br><br>

            </form>
        </div>
    </div>

    <div class="container-fluid footer-container"><p>© Pontificia Universidad Católica del Perú - Todos los derechos reservados</p></div>

</section>


<script>
    (() => {
        'use strict'

        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        const forms = document.querySelectorAll('.needs-validation')

        // Loop over them and prevent submission
        Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {
                if (!form.checkValidity()) {
                    event.preventDefault()
                    event.stopPropagation()
                }

                form.classList.add('was-validated')
            }, false)
        })
    })()
</script>


<script src="js/validarForms.js"></script>

</body>
</html>