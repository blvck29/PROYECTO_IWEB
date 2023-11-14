package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.SHA256;
import com.example.proyectoweb.model.beans.Usuario;
import com.example.proyectoweb.model.daos.TokenDao;
import com.example.proyectoweb.model.daos.UsuariosDao;
import com.mysql.cj.Session;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SystemServlet", value = "/login")
public class SystemServlet extends HttpServlet {

    UsuariosDao userDao = new UsuariosDao();
    TokenDao tokenDao = new TokenDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "login" : request.getParameter("action");

        switch (action){

            case "register":
                request.getRequestDispatcher("pages/system/register.jsp").forward(request,response);
                break;
            case "confirm_account":
                request.getRequestDispatcher("/pages/system/confirm_account.jsp").forward(request,response);

            case "validation_complete":
                request.getRequestDispatcher("/pages/system/validation_complete.jsp").forward(request,response);

            case "forgot_passwd":
                request.getRequestDispatcher("pages/system/password_recovery/email.jsp").forward(request,response);
                break;

            case "home":
                request.getRequestDispatcher("/user_home").forward(request,response);
                break;
            case "login":
                request.getRequestDispatcher("index.jsp").forward(request,response);
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

                    session.setAttribute("id", user.getIdUsuario());
                    session.setAttribute("idRolSistema", user.getIdRolSistema());
                    session.setAttribute("idRolAcademico", user.getIdRolAcademico());
                    session.setAttribute("nombres", user.getNombres());
                    session.setAttribute("apellidos", user.getApellidos());


                    session.setMaxInactiveInterval(1800); // 1800 segundos = 30 minutos

                    response.sendRedirect("login?action=home");

                } else {
                    response.sendRedirect("login");
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
                    tokenDao.generateToken(email);
                    // falta funcion para enviar correo !importante
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
                    response.sendRedirect("login?action=confirm_account&error=bad_token");
                }

                break;


        }

    }
}

