package com.example.proyectoweb.servlets;

import com.example.proyectoweb.model.beans.Actividad;
import com.example.proyectoweb.model.beans.DelegadoAct;
import com.example.proyectoweb.model.daos.ActividadesDao;
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

        switch(action){
            case "listarAct":
                ActividadesDao actividadesDao = new ActividadesDao();

                ArrayList<DelegadoAct> listaDelegadosAct = actividadesDao.listarNombresEncargadosAct();
                ArrayList<Actividad> listaActividades = actividadesDao.getListaActividades();

                request.setAttribute("listaActividades", listaActividades);
                request.setAttribute("listaDelegadosAct", listaDelegadosAct);
                request.getRequestDispatcher("/pages/super_admin/lista_actividades.jsp").forward(request,response);

                break;
            case "crear":
                request.getRequestDispatcher("/pages/super_admin/new_activity.jsp").forward(request,response);
                break;

        }



    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action") == null? "busqueda" : request.getParameter("action");

        ActividadesDao actividadesDao = new ActividadesDao();
        switch (action){
            case "busqueda":

                String actividadBuscada = request.getParameter("busquedaTituloActividad");
                ArrayList<DelegadoAct> listaActividadFiltrada = actividadesDao.filtrarXTituloActividad(actividadBuscada);
                request.setAttribute("listaDelegadosAct",listaActividadFiltrada);
                request.getRequestDispatcher("/pages/super_admin/lista_actividades.jsp").forward(request,response);
                break;



        }

    }
}
