<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content=text/html; charset=ISO-8859-1″>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="../../../css/style.css">
    <link rel="stylesheet" href="../../../css/bootstrap/bootstrap.css">

    <script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>
    <link rel="icon" type="image/jpg" href="../../../favicon.png"/>
    <title>Semana de Ingeniería 2023</title>
</head>


<body>

<section class="index">

    <div class="forgot-container">

        <div class="forgot-form">
            <form action="token.jsp" method="POST" id="forgot-formulario">
                <h2>Recuperar Contraseña</h2>

                <div class="forgot-input">
                    <i class="fa-solid fa-envelope"></i>
                    <input type="text email" id="email" name="email" required>
                    <label for="email">Correo de Recuperación</label>
                </div>

                <a href="token.jsp"><input type="submit" value="Enviar Correo" class="forgot-button"></a>

                <div class="forgot-back">
                    <label><a href="../../../index.jsp">Regresar</a></label>
                </div>

            </form>

        </div>
    </div>

    <div class="container-fluid footer-container"><p>© Pontificia Universidad Católica del Perú - Todos los derechos reservados</p></div>

</section>


</body>
</html>