package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.beans.Actividad;
import com.example.proyectoweb.model.beans.Evento;
import com.example.proyectoweb.model.daos.ActividadesDao;
import com.example.proyectoweb.model.daos.EventosDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "HomeUserEventoServlet", value = "/user_home")
public class HomeUserEventoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EventosDao eventoDao = new EventosDao();
        ActividadesDao actividadesDao = new ActividadesDao();

        ArrayList<Evento> listaEventos = eventoDao.listarEventos();
        ArrayList<Actividad> listaActividades = actividadesDao.getListaActividades();

        request.setAttribute("listaActividades", listaActividades);
        request.setAttribute("listaEventos", listaEventos);
        request.getRequestDispatcher("/pages/user/home.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

