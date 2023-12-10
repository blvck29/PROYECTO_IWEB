<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    ArrayList<String> correos = (ArrayList<String>) request.getAttribute("correos");
    ArrayList<String> codigos = (ArrayList<String>) request.getAttribute("codigos");
%>
<script>
    var correosUsados = [
        <% for (String correo : correos) { %>
        '<%= correo %>',
        <% } %>
    ];

    var codigosUsados = [
        <% for (String codigo : codigos) { %>
        '<%= codigo %>',
        <% } %>
    ];
</script>



<html lang="es">

<head>
    <meta http-equiv="Content-Type" content=text/html; charset=ISO-8859-1″>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">

    <script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>
    <link rel="icon" type="image/jpg" href="favicon.png"/>

    <link rel="stylesheet" href="css/forms.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">

    <title>Semana de Ingeniería 2023</title>
</head>


<body>

<section class="index">

    <div class="container123">



        <form id="form" class="form123" action="<%=request.getContextPath()%>/login?action=confirm_register" method="POST">

            <h2>Registrarse</h2>

            <div class="row">
                <div class="col-md-6">
                    <div class="form123-control">
                        <label for="username">Nombres</label>
                        <input type="text" id="username" name="names" />
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle"></i>
                        <small>Error message</small>
                    </div>

                    <div class="form123-control">
                        <label for="lastname">Apellidos</label>
                        <input type="text" id="lastname" name="lastnames" />
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle"></i>
                        <small>Error message</small>
                    </div>

                    <div class="form123-control">
                        <label for="codigo">Código PUCP</label>
                        <input type="number" name="code" placeholder="Como mínimo 8 caracteres" id="codigo" />
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle"></i>
                        <small>Error message</small>
                    </div>

                    <div class="form123-control">
                        <label for="email">Correo PUCP</label>
                        <input type="text" placeholder="Debe Contener 8 dígitos" name="email" id="email" />
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle"></i>
                        <small>Error message</small>
                    </div>

                </div>
                <div class="col-md-6">


                    <div class="form123-control">
                        <label for="email">Estado Académico</label>
                        <select class="form-select" id="estadoAcademico" name="estadoAcademico">
                            <option selected disabled>Seleccionar</option>
                            <option value="GRADUAT">Estudiante</option>
                            <option value="STUDENT">Egresado</option>
                        </select>
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle"></i>
                        <small>Error message</small>
                    </div>

                    <div class="form123-control">
                        <label for="email">Género Biológico</label>
                        <select class="form-select" id="genero" name="genero" >
                            <option selected disabled>Seleccionar</option>
                            <option value="male">Masculino</option>
                            <option value="female">Femenino</option>
                        </select>
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle"></i>
                        <small>Error message</small>

                    </div>


                <!--
                    <div style="display: flex; justify-content: space-between; margin-top:10px;">
                        <div style="width: 200px" class="register-checkbox">
                            <input type="checkbox" id="condition" name="condition" value="condit" >
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
                -->






                    <div class="form123-control">
                        <label for="password">Contraseña</label>
                        <input type="password" name="password" id="password"/>
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle"></i>
                        <small>Error message</small>
                    </div>



                    <div class="form123-control">
                        <label for="password2">Confirmar contraseña</label>
                        <input type="password" placeholder="Las contraseñas deben coincidir" name="passwordconf" id="password2"/>
                        <i class="fas fa-check-circle"></i>
                        <i class="fas fa-exclamation-circle"></i>
                        <small>Error message</small>
                    </div>


                    <div class="form-check">
                        <input class="form-check-input" type="checkbox" id="mostrarContrasena" >
                        <label style="color:#ffffff" class="form-check-label" for="flexCheckDefault">Mostrar contraseña</label>
                    </div>

                </div>
            </div>






            <br>

            <input type="submit" value="Registrarse" class="register-button">

            <div class="register-back">
                <label style="color:black"><a href="<%=request.getContextPath()%>/login">Regresar</a></label>

            </div>

        </form>
    </div>

    <div class="container-fluid footer-container"><p>© Pontificia Universidad Católica del Perú - Todos los derechos reservados</p></div>

</section>

<script>
    document.getElementById("mostrarContrasena").addEventListener("change", function() {
        var contrasenaInput = document.getElementById("password");
        if (this.checked) {
            contrasenaInput.type = "text";
        } else {
            contrasenaInput.type = "password";
        }
    });
</script>
<script>
    document.getElementById("mostrarContrasena").addEventListener("change", function() {
        var contrasenaInput = document.getElementById("password2");
        if (this.checked) {
            contrasenaInput.type = "text";
        } else {
            contrasenaInput.type = "password";
        }
    });
</script>



<script src="js/validarForms.js"></script>

</body>
</html>