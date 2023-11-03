package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.beans.Actividad;
import com.example.proyectoweb.model.beans.Evento;
import com.example.proyectoweb.model.beans.UsuarioInscritoXevento;
import com.example.proyectoweb.model.daos.ActividadesDao;
import com.example.proyectoweb.model.daos.EventosDao;
import com.example.proyectoweb.model.daos.InscritosDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AdminActServlet", value = "/admin_act")
public class AdminActServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "home" : request.getParameter("action");

        switch (action){
            case "home":
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

            case "list_apoyos":

                InscritosDao insDao = new InscritosDao();

                String id = request.getParameter("id");
                ArrayList<UsuarioInscritoXevento> listaUsuariosXevento = insDao.listarInscritosXevento(id);

                String nombreEvento = request.getParameter("id2");

                request.setAttribute("nombreEvento",nombreEvento);
                request.setAttribute("listaInscritosXevento",listaUsuariosXevento);
                request.getRequestDispatcher("/pages/admin_act/administrar_apoyos.jsp").forward(request,response);
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}

