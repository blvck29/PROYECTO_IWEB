package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.EmailSender;
import com.example.proyectoweb.model.beans.Usuario;
import com.example.proyectoweb.model.daos.TokenDao;
import com.example.proyectoweb.model.daos.UsuariosDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SystemServlet", value = "/login")
public class SystemServlet extends HttpServlet {

    UsuariosDao userDao = new UsuariosDao();
    TokenDao tokenDao = new TokenDao();
    EmailSender emailSender = new EmailSender();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "login" : request.getParameter("action");

        switch (action) {
            case "register":
                request.getRequestDispatcher("pages/system/register.jsp").forward(request, response);
                break;
            case "confirm_account":
                request.getRequestDispatcher("/pages/system/confirm_account.jsp").forward(request, response);
                break;
            case "validation_complete":
                request.getRequestDispatcher("/pages/system/validation_complete.jsp").forward(request, response);
                break;
            case "forgot_passwd":
                request.getRequestDispatcher("pages/system/password_recovery/email.jsp").forward(request, response);
                break;
            case "forgot_token":
                request.getRequestDispatcher("pages/system/password_recovery/token.jsp").forward(request, response);
                break;
            case "forgot_newpass":
                request.getRequestDispatcher("pages/system/password_recovery/newpass.jsp").forward(request, response);
                break;
            case "unvalid_session":
                request.getRequestDispatcher("pages/system/unvalid_session.jsp").forward(request, response);
                break;
            case "login":
                request.getRequestDispatcher("index.jsp").forward(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "auth" : request.getParameter("action");

        switch (action){

            case "auth":
                response.sendRedirect("login");
                break;

            case "login":
                String mailStr = request.getParameter("email");
                String passwdStr = request.getParameter("passwd");

                if (userDao.login(mailStr,passwdStr)){

                    Usuario user = userDao.usuarioByEmail(mailStr);

                    // Iniciar sesión exitosa, redireccionar al servlet de inicio.
                    HttpSession session = request.getSession();
                    // Almacena la información del usuario en la sesión

                    session.setAttribute("usuario", user);

                    session.setMaxInactiveInterval(1800); // 1800 segundos = 30 minutos

                    switch (user.getIdRolSistema()){
                        case "USER":
                            response.sendRedirect("user_home");
                            break;

                        case "DELACT":
                            response.sendRedirect("admin_act");
                            break;

                        case "DELGEN":
                            response.sendRedirect("admin_gen");
                            break;

                    }

                } else {
                    System.out.println("Usuario o Contraseña Incorrectos");
                    request.setAttribute("err","Usuario o password incorrectos");
                    request.getRequestDispatcher("index.jsp").forward(request,response);
                }

                break;

            case "confirm_register":
                String names = request.getParameter("names");
                String lastnames = request.getParameter("lastnames");
                int codigo = Integer.parseInt(request.getParameter("code"));
                String email = request.getParameter("email");
                boolean isEgresado = "condit".equals(request.getParameter("condition"));
                String password = request.getParameter("password");

                String correoDB =  userDao.verificarCorreo(email);
                String codigoDB = userDao.verificarCodigo(String.valueOf(codigo));

                if (correoDB != null && codigoDB != null){
                    //Falta el popup de "El correo o el codigo ingresado ya está registrado"
                    response.sendRedirect("login?action=register&error=no_valid");
                } else {
                    userDao.crearUsuario(names, lastnames, codigo, email, isEgresado, password);
                    String token = tokenDao.generateToken(email);
                    EmailSender.sendEmail(email,"Token para Verificación"," Token: " + token + "\n Confirmar su token aquí: http://localhost:8080/proyectoweb/login?action=confirm_account");
                    response.sendRedirect("login?action=confirm_account");
                }
                break;

            case "validate":
                StringBuilder enteredToken = new StringBuilder();
                for (int i = 1; i <= 6; i++) {
                    String digit = request.getParameter("digit" + i);
                    enteredToken.append(digit);
                }

                if(tokenDao.findToken(String.valueOf(enteredToken))){
                    tokenDao.verificarUsuario(String.valueOf(enteredToken)); // Cambia el estado de usuario a "VER"
                    response.sendRedirect("login?action=validation_complete");
                } else {
                    //Falta el popup de "El token no es válido"
                    response.sendRedirect("login?action=confirm_account&error=bad_token");
                }

                break;

            case "forgot_passwd":
                String emailForgot = request.getParameter("email");

                if(userDao.usuarioByEmail(emailForgot)!=null){
                    Usuario userForgot = userDao.usuarioByEmail(emailForgot);
                    if (userForgot.getIdRolSistema().equals("ACC")){
                        String tokenForgot = tokenDao.generateToken(userForgot.getCorreo());
                        EmailSender.sendEmail(userForgot.getCorreo(),"Token para Renovar Contraseña"," Token: " + tokenForgot + "\n Confirmar su token aquí: http://localhost:8080/proyectoweb/login?action=confirm_account");
                        response.sendRedirect("login?action=forgot_token");
                    } else {
                        //Falta el popup de "El correo ingresado no está aceptado por el administrador"
                        response.sendRedirect("login?action=forgot_passwd&error=no_accepted");
                    }
                } else {
                    //Falta el popup de "El correo ingresado no está registrado"
                    response.sendRedirect("login?action=forgot_passwd&error=no_valid");
                }

                break;

            case "forgot_token":
                StringBuilder forgotToken = new StringBuilder();
                for (int i = 1; i <= 6; i++) {
                    String digit = request.getParameter("digit" + i);
                    forgotToken.append(digit);
                }

                if(tokenDao.findToken(String.valueOf(forgotToken))){
                    request.setAttribute("token",forgotToken);
                    response.sendRedirect("login?action=forgot_newpass");
                } else {
                    //Falta el popup de "El token no es válido"
                    response.sendRedirect("login?action=forgot_token&error=bad_token");
                }
                break;

            case "forgot_newpass":
                String newpass = request.getParameter("newpass");



                break;

            default:
                response.sendRedirect("login"); // o redirige a una página de error
                break;


        }

    }
}

