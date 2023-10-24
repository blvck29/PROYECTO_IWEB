package com.example.proyectoweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "RolServlet", value = "/RolServlet")
public class RolServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        RolesDao rolesDao = new RolesDao();
        ArrayList<Rol> listaRol = rolesDao.getListaRoles();

        request.setAttribute("lista", listaRol);

        RequestDispatcher view = request.getRequestDispatcher("home.jsp");
        view.forward(request,response);

        PrintWriter out=response.getWriter();
        out.println("<html><body>");
        out.println("<h1>Hola Mundo</h1>");
        out.println("</body></html>");

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
