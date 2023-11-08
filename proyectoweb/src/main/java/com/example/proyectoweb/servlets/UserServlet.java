package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.CurrentDate;
import com.example.proyectoweb.model.beans.Actividad;
import com.example.proyectoweb.model.beans.Evento;
import com.example.proyectoweb.model.beans.Inscripcion;
import com.example.proyectoweb.model.daos.ActividadesDao;
import com.example.proyectoweb.model.daos.EventosDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.time.Instant;
import java.util.ArrayList;
import java.util.Date;

@WebServlet(name = "UserHome", value = "/user_home")
public class UserServlet extends HttpServlet {

    EventosDao eventoDao = new EventosDao();
    ActividadesDao actDao = new ActividadesDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "home" : request.getParameter("action");
        ArrayList<Evento> listaEventos = eventoDao.listarEventos();
        ArrayList<Actividad> listaActividades = actDao.getListaActividades();

        switch (action){
            case "home":
                request.setAttribute("listaActividades",listaActividades);
                request.setAttribute("listaEventos",listaEventos);

                request.getRequestDispatcher("pages/user/home.jsp").forward(request,response);
                break;

            case "donate":
                request.getRequestDispatcher("pages/user/donate.jsp").forward(request,response);
                break;

            case "events":

                String id = request.getParameter("id") == null? "self" : request.getParameter("id");

                switch (id){
                    case "self":

                        ArrayList<Inscripcion> listaEventosPropia = eventoDao.listarEventosPropios(100);

                        request.setAttribute("listaEventos",listaEventos);
                        request.setAttribute("listaEventosPropia",listaEventosPropia);
                        request.getRequestDispatcher("pages/user/dyn_events/self.jsp").forward(request,response);
                        break;

                    case "prox":

                        ArrayList<Evento> listaEventosProx = eventoDao.listarEventosProximos();

                        request.setAttribute("listaActividades",listaActividades);
                        request.setAttribute("listaEventosProx",listaEventosProx);
                        request.getRequestDispatcher("pages/user/dyn_events/prox.jsp").forward(request,response);
                        break;

                    case "end":

                        ArrayList<Evento> listaEventosFin = eventoDao.listarEventosFinalizados();

                        request.setAttribute("listaActividades",listaActividades);
                        request.setAttribute("listaEventosFin",listaEventosFin);
                        request.getRequestDispatcher("pages/user/dyn_events/end.jsp").forward(request,response);
                        break;
                }
                break;

            case "details":
                String idEv = request.getParameter("id") == null? "self" : request.getParameter("id");

                ArrayList<Inscripcion> listaEventosPropia = eventoDao.listarEventosPropios(100);
                Evento ev = eventoDao.EventoXid(idEv);


                request.setAttribute("listaEventosPropia",listaEventosPropia);
                request.setAttribute("evento_detailed", ev);

                java.sql.Date currentDate = CurrentDate.getCurrentDate();
                java.util.Date utilDate = ev.getFecha();
                java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
                java.sql.Date eventDate = new java.sql.Date(sqlDate.getTime() + ev.getHora().getTime());

                if(currentDate.compareTo(eventDate) > 0){
                    request.getRequestDispatcher("pages/user/dyn_events/event_end.jsp").forward(request,response);
                } else {
                    request.getRequestDispatcher("pages/user/dyn_events/event.jsp").forward(request,response);
                }

                break;


            case "acts":

                String idAct = request.getParameter("idAct");

                ArrayList<Evento> listaFiltroAct = eventoDao.listarEventosProximosxActividad(idAct);

                request.setAttribute("idAct", idAct);
                request.setAttribute("listaFiltroAct",listaFiltroAct);
                request.getRequestDispatcher("pages/user/activity.jsp").forward(request,response);
                break;


            case "user":
                request.getRequestDispatcher("pages/user/user.jsp").forward(request,response);
                break;
        }



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "load" : request.getParameter("action");

        ArrayList<Evento> listaEventos = eventoDao.listarEventos();
        ArrayList<Actividad> listaActividades = actDao.getListaActividades();


        switch (action) {
            case "load":
                request.setAttribute("listaActividades", listaActividades);
                request.setAttribute("listaEventos", listaEventos);

                request.getRequestDispatcher("pages/user/home.jsp").forward(request, response);
                break;


            case "search_title":
                String Actividad = request.getParameter("idAct");
                String title = request.getParameter("title_search");


                break;

            case "filter_act":
                String idActividad = request.getParameter("idAct");
                String filtro = request.getParameter("filtro");
                ArrayList<Evento> listaFiltroAct = new ArrayList<>();

                switch (filtro){
                    case "all":
                        listaFiltroAct = eventoDao.listarEventosxActividad(idActividad);
                        break;
                    case "prox":
                        listaFiltroAct = eventoDao.listarEventosProximosxActividad(idActividad);
                        break;
                    case "fin":
                        listaFiltroAct = eventoDao.listarEventosFinalizadosxActividad(idActividad);
                        break;
                }
                request.setAttribute("idAct", idActividad);
                request.setAttribute("listaFiltroAct",listaFiltroAct);
                request.getRequestDispatcher("pages/user/activity.jsp").forward(request,response);



        }

    }
}
