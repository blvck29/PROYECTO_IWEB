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

@WebServlet(name = "/admin_act_home", value = "/admin_act_home")
public class EventoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "admin_act_home" : request.getParameter("action");

        switch (action){
            case "admin_act_home":
                EventosDao eventoDao = new EventosDao();
                ActividadesDao actividadesDao = new ActividadesDao();

                ArrayList<Evento> listaEventos = eventoDao.listarEventos();
                ArrayList<Actividad> listaActividades = actividadesDao.getListaActividades();

                request.setAttribute("listaActividades", listaActividades);
                request.setAttribute("listaEventos", listaEventos);
                request.getRequestDispatcher("/pages/admin_act/home.jsp").forward(request,response);

                break;


            case "new_event":
                request.getRequestDispatcher("/pages/admin_act/new_event.jsp").forward(request,response);
                break;

            case "edit_event":
                request.getRequestDispatcher("pages/admin_act/mod_event.jsp").forward(request,response);
                break;

            case "listar_todos_apoyos":



        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



    }
}

