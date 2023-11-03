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

@WebServlet(name = "user_home", value = "/user_home")
public class UsuarioHomeServlet extends HttpServlet {

    EventosDao eventoDao = new EventosDao();
    ActividadesDao actDao = new ActividadesDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ArrayList<Evento> listaEventos = eventoDao.listarEventos();
        ArrayList<Actividad> listaActividades = actDao.getListaActividades();

        request.setAttribute("listaActividades",listaActividades);
        request.setAttribute("listaEventos",listaEventos);

        request.getRequestDispatcher("pages/user/home.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "load" : request.getParameter("action");
        ArrayList<Evento> listaEventos = eventoDao.listarEventos();
        ArrayList<Actividad> listaActividades = actDao.getListaActividades();


        switch (action){
            case "load":
            case "filter":
                request.setAttribute("listaActividades",listaActividades);
                request.setAttribute("listaEventos",listaEventos);

                request.getRequestDispatcher("pages/user/home.jsp").forward(request,response);
                break;

        }


    }
}
