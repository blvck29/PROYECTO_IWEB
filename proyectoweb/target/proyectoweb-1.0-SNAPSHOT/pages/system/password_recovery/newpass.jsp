<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% String token = (String) request.getAttribute("token");%>

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


<%--@declare id="email"--%>

<body>

<section class="index">

    <div class="newpass-container">

        <div class="newpass-form">
            <form method="POST" action="<%=request.getContextPath()%>/login?action=forgot_newpass" id="newpass-formulario">
                <h2>Nueva Contraseña</h2>
                <div class="newpass-input">
                    <i class="fa-solid fa-lock"></i>
                    <input type="text" id="newpass" name="newpass" required>
                    <label for="email">Nueva Contraseña <t class="t-light">(mínimo 8 carácteres)</t></label>
                </div>
                <div class="newpass-input">
                    <i class="fa-solid fa-lock"></i>
                    <input type="password" id="newpassconf" name="newpassconf" required>
                    <label for="email">Confirmar Contraseña</label>
                </div>

                <a href="#"><input type="submit" value="Cambiar Contraseña" class="newpass-button"></a>

                <div class="newpass-back">
                    <label><a href="<%=request.getContextPath()%>/login">Regresar</a></label>
                </div>

            </form>

        </div>
    </div>

    <div class="container-fluid footer-container"><p>© Pontificia Universidad Católica del Perú - Todos los derechos reservados</p></div>

</section>

<script>
    function validateForm() {
        var password = document.getElementById("newpass").value;
        var passwordconf = document.getElementById("newpassconf").value;

        // Validar coincidencia de contraseñas
        if (password !== passwordconf) {
            alert("Las contraseñas no coinciden. Por favor, inténtalo de nuevo.");
            return false;
        }
        return true;
    }
</script>

</body>
</html>