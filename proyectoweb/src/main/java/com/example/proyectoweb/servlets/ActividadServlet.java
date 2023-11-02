package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.beans.Actividad;
import com.example.proyectoweb.model.beans.Usuario;
import com.example.proyectoweb.model.beans.DelegadoAct;
import com.example.proyectoweb.model.daos.ActividadesDao;
import com.example.proyectoweb.model.daos.UsuariosDao;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.ArrayList;

@WebServlet(name = "ActividadServlet", value = "/admin_gen_activities")
public class ActividadServlet extends HttpServlet {


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "listarAct" : request.getParameter("action");

        ActividadesDao actividadesDao = new ActividadesDao();
        UsuariosDao userDao = new UsuariosDao();



        switch(action){
            case "listarAct":

                ArrayList<DelegadoAct> listaDelegadosAct = actividadesDao.listarNombresEncargadosAct();

                request.setAttribute("listaDelegadosAct", listaDelegadosAct);
                request.getRequestDispatcher("/pages/super_admin/lista_actividades.jsp").forward(request,response);

                break;
            case "crear":
                ArrayList<Usuario> listaUsuarios = userDao.listarTodosUsuarios();
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



    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "busqueda" : request.getParameter("action");

        ActividadesDao actividadesDao = new ActividadesDao();
        UsuariosDao userDao = new UsuariosDao();

        switch (action){
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

    }
}
