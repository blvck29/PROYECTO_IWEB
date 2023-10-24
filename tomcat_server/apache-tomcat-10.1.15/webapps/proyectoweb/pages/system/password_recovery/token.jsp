<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<html lang="es">

<head>
    <meta http-equiv="Content-Type" content=text/html; charset=ISO-8859-1″>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="../../../css/style.css">
    <link rel="stylesheet" href="../../../css/bootstrap/bootstrap.css">

    <script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>
    <link rel="icon" type="image/jpg" href="../../../favicon.png" />
    <title>Semana de Ingeniería 2023</title>
</head>


<body>

<section class="index">

    <div class="forgot-container">

        <div class="forgot-form">
            <form action="newpass.jsp" method="POST" id="token-formulario">
                <h2>Ingrese su Token</h2>
                <div class="otp-bx">
                    <input type="text" maxlength="1" class="space" required>
                    <input type="text" maxlength="1" class="space" required>
                    <input type="text" maxlength="1" class="space" required>
                    <input type="text" maxlength="1" class="space" required>
                    <input type="text" maxlength="1" class="space" required>
                    <input type="text" maxlength="1" class="space" required>
                </div>


                <script>

                    const inputs = document.querySelectorAll(".otp-bx input");

                    inputs.forEach((input, index) => {
                        input.dataset.index = index;
                        input.addEventListener("paste", handleOtpPaste);
                        input.addEventListener("keyup", handleOtp);
                    });

                    function handleOtpPaste(e) {
                        const data = e.clipboardData.getData("text");
                        const value = data.split("");

                        if (value.length === inputs.length) {
                            inputs.forEach((input, index) => (input.value = value[index]));
                        }
                    }

                    function handleOtp(e) {
                        const input = e.target;
                        let value = input.value;
                        input.value = "";
                        input.value = value ? value[0] : "";

                        let fieldIndex = parseInt(input.dataset.index);
                        if (value.length > 0 && fieldIndex < inputs.length - 1) {
                            input.nextElementSibling.focus();
                        }

                        if (e.key === "Backspace" && fieldIndex > 0) {
                            input.previousElementSibling.focus();
                        }

                        if (fieldIndex === inputs.length - 1) {
                            console.log("Comprobando Token...!");
                            let otp = "";
                            inputs.forEach((input) => {
                                otp += input.value;
                            });
                            console.log(otp);
                        }
                    }

                </script>


                <a href="newpass.jsp"><input type="submit" value="Confirmar Token" class="forgot-button"></a>

                <div class="forgot-back">
                    <label><a href="../../../index.jsp">Cancelar</a></label>
                </div>

            </form>

        </div>
    </div>

    <div class="container-fluid footer-container">
        <p>© Pontificia Universidad Católica del Perú - Todos los derechos reservados</p>
    </div>

</section>


</body>

</html>