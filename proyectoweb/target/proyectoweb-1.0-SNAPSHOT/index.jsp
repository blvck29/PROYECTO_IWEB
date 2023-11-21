<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>





<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content=text/html; charset=ISO-8859-1″>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
    <link rel="icon" type="image/jpg" href="favicon.png"/>

    <script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>

    <title>Login | Semana de Ingeniería 2023</title>
</head>
<body>
<section class="index">

    <div class="login-container">

        <div class="login-form">
            <form method="POST" action="<%=request.getContextPath()%>/login?action=login">
                <h2>Iniciar Sesión</h2>
                <div class="login-input">
                    <i class="fa-solid fa-envelope"></i>
                    <input type="email" id="email" name="email" required>
                    <label for="email">Email</label>
                </div>

                <div class="login-input">
                    <i class="fa-solid fa-lock"></i>
                    <input type="password" id="passwd" name="passwd" required>
                    <label for="passwd">Contraseña</label>
                </div>

                <div class="login-forgot">
                    <label><a href="<%=request.getContextPath()%>/login?action=forgot_passwd">¿Olvidó su contraseña?</a></label>
                </div>

                <% if (request.getAttribute("err") != null) {%>
                <div class="alert alert-danger" role="alert"><%=request.getAttribute("err")%>
                </div>
                <% } %>

                <a href="#"><input type="submit" value="Acceder" class="login-button"></a>

            </form>

            <div>
                <div class="login-register">
                    <p>¿No tiene cuenta? <a href="<%=request.getContextPath()%>/login?action=register"> Registrarse</a></p>
                </div>
            </div>
        </div>
    </div>

    <div class="container-fluid footer-container"><p>© Pontificia Universidad Católica del Perú - Todos los derechos reservados</p></div>

</section>
</body>
</html>