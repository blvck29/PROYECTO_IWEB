package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.beans.*;
import com.example.proyectoweb.model.daos.ActividadesDao;
import com.example.proyectoweb.model.daos.EventosDao;
import com.example.proyectoweb.model.daos.InscritosDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "admin_act", value = "/admin_act")
public class AdminActServlet extends HttpServlet {

    EventosDao eventoDao = new EventosDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "home" : request.getParameter("action");

        switch (action){
            case "home":
                ArrayList<Evento> listaEventos = eventoDao.listarEventos();
                String ActividadDelDelegado = "FUTBOL";
                System.out.println(ActividadDelDelegado);

                request.setAttribute("idActividad", ActividadDelDelegado);
                request.setAttribute("listaEventos", listaEventos);
                request.getRequestDispatcher("/pages/admin_act/home.jsp").forward(request,response);

                break;

            case "new_event":
                String idActividad = request.getParameter("idActividad");
                request.setAttribute("idActividad", idActividad);
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

        String action = request.getParameter("action") == null? "filtros" : request.getParameter("action");
        String ac = request.getParameter("ac") == null? "eventosXfecha" : request.getParameter("ac");

        switch (action){

            case "filtros":

                switch (ac){
                    case "eventosXfecha":
                        String idActividad = request.getParameter("idAct");
                        String filtro = request.getParameter("filtro");
                        ArrayList<Evento> listaFiltro = new ArrayList<>();

                        System.out.println("id actividad: " + idActividad);
                        System.out.println("filtro: " + filtro);

                        switch (filtro){
                            case "all":
                                listaFiltro = eventoDao.listarEventosxActividad(idActividad);
                                break;
                            case "prox":
                                listaFiltro = eventoDao.listarEventosProximosxActividad(idActividad);
                                break;
                            case "fin":
                                listaFiltro= eventoDao.listarEventosFinalizadosxActividad(idActividad);
                                break;
                        }
                        request.setAttribute("idActividad", idActividad);
                        request.setAttribute("listaEventos",listaFiltro);
                        request.getRequestDispatcher("pages/admin_act/home.jsp").forward(request,response);

                        break;
                }

                break;



            case "crearEvento":
                String titulo = request.getParameter("titulo");
                String subtitulo = request.getParameter("subtitulo");
                String hora = request.getParameter("hora");
                String fecha = request.getParameter("fecha");
                String lugar = request.getParameter("lugar");
                String descripcion = request.getParameter("descripcion");
                String idActividad = request.getParameter("idActividad");

                System.out.println("titutlo: " + titulo);
                System.out.println("subtitutlo: " + subtitulo);
                System.out.println("hora: " + hora+":00");
                System.out.println("fecha: " + fecha);
                System.out.println("Lugar: " + lugar);
                System.out.println("Descripcion: " + descripcion);
                System.out.println("idActividad: " + idActividad);

                eventoDao.crearEvento(titulo,subtitulo,hora,fecha,lugar,descripcion,idActividad);

                response.sendRedirect(request.getContextPath() + "/admin_act?action=home");



                break;












        }
    }
}

