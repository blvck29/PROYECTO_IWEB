package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.RandomTokenGenerator;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "SystemServlet", value = "/login")
public class SystemServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "login" : request.getParameter("action");

        switch (action){

            case "register":
                request.getRequestDispatcher("pages/system/register.jsp").forward(request,response);
                break;

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
                int code = Integer.parseInt(request.getParameter("code"));
                String email = request.getParameter("email");
                boolean isEgresado = "condit".equals(request.getParameter("condition"));
                String password = request.getParameter("password");
                String passwordconf = request.getParameter("passwordconf");

                String token = RandomTokenGenerator.generator();

                // FUNCION PARA CREAR EL USUARIO CON ESTADO "PEN" + PASSWD HASHED-> PENDIENTE Y NO PODRÁ LOGUEARSE
                // FUNCION PARA MANDAR EL CORREO CON EL TOKEN


                // En esta vista se le solicita llenar el token generado
                // Implementar logica para borrar los tokens cada cierto tiempo...
                response.sendRedirect("confirm_account.jsp");
                break;

            case "validate":
                break;


        }

    }
}

