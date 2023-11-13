package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.RandomTokenGenerator;
import com.example.proyectoweb.model.daos.TokenDao;
import com.example.proyectoweb.model.daos.UsuariosDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;


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
                request.getRequestDispatcher("pages/system/confirm_account.jsp").forward(request,response);

            case "forgot_passwd":
                request.getRequestDispatcher("pages/system/password_recovery/email.jsp").forward(request,response);
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
                    response.sendRedirect("login?action=confirm_account");
                }
                break;

            case "validate":
                break;


        }

    }
}

