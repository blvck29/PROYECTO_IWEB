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

@WebServlet(name = "AdminActServlet", value = "/admin_act")
public class AdminActServlet extends HttpServlet {

    EventosDao eventoDao = new EventosDao();
    ActividadesDao actDao = new ActividadesDao();

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
            case "activities":

                String ac = request.getParameter("ac") == null? "list" : request.getParameter("ac");

                ActividadesDao actividadesDao1 = new ActividadesDao();

                switch (ac){
                    case "lista":
                        ArrayList<Actividad> list = actividadesDao1.getListaActividades();

                        request.setAttribute("lista",list);
                        RequestDispatcher rd = request.getRequestDispatcher("pages/admin_act/new_event.jsp"); //EDITAR
                        rd.forward(request,response);
                        break;
                    /*case "edit":
                        String id = request.getParameter("id"); //JSP
                        Actividad actividad = actividadesDao1.buscarPorIdActividad(id);

                        if(actividad != null){
                            request.setAttribute("admin_act",actividad); //CAMBIAR
                            request.getRequestDispatcher("pages/admin_act/new_event.jsp").forward(request,response); //CAMBIAR
                        }else{
                            response.sendRedirect(request.getContextPath() + "/AdminActServlet"); //CAMBIAR
                        }
                        break;*/
                    case "delete":
                        String tituloActividad = request.getParameter("id");
                        String idActividad = tituloActividad.toUpperCase();

                        actividadesDao1.eliminarActividad(idActividad);
                        response.sendRedirect(request.getContextPath()+ "/admin_act?action=activities"); //CAMBIAR
                        break;
                }
                break;

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ActividadesDao actividadesDao = new ActividadesDao();
        String action = request.getParameter("action") == null? "home" : request.getParameter("action");
        String ac = request.getParameter("ac") == null? "busqueda" : request.getParameter("ac");
        switch (action){
            case "activities":

                switch (ac){
                    case "busqueda":

                        String actividadBuscada = request.getParameter("busquedaTituloActividad");
                        ArrayList<DelegadoAct> listaActividadFiltrada = actividadesDao.filtrarXTitulo(actividadBuscada);

                        request.setAttribute("listaDelegadosAct",listaActividadFiltrada);
                        request.getRequestDispatcher("/pages/admin_act/lista_actividades.jsp").forward(request,response); //cambiar
                        break;


                    case "crear":
                        String tituloActividad = request.getParameter("nombreActividad");
                        String idActividad = tituloActividad.toUpperCase();
                        String idDelegado = request.getParameter("idDelegado");

                        actividadesDao.crearActividad(idActividad,tituloActividad,Integer.parseInt(idDelegado));
                        response.sendRedirect(request.getContextPath() + "/admin_act?action=activities"); //Cambiar

                        break;

                    case "editar":
                        String tituloActividad2 = request.getParameter("tituloActividad");
                        String idActividad2 = tituloActividad2.toUpperCase();
                        String idDelegado2 = request.getParameter("idDelegado");

                        actividadesDao.actualizarActividad(idActividad2, Integer.parseInt(idDelegado2));
                        response.sendRedirect(request.getContextPath() + "/admin_act?action=activities"); //Cambiar

                        break;
                }

                break;

        }

    }
}

