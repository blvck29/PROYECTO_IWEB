package com.example.proyectoweb.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false); // No crear una nueva sesión si no existe

        if (session != null) {
            session.invalidate(); // Invalidar la sesión actual
        }

        response.sendRedirect("login"); // Redirigir a la página de inicio de sesión o a donde desees después del cierre de sesión
    }
}
