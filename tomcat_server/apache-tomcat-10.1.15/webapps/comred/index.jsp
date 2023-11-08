<%@ page import="pe.erp.comred.servlets.LoginServlet" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="resources/css/styles.css">
    <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
    <!-- UIkit CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/uikit@3.17.6/dist/css/uikit.min.css" />


    <script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>

    <link rel="icon" type="image/jpg" href="favicon.png" />


    <title>Comred ERP | Login</title>
</head>

<section class="index">

    <div class="login-container">
        <div class="login-form">
            <form method="POST" action="<%=request.getContextPath()%>/login?action=login">
                <h2><strong>Iniciar Sesión</strong></h2>
                <div class="login-input">
                    <i class="fa-solid fa-envelope"></i>
                    <input type="text" id="txtUser" name="txtUser" required>
                    <label for="txtUser">Usuario</label>
                </div>

                <div class="login-input">
                    <i class="fa-solid fa-lock"></i>
                    <input type="password" id="txtPassword" name="txtPassword" required>
                    <label for="txtPassword">Contraseña</label>
                </div>

                <div class="login-forgot">
                    <label><a href="#">Olvidé la contraseña</a></label>
                </div>

                <input type="submit" value="Acceder" class="login-button">
            </form>
        </div>
    </div>

    <div class="uk-container-expand footer-container" style="width: 100%"><p>© COMRED Perú SAC - Todos los derechos reservados</p></div>
</section>
</html>
