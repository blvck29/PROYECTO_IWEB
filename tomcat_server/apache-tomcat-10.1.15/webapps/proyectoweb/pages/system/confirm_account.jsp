<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/bootstrap/bootstrap.css">
    <script src="https://kit.fontawesome.com/a2dd6045c4.js" crossorigin="anonymous"></script>
    <link rel="icon" type="image/jpg" href="favicon.png"/>
    <title>Semana de Ingeniería 2023</title>
</head>

<body>

<section class="index">

    <div class="forgot-container">

        <div class="forgot-form">
            <form action="<%=request.getContextPath()%>/login?action=validate" method="POST" id="token-formulario">
                <h2>Ingrese su Token</h2>
                <div class="forgot-back" style="padding-top: 10px">
                    <label>Ingrese el token que recibió en su correo PUCP.</label>
                </div>

                <div class="otp-bx">
                    <input type="text" maxlength="1" class="space" required name="digit1">
                    <input type="text" maxlength="1" class="space" required name="digit2">
                    <input type="text" maxlength="1" class="space" required name="digit3">
                    <input type="text" maxlength="1" class="space" required name="digit4">
                    <input type="text" maxlength="1" class="space" required name="digit5">
                    <input type="text" maxlength="1" class="space" required name="digit6">
                </div>
                <script>
                    const inputs = document.querySelectorAll(".otp-bx input");
                    const submitButton = document.querySelector(".forgot-button");

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
                            let enteredToken = "";
                            inputs.forEach((input) => {
                                enteredToken += input.value;
                            });

                        }
                    }
                </script>


                <input type="submit" value="Confirmar Token" class="forgot-button">

            </form>
        </div>
    </div>

    <div class="container-fluid footer-container">
        <p>© Pontificia Universidad Católica del Perú - Todos los derechos reservados</p>
    </div>

</section>

</body>

</html>
