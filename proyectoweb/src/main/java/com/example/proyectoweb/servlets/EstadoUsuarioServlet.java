package com.example.proyectoweb.servlets;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;

@WebServlet(name = "EstadoUsuarioServlet", value = "/EstadoUsuarioServlet")
public class EstadoUsuarioServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       EstadoUsuariosDao estadoUsuariosDao = new EstadoUsuariosDao();
       ArrayList<EstadoUsuario> listaEstadoUsuarios = estadoUsuariosDao.getListaEstadoUsuarios();

       request.setAttribute("lista", listaEstadoUsuarios);

       RequestDispatcher view = request.getRequestDispatcher("home.jsp");
       view.forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
