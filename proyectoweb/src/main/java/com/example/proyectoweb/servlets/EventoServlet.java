package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.beans.Evento;
import com.example.proyectoweb.model.daos.EventosDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "EventosDao", value = "/EventosDao")
public class EventoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EventosDao eventoDao = new EventosDao();
        ArrayList<Evento> listaEventos = eventoDao.getListaEventos();

        request.setAttribute("lista", listaEventos);

        RequestDispatcher view = request.getRequestDispatcher("home.jsp");
        view.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

