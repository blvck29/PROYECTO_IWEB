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

@WebServlet(name = "UserHome", value = "/user_home")
public class UserServlet extends HttpServlet {

    EventosDao eventoDao = new EventosDao();
    ActividadesDao actDao = new ActividadesDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "home" : request.getParameter("action");

        switch (action){
            case "home":
                ArrayList<Evento> listaEventos = eventoDao.listarEventos();
                ArrayList<Actividad> listaActividades = actDao.getListaActividades();

                request.setAttribute("listaActividades",listaActividades);
                request.setAttribute("listaEventos",listaEventos);

                request.getRequestDispatcher("pages/user/home.jsp").forward(request,response);
                break;
        }

        

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "load" : request.getParameter("action");
        ArrayList<Evento> listaEventos = eventoDao.listarEventos();
        ArrayList<Actividad> listaActividades = actDao.getListaActividades();


        switch (action){
            case "load":
                request.setAttribute("listaActividades",listaActividades);
                request.setAttribute("listaEventos",listaEventos);
                request.getRequestDispatcher("pages/user/home.jsp").forward(request,response);
                break;

            case "filter":
                request.getRequestDispatcher("pages/user/home.jsp").forward(request,response);
                break;
        }
    }
}
