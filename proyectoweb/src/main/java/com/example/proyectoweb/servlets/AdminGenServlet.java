package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.beans.Actividad;
import com.example.proyectoweb.model.beans.DelegadoAct;
import com.example.proyectoweb.model.beans.Donaciones;
import com.example.proyectoweb.model.beans.Usuario;
import com.example.proyectoweb.model.daos.ActividadesDao;
import com.example.proyectoweb.model.daos.DonacionesDao;
import com.example.proyectoweb.model.daos.UsuariosDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "AdminGenServlet", value = "/admin_gen")
public class AdminGenServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UsuariosDao userDao = new UsuariosDao();
        String action = request.getParameter("action") == null? "home" : request.getParameter("action");
        ArrayList<Usuario> listaUsuarios = userDao.listarTodosUsuarios();

        switch (action){
            case "home":
                request.setAttribute("listaUsuarios",listaUsuarios);
                request.getRequestDispatcher("pages/super_admin/tabla_inscritos.jsp").forward(request,response);
                break;

            case "editar":
                String codigo = request.getParameter("id");
                Usuario usuario = userDao.buscarXcodigo(codigo);

                if(usuario != null){
                    request.setAttribute("usuario", usuario);
                    request.getRequestDispatcher("pages/super_admin/editar_estado.jsp").forward(request,response);
                }
                else{
                    response.sendRedirect(request.getContextPath()+"/admin_gen_home");
                }
                break;

            case "activities":

                String ac = request.getParameter("ac") == null? "list" : request.getParameter("ac");

                ActividadesDao actividadesDao = new ActividadesDao();
                ArrayList<DelegadoAct> listaDelegadosAct = actividadesDao.listarNombresEncargadosAct();

                switch (ac){
                    case "list":
                        request.setAttribute("listaDelegadosAct", listaDelegadosAct);
                        request.getRequestDispatcher("/pages/super_admin/lista_actividades.jsp").forward(request,response);
                        break;

                    case "crear":
                        ArrayList<Actividad> listaActividades = actividadesDao.getListaActividades();
                        request.setAttribute("listaActividades",listaActividades);
                        request.setAttribute("listaUsuarios",listaUsuarios);

                        request.getRequestDispatcher("/pages/super_admin/new_activity.jsp").forward(request,response);
                        break;

                    case "edit":
                        DelegadoAct actividad = actividadesDao.buscarPorTitulo(request.getParameter("id"));
                        ArrayList<Usuario> listaUsuarios2 = userDao.listarTodosUsuarios();
                        ArrayList<Actividad> listaActividades2 = actividadesDao.getListaActividades();


                        if (actividad != null){
                            request.setAttribute("listaActividades",listaActividades2);
                            request.setAttribute("actividad",actividad);
                            request.setAttribute("listaUsuarios",listaUsuarios2);
                            request.getRequestDispatcher("/pages/super_admin/edit_activity.jsp").forward(request, response);
                        }
                        else{
                            response.sendRedirect(request.getContextPath()+"/admin_gen_activities");
                        }
                        break;

                    case "delete":
                        String tituloActividad = request.getParameter("id");
                        String idActividad = tituloActividad.toUpperCase();

                        actividadesDao.eliminarActividad(idActividad);
                        response.sendRedirect(request.getContextPath()+ "/admin_gen_activities");

                        break;
                }

                break;

            case "statistics":
                request.getRequestDispatcher("pages/super_admin/statistics.jsp").forward(request,response);
                break;


            case "donations":
                DonacionesDao donacionesDao = new DonacionesDao();
                ArrayList<Donaciones> listaDonaciones = donacionesDao.listar();

                request.setAttribute("listaDonaciones", listaDonaciones);
                request.getRequestDispatcher("pages/super_admin/lista_donaciones.jsp").forward(request,response);
                break;

        }


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        UsuariosDao userDao = new UsuariosDao();
        ActividadesDao actividadesDao = new ActividadesDao();
        String action = request.getParameter("action") == null? "home" : request.getParameter("action");
        String ac = request.getParameter("ac") == null? "busqueda" : request.getParameter("ac");

        switch(action){
            case "home":

                switch (ac){
                    case "busqueda":
                        String usuarioBuscado = request.getParameter("busquedaNombreCodigo");
                        ArrayList<Usuario> listaBusqueda = userDao.buscarXnombreYcodigo(usuarioBuscado);

                        request.setAttribute("listaUsuarios",listaBusqueda);
                        request.getRequestDispatcher("pages/super_admin/tabla_inscritos.jsp").forward(request,response);
                        break;
                }
                break;

            case "activities":

                switch (ac){
                    case "busqueda":

                        String actividadBuscada = request.getParameter("busquedaTituloActividad");
                        ArrayList<DelegadoAct> listaActividadFiltrada = actividadesDao.filtrarXTitulo(actividadBuscada);

                        request.setAttribute("listaDelegadosAct",listaActividadFiltrada);
                        request.getRequestDispatcher("/pages/super_admin/lista_actividades.jsp").forward(request,response);
                        break;


                    case "crear":
                        String tituloActividad = request.getParameter("nombreActividad");
                        String idActividad = tituloActividad.toUpperCase();
                        String idDelegado = request.getParameter("idDelegado");

                        actividadesDao.crearActividad(idActividad,tituloActividad,Integer.parseInt(idDelegado));
                        response.sendRedirect(request.getContextPath() + "/admin_gen_activities");

                        break;

                    case "editar":
                        String tituloActividad2 = request.getParameter("tituloActividad");
                        String idActividad2 = tituloActividad2.toUpperCase();
                        String idDelegado2 = request.getParameter("idDelegado");

                        actividadesDao.actualizarActividad(idActividad2, Integer.parseInt(idDelegado2));
                        response.sendRedirect(request.getContextPath() + "/admin_gen_activities");

                        break;
                }

                break;

            case "donations":
                DonacionesDao donacionesDao = new DonacionesDao();

                switch (ac){
                    case "busqueda":
                        String nombreBuscado = request.getParameter("nombreDonante");
                        ArrayList<Donaciones> listaDonacionesFiltrada = donacionesDao.buscarPorNombre(nombreBuscado);

                        request.setAttribute("listaDonaciones",listaDonacionesFiltrada);
                        request.getRequestDispatcher("pages/super_admin/lista_donaciones.jsp").forward(request,response);

                        break;

                    case "filtrarComprobados":
                        String comprobacion = request.getParameter("id");
                        ArrayList<Donaciones> listaDonacionesPorComprobacion = donacionesDao.listarComprobados(comprobacion);

                        request.setAttribute("listaDonaciones",listaDonacionesPorComprobacion);
                        request.getRequestDispatcher("pages/super_admin/lista_donaciones.jsp").forward(request,response);

                        break;
                }
                break;

        }

    }

}
