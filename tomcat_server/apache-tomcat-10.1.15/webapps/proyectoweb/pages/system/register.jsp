<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="es">
<head>
    <meta http-equiv="Content-Type" content=text/html; charset=ISO-8859-1″>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="../../css/style.css">
    <link rel="stylesheet" href="../../css/bootstrap/bootstrap.css">

    <script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>
    <link rel="icon" type="image/jpg" href="../../favicon.png"/>
    <title>Semana de Ingeniería 2023</title>
</head>


<body>

<section class="index">

    <div class="register-container">

        <div class="register-form">
            <form action="../../index.jsp" method="POST" id="register-formulario">
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
                <div class="register-input">
                    <input type="text email" id="email" name="email" required>
                    <label for="email">Correo PUCP <t class="t-light">(codigo@pucp.edu.pe)</t></label>
                </div>

                <div class="register-checkbox">
                    <input type="checkbox" id="condition" name="condition" value="condit">
                    <label for="condition">Soy egresado PUCP</label>
                </div>

                <div class="register-input">
                    <input type="text" id="password" name="password" required>
                    <label for="password">Contraseña <t class="t-light">(mínimo 8 carácteres)</t></label>
                </div>
                <div class="register-input">
                    <input type="password" id="passwordconf" name="passwordconf" required>
                    <label for="passwordconf">Confirmar contraseña</label>
                </div>

                <a href="../../index.jsp"><input type="submit" value="Registrarse" class="register-button"></a>

                <div class="register-back">
                    <label><a href="../../index.jsp">Regresar</a></label>
                </div>


            </form>

        </div>
    </div>

    <div class="container-fluid footer-container"><p>© Pontificia Universidad Católica del Perú - Todos los derechos reservados</p></div>

</section>


</body>
</html>